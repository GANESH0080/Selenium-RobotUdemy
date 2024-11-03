*** Settings ***
Documentation    To validate the login form
Library     SeleniumLibrary


*** Variables ***
${LOGIN URL}             https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}               Chrome
${INVALIDUSER_NAME}      Ganesh
${INVALID_PASSWORD}      learning
${VALIDUSER_NAME}        rahulshettyacademy
${VALID_PASSWORD}        learning
${product}    Nokia Edge


*** Keywords ***
Open CHROME Browser with Rahulshettyacademy.com
    Open Browser    ${LOGIN URL}    ${BROWSER}    webdrivermanager.webdriver_manager.chrome.ChromeDriverManager().install(),options=chrome_options))    options=add_experimental_option("detach", True)
    Maximize Browser Window


Open EDGE Browser with Rahulshettyacademy.com
    [Arguments]     ${LOGIN URLurl}    ${BROWSERb}    ${installation}
    Open Browser    ${LOGIN URLurl}    ${BROWSERb}     ${installation}
    Maximize Browser Window


Close Browser session
    Close All Browsers

Print Hello Before executing the TC
    Log To Console    Hello Team

Print Bye After executing the TC
    Log To Console    Bye Team
    
    
Wait until Element passed on located Page
    [Arguments]    ${Locator}    ${time}    
    Wait Until Element Is Visible    ${Locator}    ${time}