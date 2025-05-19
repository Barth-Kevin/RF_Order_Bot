*** Settings ***
Documentation     Bestellbot für den Einkauf

Library    RPA.Browser.Playwright
Library    RPA.HTTP
Library    RPA.Tables
Library    Collections
Resource    .secret.robot

*** Variables ***
${URL}             https://sportundspiel99.de/checkout/cart
${BROWSER_TYPE}    chromium


${XPATH_FastCheckout}    //a[@class='btn btn-link is--collapse-quickorder']
${XPATH_TextArea}    //*[@id="quick-order-article-field"]
${XPATH_Button}    //*[@id="quick-order-cart-upload-tab-pane"]/div/div[1]/div/div/form/div[3]/button

# ${INPUT_CSV}    /home/brainbutt/n8n/orderbot/quickorder.csv
${INPUT_CSV-test}    /input/quickorder.csv

*** Tasks ***
# Login
# [Documentation]   Login to the website
# [Tags]   Login
# Open Browser    headless=${False}    browser=${BROWSER_TYPE}    pause_on_failure=${True}



Bestellbot_v.0.1
    [Documentation]    Bestellbot für den Einkauf
    [Tags]    Einkauf
    ${table}=    Read table from CSV    ${INPUT_CSV-test}    encoding=UTF-8
    Open Browser    headless=${False}    browser=${BROWSER_TYPE}    pause_on_failure=${True}    
    New Page    ${URL}
    Wait For Elements State    ${XPATH_FastCheckout}    visible
    Click    ${XPATH_FastCheckout}
    Wait For Elements State    ${XPATH_TextArea}    visible
    Click    ${XPATH_TextArea}
    FOR    ${row}    IN    @{table}
       ${article_no}=    Get From Dictionary    ${row}    Artikelnummer
       ${article_count}=    Get From Dictionary    ${row}    Anzahl
        Keyboard Input    action=insertText    input=${article_no}, ${article_count}
        Keyboard Key    press    Enter    
    END
    Click    ${XPATH_Button}
    Take Screenshot
    Close Browser     ${None}
