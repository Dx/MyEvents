class MenuController < UIViewController

  def viewDidLoad()
    initializeUI()
  end

  def initializeUI()
    self.view.backgroundColor = UIColor.lightGrayColor

    @misEventosButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @misEventosButton.setTitle("Mis eventos", forState: UIControlStateNormal);
    @misEventosButton.frame = [[80, 30],[160, 50]]
    @misEventosButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@misEventosButton)

    @recomendacionesButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @recomendacionesButton.setTitle("Recomendaciones", forState: UIControlStateNormal);
    @recomendacionesButton.frame = [[80, 90],[160, 50]]
    @recomendacionesButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@recomendacionesButton)

    @buscarEventosButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @buscarEventosButton.setTitle("Buscar", forState: UIControlStateNormal);
    @buscarEventosButton.frame = [[80, 150],[160, 50]]
    @buscarEventosButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@buscarEventosButton)

    @configuracionButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @configuracionButton.setTitle("Configuración", forState: UIControlStateNormal);
    @configuracionButton.frame = [[80, 210],[160, 50]]
    @configuracionButton.addTarget(self, action: :clickMisEventos, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@configuracionButton)
  end

  def clickMisEventos
    events_controller = EventsTableViewController.alloc.init
    self.navigationController.pushViewController(events_controller, animated: true)   
  end
end