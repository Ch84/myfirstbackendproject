*** Variables ***

${http context variable} =       localhost:8080
${http context variable} =       http
${header content jason}  =       application/json
${response 200}          =       200 
${response 204}          =       204
${get client endpoint}   =       /hotel-rest/webresources/client/   
${post client endpont}   =       /hotel-rest/webresources/client/

*** Keywords ***

Request information of all clients and check status code

  Create Http Context             localhost:8080             http
    Get                             /hotel-rest/webresources/client/
    ${status}=                      Get Response Status
    Should contain                  ${status}                 200
    
Generate A Random Client
    ${id} =         Set Variable                  100
    ${name} =       Generate Random String        10
    ${createDate} =         Set Variable          1451602800000
    ${email} =              Catenate              SEPARATOR =         ${name}        @email.com
    ${gender} =             Generate Random String        1           MF
    ${socialSecurityNumber} =  Generate Random String        9          [NUMBERS]
    
    ${Client_dictionary} =     Create Dictionary     id=${id}
                               ...  name = ${name}       createDate = 1451602800000
                               ...  email= ${email}        gender = ${gender}
                               ...  socialSecurityNumber =   ${socialSecurityNumber}
                               ... 
    ${client json}             Stringify Json               ${Client_dictionary}
    [Return]                   ${client json} 
    
Request information of a specific client and check status code        [Arguments]        ${client id}
    
    Create Http Context         localhost:8080        http
    Get                         /hotel-rest/webresources/client/1${client id}
    ${status} =                 Get Response Status
    Should contain              ${status}             200
    
Create A New Client With A Post Request
    
    Create Http Context        localhost:8080        http
    
    ## We removed the code to generate a client. We need to replace it with something else.
    
    ${client json} =        Generate A Random Client
    Set Request Body        ${client json}
    Set Request Header      Content-Type          application/json
    
    post                    ${post client endpont}
    ${status} =             Get Response Status
    Should Contain          ${status}             204
    

