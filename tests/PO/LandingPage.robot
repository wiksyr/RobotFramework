*** Settings ***
Documentation    Page Object model for Landing Page
Library          SeleniumLibrary


*** Variables ***
${errorMsgElement}    css:.alert.alert-danger



*** Keywords ***
open the browser with the Mortgage payment url
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_experimental_option    prefs    ${{ {'profile.password_manager_leak_detection': False} }}
    Create Webdriver    Chrome    options=${options}
    Go To    ${url}
    Maximize Browser Window

fill in the login form
    [Arguments]        ${username}    ${password}
    Input Text         id:username    ${username}
    Input Password     id:password    ${password}
    Click Button       id:signInBtn
