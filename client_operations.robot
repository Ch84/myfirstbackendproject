*** Settings ***
Library                HttpLibrary-HTTP
Library                Collections
Library                String
Library                json

*** Variables ***
${http context}=            localhost:8080        
${http set variable}=       http
${header content json}=     application/json
${header accept all}=       */*

#GET Endpoints

${get all clients endpoint}=                /hotel-rest//webresources/client
${get all clients counter endpoint}=        /hotel-rest//webresources/client/count

#POST Endpoints

${create a client endpoint}=                /hotel-rest//webresources/client

#PUT Endpoints

${edit a client endpoint}=                  /hotel-rest//webresources/client  #The id should be included

#Delete Endpoint

${delete a client endpoint}=               /hotel-rest//webresources/client   #The id should be included

*** Keywords ***
Generate a random client
    
    ${id}=                    Set Variable                100
    ${name}=                  Generate random String      10                [LOWER]  
    ${createDate}=            Set Variable                1473633063279
    ${email}=                 Catenate                    SEPARATOR=        ${name}        @email.com
    ${socialSecurityNumber}=  Generate Random String      9                 [NUMBERS]
    ${gender}=                Generate Random String      1                 MF
    ${dictionary}=            Create Dictionary           id=${id} name=${name} createDate=${createDate} email=${email} gender=${gender} socialSecurityNumber=${socialSecurityNumber}
    ${client json}=           Stringify Json              ${dictionary}
    [return]                  ${client json}
    
## Method using the GET   /webresources/client/count
    
Get the total of clients
    
    Create HTTP Context       ${http context}       ${http set variable}
    Set Request Header        Content-Type          ${header content json}
    Set Request Header        Accept                ${header accept all}
    HttpLibrary.HTTP.GET      ${get all clients counter endpoint}
    ${response status}=       Get Response Status
    ${total clients}=         Get Response Body
    log to console            ${\n}Getting the total of clients:${total clients}
    log to console            ${\n}Status code:${response status}
    Should contain            ${response status}          200
    
    #log to console
    
    [return]                  ${total clients}
    
## Method using  POST  /webresources/client/count
    
Create a client
    
    ${request body}=          Generate a random client
    Create HTTP Context       ${http context}       ${http set variable}         
    Set Request Header        Content-Type          ${header content json}
    Set Request Header        Accept                ${header accept all}
    Set Request Body          ${request body}
    log to console            ${\n}Creating a new client:${\n}DATA:${request body}
    HttpLibrary.HTTP.POST     ${create a client endpoint}
    ${response status}=       Get Response Status
    log to console            ${\n}Status code:${response status}
    Should contain            ${response status}        204









            
 
