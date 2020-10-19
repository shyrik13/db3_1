
/** Filter queries **/
/** First query **/
select
    rv.id,
    rv.geometrija.SDO_ORDINATES,
    CONCAT(rvi.nosaukums, CONCAT(CONCAT(' (',rvi.tips),')')) nosaukums
from RUDAS_VIETA rv
         inner join RUDAS_VIETA_INFO rvi on rvi.rudas_vieta_id = rv.id
where SDO_FILTER(
              rv.geometrija,  /** Paņemtas rūdas vietas ģeometrijas datnes **/
              MDSYS.SDO_GEOMETRY( /** Izveidosim jaunu ģeometrisko objektu **/
                      2003,
                      NULL,
                      NULL,
                      MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 4),
                      MDSYS.SDO_ORDINATE_ARRAY(64,5, 90,18, 58,30)
                  )
          ) = 'TRUE';  /** starp divām ģeometrijām pastāv saistība **/

/** Second query **/

select tabula, rid, nosaukums, gid, papildinformacija, bistamibas_limenis
from
    (select 'Rūdas vietas' as tabula, A.rid, A.nosaukums, A.gid,
            A.papildinformacija, A.bistamibas_limenis
     from
/** Visas ģeoloģiska slānās ar rūdas vietām kombinācija un tās informāciju **/
         (select rid, nosaukums, gid, papildinformacija,
                 bistamibas_limenis from
/** Nepieciešama informācija par rūdas vietām **/
                                        (select rvi.info_id as rid,
                                                rv.geometrija as rgeometrija,
                                                CONCAT(rvi.nosaukums, CONCAT(CONCAT(' (',rvi.tips),')'))
                                                    nosaukums
                                         from rudas_vieta rv
                                                  inner join rudas_vieta_info rvi
                                                             on rvi.rudas_vieta_id = rv.id) r,
/** Nepieciešama informācija par ģeoloģiskajam slānim **/
                                        (select gsi.info_id as gid,
                                                gs.geometrija as ggeometrija,
                                                gsi.bistamibas_limenis as bistamibas_limenis,
                                                gsi.papildinformacija as papildinformacija
                                         from geo_slanis gs
                                                  inner join geo_slanis_info gsi
                                                             on gsi.geo_slanis_id = gs.id) g
          where SDO_FILTER(
                        rgeometrija, /** Rudas ģeometrija **/
                        ggeometrija  /** ģeoloģiskā slāņa ģeometrija **/
                    ) = 'TRUE'
         ) A

inner join
/** Bīstamāka ģeoloģiskais slānis priekš rūdas vieta **/
        (select rid,
         MAX(bistamibas_limenis) as max_bistamibas_limenis
         from
/** Nepieciešama informācija par rūdas vietām **/
         (select rvi.info_id as rid ,
               rv.geometrija as rgeometrija,
               CONCAT(rvi.nosaukums, CONCAT(CONCAT(' (',rvi.tips),')'))
               nosaukums from rudas_vieta rv
         inner join rudas_vieta_info rvi
         on rvi.rudas_vieta_id = rv.id) r,
/** Nepieciešama informācija par ģeoloģiskajam slānim **/
        (select gsi.info_id as gid,
                gs.geometrija as ggeometrija,
                gsi.bistamibas_limenis as bistamibas_limenis,
                gsi.papildinformacija as papildinformacija
         from geo_slanis gs
              inner join geo_slanis_info gsi
              on gsi.geo_slanis_id = gs.id) g
         where SDO_FILTER(
                    rgeometrija, /** Rudas ģeometrija **/
                    ggeometrija  /** ģeoloģiskā slāņa ģeometrija **/
         ) = 'TRUE'
         group by rid
         ) B
/** Paņemt tikai visbīstamākās **/
       on A.rid = B.rid
and A.bistamibas_limenis = B.max_bistamibas_limenis
) rudas_vietas

/** Apvienot rezultātu ar nemetāliska minerālu rezultātiem **/
UNION

