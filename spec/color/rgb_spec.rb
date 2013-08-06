require "spec_helper"


describe "rgb color" do

  it "should hold the correct red,green,blue values" do
    [
      [0.1, 0.2, 0.3], [0, 0, 0], [1, 1, 1],
      [1, 0.2, 0.3], [0, 0.2, 0.3],
      [0.1, 1, 0.3], [0.1, 0, 0.3],
      [0.1, 0.2, 1], [0.1, 0.2, 0]
    ].each do |(r, g, b)|
      rgb_color = Colorme::Color::RGB.new(r, g, b)
      rgb_color.red.should == r
      rgb_color.green.should == g
      rgb_color.blue.should == b
    end
  end

  it "should fail for wrong red,green,blue values" do
    [
      [-1, 0.2, 0.3], [1.1, 0.2, 0.3],
      [0.1, -1, 0.3], [0.1, 1.1, 0.3],
      [0.1, 0.2, -1], [0.1, 0.2, 1.1]
    ].each do |(r, g, b)|
      expect { Colorme::Color::RGB.new(r, g, b) }.to raise_error
    end
  end

  it "should hold correct the alpha value" do
    [
      [ Colorme::Color::RGB.new(0.1, 0.2, 0.3), 1.0 ],
      [ Colorme::Color::RGB.new(0.1, 0.2, 0.3, alpha: 0.234), 0.234 ],
      [ Colorme::Color::RGB.new(0.1, 0.2, 0.3, alpha: 0.0), 0 ],
      [ Colorme::Color::RGB.new(0.1, 0.2, 0.3, alpha: 0), 0 ]
    ].each { |(color, alpha)| color.alpha.should == alpha }
  end

  it "should fail for wrong alpha values" do
    expect { Colorme::Color::RGB.new(0.1, 0.2, 0.3, alpha: 1.01) }.to raise_error
    expect { Colorme::Color::RGB.new(0.1, 0.2, 0.3, alpha: -0.1) }.to raise_error
  end

  it "should have a well-known string representation (to_s)" do
    Colorme::Color::RGB.new(0.1, 0.2, 0.3).to_s.should == "{ red:0.1 green:0.2 blue:0.3 alpha:1.0 }"
    Colorme::Color::RGB.new(0.1, 0.2, 0.3, alpha: 0.2).to_s.should == "{ red:0.1 green:0.2 blue:0.3 alpha:0.2 }"
    Colorme::Color::RGB.new(0.1, 0.2, 0.3, alpha: 1).to_s.should == "{ red:0.1 green:0.2 blue:0.3 alpha:1 }"
  end

  it "should have a well-known array representation (to_a)" do
    Colorme::Color::RGB.new(0.1, 0.2, 0.3).to_a.should == [0.1, 0.2, 0.3, 1.0 ]
    Colorme::Color::RGB.new(0.1, 0.2, 0.3, alpha: 0.2).to_a.should == [0.1, 0.2, 0.3, 0.2 ]
    Colorme::Color::RGB.new(0.1, 0.2, 0.3, alpha: 1).to_a.should == [0.1, 0.2, 0.3, 1 ]
  end

  it "should be equal to another rgb color with the same components+alpha" do
    color_0, color_1 = [ [0.1, 0.2, 0.3], [0.1, 0.2, 0.3] ].collect do |(r,g,b)|
      Colorme::Color::RGB.new(r, g, b)
    end

    color_0.should == color_0
    color_0.should == color_1
    color_0.should === color_0
    color_0.should === color_1
  end

  it "should be different to another rgb color with different components+alpha" do
    color_0, color_1, color_2, color_3 = [
      [0.1, 0.2, 0.3], [0.1, 0.2, 0.2], [0.1, 0.1, 0.3], [0.2, 0.2, 0.3]
    ].collect { |(r,g,b)| Colorme::Color::RGB.new(r, g, b) }

    color_0.should_not == color_1
    color_0.should_not == color_2
    color_0.should_not == color_3
  end

  it "should be enumerable, by yielding for each color component" do
    color = Colorme::Color::RGB.new(0.1, 0.2, 0.3)
    expected = [ [:red, 0.1], [:green, 0.2], [:blue, 0.3] ]

    color.collect { |(k,v)| [k,v] }.should == expected
    color.each.collect { |(k,v)| [k,v] }.should == expected
  end

  it "should have extended enumerable operations" do
    color = Colorme::Color::RGB.new(0.1, 0.2, 0.3, alpha: 0.2)
    expected = [ [:red, [0.2, 0.1]], [:green, [0.2, 0.2]], [:blue, [0.2, 0.3]] ]

    color.each_with_alpha.collect { |(k,v)| [k,v] }.should == expected
  end

end
