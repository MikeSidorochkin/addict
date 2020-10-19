INTERFACE yif_addict_system_rules
  PUBLIC .

  TYPES ticket_id_list TYPE STANDARD TABLE OF yd_addict_ticket_id WITH EMPTY KEY.
  TYPES trkorr_list TYPE STANDARD TABLE OF trkorr WITH EMPTY KEY.

  CONSTANTS: BEGIN OF class,
               me TYPE seoclsname VALUE 'YIF_ADDICT_SYSTEM_RULES',
             END OF class.

  METHODS get_requests_of_tickets
    IMPORTING !tickets        TYPE ticket_id_list
    RETURNING VALUE(requests) TYPE trkorr_list.

ENDINTERFACE.
