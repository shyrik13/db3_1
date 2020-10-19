
/*** CELA tabula izveidošana ar info tābulu CELA_INFO ***/

CREATE TABLE CELA (
                      id              NUMBER CONSTRAINT CONSTRAINT_CELA PRIMARY KEY,
                      geometrija      MDSYS.SDO_GEOMETRY
);

CREATE TABLE CELA_INFO (
                           info_id         NUMBER CONSTRAINT CONSTRAINT_CELA_INFO PRIMARY KEY,
                           cela_id         NUMBER UNIQUE REFERENCES CELA(id),
                           papildinformacija VARCHAR (255),
                           nosaukums       VARCHAR (255),
                           slodze          DECIMAL
);

/*** GRUNSUDENS tabula izveidošana ar info tābulu GRUNTSUDENS_INFO ***/

CREATE TABLE GRUNTSUDENS (
                      id              NUMBER CONSTRAINT CONSTRAINT_GRUNTSUDENS PRIMARY KEY,
                      geometrija      MDSYS.SDO_GEOMETRY
);

CREATE TABLE GRUNTSUDENS_INFO (
                           info_id         NUMBER CONSTRAINT CONSTRAINT_GRUNTSUDENS_INFO PRIMARY KEY,
                           gruntsudens_id  NUMBER UNIQUE REFERENCES GRUNTSUDENS(id),
                           papildinformacija VARCHAR (255),
                           nosaukums       VARCHAR (255),
                           dzilumms          DECIMAL
);

/*** NOLIKTAVA tabula izveidošana ar info tābulu NOLIKTAVA_INFO ***/

CREATE TABLE NOLIKTAVA (
                             id              NUMBER CONSTRAINT CONSTRAINT_NOLIKTAVA PRIMARY KEY,
                             geometrija      MDSYS.SDO_GEOMETRY
);

CREATE TABLE NOLIKTAVA_INFO (
                                  info_id       NUMBER CONSTRAINT CONSTRAINT_NOLIKTAVA_INFO PRIMARY KEY,
                                  noliktava_id  NUMBER UNIQUE REFERENCES NOLIKTAVA(id),
                                  slodze        NUMBER,
                                  papildinformacija VARCHAR(255)
);

/*** NOLIKTAVA tabula izveidošana ar info tābulu NOLIKTAVA_INFO ***/

CREATE TABLE PETNIEKU_CENTRS (
                             id              NUMBER CONSTRAINT CONSTRAINT_PETNIEKU_CENTRS PRIMARY KEY,
                             geometrija      MDSYS.SDO_GEOMETRY
);

CREATE TABLE PETNIEKU_CENTRS_INFO (
                                  info_id           NUMBER CONSTRAINT CONSTRAINT_PETNIEKU_CENTRS_INFO PRIMARY KEY,
                                  petnieku_centrs_id NUMBER UNIQUE REFERENCES PETNIEKU_CENTRS(id),
                                  specializacija    VARCHAR(255),
                                  nosaukums         VARCHAR(100)
);

/*** DARBA_MASINA tabula izveidošana ar info tābulu DARBA_MASINA_INFO ***/

CREATE TABLE DARBA_MASINA (
                             id              NUMBER CONSTRAINT CONSTRAINT_DARBA_MASINA PRIMARY KEY,
                             geometrija      MDSYS.SDO_GEOMETRY
);

CREATE TABLE DARBA_MASINA_INFO (
                                  info_id           NUMBER CONSTRAINT CONSTRAINT_DARBA_MASINA_INFO PRIMARY KEY,
                                  darba_masinas_id  NUMBER UNIQUE REFERENCES DARBA_MASINA(id),
                                  tips              VARCHAR(255),
                                  status            VARCHAR(255),
                                  petnieku_centrs_info_id NUMBER REFERENCES PETNIEKU_CENTRS_INFO(INFO_ID),
                                  noliktava_info_id NUMBER REFERENCES NOLIKTAVA_INFO(INFO_ID)
);

/*** IERICE tabula izveidošana ar info tābulu IERICE_INFO ***/

CREATE TABLE IERICE (
                             id              NUMBER CONSTRAINT CONSTRAINT_IERICE PRIMARY KEY,
                             geometrija      MDSYS.SDO_GEOMETRY
);

CREATE TABLE IERICE_INFO (
                                  info_id           NUMBER CONSTRAINT CONSTRAINT_IERICE_INFO PRIMARY KEY,
                                  ierice_id         NUMBER UNIQUE REFERENCES IERICE(id),
                                  tips              VARCHAR(255),
                                  status            VARCHAR(255),
                                  papildinformacija VARCHAR(255),
                                  petnieku_centrs_info_id NUMBER REFERENCES PETNIEKU_CENTRS_INFO(INFO_ID)
);

/*** GEO_SLANIS tabula izveidošana ar info tābulu GEO_SLANIS_INFO ***/

CREATE TABLE GEO_SLANIS (
                              id              NUMBER CONSTRAINT CONSTRAINT_GEO_SLANIS PRIMARY KEY,
                              geometrija      MDSYS.SDO_GEOMETRY
);

CREATE TABLE GEO_SLANIS_INFO (
                                   info_id           NUMBER CONSTRAINT CONSTRAINT_GEO_SLANIS_INFO PRIMARY KEY,
                                   geo_slanis_id     NUMBER UNIQUE REFERENCES GEO_SLANIS(id),
                                   papildinformacija VARCHAR(255),
                                   bistamibas_limenis DECIMAL
);

/*** NEMETAL_MINERAL_VIETA tabula izveidošana ar info tābulu NEMETAL_MINERAL_VIETA_INFO ***/

CREATE TABLE NEMETAL_MINERAL_VIETA (
                              id              NUMBER CONSTRAINT CONSTRAINT_NEMETAL_MINERAL_VIETA PRIMARY KEY,
                              geometrija      MDSYS.SDO_GEOMETRY
);

CREATE TABLE NEMETAL_MINERAL_VIETA_INFO (
                                   info_id           NUMBER CONSTRAINT CONSTRAINT_NEMETAL_MINERAL_VIETA_INFO PRIMARY KEY,
                                   nemetal_min_vieta_id NUMBER UNIQUE REFERENCES NEMETAL_MINERAL_VIETA(id),
                                   nosaukums VARCHAR(255),
                                   tips VARCHAR(255),
                                   papildinformacija VARCHAR(255),
                                   geo_slanis_info_id NUMBER REFERENCES GEO_SLANIS_INFO(GEO_SLANIS_ID)
);

/*** RUDAS_VIETA tabula izveidošana ar info tābulu RUDAS_VIETA_INFO ***/

CREATE TABLE RUDAS_VIETA (
                              id              NUMBER CONSTRAINT CONSTRAINT_RUDAS_VIETA PRIMARY KEY,
                              geometrija      MDSYS.SDO_GEOMETRY
);

CREATE TABLE RUDAS_VIETA_INFO (
                                   info_id        NUMBER CONSTRAINT CONSTRAINT_RUDAS_VIETA_INFO PRIMARY KEY,
                                   rudas_vieta_id NUMBER UNIQUE REFERENCES RUDAS_VIETA(id),
                                   nosaukums VARCHAR(255),
                                   tips VARCHAR(255),
                                   papildinformacija VARCHAR(255),
                                   geo_slanis_info_id NUMBER REFERENCES GEO_SLANIS_INFO(GEO_SLANIS_ID)
);