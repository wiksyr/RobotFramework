*** Settings ***
Documentation    To perform the api testing 
Library          Collections
Library          RequestsLibrary

*** Variables ***
${base_url}        https://rahulshettyacademy.com
${book_name}       RobotFramework
${book_id}

*** Test Cases ***
Add Book into Library Database (POST)
    [Tags]    API
    &{req_body}=    Create Dictionary     name=${book_name}    isbn=125126    aisle=123123    author=wiktors
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    log     ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}=    Get From Dictionary     ${response.json()}    ID
    Set Global Variable     ${book_id}
    Should be equal as Strings    successfully added    ${response.json()}[Msg]
    Status should be     200    ${response}
    
Get Book from Library Database (GET)
    [Tags]    API
    ${response}=     Get     ${base_url}/Library/GetBook.php    params=ID=${book_id}
    log     ${response}
    Should be equal as strings    ${response.json()}[0][book_name]    ${book_name}
    
Delete Book from Library Database (DELETE) 
    [Tags]    API 
    ${req_body}=     Create Dictionary     ID=${book_id}
    ${response}=     Post    ${base_url}/Library/DeleteBook.php    json=${req_body}    expected_status=200
    log     ${response}
    Should be equal as strings     ${response.json()}[msg]     book is successfully deleted
