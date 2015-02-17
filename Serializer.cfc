<cfcomponent>
	<cffunction name="canDeserialize" access="remote" returntype="boolean">
        <cfargument name="type" type="string"/>
      
        <cfreturn true>
    </cffunction>

    <cffunction name="deserialize" access="remote" returntype="any">
        <cfargument name="arg" type="String" hint="The string to be deserialized"/>
        <cfargument name="type" type="String" hint="The content-type header of the request."/>

        <cfset var xmlDoc = xmlParse(arg)>
         
        <cfif xmlDoc.XmlRoot.XmlName equals "geonames">
	
			<cfset var postalCodes = arrayNew(1)>
			
			<cfset var arrNodes = XmlSearch( xmlDoc, "//code" ) />
			<cfloop index="codeElt" array="#arrNodes#">
				<cfset var postalCodeStruct = structNew()>
				<cfset var numEntries = ArrayLen(codeElt.XMLChildren)>
		        <cfloop index="i" from="1" to="#numEntries#">
		        	<cfset key = codeElt.XMLChildren[i].XmlName>
		            <cfset postalCodeStruct[key] = codeElt.XMLChildren[i].XMLText>
		        </cfloop>
		        <cfset arrayAppend(postalCodes, postalCodeStruct)>
			</cfloop>

			<cfset arrNodes = XmlSearch( xmlDoc, "//geoname" ) />
			<cfloop index="codeElt" array="#arrNodes#">
				<cfset var postalCodeStruct = structNew()>
				<cfset var numEntries = ArrayLen(codeElt.XMLChildren)>
		        <cfloop index="i" from="1" to="#numEntries#">
		        	<cfset key = codeElt.XMLChildren[i].XmlName>
		            <cfset postalCodeStruct[key] = codeElt.XMLChildren[i].XMLText>
		        </cfloop>
		        <cfset arrayAppend(postalCodes, postalCodeStruct)>
			</cfloop>

			<cfset arrNodes = XmlSearch( xmlDoc, "//timezone" ) />
			<cfloop index="codeElt" array="#arrNodes#">
				<cfset var postalCodeStruct = structNew()>
				<cfset var numEntries = ArrayLen(codeElt.XMLChildren)>
		        <cfloop index="i" from="1" to="#numEntries#">
		        	<cfset key = codeElt.XMLChildren[i].XmlName>
		            <cfset postalCodeStruct[key] = codeElt.XMLChildren[i].XMLText>
		        </cfloop>
		        <cfset arrayAppend(postalCodes, postalCodeStruct)>
			</cfloop>
			
			<cfreturn #postalCodes#>
	
		</cfif>
      
    </cffunction>
</cfcomponent>