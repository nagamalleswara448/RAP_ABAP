@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Requestor'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZNMR_TRAVEL_REQUESTOR
  as projection on ZNMR_RAP_TRAVEL
{
    @ObjectModel.text.element: [ 'Description' ]
    key TravelId,
    Description,        
    @ObjectModel.text.element: [ 'AgencyName' ]
    @Consumption.valueHelpDefinition: [{ 
           entity.name: '/DMO/I_Agency',
           entity.element: 'AgencyID'
     }]
    AgencyId,
    _agency.name as AgencyName,
      TripStartDate,
      TripEndDate, 
      TravelReqStatus,
      RequestStatus,
      Criticality,
      @Semantics.amount.currencyCode: 'Currency'
      BookingFee,
      @Semantics.amount.currencyCode: 'Currency'
      Price,
      Currency,
     @ObjectModel.text.element: [ 'CustomerName' ]
     @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Customer', entity.element: 'CustomerID' }]
      Customer,
      CustomerName,
      CreatedBy,
      CreatedAt,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VE_CALC_TRAVEL'
      @EndUserText.label: 'CO2 Tax'
      virtual CO2Tax:abap.int4,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VE_CALC_TRAVEL'
      @EndUserText.label: 'Week Day'
      virtual DayofTravel:abap.char(10),             
      _customer,
      _booking: redirected to composition child ZNMR_Booking_REQUESTOR
   
}
