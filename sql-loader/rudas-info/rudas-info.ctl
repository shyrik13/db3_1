load data into table RUDAS_VIETA_INFO
insert
fields terminated by "," optionally enclosed by '"'
(
    info_id  INTEGER EXTERNAL,
    rudas_vieta_id INTEGER EXTERNAL,
    nosaukums,
    tips,
    papildinformacija,
    geo_slanis_info_id INTEGER EXTERNAL
)