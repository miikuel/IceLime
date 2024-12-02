*** Settings ***
Resource  resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser


*** Test Cases ***
Succesfully Add An Article Reference With Required Info
    Go To Add Article
    Write Author Firstname  Kalle
    Write Author Lastname  Eerola
    Write Title  Vakava tutkimus
    Write Journal  Tiede-lehti
    Write Year  2024
    Press Submit
    Submit Should Succeed With Message  Reference added succesfully

Unsuccesfully Adding An Article Reference
    Go To Add Article
    Press Submit
    Submit Should Fail With Message  You must put valid Author, Title, Journal And Year

Removing Of Article
    Go To Remove Reference
    Press Remove
    Removal Shold Succeed With Message  Reference removed succesfully

*** Keywords ***
Go To Add Article
    Go To  ${ARTICLE_URL}

Write Title
    [Arguments]  ${title}
    Input Text  title  ${title}

Write Author Firstname
    [Arguments]  ${author_firstname}
    Input Text  author_firstname  ${author_firstname}

Write Author Lastname
    [Arguments]  ${author_lastname}
    Input Text  author_lastname  ${author_lastname}

Write Journal
    [Arguments]  ${journal}
    Input Text  journal  ${journal}

Write Year
    [Arguments]  ${year}
    Input Text  year  ${year}

Add Article Page Should Be Open
    Title Should Be  Create a reference

Submit Should Fail With Message
    [Arguments]  ${message}
    Add Article Page Should Be Open
    Page Should Contain  ${message}

Press Remove
    Click Button    Remove Article