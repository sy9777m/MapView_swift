//
//  ViewController.swift
//  MapView
//
//  Created by Siyun Min on 2020/07/08.
//  Copyright © 2020 Siyun Min. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    func goLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta span :Double) {
        let pLocation = CLLocationCoordinate2DMake(latitude, longitude)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapView.setRegion(pRegion, animated: true)
    }

    @IBAction func changeLocation(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            _ = goLocation(latitude: 1.1, longitude: 1.1, delta: 1.1)
            break
        case 2:
            _ = goLocation(latitude: 2.2, longitude: 2.2, delta: 2.2)
            break
        case 3:
            _ = goLocation(latitude: 3.3, longitude: 3.3, delta: 3.3)
            break
        default:
            locationManager.startUpdatingLocation()
            break
        }
    }
    
}

