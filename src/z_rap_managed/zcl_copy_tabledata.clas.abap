CLASS zcl_copy_tabledata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_copy_tabledata IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

    "Copy first table
    SELECT *
      FROM /DMO/TRAVEL_M
      INTO TABLE @DATA(lt_table1).

    MODIFY ztravel_managed FROM TABLE @lt_table1.

    "Copy second table
    SELECT *
      FROM /DMO/BOOKING_M
      INTO TABLE @DATA(lt_table2).

    MODIFY zbooking_managed FROM TABLE @lt_table2.

    "Copy third table
    SELECT *
      FROM /dmo/booksuppl_m
      INTO TABLE @DATA(lt_table3).

    MODIFY zbook_supp_m FROM TABLE @lt_table3.

    out->write( 'Data copied successfully.' ).
    ENDMETHOD.
ENDCLASS.
