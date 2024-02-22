@EndUserText.label: '[AP] Tax Invoice List Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZMCDAP_C_TAX_INVOICE
  provider contract transactional_query
  as projection on ZMCDAP_R_TAX_INVOICE

{

      @Consumption.filter : {  selectionType: #SINGLE,
                               multipleSelections: false,
                               defaultValue: '1000',
                               mandatory: true }
      @Consumption.valueHelpDefinition: [
      {
        entity.name: 'I_CompanyCode',
        entity.element: 'CompanyCode'
      }
      ]
  key CompanyCode,

  key FiscalYear,

  key AccountingDocument,

      BusinessPlace,
      FiscalPeriod,
      TaxCode,
      DocumentDate,
      PostingDate,
      Customer,
      Supplier,
      BPTaxNumber,

      AccountingDocumentType,
      AccountingDocumentCreationDate,
      AccountingDocCreatedByUser,
      DocumentReferenceID,
      AccountingDocumentHeaderText,
      TransactionCurrency,
      JrnlEntryCntrySpecificRef1,
      AssignmentReference,
      DocumentItemText,
      Reference1IDByBusinessPartner,
      Reference2IDByBusinessPartner,
      Reference3IDByBusinessPartner,
      TaxDeterminationDate,
      OriginalReferenceDocument,
      //      BusinessPartner,
      //      BusinessPartnerName,

      /* Associations */
      _BusinessPartner,
      _JournalEntry
}
