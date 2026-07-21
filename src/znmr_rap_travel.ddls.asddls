@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Booking'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZNMR_RAP_TRAVEL as select from /dmo/travel_m as travel
     composition [0..*] of ZNMR_RAP_Booking as _booking
     association [1] to /dmo/agency as _agency on $projection.AgencyId = _agency.agency_id
     association [1..1] to  /DMO/I_Overall_Status_VH as _ostatus on $projection.TravelReqStatus = _ostatus.OverallStatus
     association[1] to /dmo/customer as _customer on $projection.Customer = _customer.customer_id
{
    key travel.travel_id as TravelId,
        travel.agency_id as AgencyId,
        travel.description as Description,
//        _agency.name as AgencyName,
//        _agency.city as AgencySituatedAt,
        travel.begin_date as TripStartDate,
        travel.end_date  as TripEndDate, 
        travel.overall_status as TravelReqStatus,
        _ostatus._Text.Text as RequestStatus,
        case overall_status
         when 'O' then '2'
         when 'A' then '3' 
         when 'X' then '1' 
         when 'R' then '1' end as Criticality,
         @Semantics.amount.currencyCode: 'Currency'
         travel.booking_fee as BookingFee,
         @Semantics.amount.currencyCode: 'Currency'
         travel.total_price as Price,
         travel.customer_id as Customer,
         concat_with_space(_customer.first_name,_customer.last_name, 1) as CustomerName,
         travel.currency_code as Currency,
         travel.created_by as CreatedBy,
         @Semantics.dateTime: true
         travel.created_at as CreatedAt,
         travel.last_changed_at as LastChangedAt,
        _customer,  
        _agency,
        _booking // Make association public
}
