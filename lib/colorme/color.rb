module Colorme
  module Color

    class Color

      include Enumerable

      def to_s
        raise NotImplementedError
      end

      def to_a
        raise NotImplementedError
      end

      def ==(other)
        raise NotImplementedError
      end

      def ===(other)
        raise NotImplementedError
      end

    end

  end
end

require "colorme/color/standard_illuminant"
require "colorme/color/rgb"
