dictionary1 = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
dictionary2 = ["above","up","stop","standing","bald","now","hello","is","you","high","lend","complete","enemy","stand"]

string = "Howdy partner, sit down! How's it going? Is your enemy still around? Will you go up and above anyone else to stop him?"

def substrings(string, dictionary)
  string_insensitive = string.downcase
  hash = dictionary.reduce(Hash.new(0)) do |result, word|
    result[word] = string_insensitive.scan(word).length
    result
  end
  puts hash
end

substrings(string, dictionary1)
substrings(string, dictionary2)
#works with a single word as well
substrings("how", dictionary1)