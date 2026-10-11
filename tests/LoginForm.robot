*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Library          DataDriver            file=resource/data.csv        encoding=utf_8        dialect=unix
Test Setup       open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource         common.resource
Test Template    Validate UnSuccessful Login

*** Variables ***
${errorMsgElement}    css:.alert.alert-danger
${checkoutElement}    xpath://a[contains(@class, 'nav-link') and normalize-space()='Shop']

*** Test Cases ***    
Login with user ${user_name} and password ${password}

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]     ${user_name}    ${password}
    fill in the login form    ${user_name}    ${password}
    wait for element to be visible    ${errorMsgElement}
    verify error message is correct    ${errorMsgElement}     Incorrect username/password.

verify error message is correct
    [Arguments]    ${element}    ${errorMsg}
    ${result}=     Get Text     ${element}
    Should Be Equal As Strings     ${result}    ${errorMsg}
    

    
    
