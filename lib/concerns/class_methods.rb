module Concerns
  module ClassMethods
    def all
      self.class_variable_get(:@@all)
    end

    def destroy_all
      self.class_variable_get(:@@all).clear
    end

    def create(name)
      object = self.new(name)
      object.save
      object
    end
      

      
  end
end