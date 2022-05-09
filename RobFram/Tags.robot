*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}    Chrome
${url}    https://pilot.csr-portal.insurance.dxc.com/#/
${Policy}    213166677UT


*** Test Cases ***
LoginTestcase
    [Tags]    Sanity
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
CSR portal
    [Tags]    Sanity
    LogintotheApplication

COrrespondance
    [Tags]    Regg
    Corr
    

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

Corr
    Sleep    2
    Click Element    xpath://button[@id="correspondenceFaxBtnC"]//following::td[2] 
    Click Element    //span[text()="Open"]
    Select Window    title=BHFApp   
    Sleep    4
    Click Element    xpath://button[@id="correspondenceFaxBtnC"]//following::td[2]
    Close All Browsers

