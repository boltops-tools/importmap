class Importmap::Framework
  module JetsFramework
    def framework_class
      Jets
    end

    def boot
      Jets.boot
    end
  end
end
