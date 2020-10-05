*** Settings ***
Library    SeleniumLibrary    

Suite Setup        Log    I am inside testSuite setup
Suite Teardown     log    I am inside testSuite teardown
Test Setup         log    I am inside test setup
Test Teardown      Log    I am inside test teardown now   

Default Tags    sanity

*** Test Cases ***
# Run test from cmd : C:\mehdi\work\workSpace\RobotProject1>robot -t MyFirstTest --settag=regression1 Test\TestSuit1.robot
# Run test by his tag : robot --include test1 test\TestSuit1.robot
                      # robot -i sanity -i test1 test\TestSuit1.robot
                      # robot -i sanity -e test1 test\TestSuit1.robot
MyFirstTest
    [Tags]    test1
    Log    Hello World!    
    
FirstSeleniumTest 
    Set Tags    test2
    Remove Tags    seleniumTest
    Open Browser                 https://google.com        chrome
    Set Browser Implicit Wait    5
    Input Text                   name=q                    testRecherche
    Press Keys                   name=q    ENTER
    # Click Button    name=btnK    
    Sleep    2        
    Close Browser
    Log    Test completed!    
    
SampleLoginTest
    [Tags]    havetoexclude
    [Documentation]     This is a sample login test
    Open Browser        ${URL}            chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5
    LoginKW    ${CREDENTIALS}[0]    ${LOGININFOS}[password]
    Click Element       id=welcome
    Click Element       link=Logout
    Log                 Test completed
    Log                 This test was executed by %{username} on %{os}
    Close Browser
    
*** Variables ***
# Scalar variable
${URL}             https://opensource-demo.orangehrmlive.com/

# List variable
@{CREDENTIALS}    Admin    admin123

# Dictionary variable
&{LOGININFOS}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    [Arguments]    ${usr}    ${pswd}
    Input Text          id=txtUsername  ${usr}    
    Input Password      id=txtPassword  ${pswd}
    Click Button        id=btnLogin








