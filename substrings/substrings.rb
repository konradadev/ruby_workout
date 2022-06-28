dictionary1 = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
dictionary2 = ["above","up","stop","standing","bald","now","hello","is","you","high","lend","complete","enemy","stand"]

string = "Howdy partner, sit down! How's it going? Is your enemy still around? Will you go up and above anyone else to stop him?"

def simplify(array_of_strings)
  return array_of_strings.map { |word| word.tr('^A-Za-z', '').downcase }
end

def substrings(string, dictionary)
  string_array = simplify(string.split)
  puts string_array
end

substrings(string, dictionary1)