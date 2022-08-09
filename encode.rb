def cesar_cipher(phrase, shift)
  letters = ('a'..'z').to_a
  index = (1..26).to_a
  letters_index = Hash[letters.zip index]
  is_upcase = []
  precode = phrase.split('')
  precode.each { |c| c == c.upcase ? is_upcase.append(1) : is_upcase.append(0) }
  precode_index = []
  precode.each do |c|
    if letters_index[c.downcase]
      precode_index.append(letters_index[c.downcase])
    else
      precode_index.append(c)
    end
  end

  shifted = []
  precode_index.each do |i|
    if i.instance_of? Fixnum
      if i + shift < 1
        shifted.append(i+shift+26)
      elsif i + shift > 26
        shifted.append(i+shift-26)
      else
        shifted.append(i+shift)
      end
    elsif i.instance_of? String
      shifted.append(i)
    end
  end

  encoded = ''
  shifted.each do |i|
    if i.instance_of? Fixnum
      encoded << letters_index.key(i)
    else
      encoded << i
    end
  end

  idx = 0
  while idx < encoded.length
    if is_upcase[idx] == 1
      encoded[idx] = encoded[idx].upcase
    end
    idx += 1
  end
  
  puts encoded

end

cesar_cipher("Hello there!", 5)