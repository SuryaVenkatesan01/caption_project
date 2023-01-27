*** Settings ***
Library  AppiumLibrary
#Assignment
*** Test Cases ***
TC1
    [Documentation]      working with udemy app
    Open Application   remote_url=http://localhost:4723/wd/hub
    ...   platformName=android
    ...   deviceName=oneplus
    ...   appPackage=com.udemy.android
    ...   appActivity=com.udemy.android.CombinedDeepLinkActivity

    Set Appium Timeout    20s
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Sign In']
    Click Element    xpath=//android.widget.Button[@text='Sign In']
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Create an account']
    Click Element    xpath=//android.widget.Button[@text='Create an account']
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Sign up with email']
    Click Element    xpath=//android.widget.TextView[@text='Sign up with email']
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Sign In']
    Click Element    xpath=//android.widget.Button[@text='Sign In']
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@text='Email']
    Input Text    xpath=//android.widget.EditText[@text='Email']  suryavenkatesan6@gmail.com
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Next']
    Click Element    xpath=//android.widget.Button[@text='Next']
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@text='Password (8+ characters)']
    Input Text    xpath=//android.widget.EditText[@text='Password (8+ characters)']   surya2001
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Sign In']
    Click Element    xpath=//android.widget.Button[@text='Sign In']
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Skip']
    Click Element    xpath=//android.widget.Button[@text='Skip']
    ${count}    Get Matching Xpath Count    xpath=//*[@text='Top courses in Personal Development']
    WHILE    ${count}==0
        Swipe By Percent    90    75    95   25
        ${count}    Get Matching Xpath Count    xpath=//*[@text='Top courses in Personal Development']
    END
    Wait Until Page Contains Element   xpath=//*[@text='Top courses in Personal Development']
    Click Element    xpath=//*[@text='Top courses in Personal Development']
    Wait Until Page Contains Element   xpath=//android.widget.TextView[contains(@text,'Featured courses')]
    Element Should Contain Text      xpath=//android.widget.TextView[contains(@text,'Featured')]       Featured courses
    Sleep  10s
    [Teardown]  Close Application









