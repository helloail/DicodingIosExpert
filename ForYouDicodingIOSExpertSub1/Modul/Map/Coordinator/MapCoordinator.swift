//
//  MapCoordinator.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 07/11/20.
//
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView
    let latitude: Double
    let longtitude: Double
    let title: String
    init(_ control: MapView, latitude: Double, longtitude: Double, title: String) {
        self.control = control
        self.latitude = latitude
        self.longtitude = longtitude
        self.title = title
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        let longitude = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
                    let region = MKCoordinateRegion(center: longitude, latitudinalMeters: 100000, longitudinalMeters: 100000)
                    
                    let london = MKPointAnnotation()
                    london.title = title
                    london.coordinate = longitude
                    mapView.mapType = .satellite
                    mapView.addAnnotation(london)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}
