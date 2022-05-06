*** Settings ***
Library    SeleniumLibrary
Library    XML
Variables    C:\\Users\\spathan4\\Documents\\Robot\\RobFram\\locators.py

*** Keywords ***
Open My Browser    
    [Arguments]    ${Url}    ${Browser}
    Open Browser    ${Url}    ${Browser}
    Maximize Browser Window

ENter UserName
    [Arguments]    ${username}
    Input Text    ${txt_loginUsername}    ${username}

Enter Password
    [Arguments]    ${Password}
    Input Text    ${txt_loginPassword}    ${Password}

ClickBtn
    Click Element    ${Btn_Login}

VerifySuccefullMsg
    Sleep    8 
    Element Should Contain    ${green_BanPth}    Logon successful

SearchPolicyAndAuthorize
    Sleep    3
    [Arguments]    ${Pol}
    Input Text    ${txt_SearchBox}    ${Pol}
    Click Element    ${Search_Icon}
    Sleep    20
    Wait Until Element Is Not Visible    ${Spinner_Pth}    
    Element Text Should Be    ${Cust_PolNum}    ${Pol}
    ${FullName}=    Get Text    ${txt_FullN}
    ${Role}=    Get Text    ${txt_CustRole}
    Click Button    ${Aut_Btn}
    Set Browser Implicit Wait    15
    Element Should Contain    id:authorize-sucess-policy-number-label    ${Pol}
    Element Should Contain    id:authorize-sucess-full-name-label    ${FullName}
    Element Should Contain    id:authorize-sucess-role-label    ${Role}
    Sleep    5

EmailAddition  
    [Arguments]    ${Email}
    Switch Browser    1 
    Click Element    ${Related_Par_Own}
    Sleep    9
    Click Element    ${Email_Tab}
    Sleep    2
    Click Element    ${Ph_Addbtn}
    Input Text    ${Email_Field}    ${Email}
    Click Element    ${Ph_Typ}
    Click Element    ${Email_TypeOpt}
    Click Element    ${Save_Btn}
    Sleep    2
    Element Should Contain    ${Green_Bann_Mess}    Email Address successfully Added
    Click Element    ${Cls_Btn}
    Sleep    10   
    Element Should Contain    ${Work_Req_Type}    Address Change
    Element Should Contain    ${Work_Req_Status}    COMPLETED
    Switch Browser    2
    Click Element    ${Demogra_Tab}
    Sleep    5
    ${WMAem}=    Get Value    ${wma_EmailField}
    Should Be Equal    ${WMAem}    ${Email} 
    
    