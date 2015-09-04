class Organisation
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.all
    [
      new(:sum_of_us, "Sum of Us"),
      new(:chang_org, "Change.org"),
      new(:degrees_38, "38 degrees"),
      new(:stop_the_war, "Stop the war"),
      new(:greenpeace, "Greenpeace"),
      new(:avaz, "Avaaz"),
      new(:care2, "Care2 petitions"),
    ]
  end

  def self.find(id)
    all.detect{|x| x.id == id}
  end

end
