require "colorme/color/standard_illuminant"


module Colorme
  module Color

    class Rgb < Color
      attr_accessor :red, :green, :blue

      # Create a new RGB color
      #
      # @param [Fixnum] red The red value (between 0 and 255)
      # @param [Fixnum] green The green value (between 0 and 255)
      # @param [Fixnum] blue The blue value (between 0 and 255)
      # @param [Hash] opts Additional options
      # @option opts [Float] :alpha The color transparency (between 0 and 1)
      # @option opts [] :white_ref
      #   The reference for the white color (default is 2° D65)
      #   The value of :white_ref is what the color white means for the current
      #   color
      #   @see http://en.wikipedia.org/wiki/White_point WhitePoint at Wikipedia
      def initialize(red, green, blue, opts = {})

        # ==> Defaults

        opts.merge {
          alpha: 1.0
          white_ref: StandardIlluminant.new(:std_D65)
        }

        # ==> Validation

        {red: red, green: green, blue: blue}.each do |name, value|
          unless value.is_a?(Fixnum) && (value >= 0) && (value <= 255)
            raise InvalidArgument, "#{name} not in [0,255]"
          end
        end

        unless (opts[:alpha].is_a?(Float)) &&
               (opts[:alpha] >= 0.0) && (opts[:alpha] <= 1.0)
          raise InvalidArgument, "alpha isn't a floating number between 0 and 1"
        end

        unless opts[:white_ref].is_a?(StandardIlluminant)
          raise InvalidArgument, "white_ref isn't a valid standard illuminant"
        end

        # ==> Attributes inizialization

        @alpha = opts[:alpha]
        @red, @green, @blue = red, green, blue

      end

      # @return A string representation for the RGB color
      def to_s
        "{ red:#{red} green:#{green} blue:#{blue} }"
      end

    end

  end
end
