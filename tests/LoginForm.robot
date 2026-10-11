*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Test Setup       open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource         common.resource

*** Variables ***
${errorMsgElement}    css:.alert.alert-danger
${checkoutElement}    xpath://a[contains(@class, 'nav-link') and normalize-space()='Shop']

*** Test Cases ***
Validate UnSuccessful Login
    fill in the login form    ${user_name}    ${invalid_password}
    wait for element to be visible    ${errorMsgElement}
    verify error message is correct    ${errorMsgElement}     Incorrect username/password.

Validate Successful Login 
    Fill In The Login Form    ${user_name}    ${valid_password}
    Wait For Element To Be Visible    ${checkoutElement}

*** Keywords ***
verify error message is correct
    [Arguments]    ${element}    ${errorMsg}
    ${result}=     Get Text     ${element}
    Should Be Equal As Strings     ${result}    ${errorMsg}
    

    
    
