*** Settings ***
Documentation    Example of Squash TF parameter use.
Library          squash_tf.TFParamService
Library          conditionalHang.py    42

*** Test Cases ***
Parameter Test
    [Documentation]    This test hangs, fails or passes depending on parameter value
    ${parmValue}=    Get Param    TC_REFERENCE
    Hang If Not    ${parmValue}
    Should Be Equal    ${parmValue}    42

No Parameter Test
    [Documentation]    This test works unconditionnally.
    Should Be Equal    42    42

Non Hanging Failure Parameter Test
    [Documentation]    This test always fails
    Should Be Equal    43    42
