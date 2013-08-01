require "spec_helper"


describe "rgb color" do

  it "should hold the correct red,green,blue values" do
    [
      [10, 20, 30], [0, 0, 0], [255, 255, 255],
      [255, 20,30], [0, 20, 30],
      [10, 255, 30], [10, 0, 30],
      [10, 20, 255], [10, 20, 0]
    ].each do |(r, g, b)|
      rgb_color = Colorme::Color::RGB.new(r, g, b)
      rgb_color.red.should == r
      rgb_color.green.should == g
      rgb_color.blue.should == b
    end
  end

  it "should fail for wrong red,green,blue values" do
    [
      [-1, 20, 30], [256, 20,30],
      [10, -1, 30], [10, 256, 30],
      [10, 20, -1], [10, 20, 256]
    ].each do |(r, g, b)|
      expect { Colorme::Color::RGB.new(r, g, b) }.to raise_error
    end
  end

  it "should hold correct the alpha value" do
    [
      [ Colorme::Color::RGB.new(10, 20, 30), 1.0 ],
      [ Colorme::Color::RGB.new(10, 20, 30, alpha: 0.234), 0.234 ],
      [ Colorme::Color::RGB.new(10, 20, 30, alpha: 0.0), 0 ],
      [ Colorme::Color::RGB.new(10, 20, 30, alpha: 0), 0 ]
    ].each { |(color, alpha)| color.alpha.should == alpha }
  end

  it "should fail for wrong alpha values" do
    expect { Colorme::Color::RGB.new(10, 20, 30, alpha: 1.01) }.to raise_error
    expect { Colorme::Color::RGB.new(10, 20, 30, alpha: -0.1) }.to raise_error
  end

  it "should have a well-known string representation (to_s)" do
    Colorme::Color::RGB.new(10, 20, 30).to_s.should == "{ red:10 green:20 blue:30 }"
  end

end
