//
//  ViewController.swift
//  MapkitWork
//
//  Created by 표건욱 on 2020/07/16.
//  Copyright © 2020 SloWax. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    
    let addressText = UITextField()
    
    let mapView = MKMapView()
    var destination: [CLLocationCoordinate2D] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        addressText.layer.borderWidth = 0.5
        addressText.layer.cornerRadius = 5
        addressText.delegate = self
        view.addSubview(addressText)
        
        addressText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addressText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addressText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addressText.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        mapView.delegate = self
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: addressText.bottomAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    func addQuadrangle(center: CLLocationCoordinate2D) {
        var point1 = center; point1.longitude -= 0.002;  point1.latitude += 0.002
        var point2 = center; point2.longitude += 0.002;  point2.latitude += 0.002
        var point3 = center; point3.longitude += 0.002;  point3.latitude -= 0.002
        var point4 = center; point4.longitude -= 0.002;  point4.latitude -= 0.002
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        
        mapView.addOverlay(polyline)
    }
    func addLine(){
        guard destination.count > 1 else { return }
        let points: [CLLocationCoordinate2D] = destination
        let polyline = MKPolyline(coordinates: points, count: points.count)
        
        mapView.addOverlay(polyline)
    }
    func setRegion(coordinate: CLLocationCoordinate2D) {
      let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
      let region = MKCoordinateRegion(center: coordinate, span: span)
      mapView.setRegion(region, animated: true)
    }
    func geocodeAddressString(_ addressString: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placeMark, error) in
            if error != nil { return print(error!.localizedDescription) }
            
            guard let place = placeMark?.first else { return }
            
            let pinPoint = MKPointAnnotation()
            guard let annotation = place.location?.coordinate else { return }
            pinPoint.title = "\(self.mapView.annotations.count + 1)번째 행선지"
            pinPoint.subtitle = "\(addressString)"
            pinPoint.coordinate = CLLocationCoordinate2D(latitude: annotation.latitude,
                                                         longitude: annotation.longitude
            )
            self.mapView.addAnnotation(pinPoint)
            self.setRegion(coordinate: pinPoint.coordinate)
            self.addQuadrangle(center: pinPoint.coordinate)
            self.destination.append(pinPoint.coordinate)
            self.addLine()
        }
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        geocodeAddressString(textField.text ?? "")
        return true
    }
}
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.lineWidth = 2
            renderer.strokeColor = .red
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
