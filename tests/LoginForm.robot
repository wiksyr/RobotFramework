*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Library          DataDriver            file=resource/data.csv        encoding=utf_8        dialect=unix
Test Setup       open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource         common.resource
Resource         PO/LandingPage.robot
Test Template    Validate UnSuccessful Login

*** Test Cases ***    
Login with user ${user_name} and password ${password}

*** Keywords ***
Validate UnSuccessful Login
    [Tags]    REGRESSION
    [Arguments]     ${user_name}    ${password}
    LandingPage.fill in the login form    ${user_name}    ${password}
    wait for element to be visible    ${errorMsgElement}
    verify error message is correct    ${errorMsgElement}     Incorrect username/password.
    

    
    
