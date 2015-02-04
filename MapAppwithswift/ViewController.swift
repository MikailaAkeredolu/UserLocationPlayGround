//
//  ViewController.swift
//  MapAppwithswift
//
//  Created by Mikaila Akeredolu on 2/1/15.
//  Copyright (c) 2015 MakerOfAppsDotCom. All rights reserved.

//App to know your lat & long plus closest address

import UIKit
import CoreLocation

//add map delegate
class ViewController: UIViewController,CLLocationManagerDelegate {
    
    //create a variable of type cllocation manager
    var manager: CLLocationManager!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization() //ask user to share location
        manager.startUpdatingLocation()
        
        
        
    }
    
    //did update locations function
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation:CLLocation = locations[0] as CLLocation
        
        println(userLocation)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

