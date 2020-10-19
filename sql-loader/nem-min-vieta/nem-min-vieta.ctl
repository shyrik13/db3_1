load data into table NEMETAL_MINERAL_VIETA
insert
fields terminated by ","
(
    id  INTEGER EXTERNAL,
    geometrija column object(
        sdo_gtype constant 2003,
        sdo_elem_info varray count (constant 3) (x),
        sdo_ordinates varray terminated by "|/" (y)
    )
)