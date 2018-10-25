*** Settings ***

Library             HttpLibrary.HTTP
Library             String



*** Test Cases ***

Test Case 1 - Request data of client with id 1
    Create Http Context         localhost:8080        http
    Get                         /hotel-rest/webresources/client/1
    ${status} =                 Get Response Status
    Should contain              ${status}             200
    
Test Case 2 - Request data from all client 
   Create Http Context             localhost:8080             http
    Get                             /hotel-rest/webresources/client/
    ${status}=                      Get Response Status
    Should contain                  ${status}                 200
    
Test Case 3 - Create a new client
    Create Http Context        localhost:8080        http
    ${Client_dictionary} =     Create Dictionary     id=100
                         ... name  = name       createDate = 1451602800000
                         ... email = namn@namn.se        gender = M
                         ... socialSecurityNumber = 14191843
    ${client json} =        Stringify Json        ${Client_dictionary}
    Set Request Body        ${client json}
    Set Request Header      Content-Type          application/json
    
    post                    /hotel-rest/webresources/client/
    ${status} =             Get Response Status
    Should Contain          ${status}        204
    
    
    
    
    
    
    