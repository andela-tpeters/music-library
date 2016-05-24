module Concerns
  module InstanceMethods

  	def save
	    unless self.class.all.include?(self)
	    	self.class.all << self 
	    end
	  end

    ['songs','genres','artists'].each do |method|
      define_method(method) do

        self.class.class_variable_get("@@#{method}")[self.name]
        
      end

      method_name = method[0..-2]

      define_method("add_#{method_name}") do |object|
        self.send(method) << object unless self.send(method).include?(object)
        self.send(method)
      end
    end

  end
end