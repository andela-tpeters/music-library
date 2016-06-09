module Concerns
  module ClassMethods
    def all
      self.class_variable_get(:@@all)
    end

    def destroy_all
      all.clear
    end

    def create(name)
      song = new(name)
      song.save
    end
  end
end
