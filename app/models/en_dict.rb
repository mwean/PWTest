class EnDict < ActiveRecord::Base
  def self.check_words(pwds)
    in_dict = false
    change = ""
    pwds.each do |pwd|
      result = EnDict.find_by_word(pwd)
      if result != nil
        in_dict = true
      end
    end
    
    if in_dict != false
      true
    else
      false
    end
  end
end