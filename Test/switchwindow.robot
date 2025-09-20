*** Settings ***
Library    SeleniumLibrary
Test Setup    Set Selenium Speed    2s

*** Variables ***
${url}    https://demo.automationtesting.in/Windows.html
${browser}    Chrome

*** Test Cases ***
#Demo Mo Tab Moi
#    Open Browser    ${url}    ${browser}
#    Maximize Browser Window
#
#    ${title }    Get Title
#    Click Element    xpath=//button[contains(text(),' click ')]
#
#    Switch Window    NEW
#    Title Should Be    Selenium
#    Switch Window    MAIN
#    Title Should Be    ${title }
#    Close Browser

Demo Mo Cua So Moi Rieng Biet
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    
    Click Element    xpath=//a[text()='Open New Seperate Windows']
    ${title}    Get Title

    Click Element    xpath=//button[@onclick='newwindow()']
    Switch Window    NEW
    Title Should Be    Selenium
    Switch Window    MAIN
    Title Should Be    ${title}
    Close Browser