*** Settings ***
Library    SeleniumLibrary

Resource    ../core/selenium_utils.robot
Resource    ../pages/Authentification/page_connexion.robot
Resource    ../tests/resources/test_properties.robot


Test Setup   Ouvrir le navigateur    ${url}   ${browser}
Test Teardown     Fermer le navigateur

*** Test Cases ***
Connexion en tant que administrateur
    Accéder à Crédit Auto
    Se Connecter en tant que LDAP administrateur
    Se déconnecter de CREDIT AUTO
Connexion tant que LDAP administrateur avec mot de passe incorrect
    Accéder à Crédit Auto
    Se Connecter en tant que LDAP administrateur avec mot de passe incorrect

Connexion en tant RESPONSABLE CREDIT
    Accéder à Crédit Auto
    Se Connecter En Tant Que LDAP Responsable Credit
    Se Déconnecter De CREDIT AUTO

Connexion en tant que RESPONSABLE CREDIT avec mot de passe incorrect
    Accéder à Crédit Auto
    Se Connecter en tant que LDAP Responsable Credit avec mot de passe incorrect

Connexion en tant que GESTIONNAIRE CREDIT
    Accéder à Crédit Auto
    Se Connecter en tant que LDAP Gestionnaire Credit
    Se Déconnecter De CREDIT AUTO
Connexion en tant que GESTIONNAIRE CREDIT avec mot de passe incorrect
    Accéder à Crédit Auto
    Se Connecter en tant que LDAP Gestionnaire Credit avec mot de passe incorrect


Connexion en tant que LOUEUR
    Accéder à Crédit Auto
    Se Connecter en tant que LDAP Loueur
    Se Déconnecter De CREDIT AUTO
Connexion en tant que LOUEUR avec mot de passe incorrect
    Accéder à Crédit Auto
    Se Connecter en tant que LDAP Loueur avec mot de passe incorrect

