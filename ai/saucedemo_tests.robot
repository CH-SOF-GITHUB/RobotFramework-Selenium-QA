*** Settings ***
Documentation     User story : En tant qu'utilisateur, je veux me connecter à la plateforme SauceDemo.
Resource          saucedemo_res.resource
Test Setup        Ouvrir La Page De Connexion SauceDemo
Test Teardown     Fermer Le Navigateur
Force Tags        connexion    saucedemo

*** Test Cases ***
Connexion réussie avec standard_user
    [Documentation]    Critère d'acceptation 1 : standard_user avec son mot de passe valide
    ...                accède à la page des produits.
    [Tags]    nominal    non-regression
    Se Connecter Avec    ${UTILISATEUR_STANDARD}    ${MOT_DE_PASSE_VALIDE}
    Verifier Que La Page Produits Est Affichee

Connexion échouée avec un mot de passe invalide
    [Documentation]    Critère d'acceptation 2 : un mot de passe invalide est refusé, un message
    ...                d'erreur est affiché et l'utilisateur reste sur la page de connexion.
    [Tags]    cas-erreur    non-regression
    Se Connecter Avec    ${UTILISATEUR_STANDARD}    ${MOT_DE_PASSE_INVALIDE}
    Verifier Que La Connexion Est Refusee Avec Le Message    ${MESSAGE_IDENTIFIANTS_INVALIDES}

Message d'erreur approprié quand les deux champs sont vides
    [Documentation]    Critère d'acceptation 3 : valider sans aucune saisie affiche le message
    ...                indiquant que le nom d'utilisateur est requis.
    [Tags]    cas-erreur    champs-vides    non-regression
    Valider Le Formulaire Sans Saisie
    Verifier Que La Connexion Est Refusee Avec Le Message    ${MESSAGE_NOM_UTILISATEUR_REQUIS}

Message d'erreur approprié quand le mot de passe est vide
    [Documentation]    Critère d'acceptation 3 (variante) : un nom d'utilisateur saisi sans mot de passe
    ...                affiche le message indiquant que le mot de passe est requis.
    [Tags]    cas-erreur    champs-vides    non-regression
    Saisir Le Nom Utilisateur    ${UTILISATEUR_STANDARD}
    Valider Le Formulaire De Connexion
    Verifier Que La Connexion Est Refusee Avec Le Message    ${MESSAGE_MOT_DE_PASSE_REQUIS}
