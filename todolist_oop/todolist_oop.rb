class ListService
  attr_reader :list

  def initialize
    @list = []
  end
  
  def create_task(tasking)
    @list << tasking
  end
  
  def show_list_file
    Dir.glob("*.txt").each { |file| puts file }
  end

  def save_to_file(filename)
    File.open(filename, 'a') do |f|
      list.each { |tugas| f.puts tugas.normalize_task }
    end
  end

  def read_from_file(filename)
    File.open(filename, 'r') do |f|
      f.each_line { |line| puts line }
    end
  end
end

class Task
  attr_reader :task

  def initialize(tugas)
    @task = tugas
  end
  
  def normalize_task
    "# #{task}"
  end
end

task = Task.new("Belajar deh")
list = ListService.new
list.create_task(task)
list.save_to_file("oke.txt")
list.read_from_file("oke.txt")
