class MenuController < UIViewController

  def viewDidLoad
    initializeUI
  end

  def initializeUI
    bgLayer = Skin.greyGradient
    bgLayer.frame = self.view.bounds;
    self.view.layer.insertSublayer(bgLayer, atIndex:0);

    @userButton = Skin.userButton
    @userButton.setTitle("Usuario", forState: UIControlStateNormal);
    @userButton.frame = [[7, 7],[80, 80]]
    @userButton.setImage(UIImage.imageNamed("button.png"), forState:UIControlStateNormal)
    #@userButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@userButton)

    @user_label = UILabel.new
    @user_label.font = UIFont.systemFontOfSize(15)
    @user_label.text = @user_name
    @user_label.textAlignment = UITextAlignmentCenter 
    @user_label.textColor = UIColor.whiteColor
    @user_label.backgroundColor = UIColor.clearColor
    @user_label.frame = [[80, 5], [135, 30]]
    self.view.addSubview(@user_label)

    @misEventosButton = Skin.roundButton
    @misEventosButton.setTitle("Mis eventos", forState: UIControlStateNormal);
    @misEventosButton.frame = [[25, 90],[50, 50]]
    @misEventosButton.setImage(UIImage.imageNamed("button.png"), forState:UIControlStateNormal)
    @misEventosButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@misEventosButton)

    @recomendacionesButton = Skin.roundButton
    @recomendacionesButton.setTitle("Recomendaciones", forState: UIControlStateNormal);
    @recomendacionesButton.frame = [[25, 150],[50, 50]]
    @recomendacionesButton.setImage(UIImage.imageNamed("button.png"), forState:UIControlStateNormal)
    #@recomendacionesButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@recomendacionesButton)

    @buscarEventosButton = Skin.roundButton
    @buscarEventosButton.setTitle("Buscar", forState: UIControlStateNormal);
    @buscarEventosButton.frame = [[25, 210],[50, 50]]
    @buscarEventosButton.setImage(UIImage.imageNamed("button.png"), forState:UIControlStateNormal)
    #@buscarEventosButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@buscarEventosButton)

    @configuracionButton = Skin.roundButton
    @configuracionButton.setTitle("Configuración", forState: UIControlStateNormal);
    @configuracionButton.frame = [[25, 270],[50, 50]]
    @configuracionButton.setImage(UIImage.imageNamed("button.png"), forState:UIControlStateNormal)
    #@configuracionButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@configuracionButton)
  end

  def setUserName(userName)
    @user_name = userName
  end

  def clickMisEventos
    events_controller = EventsTableViewController.alloc.init
    self.navigationController.pushViewController(events_controller, animated: true)   
  end
end