select tabula, rid, nosaukums, gid, papildinformacija, bistamibas_limenis from
    (select 'Nemetalisko mineralu vietas' as tabula, A.rid, A.nosaukums, A.gid,
            A.papildinformacija, A.bistamibas_limenis
     from
/** Visas ģeoloģiska slānās ar nemetālisko minerālu vietām kombinācija un tās informāciju **/
         (select rid, nosaukums, gid, papildinformacija,
                 bistamibas_limenis
          from
/** Nepieciešama informācija par nemetālisko minerālu vietām **/
              (select nmvi.info_id as rid,
                      nmv.geometrija as rgeometrija,
                      CONCAT(nmvi.nosaukums, CONCAT(CONCAT(' (',nmvi.tips),')'))
                          nosaukums
               from
                   nemetal_mineral_vieta nmv
                       inner join nemetal_mineral_vieta_info nmvi
                                  on nmvi.nemetal_min_vieta_id = nmv.id) r,
/** Nepieciešama informācija par ģeoloģiskajam slānim **/
              (select gsi.info_id as gid, gs.geometrija as ggeometrija,
                      gsi.bistamibas_limenis as bistamibas_limenis,
                      gsi.papildinformacija as papildinformacija
               from geo_slanis gs
                        inner join geo_slanis_info gsi
                                   on gsi.geo_slanis_id = gs.id) g
          where SDO_FILTER(
                        rgeometrija, /** Nemetālisko minerālu ģeometrija **/
                        ggeometrija  /** ģeoloģiskā slāņa ģeometrija **/
                    ) = 'TRUE'
         ) A

inner join
/** Bīstamāka ģeoloģiskais slānis priekš nemetāliska minerāla vieta **/
         (select rid, MAX(bistamibas_limenis) as max_bistamibas_limenis
           from
/** Nepieciešama informācija par nemetālisko minerālu vietām **/
              (select nmvi.info_id as rid, nmv.geometrija as rgeometrija,
                   CONCAT(nmvi.nosaukums, CONCAT(CONCAT(' (',nmvi.tips),')'))
                   nosaukums
              from nemetal_mineral_vieta nmv
                   inner join nemetal_mineral_vieta_info nmvi
                              on nmvi.nemetal_min_vieta_id = nmv.id) r,
/** Nepieciešama informācija par ģeoloģiskajam slānim **/
             (select gsi.info_id as gid, gs.geometrija as ggeometrija,
                     gsi.bistamibas_limenis as bistamibas_limenis,
                     gsi.papildinformacija as papildinformacija
              from geo_slanis gs
                   inner join geo_slanis_info gsi
                   on gsi.geo_slanis_id = gs.id) g
              where SDO_FILTER(
                    rgeometrija, /** Nemetālisko minerālu ģeometrija **/
                    ggeometrija  /** ģeoloģiskā slāņa ģeometrija **/
              ) = 'TRUE'
              group by rid
          ) B on A.rid = B.rid
/** Paņemt tikai visbīstamākās **/
and A.bistamibas_limenis = B.max_bistamibas_limenis)
ORDER BY bistamibas_limenis;


select geometrija from
    NOLIKTAVA where SDO_ANYINTERACT(
              geometrija,
              MDSYS.SDO_GEOMETRY(
                  2003,
                  NULL,
                  NULL,
                  MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
MDSYS.SDO_ORDINATE_ARRAY(12.94,153.55, 16.28,153.55, 16.28,180.15, 12.94,180.15, 12.94,153.55)                  )
          ) = 'TRUE'



/** transaction queries **/
select i.id, CONCAT(rv.nosaukums, CONCAT(CONCAT(' (',rv.tips),')')) m_nosaukums, rv.id, CONCAT(i.tips, CONCAT(CONCAT(' (',i.status),')')) i_nosaukums from
                                                                                                                                                          (select * from ierice i
                                                                                                                                                                             inner join ierice_info ii on ii.ierice_id = i.id) i,
                                                                                                                                                          (select * from rudas_vieta rv
                                                                                                                                                                             inner join rudas_vieta_info rvi on rvi.rudas_vieta_id = rv.id) rv
where SDO_RELATE(
              i.geometrija,
              rv.geometrija,
              'mask=touch'
          ) = 'TRUE'

UNION

select i.id, CONCAT(nmv.nosaukums, CONCAT(CONCAT(' (',nmv.tips),')')) m_nosaukums, nmv.id, CONCAT(i.tips, CONCAT(CONCAT(' (',i.status),')')) i_nosaukums from
                                                                                                                                                             (select * from ierice i
                                                                                                                                                                                inner join ierice_info ii on ii.ierice_id = i.id) i,
                                                                                                                                                             (select * from nemetal_mineral_vieta nmv
                                                                                                                                                                                inner join nemetal_mineral_vieta_info nmvi on nmvi.nemetal_min_vieta_id = nmv.id) nmv
where SDO_RELATE(
              i.geometrija,
              nmv.geometrija,
              'mask=touch'
          ) = 'TRUE';
