<cfset service = CreateObject("component", "GeoService")>
<cfset service.init("vyamoham")>

<h1>Postal code search</h1>

<cfset result = service.postalCodeSearch("682005")>
<cfdump var=#result#>

<h1>Place name search</h1>
<cfset result = service.placeNameSearch("Munnar")>
<cfdump var=#result#>

<h1>Search using multiple options</h1>
<cfset result = service.searchWithOptions({placeName : "Munnar", postalCode : "685612"})>
<cfdump var=#result#>

<h1>Search using multiple options</h1>
<cfset result = service.searchWithOptions({placeName : "London", countryCode : "GB", postalCode : "AL2 1HB"})>
<cfdump var=#result#>

<h1>Find nearby place using cordinates</h1>
<cfset result = service.findNearbyPlaceName("17.34912", "79.67047")>
<cfdump var=#result#>

<h1>Find the timezone of a place using cordinates</h1>
<cfset result = service.findTimeZone("51.72449", "-0.29767")>
<cfdump var=#result#>