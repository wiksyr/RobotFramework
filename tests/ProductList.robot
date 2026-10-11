*** Settings ***
Documentation    To validate the List of Products
Library          SeleniumLibrary
Library          Collections
Library          customLibs/shopLib.py
Test Setup       open the browser with the Mortgage payment url
Test Teardown    CLose Browser
Resource         common.resource

*** Variables ***
${listProductsElement}                css:.card-title
${addBtnElement}                      css:.btn.btn-info
${product}                            Blackberry
@{productsList}                       Blackberry     iphone x


*** Test Cases ***
Validate displayed list of products
    fill in the login form            ${global_user_name}            ${global_valid_password}
    Wait For Element To Be Visible    ${checkoutElement}
    Get Displayed List of Products
    Confirm That List Contains the Following Products 

Validate the functionality of adding product to the list
    fill in the login form            ${global_user_name}            ${global_valid_password}
    Wait For Element To Be Visible    ${checkoutElement}
    Get Displayed List Of Products
    Select All Products And Checkout    ${productsList}

*** Keywords ***
Get Displayed List of Products
    @{cards}=    Get WebElements     ${listProductsElement}
    @{cardTitles}=    Create List
    FOR    ${card}    IN    @{cards}
        ${title}=         Get Text               ${card}
        Log To Console    ${title}
        Append To List    ${cardTitles}          ${title}
    END
    Set Global Variable   ${CARD_TITLES}        ${cardTitles}
    
Confirm That List Contains the Following Products
    @{cardTitlesExpected}=     Create List    iphone X    Samsung Note 8   Nokia Edge     Blackberry
    @{cardTitles}=             Get Variable Value    ${CARD_TITLES}
    Should Be Equal            ${cardTitles}    ${cardTitlesExpected}
    
Add To Checkout 
    [Arguments]       ${selectedProduct}
    ${index}=         Set Variable    0
    @{cardTitles}=    Get Variable Value    @{CARD_TITLES}
    FOR    ${title}    IN    @{cardTitles}
        IF    '${title}' == '${selectedProduct}'      BREAK
        ${index}=    Evaluate     ${index}+1
    END
    @{buttons}=    Get Web Elements     ${addBtnElement}
    Click Element     ${buttons}[${index}]

    