*** Settings ***
Library           SeleniumLibrary

Resource    ../../tests/resources/test_properties.robot

*** Variables ***
#Données utilisateurs
#ldap administrateur
${username_LDAP_ADMIN}  acd
${password_LDAP_ADMIN}  acial!acd2018

#ldap responsable credit
${username_LDAP_RESPONSABLE_CREDIT}     rcd
${password_LDAP_RESPONSABLE_CREDIT}     acial!rcd2018

#LDAP GESTIONNAIRE CREDIT
${username_LDAP_GESTIONNAIRE_CREDIT}    gcd
${password_LDAP_GESTIONNAIRE_CREDIT}    acial!gcd2018


#LDAP LOUEUR
${username_LDAP_LOUEUR}       lcd
${password_LDAP_LOUEUR}       acial!acd2018


#identifiants incorrects

#ldap administrateur mot de passe incorrect
${password_LDAP_ADMIN_incorrect}  acial!acd2018acd

#ldap responsable credit mot de passe incorrect
${password_LDAP_RESPONSABLE_CREDIT_incorrect}     acial!rcd2018rcd

#LDAP GESTIONNAIRE CREDIT mot de passe incorrect
${password_LDAP_GESTIONNAIRE_CREDIT_incorrect}    acial!gcd2018gcd


#LDAP LOUEUR mot de passe incorrect
${password_LDAP_LOUEUR_incorrect}       acial!acd2018lcd


${acd}      acd



${champ_acces_CA}   xpath://*[@id="lnkAccesCreditAuto"]

${champ_username}       xpath://*[@id="username"]

${champ_password}       xpath://*[@id="password"]

#bouton connexion
${btn_Se_Connecter}       xpath://*[@id="page-top"]/div[2]/div/div/form/fieldset/button

#message erreur avec identifiant érroné
${champ_msg_erronné}        xpath://*[@id="page-top"]/div[2]/div/div/div
${msg_erroné}       Identifiants invalides.

${champ_nom_utilisateur}    xpath://*[@id="navbarNavDropdown"]/div[2]/i

#bouton déconnexion
${btn_decconexion}      xpath://*[@id="lnkDeconnexion"]


*** Keywords ***
Accéder à Crédit Auto
    Click Link        ${champ_acces_CA}

Se Connecter en tant que LDAP administrateur
    Log To Console    Se Connecter en tant que LDAP administrateur
    Input Text    ${champ_username}     ${username_LDAP_ADMIN}
    Input Text    ${champ_password}     ${password_LDAP_ADMIN}
    Click Button    ${btn_Se_Connecter}
    #Wait Until Element Contains    ${champ_nom_utilisateur}     ${username_LDAP_ADMIN}

Se Connecter en tant que LDAP Responsable Credit
    Log To Console    Se Connecter en tant que LDAP Responsable Credit
    Input Text    ${champ_username}     ${username_LDAP_RESPONSABLE_CREDIT}
    Input Text    ${champ_password}     ${password_LDAP_RESPONSABLE_CREDIT}
    Click Button    ${btn_Se_Connecter}
    #Wait Until Element Contains    ${champ_nom_utilisateur}     ${username_LDAP_RESPONSABLE_CREDIT}

Se Connecter en tant que LDAP Gestionnaire Credit
    Log To Console    Se Connecter en tant que LDAP Gestionnaire Credit
    Input Text    ${champ_username}     ${username_LDAP_GESTIONNAIRE_CREDIT}
    Input Text    ${champ_password}     ${password_LDAP_GESTIONNAIRE_CREDIT}
    Click Button    ${btn_Se_Connecter}
    #Wait Until Element Contains    ${champ_nom_utilisateur}     ${username_LDAP_GESTIONNAIRE_CREDIT}

Se Connecter en tant que LDAP Loueur
    Log To Console    Se Connecter en tant que LDAP Loueur
    Input Text    ${champ_username}     ${username_LDAP_LOUEUR}
    Input Text    ${champ_password}     ${password_LDAP_LOUEUR}
    Click Button    ${btn_Se_Connecter}
    #Wait Until Element Contains    ${champ_nom_utilisateur}     ${username_LDAP_LOUEUR}

#Identifiants érronés

Se Connecter en tant que LDAP administrateur avec mot de passe incorrect
    Log To Console    Se Connecter en tant que LDAP administrateur mot de passe incorrect
    Input Text    ${champ_username}     ${username_LDAP_ADMIN}
    Input Text    ${champ_password}     ${password_LDAP_ADMIN_incorrect}
    Click Button    ${btn_Se_Connecter}
    #Wait Until Element Contains        ${champ_msg_erronné}    ${msg_erroné}

Se Connecter en tant que LDAP Responsable Credit avec mot de passe incorrect
    Log To Console    Se Connecter en tant que LDAP Responsable Credit mot de passe incorrect
    Input Text    ${champ_username}     ${username_LDAP_RESPONSABLE_CREDIT}
    Input Text    ${champ_password}     ${password_LDAP_RESPONSABLE_CREDIT_incorrect}
    Click Button    ${btn_Se_Connecter}
    #Wait Until Element Contains    ${champ_msg_erronné}    ${msg_erroné}

Se Connecter en tant que LDAP Gestionnaire Credit avec mot de passe incorrect
    Log To Console    Se Connecter en tant que LDAP Gestionnaire Credit mot de passe incorrect
    Input Text    ${champ_username}     ${username_LDAP_GESTIONNAIRE_CREDIT}
    Input Text    ${champ_password}     ${password_LDAP_GESTIONNAIRE_CREDIT_incorrect}
    Click Button    ${btn_Se_Connecter}
    #Wait Until Element Contains    ${champ_msg_erronné}    ${msg_erroné}

Se Connecter en tant que LDAP Loueur avec mot de passe incorrect
    Log To Console    Se Connecter en tant que LDAP Loueur mot de passe incorrect
    Input Text    ${champ_username}     ${username_LDAP_LOUEUR}
    Input Text    ${champ_password}     ${password_LDAP_LOUEUR_incorrect}
    Click Button    ${btn_Se_Connecter}
    #Wait Until Element Contains    ${champ_msg_erronné}    ${msg_erroné}

#Déconnexion
Se déconnecter de CREDIT AUTO
    Click Link    ${btn_decconexion}


