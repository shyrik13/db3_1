
/** INSERT ceļas **/

INSERT INTO CELA
    VALUES(1, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                                                MDSYS.SDO_ORDINATE_ARRAY(0,27.5, 55,27.5, 55,29, 0,29, 0,27.5)));
INSERT INTO CELA_INFO
VALUES(1, 1, 'Galvena ceļa no trases', 'Galvena ceļa', 0.2);

INSERT INTO CELA
VALUES(2, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                     23,10.5, 23,14, 21,14, 21,16, 23,16,
                                     23,53, 20,53, 20,55, 23,55, 23,69,
                                     20,69, 20,71, 23,71, 23,75, 25,75,
                                     25,16, 26.5,16, 26.5,14, 25,14,
                                     25,10.5, 23,10.5
                                 )
    )
      );
INSERT INTO CELA_INFO
VALUES(2, 2, 'Ceļa savieno noliktavas un pētnieku centrus', 'Noliktavas un pētnieku centras ceļa', 0.7);

INSERT INTO CELA
VALUES(3, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                     55,11, 53,11, 53,76.5, 98,76.5, 96,30,
                                     96,75, 65,75, 65,67.5, 63.5,67.5, 63.5,75,
                                     55,75, 55,11
                                 )
    )
      );
INSERT INTO CELA_INFO
VALUES(3, 3, 'Galvena rakšanas ceļa', 'Rakšanas ceļa', 0.5);

/** INSERT noliktavas **/

INSERT INTO NOLIKTAVA
VALUES(1, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(12,0.5, 12,9, 36,9, 36,0.5, 12,0.5)));
INSERT INTO NOLIKTAVA_INFO
VALUES(1, 1, 0.7, 'Rūdas galvena noliktava');

INSERT INTO NOLIKTAVA
VALUES(2, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(14,11, 14,20, 21,20, 21,11, 14,11)));
INSERT INTO NOLIKTAVA_INFO
VALUES(2, 2, 0.4, 'Nemetālu minerālu galvena noliktava');

INSERT INTO NOLIKTAVA
VALUES(3, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(27,11, 27,20, 34,20, 34,11, 27,11)));
INSERT INTO NOLIKTAVA_INFO
VALUES(3, 3, 0.5, 'Izējvielas noliktava');

/** INSERT pētnieku centrus **/

INSERT INTO PETNIEKU_CENTRS
VALUES(1, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(11,46.5, 11,60, 20,60, 20,46.5, 11,46.5)));
INSERT INTO PETNIEKU_CENTRS_INFO
VALUES(1, 1, 'Rūdas un nemetalīsko minerālu izpēte', 'Izpētes pētnieku centrs');

INSERT INTO PETNIEKU_CENTRS
VALUES(2, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(11,63, 11,75, 20,75, 20,63, 11,63)));
INSERT INTO PETNIEKU_CENTRS_INFO
VALUES(2, 2, 'Izejvielas sagatavošana un izpēte', 'Izejvielas pētnieku centrs');

/** INSERT darba mašīnas **/

INSERT INTO DARBA_MASINA
VALUES(1, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(21.5,17, 21.5,19, 22.5,19, 22.5,17, 21.5,17)));
INSERT INTO DARBA_MASINA_INFO
VALUES(1, 1, 'Krāvas mašīna', 'izkrauj', 1, 2);

INSERT INTO DARBA_MASINA
VALUES(2, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(25.5,22.5, 25.5,24, 27,24, 27,22.5, 25.5,22.5)));
INSERT INTO DARBA_MASINA_INFO
VALUES(2, 2, 'Krāvas mašīna', 'stav', 2, 3);

INSERT INTO DARBA_MASINA
VALUES(3, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(23.5,32.5, 23.5,35, 26,35, 26,32.5, 23.5,32.5)));
INSERT INTO DARBA_MASINA_INFO
VALUES(3, 3, 'Aizsargu mašīna', 'brauc', 1, 1);

INSERT INTO DARBA_MASINA
VALUES(4, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(21.5,65, 21.5,67, 23,67, 23,65, 21.5,65)));
INSERT INTO DARBA_MASINA_INFO
VALUES(4, 4, 'Aizsargu mašīna', 'stav', 1, 2);

INSERT INTO DARBA_MASINA
VALUES(5, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(94,28, 94,31, 95.5,31, 95.5,28, 94,28)));
INSERT INTO DARBA_MASINA_INFO
VALUES(5, 5, 'Krāvas mašīna', 'strāda', 1, 1);

INSERT INTO DARBA_MASINA
VALUES(6, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(50,64, 50,68, 52,68, 52,64, 50,64)));
INSERT INTO DARBA_MASINA_INFO
VALUES(6, 6, 'Krāvas mašīna', 'strāda', 2, 3);

INSERT INTO DARBA_MASINA
VALUES(7, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(21,51.5, 22,51.5, 22,48.5, 21,48.5, 21,51.5)));
INSERT INTO DARBA_MASINA_INFO
VALUES(7, 7, 'Aizsargu mašīna', 'stav', 2, 1);

