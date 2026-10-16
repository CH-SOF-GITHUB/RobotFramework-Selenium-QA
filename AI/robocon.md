Robot Framework meets AI: Next level automation.

֎🇦🇮 AI + Robot Framework  = Next-Level Testing.

What we can do already ?
° Generating Data
° Adapting to situations
° Reasoning
° Agents!
° Reliable knowledge base

֎🇦🇮 New RF Library for AI 
֎🇦🇮 Seamless Integration
֎🇦🇮 Supports multiple Models
֎🇦🇮 No AI Expertise Needed 

pip install robotframework-ai
pip install openai


Save your key
Please save your secret key in a safe place since you won't be able to view it again. Keep it secure, 
as anyone with your API key can make requests on your behalf. If you do lose it, you'll need to generate a new one.

Learn more about API key best practices

========================================================================================================================
The Evolution of Test Automation
° Manual Testing Era
   ° Time-consuming and error-prone

° Introduction of Automation Tools
   ° Emergence of frameworks like Robot Framework 
   ° Improved efficiency and reliability

° The AI Revolution
   ° Integration of AI into testing
   ° Intelligent decision-making and realistic data generation
========================================================================================================================
Why Integrate Al into Test Automation? 
° Dynamic Test Data Generation
   ° AI creates realistic and diverse data on demand.

° Adaptive Testing through Live Interaction
   ° AI adjusts tests in real-time based on feedback.

° Intelligent Decision-Making 
   ° AI identifies edge cases and optimizes test paths.

° Improved Efficiency and Coverage
   ° Reduces redundant tests and uncovers hidden bugs.
========================================================================================================================
Objectives of RobotFramework-AI
° Merge the generative power of AI with Robot Framework
° Simplify real test data generation
° Provide interactive testing tools
° Keep AI accessible within the Robot Framework environment
========================================================================================================================
What is RobotFramework-Al?
° Definition
   ° A library adding AI functionality to Robot Framework
° Integration
   ° Connects to AI models like OpenAl's GPT
° Purpose 
   ° Leverage Al within test scripts
   ° Enhance test automation capabilities
========================================================================================================================
Key Components
° Test Data Generator
   ° Generates real-world test data using AI
° Chatbot Module
   ° Enables conversational interactions within tests
° Assistant Module
   ° Maintains conversation context
   ° Supports file attachments for enriched interactions
========================================================================================================================
Test Data Generator
° Functionality
   ° Uses AI to create authentic and diverse test data
° Supported Data Types
   ° Addresses, phone numbers and user data
° Customization Options
   ° Specify data type, quantity, and parameters (e.g., country)

========================================================================================================================
Robot Framework MCP - AI-Powered Test Automation

FROM NATURAL LANGUAGE TO A TEST SUITE?

Use RobotMCP to create a test suite and execute it step wise.
It shall
- Open https://www.saucedemo.con/ with headless=False
- Login
- Add shopping items to the basket
- Check if items were added successfully
- Complete Checkout process
- Close Browser

INTERACT WITH AGENTS (AND TOOLS)
- Functions can be provided as tools to the agent
- Extend context with additional data, e.g. from documents (RAG)
- Connection to real world
- Access to DBs, Webservices and other APIs
- Agents choose tools autonomously

INTERACT WITH AGENTS AND MCP SERVERS
Model Context Model
The “USB-Standard” for AI Tools
- Open Standard to provide tools to Agents
- Simple connection of MCP Servers wih Agents
- Agent can freely combine tools of multiple mcp servers

========================================================
A ROBOT FRAMEWORK MCP SERVER
🎯 Goal:
- Create Test Suites from natural language
- No hallucinations
- Stepwise execution and verification of keywords

🛠️ Tools:
- analyze scenario
- recommend libraries
- search keywords
- get keyword documentation
- get application state
- execute step
- build test suite
- run test suite

========================================================
RF-MCP - INSTALLATION AND SETUP

Install via pip or uv
pip install rf-mcp # Use rf-mcp [all]
uv add rf-mcp      # for all dependencies

Config to add MCP Server in VS Code
- .vscode/mcp. json

========================================================
RF-MCP USE CASES

- Create Test Suites from Natural Language
- Re-factor Test Suites
- Debug
- Monitor RF-MCP via frontend

=======================================================
PROMPT FOR TEST CREATION [prepare your prompt.md]

Use #RobotMCP to create a test suite and execute it step wise.
- Open https://www.saucedemo.com/ with headless=False
- Login
- Add shopping items to the basket
- Check if items were added successfully
- Complete Checkout process
- Close Browser

Use Firefox Browser
Use Selenium Library with implicit waits to ensure elements are loaded before interacting with them.