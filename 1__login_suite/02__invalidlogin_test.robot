*** Settings ***
Documentation       This file contains test cases related to invalid login for kohl's

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver      file=../test_data/Kohl's_data.xlsx      sheet_name=InvalidKohl'sLoginTest

Test Setup      Launch Browser And Navigate To Url
Test Teardown    Close Browser
Test Template    Invalid Kohl's Login Template

*** Test Cases ***
Invalid Kohl's Login Test_${test_case}
*** Keywords ***
Invalid Kohl's Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Click Element    //a[@title='Account']
    Click Element    class=account-signin
    Input Text    xpath=//input[@name='loginEmail']    ${username}
    Input Password    xpath=//input[@name='loginPassword']     ${password}
    Click Element    id=Profilelogin
    Element Text Should Be    xpath=//a[contains(text(),'Please enter valid email')]    ${expected_error}
    Sleep    5s
