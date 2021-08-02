class Teacher
  attr_accessor :kind, :full_name
  def initialize(kind: , full_name: )
    self.kind = kind
    self.full_name = full_name
  end
end
