*** Settings ***
Documentation    To validate the List of Products
Library          SeleniumLibrary
Library          Collections
Library          customLibs/shopLib.py
Test Setup       open the browser with the Mortgage payment url
#Test Teardown    CLose Browser
Resource         common.resource
Resource         PO/LandingPage.robot
Resource         PO/ProductListPage.robot
Resource         PO/CheckoutPage.robot

*** Variables ***
@{productsList}                       Blackberry     iphone X


*** Test Cases ***
Validate displayed list of products
    LandingPage.fill in the login form            ${global_user_name}            ${global_valid_password}
    ProductListPage.Wait For Its Loaded
    ProductListPage.Get Displayed List of Products
    ProductListPage.Confirm That List Contains the Following Products

Validate the functionality of adding product to the checkout
    LandingPage.fill in the login form            ${global_user_name}            ${global_valid_password}
    ProductListPage.Wait For Its Loaded
    ProductListPage.Get Displayed List Of Products
    select all products and checkout    ${productsList}
    ProductListPage.Proceed To Checkout
    CheckoutPage.Wait for Checkout Loaded
    CheckoutPage.Confirm the products were added to checkout properly    ${productsList}

    