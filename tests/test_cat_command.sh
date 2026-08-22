#!/bin/bash

echo "=========================================="
echo " CAT Command - Automated Test"
echo "=========================================="

PASS=0
FAIL=0

# ------------------------------------------------
# Test 1: Check newfile.txt
# ------------------------------------------------

echo ""
echo "Test Case 1: Checking newfile.txt"

if [ -f "newfile.txt" ]; then
    echo "PASS: newfile.txt exists"
    PASS=$((PASS + 1))
else
    echo "FAIL: newfile.txt does not exist"
    FAIL=$((FAIL + 1))
fi


# ------------------------------------------------
# Test 2: Check content of newfile.txt
# ------------------------------------------------

echo ""
echo "Test Case 2: Checking content of newfile.txt"

EXPECTED_NEW=$'Hello Linux\nThis is a cat command practical.'

if [ -f "newfile.txt" ] && [ "$(cat newfile.txt)" = "$EXPECTED_NEW" ]; then
    echo "PASS: newfile.txt content is correct"
    PASS=$((PASS + 1))
else
    echo "FAIL: newfile.txt content is incorrect"
    FAIL=$((FAIL + 1))
fi


# ------------------------------------------------
# Test 3: Check file1.txt
# ------------------------------------------------

echo ""
echo "Test Case 3: Checking file1.txt"

if [ -f "file1.txt" ] && [ "$(cat file1.txt)" = "First file" ]; then
    echo "PASS: file1.txt is correct"
    PASS=$((PASS + 1))
else
    echo "FAIL: file1.txt is missing or incorrect"
    FAIL=$((FAIL + 1))
fi


# ------------------------------------------------
# Test 4: Check file2.txt
# ------------------------------------------------

echo ""
echo "Test Case 4: Checking file2.txt"

if [ -f "file2.txt" ] && [ "$(cat file2.txt)" = "Second file" ]; then
    echo "PASS: file2.txt is correct"
    PASS=$((PASS + 1))
else
    echo "FAIL: file2.txt is missing or incorrect"
    FAIL=$((FAIL + 1))
fi


# ------------------------------------------------
# Test 5: Check concatenated output
# ------------------------------------------------

echo ""
echo "Test Case 5: Checking concatenation"

EXPECTED_CONCAT=$'First file\nSecond file'

if [ -f "file1.txt" ] && [ -f "file2.txt" ]; then
    ACTUAL_CONCAT=$(cat file1.txt file2.txt)

    if [ "$ACTUAL_CONCAT" = "$EXPECTED_CONCAT" ]; then
        echo "PASS: Files concatenate correctly"
        PASS=$((PASS + 1))
    else
        echo "FAIL: Concatenation result is incorrect"
        FAIL=$((FAIL + 1))
    fi
else
    echo "FAIL: Required files for concatenation are missing"
    FAIL=$((FAIL + 1))
fi


# ------------------------------------------------
# Test 6: Check append operation
# ------------------------------------------------

echo ""
echo "Test Case 6: Checking existingfile.txt"

EXPECTED_EXISTING=$'Existing file\nFirst file'

if [ -f "existingfile.txt" ] && [ "$(cat existingfile.txt)" = "$EXPECTED_EXISTING" ]; then
    echo "PASS: Content was appended correctly"
    PASS=$((PASS + 1))
else
    echo "FAIL: existingfile.txt content is incorrect"
    FAIL=$((FAIL + 1))
fi


# ------------------------------------------------
# Test 7: Check line numbering
# ------------------------------------------------

echo ""
echo "Test Case 7: Checking line numbering"

if [ -f "newfile.txt" ]; then

    NUMBERED_OUTPUT=$(cat -n newfile.txt)

    if echo "$NUMBERED_OUTPUT" | grep -q "1.*Hello Linux" &&
       echo "$NUMBERED_OUTPUT" | grep -q "2.*This is a cat command practical."; then

        echo "PASS: Lines are numbered correctly"
        PASS=$((PASS + 1))
    else
        echo "FAIL: Line numbering is incorrect"
        FAIL=$((FAIL + 1))
    fi

else
    echo "FAIL: newfile.txt does not exist"
    FAIL=$((FAIL + 1))
fi


# ------------------------------------------------
# Final Result
# ------------------------------------------------

echo ""
echo "=========================================="
echo " FINAL TEST RESULT"
echo "=========================================="

echo "Passed: $PASS"
echo "Failed: $FAIL"

if [ "$FAIL" -eq 0 ]; then
    echo ""
    echo "ALL TEST CASES PASSED!"
    exit 0
else
    echo ""
    echo "SOME TEST CASES FAILED!"
    exit 1
fi
