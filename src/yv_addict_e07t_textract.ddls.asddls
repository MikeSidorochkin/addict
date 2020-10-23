@AbapCatalog.sqlViewName: 'YVADDICT002'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'E07T tablosundaki metinleri açar'
define view YV_ADDICT_E07T_TEXTRACT
  as select from e07t {
  key trkorr,
  as4text,
  left(as4text, 1) as as4text_1,
  left(as4text, 2) as as4text_2,
  left(as4text, 3) as as4text_3,
  left(as4text, 4) as as4text_4,
  left(as4text, 5) as as4text_5,
  left(as4text, 6) as as4text_6,
  left(as4text, 7) as as4text_7,
  left(as4text, 8) as as4text_8,
  left(as4text, 9) as as4text_9,
  left(as4text, 10) as as4text_10,
  left(as4text, 11) as as4text_11,
  left(as4text, 12) as as4text_12,
  left(as4text, 13) as as4text_13,
  left(as4text, 14) as as4text_14,
  left(as4text, 15) as as4text_15,
  left(as4text, 16) as as4text_16,
  left(as4text, 17) as as4text_17,
  left(as4text, 18) as as4text_18,
  left(as4text, 19) as as4text_19,
  left(as4text, 20) as as4text_20,
  left(as4text, 21) as as4text_21,
  left(as4text, 22) as as4text_22,
  left(as4text, 23) as as4text_23,
  left(as4text, 24) as as4text_24,
  left(as4text, 25) as as4text_25,
  left(as4text, 26) as as4text_26,
  left(as4text, 27) as as4text_27,
  left(as4text, 28) as as4text_28,
  left(as4text, 29) as as4text_29,
  left(as4text, 30) as as4text_30,
  left(as4text, 31) as as4text_31,
  left(as4text, 32) as as4text_32,
  left(as4text, 33) as as4text_33,
  left(as4text, 34) as as4text_34,
  left(as4text, 35) as as4text_35,
  left(as4text, 36) as as4text_36,
  left(as4text, 37) as as4text_37,
  left(as4text, 38) as as4text_38,
  left(as4text, 39) as as4text_39,
  left(as4text, 40) as as4text_40,
  left(as4text, 41) as as4text_41,
  left(as4text, 42) as as4text_42,
  left(as4text, 43) as as4text_43,
  left(as4text, 44) as as4text_44,
  left(as4text, 45) as as4text_45,
  left(as4text, 46) as as4text_46,
  left(as4text, 47) as as4text_47,
  left(as4text, 48) as as4text_48,
  left(as4text, 49) as as4text_49,
  left(as4text, 50) as as4text_50,
  left(as4text, 51) as as4text_51,
  left(as4text, 52) as as4text_52,
  left(as4text, 53) as as4text_53,
  left(as4text, 54) as as4text_54,
  left(as4text, 55) as as4text_55,
  left(as4text, 56) as as4text_56,
  left(as4text, 57) as as4text_57,
  left(as4text, 58) as as4text_58,
  left(as4text, 59) as as4text_59,
  left(as4text, 60) as as4text_60
}
where
  langu = $session.system_language