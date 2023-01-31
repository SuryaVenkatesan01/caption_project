*** Settings ***
Documentation       This file contains test cases related to add to cart for kohl's

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver      file=../test_data/Kohl's_data.xlsx      sheet_name=AddToCartValidTest

Test Setup      Launch Browser And Navigate To Url
Test Teardown    Close Browser
Test Template    Add To Cart Valid Template

*** Test Cases ***
Add To Cart Valid Test

*** Keywords ***
Add To Cart Valid Template
    [Arguments]     ${username}     ${password}     ${expected_text}
    Click Element    //a[@title='Account']
    Click Element    class=account-signin
    Input Text    xpath=//input[@name='loginEmail']    ${username}
    Input Password    xpath=//input[@name='loginPassword']     ${password}
    Click Element    id=Profilelogin
    Click Element    xpath=//span[text()='Shop by Category']
    Click Element    xpath=(//a[@class='navigation-item-link'])[10]
    Click Element    xpath=//a[text()=' Boots']
    Click Element    xpath=//div[@class='dy-lb-close']
    Click Element    xpath=//p[text()='Dress Boots']
    Click Element    xpath=//p[@rel='/product/prd-3936276/aerosoles-cinnamon-womens-ankle-boots.jsp?prdPV=8']
    Click Element    xpath=//input[@class='pdp-addtobag']
    Page Should Contain    ${expected_text}
    Sleep    5s