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
let regionIdentifier = "voyage.dom.iBeacon-Testing.region"

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager = CLLocationManager()
        locationManager.delegate = self
        
        let region = CLBeaconRegion(proximityUUID: UUID(uuidString: beaconUUID)!, identifier: regionIdentifier)
        
        region.notifyOnEntry = true
        region.notifyOnExit = true
        region.notifyEntryStateOnDisplay = true
        
        self.locationManager.startMonitoring(for: region)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region.isKind(of: CLBeaconRegion.self) {
            let beaconRegion = region as! CLBeaconRegion
            if beaconRegion.identifier == regionIdentifier {
                locationManager.startRangingBeacons(in: beaconRegion)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region.isKind(of: CLBeaconRegion.self) {
            let beaconRegion = region as! CLBeaconRegion
            if beaconRegion.identifier == regionIdentifier {
                locationManager.stopRangingBeacons(in: beaconRegion)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        for beacon in beacons {
            print("Ranging beacon: \(beacon.proximityUUID)")
            print("  major: \(beacon.major)  |  minor: \(beacon.minor)")
            print("  range: \(stringForProximity(beacon.proximity))")
            
            setColorForProximity(beacon.proximity)
        }
    }
    
    func stringForProximity(_ prox: CLProximity) -> String {
        switch prox {
        case CLProximity.unknown:
            return "~ Proximity Unknown"
        case CLProximity.far:
            return "~ Proximity Far"
        case CLProximity.near:
            return "~ Proximity Near"
        case CLProximity.immediate:
            return "~ Proximity Immediate"
        }
    }
    
    func setColorForProximity(_ prox: CLProximity) {
        switch prox {
        case CLProximity.unknown:
            self.view.backgroundColor = .white
        case CLProximity.far:
            self.view.backgroundColor = .red
        case CLProximity.near:
            self.view.backgroundColor = .yellow
        case CLProximity.immediate:
            self.view.backgroundColor = .green
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        <#code#>
    }


}

