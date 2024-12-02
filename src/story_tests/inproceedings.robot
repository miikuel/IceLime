*** Settings ***
Resource  resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser

*** Test Cases ***
Succesfully Add An Inproceeding Reference With Required Info
    Go To Add Inproceeding
    Write Title  Vakava konferenssi
    Write Author Firstname  Jesse
    Write Author Lastname  Meikäläinen
    Write Booktitle  Konferenssi 1
    Write Year  2005
    Press Submit
    Submit Should Succeed With Message  Reference added succesfully

Unsuccesfully Adding An Article Reference
    Go To Add Inproceeding
    Press Submit
    Submit Should Fail With Message  You must put valid Author, Title, Booktitle And Year

Removing Of Inproceeding
    Go To Remove Reference
    Press Remove
    Removal Shold Succeed With Message  Reference removed succesfully

*** Keywords ***
Go To Add Inproceeding
    Go To  ${INPROCEEDING_URL}

Press Remove
    Click Button    Remove Inproceeding

Write Title
    [Arguments]  ${title}
    Input Text  title  ${title}

Write Author Firstname
    [Arguments]  ${author_firstname}
    Input Text  author_firstname  ${author_firstname}

Write Author Lastname
    [Arguments]  ${author_lastname}
    Input Text  author_lastname  ${author_lastname}

Write Booktitle
    [Arguments]  ${booktitle}
    Input Text  booktitle  ${booktitle}

Write Year
    [Arguments]  ${year}
    Input Text  year  ${year}

Add Inproceeding Page Should Be Open
    Title Should Be  Create a reference

Submit Should Fail With Message
    [Arguments]  ${message}
    Add Inproceeding Page Should Be Open
    Page Should Contain  ${message}