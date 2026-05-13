*&---------------------------------------------------------------------*
*& Report ZSD_SALES_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsd_sales_report.

DATA:
  lt_vbak      TYPE STANDARD TABLE OF vbak,
  lv_tax       TYPE vbak-netwr,
  lv_tax_total TYPE vbak-netwr.

FIELD-SYMBOLS:
  <vbak>  LIKE LINE OF lt_vbak.

START-OF-SELECTION.

  SELECT *
    FROM vbak
    INTO TABLE lt_vbak.

  LOOP AT lt_vbak ASSIGNING <vbak>.
    lv_tax = ( <vbak>-netwr * 20 ) / 100.
    ADD lv_tax TO lv_tax_total.
  ENDLOOP.

  WRITE: / 'Tax rate:', 20, '%'.
  WRITE: / 'Tax total:', lv_tax_total.

* TBD
