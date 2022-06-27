def is_lower_case?(char)
  char.ord.between?(97, 122)
end

def is_upper_case?(char)
  char.ord.between?(65, 90)
end

def get_char_from_big_key(key, char_ord, range_start, range_end)
  key_rest = key % 26
  if (char_ord - key_rest).between?(range_start, range_end)
    char_ord = char_ord - key_rest
  else
    char_ord = get_char_from_small_key(key_rest, char_ord, range_start, range_end)
  end
  char_ord
end

def get_char_from_small_key(key, char_ord, range_start, range_end)
  key_rest = key - (char_ord - range_start) - 1
  char_ord = range_end - key_rest
  char_ord
end

def caesar_cipher(message, key)
  message_array = message.split('')
  encoded_message_array = []
  message_array.each do |char|
    final_char = nil
    range_start = nil
    range_end = nil
    skip = false
    if is_lower_case?(char)
      range_start = 97
      range_end = 122
    elsif is_upper_case?(char)
      range_start = 65
      range_end = 90
    else
      final_char = char.ord
      skip = true
    end

    if skip == false
      unless (char.ord - key).between?(range_start, range_end)
        if key > 25
          final_char = get_char_from_big_key(key, char.ord, range_start, range_end)
        else
          final_char = get_char_from_small_key(key, char.ord, range_start, range_end)
        end
      else
        final_char = char.ord - key
      end
    end
    encoded_message_array.push(final_char)
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