*** Settings ***
Documentation    To validate the login form
Library     SeleniumLibrary
Library     webdriver_manager
Library    String
Library    Collections
Test Setup    Open CHROME Browser with Rahulshettyacademy.com
Test Teardown    Close Browser
Resource    ../PO/Generic_resource.robot


*** Test Cases ***
Validate child window functionality
    [Tags]    REGRESSION
    Select the link of child window
    Verify the user is switched to child window
    Grab the email id in child window
    switch to parent window and enter the email


*** Keywords ***
Select the link of child window
    Click Link    css:.blinkingText
    Sleep    5    
    ${child-window}=    Switch Window    NEW

Verify the user is switched to child window
    Title Should Be    RS Academy
    
Grab the email id in child window
    ${Window_msg}=    Get Text    css:.red
    #Log To Console    Original String is ${Window_msg}
    #Log    ${Window_msg}

    @{words} =	Split String	${Window_msg}    at
    #Log To Console    String after first split ${words}
    ${expectedStr} =    Get From List    ${words}    1
    Log To Console    semi Index String ${expectedStr}

    @{finalSplit} =	Split String	${expectedStr}   with
    Log To Console    Final String after final split ${finalSplit}
    ${finalemail} =    Get From List    ${finalSplit}    0
    Log To Console    First Index String ${finalemail}
    ${Email}=    Strip String    ${finalemail}
    Log To Console    Now final EMAIL ID is : ${Email}
    Set Global Variable    ${Email}
    
    

Switch to parent window and enter the email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username         ${Email}





    
    




