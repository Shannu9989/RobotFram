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
    Sleep    10

AddressChangeAndWMA
    [Arguments]    ${Adderess}    ${url2}    ${Browser}    ${wma_User}    ${wma_Pass}    ${Pol}    
    Click Element    ${Related_Par_Own}
    Sleep    10
    Click Element    ${Add_Btn}
    Clear Element Text    ${Add_Line1}
    Input Text    ${Add_Line1}    ${Adderess}
    Click Element    ${Save_Btn}
    Sleep    2
    Element Should Contain    ${Green_Bann_Mess}    Address Change Processed Successfully
    Click Element    ${Cls_Btn}
    Sleep    10   
    Element Should Contain    ${Work_Req_Type}    Address Change
    Element Should Contain    ${Work_Req_Status}    COMPLETED  
    ${Com}=    Get Text    ${Comp_Code}
    Open Browser    ${url2}  ${Browser}
    Maximize Browser Window
    Input Text    ${WMA_UserName}    ${wma_User}   
    Input Text    ${WMA_Password}    ${wma_Pass}
    Click Element    ${Sub_Btn} 
    Input Text    ${Poli_Search}    ${Pol}   
    Select From List By Label    ${Comp_Cde_Drp}    ${Com}
    Click Element    ${WMA_Search_Btn}
    Sleep    4
    Click Element    ${WMA_Roles_Tab}
    Sleep    4
    Select Frame    tag:iframe
    Click Element    ${WMA_Owner_Role}
    Sleep    4
    Click Element    ${WMA_Update_Party_Btn}
    Sleep    7
    ${WMAAdd}    Get Value    ${WMA_Add_Line1}
    Should Be Equal    ${WMAAdd}    ${Adderess} 

CloseCall
    [Arguments]    ${Pnumber}    ${Pol}
    Switch Browser    1
    Click Element    ${Call_DispDrop}
    Click Element    ${Call_DisOpt}
    Input Text    ${PhNum_Field}    ${Pnumber}
    Click Element    ${Confirmation_ChkBox}
    ${Calldip}=    Get Text    ${Call_DispDrop}
    Click Element    ${SaveCloseBtn}
    Element Should Contain    ${My_CallHis_Pol}    ${Pol}
    Element Text Should Be    ${My_CallHis_Rea}    ${Calldip}
    
    