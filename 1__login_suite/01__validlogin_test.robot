*** Settings ***
Documentation       This file contains test cases related to valid login for kohl's

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver      file=../test_data/Kohl's_data.xlsx      sheet_name=ValidKohl'sLoginTest

Test Setup      Launch Browser And Navigate To Url
Test Teardown    Close Browser
Test Template    Valid Kohl's Login Template

*** Test Cases ***
Valid Kohl's Login Test

*** Keywords ***
Valid Kohl's Login Template
    [Arguments]     ${username}     ${password}     ${expected_element}
    Click Element    //a[@title='Account']
    #Click Element    class=account-signin
    Input Text    xpath=//input[@name='loginEmail']    ${username}
    Input Password    xpath=//input[@name='loginPassword']     ${password}
    Click Element    xpath=//input[@id='Profilelogin']
    Element Should Contain    xpath=//span[text()='Shop by Category']    ${expected_element}
    Sleep    5s
