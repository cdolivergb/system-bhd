*&---------------------------------------------------------------------*
*& Report ZSD_SALES_ITEM_TAX_REPORT
*&---------------------------------------------------------------------*
*& Calculates tax total from sales order line items
*&---------------------------------------------------------------------*
REPORT zsd_sales_item_tax_report.

DATA:
  lt_vbap      TYPE STANDARD TABLE OF vbap,
  lv_tax       TYPE vbap-netwr,
  lv_tax_total TYPE vbap-netwr.

FIELD-SYMBOLS:
  <vbap> LIKE LINE OF lt_vbap.

START-OF-SELECTION.

  SELECT *
    FROM vbap
    INTO TABLE lt_vbap.

  LOOP AT lt_vbap ASSIGNING <vbap>.
    lv_tax = ( <vbap>-netwr * 30 ) / 100.
    ADD lv_tax TO lv_tax_total.
  ENDLOOP.

  WRITE: / 'Tax rate:', 30, '%'.
  WRITE: / 'Tax total:', lv_tax_total.
