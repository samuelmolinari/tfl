module Tfl
  class Style
    attr_accessor :id,
                  :icon

    def initialize(id = nil, icon = nil)
      @id = id
      @icon = icon
    end

    def ==(other)
      other.respond_to?(:id) && @id == other.id
    end
  end
end
