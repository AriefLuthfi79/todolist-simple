def print
  puts "Todolist Command Line"
end

def main_loop
  print
  while true do
    puts <<-EOP
       Pilih Menu:
       1. Buat tugas
       2. Read task
       3. exit
    EOP
    input = gets.to_i
    case input
    when 1
      create_task
    when 2
      puts "File yang sudah ada: "
      show_all_files
      puts "Pilih nama file nya apa?"
      file = gets.chomp
      read_task(file)
    when 3
      break
    end
  end
end

def create_task
  puts "Masukkan tugas yang ingin dilakukan"
  task = gets.chomp
  puts "Apakah ingin dimasukkan kedalam file? (yes/no)"
  option = gets.chomp
  case option
  when /yes/
    puts 'Apa nama filename nya?'
    filename = gets.chomp
    save_to_file(filename, task)
  when /no/
    puts "tugas anda adalah #{task}"
  end
end

def save_to_file(filename, task)
  if File.exist? filename
    puts "File sudah ada, apakah ingin ditambah? (yes/no)"
    option = gets.chomp
    case option
    when /yes/
      create_file(filename, task)
    when /no/
      raise 'Tidak disave ke file'
    end
  else
    create_file(filename, task)
  end
end

def create_file(filename, task)
  File.open(filename, 'a+') { |f| f.puts task }
end

def read_task(name_of_file)
  File.open(name_of_file, "r") do |f|
    f.each_line { |line| puts line }
  end 
end

def show_all_files
  Dir.glob("*.txt").each { |file| puts file }
end

main_loop
