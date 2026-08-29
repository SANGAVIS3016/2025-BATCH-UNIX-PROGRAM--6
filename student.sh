#!/bin/bash

# UNIX Practical 6
# CAT Command

# Student Name:
# Register Number:

# 1. Create newfile.txt
cat > newfile.txt << EOF
Hello Linux
This is a cat command practical.
EOF

# 2. Create file1.txt
cat > file1.txt << EOF
First file
EOF

# 3. Create file2.txt
cat > file2.txt << EOF
Second file
EOF

# 4. Concatenate file1.txt and file2.txt
cat file1.txt file2.txt > concatenated.txt

# 5. Create existingfile.txt
cat > existingfile.txt << EOF
Existing file
EOF

# 6. Append file1.txt to existingfile.txt
cat file1.txt >> existingfile.txt
