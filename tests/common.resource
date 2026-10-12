# Created by hp_no at 09.10.2026
*** Settings ***

*** Variables ***
${url}                         https://rahulshettyacademy.com/loginpagePractise/
${global_user_name}            rahulshettyacademy
${global_invalid_password}     123456
${global_valid_password}       Learning@830$3mK2
${defaultTimeout}              10

*** Keywords ***
wait for element to be visible
    [Arguments]    ${element}
    Wait Until Element Is Visible     ${element}     ${defaultTimeout}

verify error message is correct
    [Arguments]    ${element}    ${errorMsg}
    ${result}=     Get Text     ${element}
    Should Be Equal As Strings     ${result}    ${errorMsg}