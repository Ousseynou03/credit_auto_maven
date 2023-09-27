*** Settings ***
Library    SeleniumLibrary


*** Variables ***

#${chromedriver_path}    /usr/local/bin/chromedriver
${options}        --headless

*** Keywords ***
Ouvrir le navigateur
    [Arguments]      ${url}     ${browser}
    #Open Browser    ${url}    ${browser}    executable_path=${chromedriver_path}
    Open Browser    ${url}    ${browser}    options=${options}
    maximize browser window
    Log To Console    Exécution de test démarrée sur ${browser}

Fermer le navigateur
    Close browser
    Log To Console    Fin de l'exécution de test