*** Settings ***
Resource    C:\\Users\\spathan4\\Documents\\Robot\\RobFram\\AddressUpdate\\AddUpdpom.robot
Suite Teardown    Close All Browsers

*** Variables ***
${Browser}    Chrome
${Url}    https://pilot.csr-portal.insurance.dxc.com/#/
${url2}    http://dxcmwbnor461:85/wma/login.jsf
${username}    csruser2    
${Password}    Pass@1234
${Pol}    0373601
${Adderess}    1845 FAIRMOUNT 
${Pnumber}    5534342331
${wma_User}    spathan
${wma_Pass}    spathan

*** Test Cases ***
LoginT    
    Open My Browser    ${Url}    ${Browser}
    ENter UserName    ${username}
    Enter Password    ${Password}
    ClickBtn
    VerifySuccefullMsg
    SearchPolicyAndAuthorize    ${Pol}
    AddressChangeAndWMA    ${Adderess}    ${url2}    ${Browser}    ${wma_User}    ${wma_Pass}    ${Pol}
    CloseCall    ${Pnumber}    ${Pol}
 