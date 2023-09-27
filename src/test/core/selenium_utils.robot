*** Settings ***
Library    SeleniumLibrary


*** Variables ***

${chromium_path}    /usr/bin/chromium

*** Keywords ***
Ouvrir le navigateur
    [Arguments]      ${url}     ${browser}
    Open Browser    ${url}    ${browser}    executable_path=${chromium_path}    remote_url=http://139.99.130.158/
    maximize browser window
    Log To Console    Exécution de test démarrée sur ${browser}

Fermer le navigateur
    Close browser
    Log To Console    Fin de l'exécution de test