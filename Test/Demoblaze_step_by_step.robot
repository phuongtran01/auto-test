*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${url}      https://demoblaze.com/


*** Test Cases ***
User_Can_Login_With_Valid_Credentials
    Open Browser    ${url}    chrome
    Wait Until Element Is Visible    login2    5s
    Click Element    login2
    Wait Until Element Is Visible    loginusername    5s
    Clear Element Text    loginusername
    Input Text    loginusername    admin
    Wait Until Element Is Visible    loginpassword    2s
    Clear Element Text    loginpassword
    Input Text    loginpassword    admin
    Wait Until Element Is Visible    xpath=//button[text()='Log in']    30s
    Click Element    xpath=//button[text()='Log in']
    Wait Until Element Is Visible    xpath=//a[text()='Welcome admin']    10s
    Close Browser

User_Cannot_Login_With_Invalid_Password
    Open Browser    ${url}    chrome
    Wait Until Element Is Visible    login2    5s
    Click Element    login2
    Wait Until Element Is Visible    loginusername    5s
    Clear Element Text    loginusername
    Input Text    loginusername    admin
    Wait Until Element Is Visible    loginpassword    2s
    Clear Element Text    loginpassword
    Input Text    loginpassword    notadmin
    Wait Until Element Is Visible    xpath=//button[text()='Log in']    30s
    Click Element    xpath=//button[text()='Log in']
    Alert Should Be Present    Wrong password.    ACCEPT    30S
    Close Browser

User_Can_View_Product_Details
    Open Browser    ${url}    chrome
    Wait Until Element Is Visible    login2    5s
    Click Element    //a[text()='Samsung galaxy s6']    30s
    Wait Until Element Is Visible    //h2[text()='Samsung galaxy s6']    20s
    Wait Until Element Is Visible    //h3[text()='$360']    20s
    Wait Until Element Is Visible
    ...    //p[contain(text(),'The Samsung Galaxy is powered by 1.5GHz octa-core Samsung Exynos 7420')]
    ...    20s
    Close Browser

User_Can_Add_Product_To_Cart
    Open Browser    ${url}    chrome
    Wait Until Element Is Visible    login2    5s
    Click Element    //a[text()='Samsung galaxy s6']    30s
    Wait Until Element Is Visible    //a[text()='Add to cart']    20s
    Alert Should Be Present    Product added    ACCEPT    30s
    Close Browser

User_Can_Delete_Product_Added
    Open Browser    ${url}    chrome
    Wait Until Element Is Visible    login2    5s
    Click Element    //a[text()='Samsung galaxy s6']    30s
    Wait Until Element Is Visible    //a[text()='Add to cart']    20s
    Alert Should Be Present    Product added    ACCEPT    30s
    Wait Until Element Is Visible    //a[text()='Cart']    20s
    Click Element    //a[text()='Cart']
    Wait Until Element Is Visible    //a[text()='Delete']    20s
    Click Element    //a[text()='Delete']
    Wait Until Element Is Not Visible    //a[text()='Samsung galaxy s6']    30s

User_Can_Place_An_Order_Successfully
    Open Browser    ${url}    chrome
    Wait Until Element Is Visible    login2    5s
    Click Element    //a[text()='Samsung galaxy s6']    30s
    Wait Until Element Is Visible    //a[text()='Add to cart']    20s
    Alert Should Be Present    Product added    ACCEPT    30s
    Wait Until Element Is Visible    //a[text()='Cart']    20s
    Click Element    //a[text()='Cart']
    Wait Until Element Is Visible    //button[text()='Place Order']    20s
    Click Element    //button[text()='Place Order']
    Wait Until Element Is Visible    name    20s
    Input Text    name    nguyen van ba
    Wait Until Element Is Visible    country    20s
    Input Text    country    Viet Nam
    Wait Until Element Is Visible    city    20s
    Input Text    city    Ha Noi
    Wait Until Element Is Visible    card    20s
    Input Text    card    123456789
    Wait Until Element Is Visible    month    20s
    Input Text    month    5
    Wait Until Element Is Visible    year    20s
    Input Text    year    2025
    Wait Until Element Is Visible    //button[text()='Purchase']    20s
    Click Element    //button[text()='Purchase']
    Wait Until Element Is Visible    //h2[text()='Thank you for your purchase!']    20s
    Close Browser
