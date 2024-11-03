*** Settings ***
Documentation    All the page Objects and Keyword of Landing Page.
Library     SeleniumLibrary
Library    Collections

*** Variables ***
${CheckOutBTN}            css:.nav-link.btn.btn-primary


*** Keywords ***
#Wait for element is visible
#    Wait until Element passed on located Page    ${CheckOutBTN}    10s
    
    
Verify card tittles in the shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elem} =	Get Webelements    css:.card-title
    @{actuallist} =        Create List
    FOR  ${values}    IN        @{elem}
         ${text}=  Get Text  ${values}
         Log        ${values.text}
         Log To Console     ${text}
         Append To List      ${actuallist}       ${values.text}
    END
    Lists Should Be Equal        ${expectedList}        ${actuallist}




#Select product as
#    [Arguments]    ${product}
#    ${elem} =	Get Webelements    css:.card-title
#    ${index} =    Set Variable    1
#        FOR  ${values}    IN        @{elem}
#             ${text}=  Get Text  ${values}
#             Log        ${values.text}
#             Log To Console    ${text}
#             Exit For Loop if    '${values.text}' == '${product}'
#             ${index} =  Evaluate    ${index}+1
#        END
#    Click Button    Xpath:(//*[@class='card-footer'])[${index}]/button
