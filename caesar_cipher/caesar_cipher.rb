def is_lower_case?(char)
  char.ord.between?(97, 122)
end

def is_upper_case?(char)
  char.ord.between?(65, 90)
end

def get_char_from_big_key(key, char, range_start, range_end)
  key_rest = key % 26
  if char - key_rest < range_start
    key_rest -= range_start
    char = range_end - key_rest
  else
    char = char - key_rest
  end
  char
end

def caesar_cipher(message, key)
  message_array = message.split('')
  encoded_message_array = []
  message_array.each do |char|
    if is_lower_case?(char)
      if key > 25
        char = get_char_from_big_key(key, char.ord, 97, 122)
        encoded_message_array.push(char)
      else
        encoded_message_array.push(char.ord - key)
      end
    elsif is_upper_case?(char)
      if key > 25
        char = get_char_from_big_key(key, char.ord, 65, 90)
        encoded_message_array.push(char)
      else
        encoded_message_array.push(char.ord - key)
      end
    else
      encoded_message_array.push(char.ord)
    end
  end
  encoded_message_array.map! {|char_ord| char_ord = char_ord.chr}
  encoded_message = encoded_message_array.join('')
  puts encoded_message
end

puts "Type in your message:"
string = gets.chomp

puts "Type in your key:"
key = gets.to_i

caesar_cipher(string, key)