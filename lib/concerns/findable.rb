module Concerns
  module Findable
    def find_by_name(name)
      found = all.select { |item| item.name == name }
      return found if found.size > 1
      return found[0] if found.size == 1
      return nil if found.empty?
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
  end
end
