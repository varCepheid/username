# README for Username Validation Script

## Author Information
- **Name:** Alex Vennebush
- **Course:** CPSC298 Intro to \*nix
- **Assignment:** Username Validation
- **Date:** 6 October 2025

## Program Description
This program verifies a list of usernames against the validation criteria below.
It iterates through a list, stored in an external file, and in each iteration outputs the username and whether or not it is valid.

## Username Requirements
This script validates usernames according to the following rules:
- Must start with a lowercase letter
- Can only contain lowercase letters, digits, and underscores
- Must be between 3 and 12 characters in length (inclusive)

## Usage
The script must be run with the provided input file:
```bash
./username.sh < username-input
```

## How the Script Works
The script starts by locating the file with the inputs, the usernames to test, and storing it as a list variable.
It then iterates through each line of the file, which is a single username.
At each iteration, it runs a `grep` command to check the username against a regex string.
The `grep` command includes the `-E` flag, which indicates an extended syntax for the regex string,
and the `-q` flag, which tells the script not to output anything to the user.
If the `grep` command has an output, the username is valid; if not, the username is not valid.

## Regular Expression Pattern
The validation uses the following regular expression pattern:
```
^[a-z][a-z0-9_]{2,11}$
```
This pattern ensures that:
- The username starts with a lowercase letter `[a-z]`
- The following characters are lowercase letters, digits, or underscores `[a-z0-9_]`
- The total length is between 3 and 12 characters

## Testing and Debugging
I tested that my script worked by running it with the inputs from the username-input file, since the program wasn't set up to take inputs from the user.
On my first test, I noticed that a lot of usernames were marked valid that shouldn't have been.
I realized that this was because I had forgotten the `$` at the end of the regex string,
so usernames that were too long or contained invalid characters after the third character were accepted,
because the regex matched the first part of the username.
After I fixed this problem, every username was marked correctly.

## Resources
I did not rely on any particular resources besides what was provided in the assignment directions on Canvas. My code is based on the example `zip.sh` file.

## License
This project is part of coursework for Chapman University and is intended for educational purposes.
