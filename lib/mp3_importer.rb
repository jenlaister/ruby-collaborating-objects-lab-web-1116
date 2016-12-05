
require 'pry'
class MP3Importer

  attr_reader :path


  def initialize(path)
    @path = path
  end

  def files
    @files = []
    @files << Dir.glob("#{self.path}/*.mp3")
    @files.flatten.each { |file| file.gsub!("./spec/fixtures/mp3s/", "") }
  end


  def import
    files.each { |file| Song.new_by_filename(file) }
  end


end
