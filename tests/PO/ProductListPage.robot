*** Settings ***
Documentation    Page Object model for Product List Page
Library          SeleniumLibrary


*** Variables ***
${listProductsElement}                css:.card-title
${addBtnElement}                      css:.btn.btn-info
${checkoutElement}                    css:a.nav-link.btn.btn-primary

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
 
Wait For Its Loaded    
    Wait For Element To Be Visible    ${checkoutElement}
    
Proceed To Checkout 
    Log To Console     Proceeding to checkout
    Click Link     ${checkoutElement}