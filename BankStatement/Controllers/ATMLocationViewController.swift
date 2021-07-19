//
//  ATMLocationViewController.swift
//  BankStatement
//
//  Created by Manab Kumar Mal on 26/06/21.
//

import UIKit
import MapKit
class ATMLocationViewController: UIViewController, MKMapViewDelegate {
    let mapView = MKMapView()
    var atmDetails: ATM?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title  = "ATM Location"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.center = view.center
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        let margins = self.view.safeAreaLayoutGuide
        mapView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        mapView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        
        if let atmLocation = atmDetails?.location
        {
            let initialLocation = CLLocation(latitude: atmLocation.lat, longitude: atmLocation.lng)
            self.centerMapOnLocation(location: initialLocation)
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        DispatchQueue.main.async { [self] in
            self.mapView.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = self.atmDetails?.name
            annotation.subtitle = self.atmDetails?.address
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "CBAFindUsAnnotationIconATM")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
    
    /*@objc(mapView:didAddAnnotationViews:) func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
     let sourceView = views.first
     sourceView?.image = UIImage(named: "CBAFindUsAnnotationIconATM")
     }*/
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
