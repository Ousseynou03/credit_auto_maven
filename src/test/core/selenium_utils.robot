*** Settings ***
Library    SeleniumLibrary


*** Variables ***

*** Keywords ***
Ouvrir le navigateur
    [Arguments]      ${url}     ${browser}
    Open Browser    ${url}    ${browser}    options=headless
    maximize browser window
    Log To Console    Exécution de test démarrée sur ${browser}

Fermer le navigateur
    Close browser
    Log To Console    Fin de l'exécution de test