*** Settings ***
Library    SeleniumLibrary


*** Variables ***

*** Keywords ***
Ouvrir le navigateur
    [Arguments]      ${url}     ${browser}
    open browser        ${url}      ${browser}
    maximize browser window
    Log To Console    Exécution de test démarrée sur ${browser}

Fermer le navigateur
    Close browser
    Log To Console    Fin de l'exécution de test