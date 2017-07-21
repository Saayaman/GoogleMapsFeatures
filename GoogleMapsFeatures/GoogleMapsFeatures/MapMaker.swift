//
//  MapMaker.swift
//  CollectionView3
//
//  Created by ayako_sayama on 2017-07-09.
//  Copyright © 2017 ayako_sayama. All rights reserved.
//

import Foundation
import GoogleMaps

class MapMaker {
    
    //Tokyo Dome
    let latitude = 35.705640
    let longitude = 139.751891
    
    //Tokyo Station
    let latitude2 = 35.681382
    let longitude2 = 139.76608399999998
    
    var markers:[GMSMarker] = []
    
    func makeMarker(_ mapVIew: GMSMapView) -> [GMSMarker]{
        
        let map = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        let marker = GMSMarker(position: map)
        
        marker.snippet = "Marker1"
        marker.icon = GMSMarker.markerImage(with: UIColor.red)
        marker.userData = "ChIJ97rF-TiMGGARnhUbWnxmOQo"
        marker.map = mapVIew
        
        let map2 = CLLocationCoordinate2D.init(latitude: latitude2, longitude: longitude2)
        let marker2 = GMSMarker(position: map2)
        
        marker2.snippet = "Marker2"
        marker2.icon = GMSMarker.markerImage(with: UIColor.blue)
        marker2.userData = "ChIJC3Cf2PuLGGAROO00ukl8JwA"
        marker2.map = mapVIew
        
        markers.append(marker)
        markers.append(marker2)
        
        return markers
    }
    

}
