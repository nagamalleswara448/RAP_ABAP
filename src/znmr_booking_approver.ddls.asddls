@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project View for Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZNMR_BOOKING_APPROVER as projection on ZNMR_RAP_Booking
{
    key TravelId,
    key BookingId,
    @ObjectModel.text.element: [ 'bookingstat' ]
    @Consumption.valueHelpDefinition: [{ entity.name: 'ZI_Booking_Status_VH', entity.element: 'BookingStatus' }]
    BookingStatus,
    _bookstat.text as bookingstat,
    @ObjectModel.text.element: [ 'name' ]
    @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Carrier', entity.element: 'AirlineID'  }]
    CarrierId,
    _carrier.name,
    @Semantics.amount.currencyCode: 'Currency'
    Price,
    Currency,
    flight_date,
    _bookstat,
    _Travel: redirected to parent ZNMR_TRAVEL_APPROVER

}
