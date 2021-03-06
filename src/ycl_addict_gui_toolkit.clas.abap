CLASS ycl_addict_gui_toolkit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS are_you_sure
      IMPORTING !text TYPE clike
      RAISING   ycx_addict_user_input.

    CLASS-METHODS display_transport_requests
      IMPORTING !requests TYPE ycl_addict_transport_request=>trkorr_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS: BEGIN OF answer,
                 yes          TYPE char1 VALUE 'J',
                 first_button TYPE char1 VALUE '1',
               END OF answer.

    CONSTANTS: BEGIN OF icon_name,
                 okay   TYPE iconname VALUE 'ICON_OKAY',
                 cancel TYPE iconname VALUE 'ICON_CANCEL',
               END OF icon_name.
ENDCLASS.



CLASS ycl_addict_gui_toolkit IMPLEMENTATION.
  METHOD are_you_sure.
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Asks the user if he/she wants to continue
    " Raises exception on rejection
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA user_answer(1).

    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        titlebar              = TEXT-608
        text_question         = text
        text_button_1         = TEXT-105
        icon_button_1         = ycl_addict_gui_toolkit=>icon_name-okay
        text_button_2         = TEXT-106
        icon_button_2         = ycl_addict_gui_toolkit=>icon_name-cancel
        display_cancel_button = abap_false
      IMPORTING
        answer                = user_answer
      EXCEPTIONS
        text_not_found        = 1
        OTHERS                = 2.

    ASSERT sy-subrc = 0.

    IF user_answer <> ycl_addict_gui_toolkit=>answer-first_button.
      RAISE EXCEPTION TYPE ycx_addict_user_input
        EXPORTING
          textid = ycx_addict_user_input=>user_cancelled.
    ENDIF.
  ENDMETHOD.


  METHOD display_transport_requests.
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Displays transport requests in standard TCode
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    CHECK requests IS NOT INITIAL.

    DATA(displayable_requests) = ycl_addict_transport_request=>get_request_list( VALUE #(
                                     srch_strkorr = abap_true
                                     trkorr_rng   = VALUE #( FOR _request IN requests (
                                                             sign   = ycl_addict_toolkit=>sign-include
                                                             option = ycl_addict_toolkit=>option-eq
                                                             low    = _request ) ) ) ).

    DATA(wd_requests) = VALUE strhi_requests_wd( ).

    LOOP AT displayable_requests ASSIGNING FIELD-SYMBOL(<request>).
      TRY.
          DATA(request_obj) = ycl_addict_transport_request=>get_instance( <request>-trkorr ).
          DATA(content) = request_obj->get_content( ).

          APPEND VALUE #( h              = CORRESPONDING #( request_obj->get_header( ) )
                          objects        = CORRESPONDING #( content-objects )
                          keys           = CORRESPONDING #( content-keys )
                          objects_filled = abap_true
                        ) TO wd_requests.

        CATCH cx_root ##no_handler.
      ENDTRY.
    ENDLOOP.

    CALL FUNCTION 'TRINT_DISPLAY_REQUESTS'
      EXPORTING
        it_requests        = wd_requests
        iv_first_node_text = TEXT-013.
  ENDMETHOD.
ENDCLASS.
