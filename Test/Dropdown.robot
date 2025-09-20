*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://automationtesting.co.uk/dropdown.html
${browser}    chrome

*** Test Cases ***
Dropdown
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

    Select From List By Label    id=cars    Suzuki
    Sleep    5s
    ${selected}    Get Selected List Label    id=cars
    Should Be Equal As Strings    ${selected}    Suzuki
    Select From List By Value    id=cars    bmw
    Sleep    5s
    Select From List By Index    id=cars    5
    Sleep    5s
    Close Browser

*** Keywords ***
