// Program to convert strings to their rot13-encoded counterparts

globals
    string array plainCharacters
    string array rot13EncodedCharacters
endglobals

// rot13EncodedCharacters[k] is plainCharacters[k] encoded in rot13 
function InitialiseData takes nothing returns nothing
    set plainCharacters[0] = "a"
    set plainCharacters[1] = "b"
    set plainCharacters[2] = "c"
    set plainCharacters[3] = "d"
    set plainCharacters[4] = "e"
    set plainCharacters[5] = "f"
    set plainCharacters[6] = "g"
    set plainCharacters[7] = "h"
    set plainCharacters[8] = "i"
    set plainCharacters[9] = "j"
    set plainCharacters[10] = "k"
    set plainCharacters[11] = "l"
    set plainCharacters[12] = "m"
    set plainCharacters[13] = "n"
    set plainCharacters[14] = "o"
    set plainCharacters[15] = "p"
    set plainCharacters[16] = "q"
    set plainCharacters[17] = "r"
    set plainCharacters[18] = "s"
    set plainCharacters[19] = "t"
    set plainCharacters[20] = "u"
    set plainCharacters[21] = "v"
    set plainCharacters[22] = "w"
    set plainCharacters[23] = "x"
    set plainCharacters[24] = "y"
    set plainCharacters[25] = "z"
    set plainCharacters[26] = "A"
    set plainCharacters[27] = "B"
    set plainCharacters[28] = "C"
    set plainCharacters[29] = "D"
    set plainCharacters[30] = "E"
    set plainCharacters[31] = "F"
    set plainCharacters[32] = "G"
    set plainCharacters[33] = "H"
    set plainCharacters[34] = "I"
    set plainCharacters[35] = "J"
    set plainCharacters[36] = "K"
    set plainCharacters[37] = "L"
    set plainCharacters[38] = "M"
    set plainCharacters[39] = "N"
    set plainCharacters[40] = "O"
    set plainCharacters[41] = "P"
    set plainCharacters[42] = "Q"
    set plainCharacters[43] = "R"
    set plainCharacters[44] = "S"
    set plainCharacters[45] = "T"
    set plainCharacters[46] = "U"
    set plainCharacters[47] = "V"
    set plainCharacters[48] = "W"
    set plainCharacters[49] = "X"
    set plainCharacters[50] = "Y"
    set plainCharacters[51] = "Z"
    
    set rot13EncodedCharacters[0] = "n"
    set rot13EncodedCharacters[1] = "o"
    set rot13EncodedCharacters[2] = "p"
    set rot13EncodedCharacters[3] = "q"
    set rot13EncodedCharacters[4] = "r"
    set rot13EncodedCharacters[5] = "s"
    set rot13EncodedCharacters[6] = "t"
    set rot13EncodedCharacters[7] = "u"
    set rot13EncodedCharacters[8] = "v"
    set rot13EncodedCharacters[9] = "w"
    set rot13EncodedCharacters[10] = "x"
    set rot13EncodedCharacters[11] = "y"
    set rot13EncodedCharacters[12] = "z"
    set rot13EncodedCharacters[13] = "a"
    set rot13EncodedCharacters[14] = "b"
    set rot13EncodedCharacters[15] = "c"
    set rot13EncodedCharacters[16] = "d"
    set rot13EncodedCharacters[17] = "e"
    set rot13EncodedCharacters[18] = "f"
    set rot13EncodedCharacters[19] = "g"
    set rot13EncodedCharacters[20] = "h"
    set rot13EncodedCharacters[21] = "i"
    set rot13EncodedCharacters[22] = "j"
    set rot13EncodedCharacters[23] = "k"
    set rot13EncodedCharacters[24] = "l"
    set rot13EncodedCharacters[25] = "m"
    set rot13EncodedCharacters[26] = "N"
    set rot13EncodedCharacters[27] = "O"
    set rot13EncodedCharacters[28] = "P"
    set rot13EncodedCharacters[29] = "Q"
    set rot13EncodedCharacters[30] = "R"
    set rot13EncodedCharacters[31] = "S"
    set rot13EncodedCharacters[32] = "T"
    set rot13EncodedCharacters[33] = "U"
    set rot13EncodedCharacters[34] = "V"
    set rot13EncodedCharacters[35] = "W"
    set rot13EncodedCharacters[36] = "X"
    set rot13EncodedCharacters[37] = "Y"
    set rot13EncodedCharacters[38] = "Z"
    set rot13EncodedCharacters[39] = "A"
    set rot13EncodedCharacters[40] = "B"
    set rot13EncodedCharacters[41] = "C"
    set rot13EncodedCharacters[42] = "D"
    set rot13EncodedCharacters[43] = "E"
    set rot13EncodedCharacters[44] = "F"
    set rot13EncodedCharacters[45] = "G"
    set rot13EncodedCharacters[46] = "H"
    set rot13EncodedCharacters[47] = "I"
    set rot13EncodedCharacters[48] = "J"
    set rot13EncodedCharacters[49] = "K"
    set rot13EncodedCharacters[50] = "L"
    set rot13EncodedCharacters[51] = "M"
endfunction

function Rot13 takes string text returns string
    // i is the position of the character in the parameter string
    // j is the common index in the arrays
    // the boolean encoded represents the state of the encoding of
    // the substring

    local integer i
    local integer j
    local integer length
    local string encoded_string
    local string substring
    local string rot13_character
    local string plain_character
    local boolean encoded
    
    set length = StringLength(text)
    set i = 0
    set j = 0
    set encoded_string = ""
    set encoded = false
    
    loop
        exitwhen (i == length)
        
        set substring = SubString(text, i, i+1)
        
        loop
            // exit the loop when either we traversed the arrays or
            // an encoded mapping has been found for a character
            exitwhen (j == 51 or encoded)
            
            set plain_character = plainCharacters[j]
            set rot13_character = rot13EncodedCharacters[j]
            if (plain_character == substring) then
                set encoded_string = encoded_string + rot13_character
                set encoded = true
            endif
            set j = j+1
        endloop
        
        // if there was no corresponding encoded mapping found
        // (e.g. it is a special character) we simply substitute in
        // the original substring from the parameter string
        if (not encoded) then
            set encoded_string = encoded_string + substring
        endif
        
        set i = i+1
        set j = 0
        set encoded = false
    endloop
    
    return encoded_string
endfunction
