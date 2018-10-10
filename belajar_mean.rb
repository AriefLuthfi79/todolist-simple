puts ("=" * 3) + ("> " * 2) + "Selamat datang di Program Input Nilai Ujian" + (" <" * 2) + ("=" * 3)

user = {}

def loop_user(user)
  user.each { |key, value| puts "#{key.capitalize} " + "=>" + " #{value}" }      
end

def get_greatest_score(user)
  return if user.nil?
  temp = 0
  user.each { |key, value| temp = value if value > temp }
  return temp
end

def get_lowest_score(user)
  return "Tidak ada yang terendah" if same_value? user
  temp = 100
  user.each { |key, value| temp = value if value < temp } 
  return temp
end

def same_value?(user)
  user.values.all? { |x| x == user.values[0] }
end

def fail_user(user)
  print "\n"
  puts "=" * 3 + "> Nilai Tidak Lulus <" + "=" * 3
  user.each do |key, value|
    puts "Nilai ujian #{key} tidak mencukupi. Capaian #{(value*10).to_f}" if value < 5
  end
end

def success_user(user)
  print "\n"
  puts "=" * 3 + "> Nilai Lulus <" + "=" * 3 
  user.each do |key, value|
    puts "Nilai ujian #{key} telah mencukupi. Capaian #{(value*10).to_f}" if value >= 5
  end
end 

loop do
  print "Masukkan Nama Peserta : "
  name = gets.chomp

  print "Masukkan Nilai #{name} : "
  value = gets.to_f

  user[name] = value
  print "Lanjutkan? [Y/n] : "
  option = gets.chomp
  case option
  when "Y" 
    next
  when "n"
    puts "Terimakasih sudah memasukkan nilai nilai peserta ujian"
    puts "-" * 38 + "*" + "-" * 38
    loop_user(user)
    success_user(user)  
    fail_user(user)
    print "\n"
    puts "Nilai TERTINGGI adalah #{user.key(get_greatest_score(user)).capitalize} dengan nilai #{get_greatest_score(user)}"
    if get_lowest_score(user).is_a? Float or get_lowest_score(user).is_a? Integer 
      puts "Nilai TERENDAH adalah #{user.key(get_lowest_score(user)).capitalize} dengan nilai #{get_lowest_score(user)}"
    else
      puts "Nilai TERENDAH adalah #{get_lowest_score(user)}"
    end
    break
  else
    puts "Maaf input tidak sesuai option"
    break
  end
end

