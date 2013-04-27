class WhereController < UIViewController
  def init
    super.tap do
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Location', image:UIImage.imageNamed('map'), tag:3)
      @poul_location = [45.47717,9.229802]
      @map_region = [@poul_location, [0.001,0.001]]
    end
  end

  def setPoint(event)
  	@event = event

  	self.tabBarItem = UITabBarItem.alloc.initWithTitle('Location', image:UIImage.imageNamed('map'), tag:3)
 	
  	@event_location = [@event.latitude, @event.longitude]
  	@map_region = [@event_location, [0.001,0.001]]
  end

  def loadView
    super
    self.view = MKMapView.alloc.init
    self.view.frame = self.navigationController.view.bounds
    self.view.delegate = self
    self.view.mapType = MKMapTypeHybrid
    
  end

  def viewDidLoad
    super
    self.view.setRegion(@map_region, animated:true)
    @event_annotation = MKPointAnnotation.alloc.init
    @event_annotation.coordinate = @event_location
    @event_annotation.title = @event.place
    @event_annotation.subtitle = @event.event_name
    self.view.addAnnotation(@event_annotation)
    
    
  end

  def mapView(map_view, didAddAnnotationViews:ann_views)
    self.view.selectAnnotation(@event_annotation, animated:true)
  end
  

  def mapView(map_view, viewForAnnotation:annotation)
    annotation_view = self.view.dequeueReusableAnnotationViewWithIdentifier('tux')
    unless(annotation_view)
      annotation_view = MKAnnotationView.alloc.initWithAnnotation(annotation, reuseIdentifier:'tux')
      annotation_view.image = UIImage.imageNamed('tux_icon')
      annotation_view.canShowCallout = true
    end

    annotation_view
  end
  

  
end