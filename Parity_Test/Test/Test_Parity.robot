*** Settings ***
Library    BuiltIn

*** Variables ***
${NUMBER}    10
@{NUMBERS}   1    2    3    4    5

*** Test Cases ***
Print Scalar Variable
    [Documentation]    Checks the printing of a scalar variable.
            Log     ${NUMBER}

Print List Variable
    [Documentation]    Checks the printing of a list variable.
            Log     ${NUMBERS}

Check Even Numbers
    [Documentation]    Check the even numbers in the list.
    ${even_numbers}=    Evaluate    [int(num) for num in ['1', '2', '3', '4', '5'] if int(num) % 2 == 0]
    ${even_numbers_string}=    Convert To String    ${even_numbers}
    Should Be Equal As Strings    ${even_numbers_string}    [2, 4]

Check Odd Numbers
    [Documentation]    Check the odd numbers in the list.
    ${odd_numbers}=    Evaluate    [int(num) for num in ['1', '2', '3', '4', '5'] if int(num) % 2 != 0]
    ${odd_numbers_string}=    Convert To String    ${odd_numbers}
    Should Be Equal As Strings    ${odd_numbers_string}    [1, 3, 5]