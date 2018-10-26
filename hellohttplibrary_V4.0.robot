*** Settings ***

Library                HttpLibrary.HTTP
Library                String

Resource               clients_operations.robot


*** Test Cases ***

Test Case 1 - Request information from all clients
    
    Request information of all clients and check status code
    
Test Case 2 - Generate a client
    
    Generate A Random Client
    
Test Case 3 - Request information of just one client
    
    Request information of a specific client and check status code
    
Test Case 4 - Create a new client
    
    Create A New Client With A Post Request
    
    