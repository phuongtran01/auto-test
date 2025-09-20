*** Settings ***
Resource            ../config/imports.resource

Test Setup          Common - Open Demoblaze Website
Test Teardown       Common - Close Browser Session
# Suite Setup
# Suite Teardown


*** Variables ***
${user_name}            admin
${valid_password}       admin
${invalid_password}     invalid123
${name}                 Nguyen Van Ba
${country}              Viet Nam
${city}                 Ha Noi
${card}                 123456789
${month}                5
${year}                 2025


*** Test Cases ***
User_Can_Login_With_Valid_Credentials
    Home - Access To Login Form
    Login - Fill The Login Form    ${user_name}    ${valid_password}
    Login - Click Submit Login Button
    Home - Verify Login Success

User_Cannot_Login_With_Invalid_Password
    Home - Access To Login Form
    Login - Fill The Login Form    ${user_name}    ${invalid_password}
    Login - Click Submit Login Button
    Login - Verify Wrong Password Alert

User_Can_View_Product_Details
    Home - Choose Product
    Detail Product - Verify Detail Product

User_Can_Add_Prod_To_Cart
    Home - Choose Product
    Detail Product - Add Product To Cart
    Detail Product - Verify Add To Cart Success

User_Can_Remove_Prod_From_Cart
    Home - Choose Product
    Detail Product - Add Product To Cart
    Detail Product - Verify Add To Cart Success
    Home - Access To Cart
    Cart - Delete Product
    Cart - Verify Delete Product Success

User_Can_Place_An_Order_Successfully
    Home - Choose Product
    Detail Product - Add Product To Cart
    Detail Product - Verify Add To Cart Success
    Home - Access To Cart
    Cart - Access Place Order
    Place Order - Input Information Payment    ${name}    ${country}    ${city}    ${card}    ${month}    ${year}
    Place Order - Purchase
    Place Order - Verify Purchase Success
