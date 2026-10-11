# Created by hp_no at 09.10.2026
*** Settings ***

*** Variables ***
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${global_user_name}            rahulshettyacademy
${global_invalid_password}     123456
${global_valid_password}       Learning@830$3mK2
${defaultTimeout}       10

${checkoutElement}      xpath://a[contains(@class, 'nav-link') and normalize-space()='Shop']


*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    ${url}
    Maximize Browser Window

fill in the login form
    [Arguments]        ${username}    ${password}
    Input Text         id:username    ${username}
    Input Password     id:password    ${password}
    Click Button       id:signInBtn

wait for element to be visible
    [Arguments]    ${element}
    Wait Until Element Is Visible     ${element}     ${defaultTimeout}