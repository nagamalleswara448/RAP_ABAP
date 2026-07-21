@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking View Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZNMR_RAP_Booking as select from /dmo/booking_m as booking
association to parent ZNMR_RAP_TRAVEL as _Travel on 
     $projection.TravelId = _Travel.TravelId

association to /dmo/book_stat_t as _bookstat on $projection.BookingStatus = _bookstat.booking_status   
association to /dmo/carrier as _carrier on $projection.CarrierId = _carrier.carrier_id
     
{
    key booking.travel_id as TravelId,
    key booking.booking_id as BookingId,
    booking.booking_status as BookingStatus,
    booking.carrier_id as CarrierId,
    booking.flight_date,
    @Semantics.amount.currencyCode: 'Currency'
    booking.flight_price as Price,    
    booking.currency_code as Currency,
    _bookstat,
    _carrier,
    _Travel
}
