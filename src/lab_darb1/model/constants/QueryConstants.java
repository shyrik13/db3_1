package lab_darb1.model.constants;

// vaicājumu konstantes
public class QueryConstants {

    public static String GEO_SLANIS_NAV_BISTAMS =
            "select gs.id, gs.geometrija, gsi.papildinformacija from geo_slanis gs\n" +
            "    inner join geo_slanis_info gsi on gs.id = gsi.geo_slanis_id";

    public static String GEO_SLANIS_VID_BISTAMS =
            "select gs.id, gs.geometrija, gsi.papildinformacija from geo_slanis gs\n" +
                    "    inner join geo_slanis_info gsi on gs.id = gsi.geo_slanis_id\n" +
                    "    where gsi.bistamibas_limenis > 4 and gsi.bistamibas_limenis < 7";

    public static String GEO_SLANIS_BISTAMS =
            "select gs.id, gs.geometrija, gsi.papildinformacija from geo_slanis gs\n" +
                    "    inner join geo_slanis_info gsi on gs.id = gsi.geo_slanis_id\n" +
                    "    where gsi.bistamibas_limenis >= 7";


    public static String GRUNTSUDENS =
            "select g.id, g.geometrija, gi.nosaukums from gruntsudens g \n" +
                    "    inner join gruntsudens_info gi on g.id = gi.gruntsudens_id\n" +
                    "    where gi.dzilumms > 0 ";

    public static String CELAS =
            "select c.id, c.geometrija, ci.nosaukums from cela c\n" +
                    "    inner join cela_info ci on c.id = ci.cela_id";

    public static String NOLIKTAVAS =
            "select n.id, n.geometrija, ni.papildinformacija from noliktava n\n" +
                    "    inner join noliktava_info ni on n.id = ni.noliktava_id";

    public static String PETNIEKU_CENTRS =
            "select pc.id, pc.geometrija, pci.nosaukums from petnieku_centrs pc\n" +
                    "    inner join petnieku_centrs_info pci on pc.id = pci.petnieku_centrs_id";

    public static String DARBA_MASINA =
            "select dm.id, dm.geometrija, CONCAT(dmi.tips, CONCAT(CONCAT(' (',dmi.status),')')) nosaukums from darba_masina dm\n" +
                    "inner join darba_masina_info dmi on dm.id = dmi.darba_masinas_id";

    public static String IERICE =
            "select i.id, i.geometrija, CONCAT(ii.tips, CONCAT(CONCAT(' (',ii.status),')')) nosaukums from ierice i\n" +
                    "inner join ierice_info ii on i.id = ii.ierice_id";

    public static String RUDAS_VIETA =
            "select rv.id, rv.geometrija,  CONCAT(rvi.nosaukums, CONCAT(CONCAT(' (',rvi.tips),')')) nosaukums from RUDAS_VIETA rv\n" +
                    "inner join RUDAS_VIETA_INFO rvi on rvi.rudas_vieta_id = rv.id";

    public static String NEMETAL_MINERAL_VIETA =
            "select nmv.id, nmv.geometrija,  CONCAT(nmvi.nosaukums, CONCAT(CONCAT(' (',nmvi.tips),')')) nosaukums from NEMETAL_MINERAL_VIETA nmv\n" +
                    "inner join NEMETAL_MINERAL_VIETA_INFO nmvi on nmvi.nemetal_min_vieta_id = nmv.id";

    public static String selectorQueryBuilder(String selectorGeometry, String tableName) {

        return "select geometrija from \n" + tableName +
                " where SDO_ANYINTERACT(\n" +
                "              geometrija,\n" +
                "              MDSYS.SDO_GEOMETRY(\n" +
                "                  2003, \n" +
                "                  NULL,\n" +
                "                  NULL,\n" +
                "                  MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1),\n" +
                                   selectorGeometry +
                "                  ) \n" +
                "          ) = 'TRUE'"
                ;
    }

    public static String[] TABLES = {
           "CELA",
           "DARBA_MASINA",
           "GEO_SLANIS",
           "GRUNTSUDENS",
           "IERICE",
           "NEMETAL_MINERAL_VIETA",
           "NOLIKTAVA",
           "PETNIEKU_CENTRS",
           "RUDAS_VIETA"
    };

    public static String TEST = "select\n" +
            "    rv.id,\n" +
            "    rv.geometrija\n" +
            "from RUDAS_VIETA rv\n" +
            "where SDO_FILTER(\n" +
            "              rv.geometrija,\n" +
            "              MDSYS.SDO_GEOMETRY(\n" +
            "                      2003,\n" +
            "                      NULL,\n" +
            "                      NULL,\n" +
            "                      MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 4),\n" +
            "                      MDSYS.SDO_ORDINATE_ARRAY(64,5, 90,18, 58,30)\n" +
            "                  )\n" +
            "          ) = 'TRUE'";


}
