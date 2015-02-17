<cfcomponent>
	<cffunction name="init" access="public" returntype="GeoService">
		<cfargument name="userName" type="string">

		<cfset variables.user = userName>
		<cfreturn this>
	</cffunction>

	<cffunction access="public" name="postalCodeSearch" returntype="array" hint="returns a list of postal codes using the options.">
		<cfargument name="postalcode" type="string">

		<cfset var finalURL = "http://api.geonames.org/postalCodeSearch?" & "username=" & variables.user & "&postalcode=" & postalcode>
		<cfdump var="#finalURL#" output="console">
		<cfhttp url="#finalURL#" method="get" result="res">
		<cfreturn deserializeXML(#res.filecontent#)>
	</cffunction>

	<cffunction access="public" name="placeNameSearch" returntype="array" hint="returns a list of postal codes using the options.">
		<cfargument name="placeName" type="string">

		<cfset var finalURL = "http://api.geonames.org/postalCodeSearch?" & "username=" & variables.user & "&placename=" & placeName>
		<cfhttp url="#finalURL#" method="get" result="res">
			
		<cfreturn deserializeXML(#res.filecontent#)>
	</cffunction>

	<cffunction access="public" name="searchWithOptions" returntype="array" hint="returns a list of postal codes using the options.">
		<cfargument name="options" type="struct">

		<cfset var finalURL = "http://api.geonames.org/postalCodeSearch?" & "username=" & variables.user>

		<cfif structKeyExists(options, "placeName")>
			<cfset finalURL = finalURL & "&placename=" & options.placeName>
		</cfif>
		<cfif structKeyExists(options, "postalCode")>
			<cfset finalURL = finalURL & "&postalcode=" & options.postalCode>
		</cfif>
		<cfif structKeyExists(options, "countryCode")>
			<cfset finalURL = finalURL & "&country=" & options.countryCode>
		</cfif>

		<cfhttp url="#finalURL#" method="get" result="res">
			
		<cfreturn deserializeXML(#res.filecontent#)>
	</cffunction>

	<cffunction access="public" name="findNearbyPlaceName" returntype="array" hint="finds nearby places to the lat and long">
		<cfargument name="lat" type="string">
		<cfargument name="lng" type="string">

		<cfset var finalURL = "http://api.geonames.org/findNearbyPlaceName?" & "username=" & variables.user & "&lat=" & lat & "&lng=" & lng>
		<cfhttp url="#finalURL#" method="get" result="res">

		<cfreturn deserializeXML(#res.filecontent#)>


	</cffunction>

	<cffunction access="public" name="findTimeZone" returntype="array" hint="finds the time zone for a given location">
		<cfargument name="lat" type="string">
		<cfargument name="lng" type="string">

		<cfset var finalURL = "http://api.geonames.org/timezone?" & "username=" & variables.user & "&lat=" & lat & "&lng=" & lng>
		<cfhttp url="#finalURL#" method="get" result="res">

		<cfreturn deserializeXML(#res.filecontent#)>

	</cffunction>
</cfcomponent>