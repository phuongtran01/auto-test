*** Settings ***
Resource    ../../config/imports.resource
Resource    place_order_variables.resource


*** Keywords ***
Place Order - Input Information Payment
    [Arguments]    ${name}    ${country}    ${city}    ${card}    ${month}    ${year}
    Common - Wait And Input Text    ${input_name}    ${name}
    Common - Wait And Input Text    ${input_country}    ${country}
    Common - Wait And Input Text    ${input_city}    ${city}
    Common - Wait And Input Text    ${input_card}    ${card}
    Common - Wait And Input Text    ${input_month}    ${month}
    Common - Wait And Input Text    ${input_year}    ${year}

Place Order - Purchase
    Common - Wait And Click Element    ${btn_purchase}

Place Order - Verify Purchase Success
    Wait Until Element Is Visible    ${txt_purchase_success}
