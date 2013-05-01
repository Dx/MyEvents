class Skin
  def self.greyGradient
    colorOne = UIColor.colorWithRed((33/255.0),  green:(33/255.0),  blue:(33/255.0),  alpha:1.0)
    colorTwo = UIColor.colorWithRed((80/255.0), green:(80/255.0), blue:(80/255.0), alpha:1.0)
    colorThree = UIColor.colorWithRed((33/255.0),  green:(33/255.0),  blue:(33/255.0),  alpha:1.0)

    colors =  [colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor]

    stopOne = 0.0
    stopTwo = 0.3
    stopThree = 1.0

    locations = [stopOne, stopTwo, stopThree]
    headerLayer = CAGradientLayer.layer
    headerLayer.colors = colors
    headerLayer.locations = locations

    headerLayer
  end

  def self.roundButton
    uiRoundButton = UIButton.buttonWithType(UIButtonTypeCustom)
    uiRoundButton.clipsToBounds = true
    uiRoundButton.layer.cornerRadius = 25
    uiRoundButton.layer.borderColor = UIColor.grayColor.CGColor
    uiRoundButton.layer.borderWidth = 1.0

    uiRoundButton
  end

  def self.userButton
    uiRoundButton = UIButton.buttonWithType(UIButtonTypeCustom)
    uiRoundButton.clipsToBounds = true
    uiRoundButton.layer.cornerRadius = 40
    uiRoundButton.layer.borderColor = UIColor.blackColor.CGColor
    uiRoundButton.layer.borderWidth = 2.0

    uiRoundButton
  end
end