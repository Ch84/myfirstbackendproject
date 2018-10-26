*** Settings ***

Library             HttpLibrary.HTTP
Library             String

*** Keywords ***

Generate A Random Client
    ${id} =         Set Variable                  100
    ${name} =       Generate Random String        10                  [LOWER]
    ${createDate} =         Set Variable          1451602800000
    ${email} =              Catenate              SEPARATOR=          ${name}        @email.com
    ${socialSecurityNumber} =  Generate Random String        9        [NUMBERS]
    ${gender} =             Generate Random String        1           MF
    
    ${Client_dictionary} =     Create Dictionary     id=${id}
                               ... name  = ${name}       createDate = 1451602800000
                               ... email  = ${email}        gender = ${gender}
                               ... socialSecurityNumber =   ${socialSecurityNumber}
                               ... 
    ${client json}             Stringify Json               ${Client_dictionary}
    [return]                   ${client json} 
    
    
    

*** Test Cases ***

Test Case 1 - Request data of clients with id 1
    Create Http Context         localhost:8080        http
    Get                         /hotel-rest/webresources/client/1
    ${status} =                 Get Response Status
    Should contain              ${status}             200
    
Test Case 2 - Request data from all clients
   Create Http Context             localhost:8080             http
    Get                             /hotel-rest/webresources/client/
    ${status}=                      Get Response Status
    Should contain                  ${status}                 200
    
Test Case 3 - Create a new client
    Create Http Context        localhost:8080        http
    
    ## We removed the code to generate a client. We need to replace it with something.
    
    ${client json} =        Stringify Json        ${Client_dictionary}
    Set Request Body        ${client json}
    Set Request Header      Content-Type          application/json
    
    post                    /hotel-rest/webresources/client/
    ${status} =             Get Response Status
    Should Contain          ${status}        204
    
    
    
    
    
    
    