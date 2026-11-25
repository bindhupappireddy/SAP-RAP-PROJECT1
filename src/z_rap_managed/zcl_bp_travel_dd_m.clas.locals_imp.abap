CLASS lhc_Z_TRAVEL_DD_M DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR z_travel_dd_m RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR z_travel_dd_m RESULT result.
    METHODS earlynumbering_cba_booking FOR NUMBERING
      entities FOR CREATE z_travel_dd_m\_booking.

    METHODS earlynumbering_create FOR NUMBERING
       entities FOR CREATE z_travel_dd_m.

ENDCLASS.

CLASS lhc_Z_TRAVEL_DD_M IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.

    DATA(lt_entities) = entities.
    DELETE lt_entities WHERE TravelId IS NOT INITIAL.
    "To get the number
    TRY.
        cl_numberrange_runtime=>number_get(
          EXPORTING
*      ignore_buffer     =
            nr_range_nr       = '01'
            object            = '/DMO/TRV_M'
            quantity          = CONV #( lines( lt_entities ) )
*      subobject         =
*      toyear            =
          IMPORTING
            number            = DATA(lv_next_num)
            returncode        = DATA(lv_code)
            returned_quantity = DATA(lv_qty)
        ).
      CATCH cx_nr_object_not_found.
      CATCH cx_number_ranges INTO DATA(lv_error).
        LOOP AT lt_entities INTO DATA(lwa_entity).
          APPEND VALUE #( %cid = lwa_entity-%cid
                          %key = lwa_entity-%key ) TO failed-z_travel_dd_m.
          APPEND VALUE #( %cid = lwa_entity-%cid
                          %key = lwa_entity-%key
                          %msg = lv_error ) TO reported-z_travel_dd_m.
        ENDLOOP.
    ENDTRY.

    ASSERT lv_qty = lines( lt_entities ).

*    DATA: lt_travel_dd_m type table for mapped early z_travel_dd_m,
*          ls_map TYPE LINE OF lt_travel_dd_m.
    DATA: lv_curr_num TYPE int8.
    lv_curr_num = lv_next_num - lv_qty.

    LOOP AT lt_entities INTO lwa_entity.

      lv_curr_num = lv_curr_num + 1.

      APPEND VALUE #( %cid = lwa_entity-%cid TravelId = lv_curr_num ) TO mapped-z_travel_dd_m.

    ENDLOOP.
  ENDMETHOD.

  METHOD earlynumbering_cba_Booking.
  ENDMETHOD.

ENDCLASS.
