*** Settings ***

Library             HttpLibrary.HTTP
Library             String

Resource            clients_operations.robot

*** Test Cases ***

Test Case 1 - Request data of client with id 1

    Request information of all clients and check status code


Test Case 2 - Request data from all clients
    
    Request information of all clients and check status code
    
Test Case 3 - Create a new client

    Create A New Client With A Post Request
    

