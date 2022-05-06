*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}    Chrome
${url}    https://pilot.csr-portal.insurance.dxc.com/#/
${Policy}    213166677UT


*** Test Cases ***
LoginTestcase

    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    LogintotheApplication
    

*** Keywords ***
LogintotheApplication
    Input Text    id:authUsername    csruser2
    Input Text    id:authPassword    Pass@1234
    Click Button    id:loginBtn
    Sleep    8 
    Element Should Contain    xpath://div[@class="toast-message"]    Logon successful
    #Wait Until Element Is Not Visible    xpath://div[@class="ng-star-inserted spinnerWrapperPost"]
    Wait Until Page Contains    Reason
    Input Text    id:contracts-collection-search-text    ${Policy}
    Click Element    xpath://mat-icon[@id='']
    Sleep    20
    Wait Until Element Is Not Visible    xpath://div[@class="ng-star-inserted spinnerWrapperPost"]
    Element Text Should Be    id:selected-roles-policy-number-label    ${Policy}
    ${Full Name}=    Get Text   id:selected-roles-full-name-label
    ${Role}=    Get Text    id:selected-roles-role-label
    Click Button    id:authorize-undefined-button
    Set Browser Implicit Wait    15
    Element Should Contain    id:authorize-sucess-policy-number-label    ${Policy}
    Element Should Contain    id:authorize-sucess-full-name-label    ${Full Name}
    Element Should Contain    id:authorize-sucess-role-label    ${Role}
    Click Element    id:policy-details-policy-number-action-checkbox_label
    Click Element    id:policy-details-plan-code-action-checkbox_label
    ${PolNum}=    Get Text    id:policy-details-policy-number-label
    ${PlanCod}=    Get Text    id:policy-details-plan-code-label  
    ${Com}=    Get Text    id:policy-details-company-code-label 
    Element Should Contain    xpath://dl[@class="pad-lAr-10px"]    ${PolNum}
    Element Should Contain    xpath://dl[@class="pad-lAr-10px"]    ${PlanCod}
    Scroll Element Into View    xpath://input[@placeholder="Date / Caller Name / Reason"]
    Sleep    4

