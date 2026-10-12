*** Settings ***
Documentation    Page Object model for Checkout Page 
Library          SeleniumLibrary

*** Variables ***
${checkoutProductTitleElements}        css:.row tr td h4
${checkoutProductQuantityElements}     css:.row tr td input

*** Keywords ***
Wait for Checkout Loaded 
    Wait Until Element Is Visible    ${checkoutProductTitleElements}    10

Confirm the products were added to checkout properly 
    [Arguments]    ${productList}
    @{actualCheckProducts}=    Get WebElements     ${checkoutProductTitleElements}
    @{actualCheckProductTitles}=    Create List
    FOR    ${checkProduct}     IN    @{actualCheckProducts}
        ${title}=    Get Text    ${checkProduct}
        Append To List    ${actualCheckProductTitles}    ${title}
    END
    Lists Should Be Equal     ${actualCheckProductTitles}    ${productList}    ignore_order=true
