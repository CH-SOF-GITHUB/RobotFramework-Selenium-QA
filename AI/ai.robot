#*** Settings ***
Documentation     Use AI to generate real addresses dynamically.
# Le paramètre %{OPENAI_KEY} va lire automatiquement la variable que vous avez créée dans votre terminal
#Library           RobotFrameworkAI
#*** Variables ***
#${AI}             openai

#*** Test Cases ***
#Generate Addresses with AI
    # Attention à bien mettre au moins 2 espaces entre chaque élément
    ${addresses}=    Generate Test Data    ${AI}    address    model=gpt-4o-mini    country=finland
    Log To Console    \nDonnées générées : ${addresses}