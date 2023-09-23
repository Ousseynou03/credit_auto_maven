*** Settings ***
Library           SeleniumLibrary   run_on_failure=Capture Page Screenshot  timeout=0:00:20  implicit_wait=0:00:20

*** Variables ***
${clic_eff_simulation}      xpath://*[@id="lnkSimulation"]
${ele_after_clic_simulation}     xpath://*[@id="page-top"]/div[1]/h3
${ele_after_clic_simulation_msg}    Création d'un contrat de crédit
${btn_annuler}      xpath://*[@id="contract"]/form/fieldset/div[1]/a
${champ_coût_credit}        xpath://*[@id="form_simulation_coutCredit"]

${valeur_cout_credit_par_defaut}        0.00

${champ_categorie}      xpath://*[@id="form_simulation_categorie"]

${valeur_par_defaut_A}      A

${champ_montant_achat}      xpath://*[@id="form_simulation_montantAchat"]

${montant_achat}    30000
${champ_montant_credit}       xpath://*[@id="form_simulation_montantCredit"]
${montant_credit}       24000

${champ_duree}      xpath://*[@id="form_simulation_duree"]
${duree}    12

${btn_calculer_credit}      xpath://*[@id="calcul"]

${champ_taux_credit}     xpath://*[@id="contract"]/form/fieldset/div[2]/div[1]/div[6]/label

${montant_achat_érroné}     5001&

${champ_msg_erreur_montant_achat}   xpath://*[@id="errorAchat"]
${msg_erreur_montant_achat}     Le montant d'achat doit être compris entre 5000€ et 48000€ !

${montant_credit_éronné}    24000&
${champ_msg_erreur_montant_credit}      xpath://*[@id="errorCredit"]
${msg_erreur_montant_credit}        Le montant de crédit doit représenter au minimum 80% du montant d'achat !

*** Keywords ***
Cliquer sur effectuer une simulation
    Click Link    ${clic_eff_simulation}
    Wait Until Element Contains     {ele_after_clic_simulation}     ${ele_after_clic_simulation_msg}

Vérifier si le bouton est présente
    Page Should Contain    ${btn_annuler}

Vérifier que le champ coût credit reste gris si tous les champs obligatoires ne sont pas remplis
    Wait Until Page Contains Element    ${champ_coût_credit}
    Element Should Be Disabled    ${champ_coût_credit}

Vérifier si le champ coût credit est 0.00
    Wait Until Page Contains Element    ${champ_coût_credit}
    ${valeur_cout_credit}    Get Text    ${champ_coût_credit}
    Should Be Equal As Strings    ${valeur_cout_credit}    ${valeur_cout_credit_par_defaut}

Vérifier que la valeur par defaut de categorie est A
    Wait Until Page Contains Element    ${champ_categorie}
    ${valeur_cout_credit}    Get Text    ${champ_categorie}
    Should Be Equal As Strings    ${valeur_par_defaut_A}    ${valeur_cout_credit_par_defaut}


Saisir le montant de l'achat
    Input Text    ${champ_montant_achat}    ${montant_achat}

Saisir le montant de credit
    Input Text    ${champ_montant_credit}       ${montant_credit}

Saisir la durée
    Input Text    ${champ_duree}    ${duree}

Vérifier que calculer credit et annuler sont des boutons cliquables
    Wait Until Element Contains    ${btn_calculer_credit}
    Element Should Be Enabled    ${btn_calculer_credit}
    Element Should Be Enabled    ${btn_annuler}

Calculer le credit
    Click Button    ${btn_calculer_credit}
    Wait Until Element Contains    ${champ_taux_credit}

# INSERTION CONTENU ALPHA NUMÉRIQUE DANS LES CHAMPS OBLIGATOIRES
Saisir le montant de l'achat en incluant un caractére alpha numérique
    Input Text    ${champ_montant_achat}    ${montant_achat_érroné}
    Wait Until Page Contains Element    ${champ_msg_erreur_montant_achat}   ${msg_erreur_montant_achat}

Saisir le montant de credit avec un caractére alpha numérique
    Input Text    ${champ_montant_credit}       ${montant_credit_éronné}
    Wait Until Element Contains    ${champ_msg_erreur_montant_credit}       ${msg_erreur_montant_credit}

Vérifier que le bouton calculer credit n'apparaît pas
    Page Should Not Contain    ${btn_calculer_credit}

