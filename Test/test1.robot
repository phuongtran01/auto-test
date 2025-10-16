*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}                  https://cms.anhtester.com/login
${INPUT_EMAIL}          id=email
${INPUT_PASSWORD}       id=password
${BTN_SUBMIT}           css=form button[type="submit"]
${TXT_EXAMPLE}          xpath=//span[normalize-space(.)='Admin Example']
${TIMEOUT}              30s
${EMAIL}                admin@example.com
${PASSWORD}             123456
${WEB_BROWSER}          chrome


*** Test Cases ***
Login_CMS_1
    [Tags]    1    login
    Login CMS    ${WEB_BROWSER}    ${EMAIL}    ${PASSWORD}


*** Keywords ***
Open CMS
    [Arguments]    ${browser}
    Open Browser    ${URL}    ${browser}

Fill login form
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    ${INPUT_EMAIL}    ${TIMEOUT}
    Sleep    1s
    Common - Input Text    ${INPUT_EMAIL}    ${EMAIL}    ${TIMEOUT}
    Common - Input Text    ${PASSWORD}    ${PASSWORD}    ${TIMEOUT}

Submit login form
    Common - Click Element    ${BTN_SUBMIT}    ${TIMEOUT}

Verify login success
    Wait Until Element Is Visible    ${TXT_EXAMPLE}    ${TIMEOUT}

Close CMS
    Close Browser

Login CMS
    [Arguments]    ${browser}    ${email}    ${password}
    Open CMS    ${browser}
    Fill Login Form    ${email}    ${password}
    Submit Login Form
    Verify Login Success
    Close CMS

Common - Click Element
    [Arguments]    ${element}    ${timeout}
    Wait Until Element Is Visible    ${element}    ${timeout}
    Click Element    ${element}

Common - Input Text
    [Arguments]    ${element}    ${text}    ${timeout}
    Wait Until Element Is Visible    ${element}    ${timeout}
    Clear Element Text    ${element}
    Input Text    ${element}    ${text}
