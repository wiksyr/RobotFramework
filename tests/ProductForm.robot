*** Settings ***
Documentation      To Validate the Product Form
Library            Sellenium 
Library            Collections 
Test Setup         open the browser with the Mortgage payment url
Test Teardown      Close Browser 
Resource           common.resource

*** Test Cases ***

