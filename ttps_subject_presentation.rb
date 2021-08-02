require_relative "subject_presentation"
require_relative "teacher"
require_relative "schedule"

class TTPSSubjectPresentation < SubjectPresentation

  def initialize(*,**)

    super(title: "Tecnologias de\nProduccion de Software")
    self.subtitle = "Ruby"

    add_teacher Teacher.new(
      kind: "Profesor",
      full_name: "Christian Rodriguez")

    add_teacher Teacher.new(
      kind: "JTP",
      full_name: "Nahuel Cuesta Luengo")

    add_teacher Teacher.new(
      kind: "Ayudante",
      full_name: "Lucas Di Cunzolo")

    add_teacher Teacher.new(
      kind: "Ayudante",
      full_name: "Damián Candia")

    s= Schedule.new(
      weekday: "Martes",
      start_hour: 11,
      end_hour: 13,
      description: "Generalmente teoria")

    add_schedule s
    add_schedule Schedule.new(
      weekday: "Jueves",
      start_hour: 11,
      end_hour: 13,
      description: "Generalmente practica")
  end

  def present_name
    title.split("\n").each do |t|
      puts format(t).bold
    end
    puts format("#{subtitle} - #{year}", font: "xsansb", color: :red)
  end

  def present_teachers
    puts format("Catedra", color: :red)
    %w(Profesor JTP Ayudante).each do |kind|
      puts format(kind, font: "bubble", color: :green)
      puts
      teachers.select {|t| t.kind == kind}.each do |t|
        puts "  [x]  #{t.full_name}".bold
      end
      puts
    end
    nil
  end

  def present_schedule
    puts format("Horarios", color: :red)
    schedule.each do |s|
      puts "  #{"%-10s" % s.weekday} #{s.start_hour}hs - #{s.end_hour}hs".bold +
        " > #{s.description}".italic.blue
      puts
    end
    nil
  end

  def present_how_to_approve?
    puts format("Modalidad de cursada", color: :blue)
    puts format("Aprobacion de la cursada", color: :green, font: "bubble")
    puts
    txt = <<-APPROVE
    [x] Una evaluación o entrega para cada tema. En caso de no aprobar algún tema,
        se podrá reiterar la evaluación de aquellos temas no aprobados.
    [x] Trabajo practico final integrador
    APPROVE
    puts txt.bold
    puts format("Aprobacion de la materia", color: :light_blue, font: "bubble")
    puts
    txt = <<-APPROVE
    La nota final de la materia será un seis aprobando la cursada. Será posible
    mejorar la nota con una extensión del trabajo práctico integrador o propuesta
    de trabajo conjunta con el profesor.
    APPROVE
    puts txt.bold
  end

  def present_about
    puts format("Links", color: :green).bold
    puts format("Teorias online", color: :light_blue, font: "bubble")
    puts
    puts "  [x] https://ttps-ruby.github.io/teoria".bold
    puts format("Otros", color: :light_blue, font: "bubble")
    puts
    puts "  [x] - Los fuentes de esta presentación por CLI: https://github.com/chrodriguez/ttps-presentacion-cli".italic
    puts "  [x] - las teorías del año pasado: https://www.youtube.com/playlist?list=PLbzlLgd17gcHfBQWOvT5V10VAPONlv6Mf".italic
  end

end
