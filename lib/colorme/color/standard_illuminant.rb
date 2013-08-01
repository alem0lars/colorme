module Colorme
  module Color

    # The class exposes StandardIlluminant.allowed_stds which are the name
    # for the available standard names that can be used to create a
    # new StandardIlluminant.
    #
    # A StandardIlluminant exposes the x,y,z coordinates, scaled to get y=1
    class StandardIlluminant

      attr_accessor :std_name, :scaled_x, :scaled_y, :scaled_z

      # { Known standard-illuminants KB

      class << self
        def allowed_stds
          @allowed_stds.collect { |k,v| k }
        end
      end

      # Convenient hash that stores the x,y values for each available
      # illuminant-standard. This should not be used directly, instead instances
      # should use their method allowed_stds
      @allowed_stds = {
        std_A: [1.09847, 0.35582],
        std_B: [0.99093, 0.85313],
        std_C: [0.98071, 1.18225],
        std_D50: [0.96421, 0.82519],
        std_D55: [0.95680, 0.92148],
        std_D65: [0.95043, 1.08890],
        std_D75: [0.94972, 1.22639],
        std_E: [1.00000, 1.00000],
        std_F1: [0.92834, 1.03665],
        std_F2: [0.99145, 0.67316],
        std_F3: [1.03753, 0.49861],
        std_F4: [1.09147, 0.38813],
        std_F5: [0.90872, 0.98723],
        std_F6: [0.97309, 0.60191],
        std_F7: [0.95017, 1.08630],
        std_F8: [0.96413, 0.82333],
        std_F9: [1.00365, 0.67868],
        std_F10: [0.96174, 0.81712],
        std_F11: [1.00899, 0.64262],
        std_F12: [1.08046, 0.39228],
        sup_A: [1.11142, 0.35200],
        sup_B: [0.99178, 0.84349],
        sup_C: [0.97286, 1.16145],
        sup_D50: [0.96721, 0.81428],
        sup_D55: [0.95797, 0.90925],
        sup_D65: [0.94810, 1.07305],
        sup_D75: [0.94417, 1.20643],
        sup_E: [1.00000, 1.00000],
        sup_F1: [0.94791, 1.03191],
        sup_F2: [1.03245, 0.68990],
        sup_F3: [1.08968, 0.51965],
        sup_F4: [1.14961, 0.40963],
        sup_F5: [0.93369, 0.98636],
        sup_F6: [1.02148, 0.62074],
        sup_F7: [0.95780, 1.07618],
        sup_F8: [0.97115, 0.81135],
        sup_F9: [1.02116, 0.67826],
        sup_F10: [0.99001, 0.83134],
        sup_F11: [1.03820, 0.65555],
        sup_F12: [1.11428, 0.40353]
      }

      # }

      def initialize(name)
        raise InvalidArgument, "invalid name" unless name_valid?(name)
        xyz = allowed_stds[name]
        @std_name = name
        @scaled_x, @scaled_y, @scaled_z = xyz[:x], xyz[:y], xyz[:z]
      end

      protected

        # @return the allowed standards.
        #   Each allowed standard is in the following hash form:
        #     { x: <value>, y: <value>, z: <value> }
        def allowed_stds
          h = {}
          self.class.instance_variable_get(:@allowed_stds).each do |k,v|
            h[k] = {
              x: self.class.instance_variable_get(:@allowed_stds)[k][0],
              y: 1.0,
              z: self.class.instance_variable_get(:@allowed_stds)[k][1]
            }
          end
          return h
        end

        # @return
        #   true if provided the name is an allowed standard, otherwise false
        def name_valid?(name)
          allowed_stds.has_key?(name)
        end

    end

  end
end