INSERT INTO DARBA_MASINA
VALUES(8, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(56,21.5, 56,25, 58,25, 58,21.5, 56,21.5)));
INSERT INTO DARBA_MASINA_INFO
VALUES(8, 8, 'Krāvas mašīna', 'stav', 1, 1);

INSERT INTO DARBA_MASINA
VALUES(9, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(56,21.5, 56,25, 58,25, 58,21.5, 56,21.5)));
INSERT INTO DARBA_MASINA_INFO
VALUES(9, 9, 'Pētnieku mašīna', 'pēta augsni', 1, 2);

INSERT INTO DARBA_MASINA
VALUES(10, MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(55.5,34, 55.5,38.5, 58,38.5, 58,34, 55.5,34)));
INSERT INTO DARBA_MASINA_INFO
VALUES(10, 10, 'Pētnieku mašīna', 'pēta augsni', 2, 1);

/** INSERT ierices **/

INSERT INTO IERICE
VALUES(1, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 4),
                             MDSYS.SDO_ORDINATE_ARRAY(35,30, 36.5,33.5, 37.5,31.5))
      );
INSERT INTO IERICE_INFO
VALUES(1, 1, 'seismometrs', 'parbauda uz zemestrīces', 'mēra pēc zemes vilcināšanās vilņiem', 1);

INSERT INTO IERICE
VALUES(2, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 4),
                             MDSYS.SDO_ORDINATE_ARRAY(91,32, 92.5,35.5, 93.5,33.5))
      );
INSERT INTO IERICE_INFO
VALUES(2, 2, 'būrs', 'strāda', 'būra no zemes rūdas', 1);

INSERT INTO IERICE
VALUES(3, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 4),
                             MDSYS.SDO_ORDINATE_ARRAY(60,15, 61.5,20.5, 62.5,16.5))
      );
INSERT INTO IERICE_INFO
VALUES(3, 3, 'būrs', 'strāda', 'būra no zemes minerālus', 1);

INSERT INTO IERICE
VALUES(4, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 4),
                             MDSYS.SDO_ORDINATE_ARRAY(65,37, 66.5,42.5, 67.5,38.5))
      );
INSERT INTO IERICE_INFO
VALUES(4, 4, 'seismometrs', 'parbauda uz zemestrīces', 'mēra pēc zemes vilcināšanās vilņiem', 2);

INSERT INTO IERICE
VALUES(5, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 4),
                             MDSYS.SDO_ORDINATE_ARRAY(47.5,60, 48,62, 49.5,60.5))
      );
INSERT INTO IERICE_INFO
VALUES(5, 5, 'būrs', 'neko nedara', 'būra no zemes rūdas', 2);

INSERT INTO IERICE
VALUES(6, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 4),
                             MDSYS.SDO_ORDINATE_ARRAY(60,64.5, 61.5,66, 62,63.5))
      );
INSERT INTO IERICE_INFO
VALUES(6, 6, 'būrs', 'strāda', 'būra no zemes rūdas', 2);

/** INSERT geo slanis **/

INSERT INTO GEO_SLANIS
VALUES(1, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                 75,0.5, 85.5,0.5, 85.5,1, 87.5,1, 87.5,1.5,
                                 88.5,1.5, 88.5,2, 90,2, 90,2.5, 91,2, 92,3,
                                 92,4, 92.5,4, 93,4.5, 93.5,5.5, 93,6.5,
                                 94,6.5, 94.5,8, 94.5,17, 95.5,13, 99,21,
                                 96.5,81, 93.5,83, 92.5,84.5, 90,89.5,
                                 80.5,96.5, 68.5,96.5, 55,95.5, 43,89,
                                 34.5,81, 31,75.5, 29.5,71.5, 28.5,71.5,
                                 25.5,64.5, 25.5,51, 26,45.5, 27.5,35,
                                 28,33, 30,30.5, 30.5,25.5, 36.5,21.5,
                                 38,18.5, 40,17.5, 42,14.5, 44.5,12.5,
                                 47.5,10.5, 52,7.5, 59,7, 61.5,6, 70,1, 75,0.5)
                            )
      );
INSERT INTO GEO_SLANIS_INFO
VALUES(1, 1, 'Ieži un mals', 1);

INSERT INTO GEO_SLANIS
VALUES(2, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                45,42.5, 56.5,42.5, 58,43.5, 61,42.5, 64,39,
                                66,37.5, 70,34.5, 71.5,34.5, 73.5,33.5, 76.5,33,
                                83,33, 89,34.5, 92.5,39.5, 94,45, 94,52.5,
                                92,58, 89.5,63.5, 87,66.5, 84.5,68.5, 77.5,69.5,
                                70.5,69.5, 67.5,68.5, 64,65.5, 63.5,62.5, 59,56,
                                56,55.5, 50,56, 45.5,60, 46,68.5, 41,71.5, 37.5,71.5,
                                31,70, 27.5,66, 27.5,55.5, 29.5,51, 33.5,47.5, 38,44.5, 45,42.5)
    )
      );
