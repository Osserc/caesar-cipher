def factor_reformatting(factor)
    if factor > 26
        until factor < 26 do
            factor -= 26
        end
        return factor
    elsif factor < -26
        until factor > -26 do
            factor += 26
        end
        return factor
    else
        return factor
    end
end

def character_check(number)
    if (number >= 97 && number <= 122) || (number >= 65 && number <= 90)
        return true
    else
        return false
    end
end

def case_check(number)
    if number >= 97 && number <= 122
        return true
    elsif number >= 65 && number <= 90
        return false
    end
end

def factor_shift(number, factor)
    if character_check(number) == true
        if case_check(number) == true
            if factor > 0
                number += factor
                if number > 122
                    number -= 26
                end
                return number
            elsif factor < 0
                number += factor
                if number < 97
                    number += 26
                end
                return number
            end
        elsif case_check(number) == false
            if factor > 0
                number += factor
                if number > 90
                    number -= 26
                end
                return number
            elsif factor < 0
                number += factor
                if number < 65
                    number += 26
                end
                return number
            end
        end
    else
        return number
    end
end

def cipher()
    puts "Type your sentence"
    string = gets.chomp
    puts "Decide the shift factor"
    factor = gets.chomp.to_i
    split = string.split("")
    factor = factor_reformatting(factor)
    split.map! { | character | character.ord }
    split.map! { | number | factor_shift(number, factor) }
    split.map! { | number | number.chr }
    string = split.join
    puts string
end

cipher()

# Predetermined version up for posterity
# def cipher(string, factor)
#     # string = gets.chomp
#     split = string.split("")
#     factor = factor_reformatting(factor)
#     split.map! { | character | character.ord }
#     split.map! { | number | factor_shift(number, factor) }
#     split.map! { | number | number.chr }
#     split = split.join
#     puts split
# end

# cipher("Hello, world", 3)
# cipher("Hello, world", -17)
# cipher("I am the GlobGlobGlabGalab", 41)