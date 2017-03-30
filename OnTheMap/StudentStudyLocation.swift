//
//  StudentStudyLocation.swift
//  OnTheMap
//
//  Created by Matthias Ko on 3/28/17.
//  Copyright © 2017 Matthias Ko. All rights reserved.
//

import Foundation

import MapKit

class StudentStudyLocation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let studentLink: String
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D, studentLink: String) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        self.studentLink = studentLink
        
        super.init()
    }
    
    var subtitle: String? {
        return studentLink
    }
}
