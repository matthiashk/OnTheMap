//
//  FirstViewController.swift
//  OnTheMap
//
//  Created by Matthias Ko on 3/27/17.
//  Copyright © 2017 Matthias Ko. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, MKMapViewDelegate { // Map view
    
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self

        // add mock data for student locations here
        
        let studentStudyLocation = StudentStudyLocation(title: "John Doe",
                                                        locationName: "Library",
                                                        coordinate: CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298),
                                                        studentLink: "http://www.apple.com")
        
        mapView.addAnnotation(studentStudyLocation)
        
        //mapView.addAnnotations([studentStudyLocation])
        
        
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        if let annotation = annotation as? StudentStudyLocation {
            let identifier = "pin"
            var view: MKPinAnnotationView
            
            
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
                
                
            } else {
                
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type:.detailDisclosure) as UIView
                
            }
            return view
        }
        return nil
    }
    
    // detect click on annotation text area
    // parts of code from http://stackoverflow.com/questions/3395772/detect-tap-on-calloutbubble-in-mkannotationview
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.calloutTapped(sender:)))
        view.addGestureRecognizer(gesture)
    }

    // open annotation url in safari
    func calloutTapped(sender:UITapGestureRecognizer) {
        guard let annotation = (sender.view as? MKAnnotationView)?.annotation as? StudentStudyLocation else { return }
        
        UIApplication.shared.open(URL(string: annotation.studentLink)!, options: [:], completionHandler: nil)
    }

}

