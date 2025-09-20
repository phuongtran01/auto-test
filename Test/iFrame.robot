*** Settings ***
Library    SeleniumLibrary
Test Setup    Set Selenium Speed    1s

*** Variables ***
${url_frame}    https://demo.automationtesting.in/Frames.html
${browser}    Chrome

*** Test Cases ***
Demo IFrame Đơn
    Open Browser    ${url_frame}    ${browser}
    Maximize Browser Window

    Select Frame    id=singleframe
    Input Text    xpath=//input[@type='text']    Hello iFrame!
#    Current Frame Should Contain    Hello iFrame!
    ${value}    Get Value    xpath=//input[@type='text']
    Should Be Equal    ${value}    Hello iFrame!

    Unselect Frame
    Wait Until Page Contains    Single Iframe
    Close Browser

Demo IFrame Long Nhau
    Open Browser    ${url_frame}    ${browser}
    Maximize Browser Window

    Click Element    xpath=//a[text()='Iframe with in an Iframe']
    Select Frame    xpath=//iframe[@src='MultipleFrames.html']
    Select Frame    xpath=//iframe[@src='SingleFrame.html']
    Input Text    xpath=//input[@type='text']    Hello Frame
    
    ${value}    Get Value    xpath=//input[@type='text']
    Should Be Equal    ${value}    Hello Frame

    Unselect Frame
    Unselect Frame
    Wait Until Page Contains    Single Iframe
    Close Browser
