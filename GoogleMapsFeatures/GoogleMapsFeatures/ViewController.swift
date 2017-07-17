
import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var myView: UIView!
    
    var delegate: MapViewDelegate!
    var manager:MapCLLocationManager!

    var markers: [GMSMarker] = []
    var isVisible = false
    
    fileprivate var placesClient: GMSPlacesClient!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = MapCLLocationManager(mapView)
        delegate = MapViewDelegate(self)
        
        self.loadTemplate()
        
        mapView.isHidden = true
        
        let mapMaker = MapMaker()
        mapMaker.makeMarker(mapView)
        
        placesClient = GMSPlacesClient.shared()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myView.center.y  += view.bounds.height
    }
    

    
    func loadTemplate(){
        let view = SampleView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        myView.addSubview(view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonTapped() {
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [],
                       animations: {
                        
                        if self.isVisible{
                            self.myView.center.y += self.view.bounds.height
                            self.isVisible = false
                        } else{
                            self.myView.center.y -= self.view.bounds.height
                            self.isVisible = true
                        }
        },
                       completion: nil
        )
        
    }
    
    func coordinateTapped(){
        buttonTapped()
    }

}


