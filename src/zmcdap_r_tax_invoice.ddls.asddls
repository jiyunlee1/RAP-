@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '[AP] Tax Invoice List Root View'
define root view entity ZMCDAP_R_TAX_INVOICE
  as select from           I_OperationalAcctgDocTaxItem
    left outer to one join I_OperationalAcctgDocItem as _OperationalAcctgDocItem on  I_OperationalAcctgDocTaxItem.AccountingDocument = _OperationalAcctgDocItem.AccountingDocument
                                                                                 and I_OperationalAcctgDocTaxItem.CompanyCode        = _OperationalAcctgDocItem.CompanyCode
                                                                                 and I_OperationalAcctgDocTaxItem.FiscalYear         = _OperationalAcctgDocItem.FiscalYear


  association [0..1] to I_BusinessPartner          as _BusinessPartner          on  $projection.Customer = _BusinessPartner.BusinessPartner
                                                                                or  $projection.Supplier = _BusinessPartner.BusinessPartner

  association [0..1] to I_Businesspartnertaxnumber as _Businesspartnertaxnumber on  $projection.Customer = _Businesspartnertaxnumber.BusinessPartner
                                                                                or  $projection.Supplier = _Businesspartnertaxnumber.BusinessPartner

  association [0..1] to I_JournalEntry             as _JournalEntry             on  $projection.CompanyCode        = _JournalEntry.CompanyCode
                                                                                and $projection.AccountingDocument = _JournalEntry.AccountingDocument

{
      //I_OperationalAcctGdocTaxItem
  key I_OperationalAcctgDocTaxItem.CompanyCode,
  key I_OperationalAcctgDocTaxItem.FiscalYear,
  key I_OperationalAcctgDocTaxItem.AccountingDocument,
      I_OperationalAcctgDocTaxItem.TaxCode,

      //I_OperationalAcctgDocItem
      _OperationalAcctgDocItem.BusinessPlace,
      _OperationalAcctgDocItem.DocumentDate,
      _OperationalAcctgDocItem.PostingDate,
      _OperationalAcctgDocItem.Customer,
      _OperationalAcctgDocItem.Supplier, 
      _OperationalAcctgDocItem.AssignmentReference,
      _OperationalAcctgDocItem.DocumentItemText,
      _OperationalAcctgDocItem.Reference1IDByBusinessPartner,
      _OperationalAcctgDocItem.Reference2IDByBusinessPartner,
      _OperationalAcctgDocItem.Reference3IDByBusinessPartner,
      _OperationalAcctgDocItem.TaxDeterminationDate,
      _OperationalAcctgDocItem.OriginalReferenceDocument,

      _BusinessPartner.BusinessPartner,
      _BusinessPartner.BusinessPartnerName,

      _Businesspartnertaxnumber.BPTaxNumber,

      _JournalEntry.FiscalPeriod,      
      _JournalEntry.AccountingDocumentCreationDate,
      _JournalEntry.AccountingDocCreatedByUser,
      _JournalEntry.DocumentReferenceID,
      _JournalEntry.AccountingDocumentHeaderText,
      _JournalEntry.TransactionCurrency,
      _JournalEntry.JrnlEntryCntrySpecificRef1,
      _JournalEntry.AccountingDocumentType,   

      //public associations
      _BusinessPartner,
      _JournalEntry

}
