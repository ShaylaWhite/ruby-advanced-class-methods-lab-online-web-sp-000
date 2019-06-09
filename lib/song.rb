class Song
  attr_accessor :name, :artist_name
  @@all = []
  

  def self.create(name = nil, artist_name = nil)
   song = self.new 
   song.name = name 
   song.artist_name = artist_name
      @@all << song
      song
  end  

  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end

  
  def self.new_by_name(name) 
    song=self.new
    song.name=name
    song.save
    song
  end

 def self.create_by_name(name)
    song=self.new
    song.name=name
    song.save
    song
  end
 def self.find_by_name(name)
    self.all.find{|song| song.name==name}
  end

def self.find_or_create_by_name(name) 
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    answer=self.new
    answer.artist_name=filename.split(/[^a-zA-Z\s]|\s-\s/)[0]
    answer.name=filename.split(/[^a-zA-Z\s]|\s-\s/)[1]
    answer
  end

  def self.create_from_filename(filename)
    answer=self.new
    answer.artist_name=filename.split(/[^a-zA-Z\s]|\s-\s/)[0]
    answer.name=filename.split(/[^a-zA-Z\s]|\s-\s/)[1]
    answer.save
    answer
  end

  def self.destroy_all
    self.all.clear
  end
end

