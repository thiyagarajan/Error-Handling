# ConcernedWith
module ConcernedWith
  module ActiveRecord
    def concerned_with(*concerns)
      concerns.each do |concern|
        require_dependency "#{name.underscore}/#{concern}"
      end
    end
  end
  
  module ActionController
    def concerned_with(*concerns)
      concerns.each do |concern|
        require_dependency "#{self.name.gsub(/Controller$/, '').downcase}/#{concern}"
      end
    end
  end
end
