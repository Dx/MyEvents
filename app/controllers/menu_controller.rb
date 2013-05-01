class MenuController < UIViewController

  def viewDidLoad
    initializeUI
  end

  def initializeUI
    bgLayer = Skin.greyGradient
    bgLayer.frame = self.view.bounds;
    self.view.layer.insertSublayer(bgLayer, atIndex:0);

    lineView = UIView.alloc.initWithFrame(CGRectMake(50, 10, 1, 300))
    lineView.backgroundColor = UIColor.whiteColor
    self.view.addSubview(lineView)

    @userButton = Skin.userButton
    @userButton.setTitle("Usuario", forState: UIControlStateNormal);
    @userButton.frame = [[10, 7],[80, 80]]
    @userButton.setImage(UIImage.imageNamed("profileImage.png"), forState:UIControlStateNormal)
    #@userButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@userButton)

    @user_label = Skin.labelRoundButton(@user_name)
    @user_label.frame = [[100, 30], [135, 30]]
    self.view.addSubview(@user_label)

    @misEventosButton = Skin.roundButton
    #@misEventosButton.setTitle("Mis eventos", forState: UIControlStateNormal);
    @misEventosButton.frame = [[30, 100],[40, 40]]
    @misEventosButton.setImage(UIImage.imageNamed("button.png"), forState:UIControlStateNormal)
    @misEventosButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@misEventosButton)
    #------ Label --------#
    @misEventoslabel = Skin.labelRoundButton("Mis eventos")
    @misEventoslabel.frame = [[80, 105], [200, 30]]
    tap = UITapGestureRecognizer.alloc.initWithTarget(self, action:'clickMisEventosLabel:')
    @misEventoslabel.setUserInteractionEnabled(true)
    @misEventoslabel.addGestureRecognizer(tap)
    self.view.addSubview(@misEventoslabel)

    @recomendacionesButton = Skin.roundButton
    #@recomendacionesButton.setTitle("Recomendaciones", forState: UIControlStateNormal);
    @recomendacionesButton.frame = [[30, 160],[40, 40]]
    @recomendacionesButton.setImage(UIImage.imageNamed("button.png"), forState:UIControlStateNormal)
    #@recomendacionesButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@recomendacionesButton)
    #------ Label --------#
    @recomendacioneslabel = Skin.labelRoundButton("Recomendaciones")
    @recomendacioneslabel.frame = [[80, 165], [200, 30]]
    self.view.addSubview(@recomendacioneslabel)

    @buscarEventosButton = Skin.roundButton
    #@buscarEventosButton.setTitle("Buscar", forState: UIControlStateNormal);
    @buscarEventosButton.frame = [[30, 220],[40, 40]]
    @buscarEventosButton.setImage(UIImage.imageNamed("button.png"), forState:UIControlStateNormal)
    #@buscarEventosButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@buscarEventosButton)
    #------ Label --------#
    @buscarEventoslabel = Skin.labelRoundButton("Buscar")
    @buscarEventoslabel.frame = [[80, 225], [200, 30]]
    self.view.addSubview(@buscarEventoslabel)

    @configuracionButton = Skin.roundButton
    #@configuracionButton.setTitle("Configuración", forState: UIControlStateNormal);
    @configuracionButton.frame = [[30, 280],[40, 40]]
    @configuracionButton.setImage(UIImage.imageNamed("button.png"), forState:UIControlStateNormal)
    #@configuracionButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@configuracionButton)
    #------ Label --------#
    @configuracionlabel = Skin.labelRoundButton("Configuración")
    @configuracionlabel.frame = [[80, 285], [200, 30]]
    self.view.addSubview(@configuracionlabel)
  end

  def setUserName(userName)
    @user_name = userName
  end

  def clickMisEventos
    events_controller = EventsTableViewController.alloc.init
    self.navigationController.pushViewController(events_controller, animated: true)   
  end

  def clickMisEventosLabel(recognizer)
    events_controller = EventsTableViewController.alloc.init
    self.navigationController.pushViewController(events_controller, animated: true)
  end
end
