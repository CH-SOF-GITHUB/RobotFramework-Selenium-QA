*** Settings ***
Documentation     Ressources de la fonctionnalite Connexion SauceDemo : variables (locators, donnees) et keywords composes.
Library           SeleniumLibrary

*** Variables ***
# Environnement
${URL_SAUCEDEMO}                     https://www.saucedemo.com/
${NAVIGATEUR}                        chrome
${DELAI_ATTENTE}                     5s

# Donnees de test
${UTILISATEUR_STANDARD}              standard_user
${MOT_DE_PASSE_VALIDE}               secret_sauce
${MOT_DE_PASSE_INVALIDE}             mauvais_mot_de_passe

# Locators
${CHAMP_NOM_UTILISATEUR}             id=user-name
${CHAMP_MOT_DE_PASSE}                id=password
${BOUTON_CONNEXION}                  id=login-button
${MESSAGE_ERREUR}                    css=[data-test='error']
${TITRE_PAGE_PRODUITS}               css=[data-test='title']
${CONTENEUR_PRODUITS}                id=inventory_container

# Valeurs attendues
${FRAGMENT_URL_PRODUITS}             /inventory.html
${TEXTE_TITRE_PRODUITS}              Products
${MESSAGE_IDENTIFIANTS_INVALIDES}    Epic sadface: Username and password do not match any user in this service
${MESSAGE_NOM_UTILISATEUR_REQUIS}    Epic sadface: Username is required
${MESSAGE_MOT_DE_PASSE_REQUIS}       Epic sadface: Password is required

*** Keywords ***
Ouvrir La Page De Connexion SauceDemo
    [Documentation]    Ouvre le navigateur sur la page de connexion SauceDemo.
    Open Browser    ${URL_SAUCEDEMO}    ${NAVIGATEUR}
    Maximize Browser Window
    Wait Until Element Is Visible    ${CHAMP_NOM_UTILISATEUR}    ${DELAI_ATTENTE}

Saisir Le Nom Utilisateur
    [Arguments]    ${nom_utilisateur}
    Input Text    ${CHAMP_NOM_UTILISATEUR}    ${nom_utilisateur}

Saisir Le Mot De Passe
    [Arguments]    ${mot_de_passe}
    Input Password    ${CHAMP_MOT_DE_PASSE}    ${mot_de_passe}

Valider Le Formulaire De Connexion
    Click Button    ${BOUTON_CONNEXION}

Se Connecter Avec
    [Documentation]    Saisit le nom d'utilisateur et le mot de passe puis valide le formulaire.
    [Arguments]    ${nom_utilisateur}    ${mot_de_passe}
    Saisir Le Nom Utilisateur    ${nom_utilisateur}
    Saisir Le Mot De Passe    ${mot_de_passe}
    Valider Le Formulaire De Connexion

Valider Le Formulaire Sans Saisie
    [Documentation]    Valide le formulaire alors que tous les champs sont vides.
    Valider Le Formulaire De Connexion

Verifier Que La Page Produits Est Affichee
    [Documentation]    Verifie l'acces a la page des produits apres une connexion reussie.
    Wait Until Location Contains    ${FRAGMENT_URL_PRODUITS}    ${DELAI_ATTENTE}
    Wait Until Element Is Visible    ${CONTENEUR_PRODUITS}    ${DELAI_ATTENTE}
    Element Text Should Be    ${TITRE_PAGE_PRODUITS}    ${TEXTE_TITRE_PRODUITS}

Verifier Que La Connexion Est Refusee Avec Le Message
    [Documentation]    Verifie que le message d'erreur attendu est affiche et que la page produits n'est pas accessible.
    [Arguments]    ${message_attendu}
    Wait Until Element Is Visible    ${MESSAGE_ERREUR}    ${DELAI_ATTENTE}
    Element Text Should Be    ${MESSAGE_ERREUR}    ${message_attendu}
    Location Should Be    ${URL_SAUCEDEMO}
    Element Should Not Be Visible    ${CONTENEUR_PRODUITS}

Fermer Le Navigateur
    Close All Browsers
