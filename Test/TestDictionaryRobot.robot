*** Settings ***
Library    Collections
Library    RequestsLibrary


*** Variables ***
${baseurl}    http://216.10.245.166
${idvalue}
${bookName}    Learn Appium Automation with python3


*** Test Cases ***
Play around the Dictionary
    [Tags]        API
    &{dict} =	Create Dictionary	name=Ganesh    course=Robot    Trainer=Salunkhe    98=45    age=37
    log    ${dict}
    Log To Console    ${dict}
    Dictionary Should Contain Item      ${dict}        course   Robot
    Dictionary Should Contain Key          ${dict}        Trainer
    Dictionary Should Contain Key          ${dict}        98
    #Dictionary Should Contain Key          ${dict}        Add
    Dictionary Should Contain Value        ${dict}        37
    
    Log To Console    ${dict}[course]
    Log To Console    ${dict}[98]
    Log To Console    ${dict}[age]
    ${namevalue} =    Get From Dictionary    ${dict}    name
    Log To Console    ${namevalue}
    

Add Book in Library Database
     [Tags]        API
     &{req_body}=        Create Dictionary    name=${bookName}    isbn=867450    aisle=9923800    author=John
     ${response}=        POST        ${baseurl}/Library/Addbook.php    json=${req_body}    expected_status=200
     Log To Console        ${response.json()}
     Dictionary Should Contain Key    ${response.json()}    ID
     ${idvalue}=        Get From Dictionary    ${response.json()}    ID
     Log To Console    ${idvalue}
     Set Global Variable        ${idvalue}
     Log To Console    ${response.json()}[Msg]
     Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
     Status Should Be    200         ${response}



Get the Book Details which got added
     [Tags]        API
     ${getresponse} =    GET    ${baseurl}/Library/GetBook.php    params=ID=${idvalue}   expected_status=200
     #Printing the Json Response(Response contains LIST type Response)
     Log To Console    ${getresponse.json()}

     #Comparing actual book value with Expected book value
     #0 is the index of dictionary (From List dictionary index is 0)
     Should Be Equal As Strings    ${getresponse.json()}[0][book_name]    ${bookName}
     Log To Console   ${getresponse.json()}[0][book_name]
     Log To Console   ${getresponse.json()}[0][isbn]


Delete the Book Details which got added
     [Tags]        API
     &{deletereq_body}=        Create Dictionary    ID=${idvalue}
     ${deleteresponse}=        POST        ${baseurl}/Library/DeleteBook.php    json=${deletereq_body}    expected_status=200
     Log To Console    ${deleteresponse.json()}
     Log To Console    ${deleteresponse.json()}[msg]
     


  