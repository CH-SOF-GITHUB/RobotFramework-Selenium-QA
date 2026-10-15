Robot Framework : is generic open source automation framework for acceptance testing, (ATTD) Testing, and RPA.
Acceptance Testing is to evaluate of a system in accordance with the business requirements.
ATTD: development methodology that is based on the communication between business customer developers and testers.
RPA: process reducing the human effort that uses machine learning and AI capabilities RPI.

01
ROBOT FRAMEWORK ARCHITECTURE:
Test Data 
--------------------------->  Test Data syntax
Robot Framework
--------------------------->  Test Library API
Test Libraries

Test Tools
-------------------------->  Application Interfaces
System Under Test


02 
STANDARD LIBRARIES:
+ Built-In: provides a set of generic keywords which are needed very often, so it is important automatically
and this always available. These keywords provide for example verification( should be equal, should contain),
working on test cases and can be used for conversion, for exemple, convert to integer and for various other 
purposes: logs, run keywords, set variables, etc.
+ Collections: provide a set of keywords for handling Python lists and dictionaries.
+ DateTime: test library for handling date and time values
+ Dialogs: for pausing the test, execution and getting input from users.
+ OperatingSystem: enables the various operating system related to tasks, going to be performed in the system when the
                   robot framework is running it.
+ Process
+ Remote
+ Screenshot

03
BUILT-IN TOOLS:
+ Testdoc
+ Rebot
+ Tidy
+ Libdoc

04
TEST CASES:
+ Workflow Tests
+ Data-Driven Tests
+ High Level Tests

1) TestCaseName
2) Keywords names
3) Settings: documentation, setup, teardown, template, timeout.

Examples of test cases:
*** Test Cases ***
User can create an account and log in
    Create Valid User python P4ssw0rd
    Attempt to Login with Credentials python P4ss0rd
    Status Should Be Logged In

User cannot log in with bad password
    Create Valid User python P4ssw0rd
    Attempt to Login with Credentials python wrong
    Status Should Be Access Denied

#############################################################
*** Test Cases ***
User can change password
    Given a user has a valid account
    When she changes her password
    Then she can log in with the new password
    And she cannot use the old password anymore

#############################################################
*** Test Cases ***
Invalid password
       [Template] Creating user with invalid password should fai.
        2605 ${PWD INVALID LENGTH
        bCDS6789 {PWD INVALID LENGTH
        1230 ${PWD INVALID CONTEN
        abcds6789 ${PWD INVALID CONTENT
        SC EFGh ${PWD INVALID CONTENT)
        2600564 ${PWD INVALID CONTENT

05
Keywords:
Library Keywords: All the lowest level keywords are defined in standard libraries that can be implemented 
using programming languages like Python, Java, etc.

User Keywords: One of the powerful features of robot framework is that we can make custom high-level Keywords 
using other keywords.

06
Variables:
${USERNAME}            janedoe
${PASSWORD}            J4n300e
${NEW PASSWORD}        e003nd
${DATABASE FILE}       ${TEMPDIR}${/}robotframework-quickstart-db. txt
${PWD INVALID LENGTH}  Password must be 7-12 characters long

07
ORGANIZING TEST CASES:
+ Setup and Teardowns
+ Using Tags
*** Settings ***
Suite Setup       Clear Login Database
Test Teardown     Clear Login Database
*** Settings ***
Force Tag     quickstart
default Tag   example    smoke

08
SELENIUM LIBRARY
The selenium library in the robot framework  is a web testing library that uses the selenium
tools internally.
And The installation works like any other library, using the pip install command.