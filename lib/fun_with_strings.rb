module FunWithStrings
	
	def palindrome?
		s = self.gsub(/\W/,"")
		s.downcase == s.downcase.reverse
	end
	
    def count_words
		wc = Hash.new(0)
		self
            .gsub(/[^\w ]/,"")
            .split(" ")
            .each {
                |x| wc[x.downcase] += 1
            }
		wc
	end
	
    def anagram_groups
		a_groups = Hash.new([])
		self.split(" ").each { |w| 
			a_groups[w
                .downcase
                .chars
                .sort
                .join
            ] += [w] 
		}
		a_groups.values
	end

end

# make all the above functions available as instance methods on Strings:

class String
	include FunWithStrings
end
