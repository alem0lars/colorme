require "spec_helper"


describe "standard illuminant" do

  it "should raise exceptions for invalid names" do
    expect { Colorme::Color::StandardIlluminant.new(:foo) }.to raise_error
  end

  it "should have the Y value at 1" do
    Colorme::Color::StandardIlluminant.allowed_stds.each do |std|
      Colorme::Color::StandardIlluminant.new(std).scaled_y.should be(1.0)
    end
  end

  it "should have x,y,z as numbers" do
    Colorme::Color::StandardIlluminant.allowed_stds.each do |std|
      Colorme::Color::StandardIlluminant.new(std).scaled_x.should be_a(Numeric)
      Colorme::Color::StandardIlluminant.new(std).scaled_y.should be_a(Numeric)
      Colorme::Color::StandardIlluminant.new(std).scaled_z.should be_a(Numeric)
    end
  end

end
