def caesar_encode(string,offset)
    upper = [*?A..?Z]
    lower = [*?a..?z]
    empty_string = "" #set an empty string to "join" the letters back together again later on
    
    string.each_char do |char| #goes through each of the characters in the string
        if char[/[a-zA-Z]/] == char #uses regex to match whether or not a character is a letter from a-z or A-Z
            if char.upcase == char #tests for when the characters are uppercase
                index = (upper.index(char) + offset) % 26 #set a variable index equal to the position of the item in the "upper" letter array of the 
                                                          #character and adds the offset number and finding the remainder of the number divisible by 26 if given a offset bigger than 26
                char.sub!(char,upper[index]) #substitutes character found to the letter found in the position index of the "upper" letter array
            else
                index = (lower.index(char) + offset) % 26
                char.sub!(char,lower[index])
            end
        else
            char #if the character is not a letter, it will just return the character
        end
        empty_string << char #pushes the characters into the earlier formed empty string
    end
    empty_string #returns the empty string again, as a whole
end

def caesar_decode(string,offset)
    # string
    upper = [*?A..?Z]
    lower = [*?a..?z]
    empty_string = ""

    string.each_char do |char|
        if char[/[a-zA-Z]/] == char
            if char.upcase == char
                index = (upper.index(char) - offset) % 26 #same thing as the encode, but subtracts the offset number instead of adding the offset to decode
                char.sub!(char,upper[index])
            else
                index = (lower.index(char) - offset) % 26 #same thing as the encode, but subtracts the offset number instead of adding the offset to decode
                char.sub!(char,lower[index])
            end
        else
            char
        end
        empty_string << char
    end
    empty_string
end