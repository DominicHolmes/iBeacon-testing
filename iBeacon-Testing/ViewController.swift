//
//  ViewController.swift
//  iBeacon-Testing
//
//  Created by dominic on 4/6/18.
//  Copyright © 2018 Dominic Holmes. All rights reserved.
//

import UIKit
import CoreLocation

let beaconUUID = "F5BF2C36-73CB-4EA1-9FC6-005DF308EC34"

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSLog("%@", NSUUID().uuidString)
        
        self.locationManager = CLLocationManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

