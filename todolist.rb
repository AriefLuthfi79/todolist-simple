puts "#" * 20
puts "Todo List command line"

while true do
  puts <<-EOF
      Pilih menu :
      1. Buat tugas
      2. Read task
      3. exit
  EOF
  input = gets.chomp.to_i
  case input
  when 1
    puts "Masukkan tugas yang ingin dilakukan"
    task = gets.chomp
    puts "Apakah ingin disave kedalam file(yes/no)?"
    option = gets.chomp
    case option
    when /yes/
      puts 'Apa nama file nya?'
      filename = gets.chomp
      unless File.exist? filename
        File.open(filename, 'a+') do |f|
          f.puts task
        end
      else
        puts 'file sudah ada' 
      end
    when /no/
      puts "tugas mu adalah"
      puts "#{task}"
    end
  when 2
    files = Dir.glob("*")
    files.each do |filename|
      unless File.extname(filename).include?(".rb")
        File.open(filename, 'r') do |file|
          file.each_line { |line| puts line }
        end
      else
        puts "file ekstensi .rb tidak bisa dibaca"
      end
    end
  when 3
    break
  end
 end

