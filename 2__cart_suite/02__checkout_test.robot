*** Settings ***
Documentation       This file contains test cases related to checkout for kohl's

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver      file=../test_data/Kohl's_data.xlsx      sheet_name=CheckoutTest

Test Setup      Launch Browser And Navigate To Url
Test Teardown    Close Browser
Test Template    Checkout Template
#Note:Rerun incase of failure of testcase.
*** Test Cases ***
Checkout Test

*** Keywords ***
Checkout Template
    [Arguments]     ${username}     ${password}    ${Coupon}   ${title}
    Click Element    //a[@title='Account']
    Click Element    class=account-signin
    Input Text    xpath=//input[@name='loginEmail']    ${username}
    Input Password    xpath=//input[@name='loginPassword']     ${password}
    Click Element    id=Profilelogin
    Click Element    xpath=//span[text()='Shop by Category']
    Click Element    xpath=(//a[@class='navigation-item-link'])[10]
    Click Element    xpath=//a[text()=' Boots']
    Run Keyword And Ignore Error  Click Element    xpath=//div[@class='dy-lb-close']
    Click Element    xpath=//p[text()='Dress Boots']
    Click Element    xpath=//img[@title="Aerosoles Cinnamon Women's Ankle Boots"]
    Wait Until Page Contains Element    xpath=//input[@class='pdp-addtobag']
    Click Element    xpath=//input[@class='pdp-addtobag']
    Click Element    xpath=//button[@title='View Cart & Checkout']
    Click Element    xpath=//div[@class='open-offers-block']
    Input Text    name=promoCode    ${Coupon}
    Title Should Be    ${title}
    Sleep    5s