require "date"
require 'colorize'
require 'artii'

class SubjectPresentation
  attr_accessor :title, :subtitle, :year,
    :teachers, :topics, :schedule, :conditions

  def initialize(title:, year: Date.today.year)
    self.title = title
    self.year = year
    self.teachers = []
    self.schedule = []
  end

  def present
    clear
    present_name
    pause_and_clear
    present_teachers
    pause_and_clear
    present_schedule
    pause_and_clear
    present_how_to_approve?
    pause_and_clear
    present_about
  end

  protected

    def clear
      system("clear") || system("cls")
    end

    def pause_and_clear
      require 'io/console'
      puts "Presione cualquier tecla...".italic.light_green
      STDIN.getch
      clear
    end
  
    def format(msg, font: "big", color: :white)
      a = Artii::Base.new font: font
      a.asciify(msg).colorize(color)
    end
    
    def add_teacher(t)
      self.teachers << t
    end

    def add_schedule(s)
      self.schedule << s
    end
end
