module Colorme
  module Color
    module StandardIlluminants

      # The standard illuminant values
      #
      # The chromaticity coordinates are given for the 2 degree field of view
      @@values = {

        std_A: XYZ.new(1.09847, 1.00000, 0.35582),
        std_B: XYZ.new(0.99093, 1.00000, 0.85313),
        std_C: XYZ.new(0.98071, 1.00000, 1.18225),
        std_D50: XYZ.new(0.96421, 1.00000, 0.82519),
        std_D55: XYZ.new(0.95680, 1.00000, 0.92148),
        std_D65: XYZ.new(0.95043, 1.00000, 1.08890),
        std_D75: XYZ.new(0.94972, 1.00000, 1.22639),
        std_E: XYZ.new(1.00000, 1.00000, 1.00000),
        std_F1: XYZ.new(0.92834, 1.00000, 1.03665),
        std_F2: XYZ.new(0.99145, 1.00000, 0.67316),
        std_F3: XYZ.new(1.03753, 1.00000, 0.49861),
        std_F4: XYZ.new(1.09147, 1.00000, 0.38813),
        std_F5: XYZ.new(0.90872, 1.00000, 0.98723),
        std_F6: XYZ.new(0.97309, 1.00000, 0.60191),
        std_F7: XYZ.new(0.95017, 1.00000, 1.08630),
        std_F8: XYZ.new(0.96413, 1.00000, 0.82333),
        std_F9: XYZ.new(1.00365, 1.00000, 0.67868),
        std_F10: XYZ.new(0.96174, 1.00000, 0.81712),
        std_F11: XYZ.new(1.00899, 1.00000, 0.64262),
        std_F12: XYZ.new(1.08046, 1.00000, 0.39228),
        sup_A: XYZ.new(1.11142, 1.00000, 0.35200),
        sup_B: XYZ.new(0.99178, 1.00000, 0.84349),
        sup_C: XYZ.new(0.97286, 1.00000, 1.16145),
        sup_D50: XYZ.new(0.96721, 1.00000, 0.81428),
        sup_D55: XYZ.new(0.95797, 1.00000, 0.90925),
        sup_D65: XYZ.new(0.94810, 1.00000, 1.07305),
        sup_D75: XYZ.new(0.94417, 1.00000, 1.20643),
        sup_E: XYZ.new(1.00000, 1.00000, 1.00000),
        sup_F1: XYZ.new(0.94791, 1.00000, 1.03191),
        sup_F2: XYZ.new(1.03245, 1.00000, 0.68990),
        sup_F3: XYZ.new(1.08968, 1.00000, 0.51965),
        sup_F4: XYZ.new(1.14961, 1.00000, 0.40963),
        sup_F5: XYZ.new(0.93369, 1.00000, 0.98636),
        sup_F6: XYZ.new(1.02148, 1.00000, 0.62074),
        sup_F7: XYZ.new(0.95780, 1.00000, 1.07618),
        sup_F8: XYZ.new(0.97115, 1.00000, 0.81135),
        sup_F9: XYZ.new(1.02116, 1.00000, 0.67826),
        sup_F10: XYZ.new(0.99001, 1.00000, 0.83134),
        sup_F11: XYZ.new(1.03820, 1.00000, 0.65555),
        sup_F12: XYZ.new(1.11428, 1.00000, 0.40353)
      }

      def self.method_missing(meth, *args, &block)
        @@values[meth.is_a?(Symbol) ? meth : meth.to_sym]
      end

    end
  end
end