INSERT INTO GEO_SLANIS_INFO
VALUES(2, 2, 'Māls blakus ūdens', 5);

INSERT INTO GEO_SLANIS
VALUES(3, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                    27.5,50, 27,47, 31.5,37, 34.5,36, 38,33, 43.5,32.5, 47,30.5,
                                    48.5,30.5, 49.5,32.5, 49.5,37, 48.5,39.5, 47.5,40.5, 44.5,41,
                                    41.5,41, 39.5,42.5, 36,43.5, 33,44.5, 31,47, 27.5,50
                                 )
    )
      );
INSERT INTO GEO_SLANIS_INFO
VALUES(3, 3, 'Nestabīla un trausla augsne', 7);

INSERT INTO GEO_SLANIS
VALUES(4, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                    37.5,25, 37.5,23, 41.5,20.5, 43.5,15.5, 45.5,13, 48.5,13,
                                    50,15.5, 50,22.5, 49,24, 47.5,24, 45,25.5, 37.5,25
                                 )
    )
      );
INSERT INTO GEO_SLANIS_INFO
VALUES(4, 4, 'Mals blakus ūdens', 5);

INSERT INTO GEO_SLANIS
VALUES(5, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                    71,5.5, 81.5,5.5, 83.5,6.5, 85.5,9.5, 89.5,20, 89.5,29,
                                    88,31, 86,32.5, 81.5,32, 78,30.5, 75.5,30.5, 73.5,30,
                                    71,29.5, 68,28.5, 63,25, 61.5,22.5, 62,17.5, 63,13, 64.5,9.5,
                                    68.5,6, 71,5.5
                                 )
    )
      );
INSERT INTO GEO_SLANIS_INFO
VALUES(5, 5, 'Mals blakus ūdens', 5);

INSERT INTO GEO_SLANIS
VALUES(6, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                    74.5,9, 80,9, 82.5,11.5, 83.5,14, 84.5,16.5, 85.5,20,
                                    86,22.5, 85.5,27, 83,29, 77.5,29, 73.5,28, 69.5,27,
                                    66,24.5, 66.5,19.5, 67.5,16.5, 70,14, 70.5,11, 72,10,
                                    74.5,9
                                 )
    )
      );
INSERT INTO GEO_SLANIS_INFO
VALUES(6, 6, 'Nestabīla un trausla augsne', 9);

/** INSERT gruntsudens **/

INSERT INTO GRUNTSUDENS
VALUES(1, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                 45,46, 57,45.5, 61.5,46.5, 67,47.5, 73,48.6, 72.5,45.5,
                                 70,41.5, 70.5,38, 72,36.5, 74,36, 78.5,35, 85,35.5, 87.5,36.5,
                                 91,44, 90.5,46.5, 89,51, 87.5,54, 86,57, 83.5,59.5, 81.5,59.5,
                                 76.5,53.5, 74.5,52.5, 66.5,52, 56,51.5, 51,50, 49,50.5, 42.5,51,
                                 40.5,52.5, 39.5,55, 40,58, 41,59.5, 40.5,61.5, 39,64, 37.5,64,
                                 37,63, 36.5,61.5, 33,55, 33,52, 36,49.5, 38.5,48, 41.5,47, 45,46
                                 )
    )
      );
INSERT INTO GRUNTSUDENS_INFO
VALUES(1, 1, 'Centrālais gruntsudens ar minerāliem', 'Centrālais gruntsudens', 7);

INSERT INTO GRUNTSUDENS
VALUES(2, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                    28,45, 31.5,42.5, 32.5,39.5, 36.5,36, 40,34.5, 42.5,34, 46,33,
                                    46.5,36.5, 42,40, 37.5,41.5, 32,43.5, 28,45
                                 )
    )
      );
INSERT INTO GRUNTSUDENS_INFO
VALUES(2, 2, 'Pirmais mazs gruntsudens', 'Pirmais mazs gruntsudens', 5);

INSERT INTO GRUNTSUDENS
VALUES(3, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                    39,23.5, 43,21, 43.5,18.5, 45,16, 47,13.5, 48.5,16.5,
                                    49,22, 46,24, 39.5,25, 39,23.5
                                 )
    )
      );
INSERT INTO GRUNTSUDENS_INFO
VALUES(3, 3, 'Otrais mazs gruntsudens', 'Otrais mazs gruntsudens', 4);

INSERT INTO GRUNTSUDENS
VALUES(4, MDSYS.SDO_GEOMETRY(2003, NULL, NULL,   MDSYS.SDO_ELEM_INFO_ARRAY(1, 3, 1),
                             MDSYS.SDO_ORDINATE_ARRAY(
                                    71.5,13.5, 76,14, 77.5,15.5, 80,20, 80.5,24.5,
                                    78,26, 68.5,25.5, 68,21, 70,19, 70.5,14, 71.5,13.5
                                 )
    )
      );
INSERT INTO GRUNTSUDENS_INFO
VALUES(4, 4, 'Vidējais gruntsudens', 'Vidējais gruntsudens', 6);