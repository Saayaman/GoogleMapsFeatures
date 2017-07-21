
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
        
        let mapMaker = MapMaker()
        markers = mapMaker.makeMarker(mapView)
        
        manager = MapCLLocationManager(mapView, markers)
        delegate = MapViewDelegate(self)
        
        self.loadTemplate()
        
        mapView.isHidden = true
        

//
//        delay(seconds: 2) { () -> () in
//            let path = GMSMutablePath()
//            path.add(self.markers[0].position)
//            path.add(self.markers[1].position)
//            
//            let rectangle = GMSPolyline(path: path)
//            rectangle.map = self.mapView
//            
//            let bounds = GMSCoordinateBounds(path: path)
//            
//            self.mapView.animate(with: GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(50.0 , 50.0 ,50.0 ,50.0)))
//        }
        
        placesClient = GMSPlacesClient.shared()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myView.center.y  += view.bounds.height
    }
  
    
    func delay(seconds: Double, completion:@escaping ()->()) {
//        let popTime = DispatchTime.init(uptimeNanoseconds: UInt64(Int64(seconds)))
        let popTime = DispatchTime.now()
        
        DispatchQueue.main.asyncAfter(deadline: popTime){
            print("one!")
        }
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


