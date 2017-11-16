
ascii_user = gets.chomp

ascii = ascii_user.chars.map{ |c| c.ord }
ascii_5 = ascii.map { |c| c + 5 }
test_cesar  = ascii_5.map { |c| c.chr }.join
puts test_cesar

