require "colorme/color/standard_illuminant"


module Colorme
  module Color

    class RGB < Color

      attr_accessor :red, :green, :blue, :alpha, :white_ref

      # Create a new RGB color
      #
      # @param [Fixnum] red The red value (between 0 and 1)
      # @param [Fixnum] green The green value (between 0 and 1)
      # @param [Fixnum] blue The blue value (between 0 and 1)
      # @param [Hash] opts Additional options
      # @option opts [Float] :alpha The color transparency (between 0 and 1)
      # @option opts [] :white_ref
      #   The reference for the white color (default is 2° D65)
      #   The value of :white_ref is what the color white means for the current
      #   color
      #   @see http://en.wikipedia.org/wiki/White_point WhitePoint at Wikipedia
      def initialize(red, green, blue, opts = {})

        # ==> Defaults

        opts = {
          alpha: 1.0,
          white_ref: StandardIlluminant.new(:std_D65)
        }.merge(opts)

        # ==> Validation

        {red: red, green: green, blue: blue}.each do |name, value|
          unless value.is_a?(Numeric) && (value >= 0) && (value <= 1)
            raise ArgumentError, "#{name} isn't a Numeric between 0 and 1"
          end
        end

        unless (opts[:alpha].is_a?(Numeric)) &&
               (opts[:alpha] >= 0.0) && (opts[:alpha] <= 1.0)
          raise ArgumentError, "alpha isn't a Numeric between 0 and 1"
        end

        unless opts[:white_ref].is_a?(StandardIlluminant)
          raise ArgumentError, "white_ref isn't a valid standard illuminant"
        end

        # ==> Attributes inizialization

        @red, @green, @blue = red, green, blue
        @alpha, @white_ref = opts[:alpha], opts[:white_ref]

      end

      # @return A String representation for the RGB color components
      # @example A String representation for the RGB color 10,20,30:
      #   RGB.new(10,20,30).to_s # => { red:10 green:20 blue:30 alpha:1.0 }
      def to_s
        "{ red:#{red} green:#{green} blue:#{blue} alpha:#{alpha} }"
      end

      # @return An Array representation for the RGB color
      # @example Get the r, g, b components for a color
      #   r, g, b = my_color.to_a # => [ 10, 20, 30, 1.0 ]
      def to_a
        [ red, green, blue, alpha ]
      end

      # A RGB is equal to another if it has the same components+alpha
      def ==(other)
        red == other.red && green == other.green && blue == other.blue &&
        alpha == other.alpha && white_ref == white_ref
      end

      # A RGB is equal to another if it has the same components+alpha
      def ===(other)
        self.==(other)
      end

      def each(&block)
        vals = { red: red, green: green, blue: blue }
        custom_each(vals, &block)
      end

      def each_with_alpha(&block)
        vals = { red: [alpha, red], green: [alpha, green], blue: [alpha, blue] }
        custom_each(vals, &block)
      end

      protected

        def custom_each(vals)
          block_given? ? vals.each { |e| yield(e) } : vals.to_enum
        end

    end

  end
end
