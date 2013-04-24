require 'net/http'

namespace :content do
  def sample_data_path(filename)
    dir = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'db', 'sample_data'))
    File.join(dir, filename)
  end

  task :operatives => :environment do
    names_file = sample_data_path('names.txt')
    names = File.read(names_file).split("\n")
    $stderr.puts "Creating #{names.size} Operatives"
    names.each do |name|
      Operative.create(:name => name)
    end
  end

  task :missions => :environment do
    colors_file = sample_data_path('colors.txt')
    animals_file = sample_data_path('animals.txt')
    colors = File.read(colors_file).split("\n")
    animals = File.read(animals_file).split("\n")
    colors.each do |color|
      animals.each do |animal|
        codename = "#{color} #{animal}"
        Mission.create(:codename => codename)
      end
    end
  end

  task :assign_missions => :environment do
    all_missions = Mission.all
    Operative.all.each do |operative|
      num_missions = rand(5)
      num_missions.times do
        operative.missions << all_missions.sample
      end
    end
  end
end
