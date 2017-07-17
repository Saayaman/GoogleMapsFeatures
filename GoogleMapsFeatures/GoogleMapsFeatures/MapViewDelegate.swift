

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewDelegate: NSObject, GMSMapViewDelegate{
    
    var vc:ViewController = ViewController()

    
    init(_ vc:ViewController) {
        super.init()
        
        self.vc = vc
        
        let polyLine: GMSPolyline = GMSPolyline()
        polyLine.isTappable = true
        vc.mapView.delegate = self

        vc.mapView.isUserInteractionEnabled = true
        vc.mapView.settings.setAllGesturesEnabled(true)
        vc.mapView.settings.consumesGesturesInView = true
    }


    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("Tapped marker")
        vc.buttonTapped()
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        vc.coordinateTapped()
        print("Tapped at Coordinate")

    }
    
    func mapView(_ mapView:GMSMapView, didTapPOIWithPlaceID placeID:String,
                 name:String, location:CLLocationCoordinate2D) {
        print("You tapped \(name): \(placeID), \(location.latitude)/\(location.longitude)")
        
        
        let infoMarker = GMSMarker(position: location)
        infoMarker.snippet = placeID
        infoMarker.title = name
        infoMarker.opacity = 0;
        infoMarker.appearAnimation = .pop
        infoMarker.infoWindowAnchor.y = 1
        infoMarker.userData = placeID
        infoMarker.map = mapView
        mapView.selectedMarker = infoMarker
    }

    
    
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D, marker: GMSMarker) {
        
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                // 3
                let title = address.lines as [String]?
                marker.title = title?.first
                
                UIView.animate(withDuration: 0.25) {
                }
            }
        }
    }
    
}
