class Importmap::Framework
  module RailsFramework
    def framework_class
      Rails
    end

    def boot
      require "./config/environment"
    end
  end
end
