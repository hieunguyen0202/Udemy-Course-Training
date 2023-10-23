# Tutorials
## Linux File Editor (vi)
- `vi` - visual editor
- `i`: insert
- `ESC`: Escape any of code
- `r`: replace, (ESC->move cursor before the character which you want to replace-> Type `r`-> new charater)
- `:q!`: without saving
- `:wq!` or `shift + Z + Z`: Exit and saving
## "sed" Command
- Replace a string  in a file with a newstring
    ```
    sed 's/oldWord/newWord/g' file
   # g: replace entire the file
    sed -i 's/oldWord/newWord/g' file
    ```
    
- Find and delete a line
- Remove empty lines
- Remove the first or n lines in a file
- To replace tabs with spaces
- Show defined lines from a file
- Substitute within `vi` editor
