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
    
    
    let latitude = 35.705640
    let longitude = 139.751891
    
    func makeMarker(_ mapVIew: GMSMapView){
        
        let map = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        let marker = GMSMarker(position: map)
        
        marker.snippet = "Marker1"
        marker.icon = GMSMarker.markerImage(with: UIColor.red)
        marker.userData = "ChIJ97rF-TiMGGARnhUbWnxmOQo"
        marker.map = mapVIew
    }
    

}
