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
    
    //outlets
    
    @IBOutlet weak var latitude: UILabel!
    
    @IBOutlet weak var longitude: UILabel!
    
    @IBOutlet weak var heading: UILabel!
    
    @IBOutlet weak var speed: UILabel!
    
    @IBOutlet weak var altitude: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    
    
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
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    { //locations is an array
        
        var userLocation:CLLocation = locations[0] as CLLocation //display first location
        
        //get latitude and use string interpolation to pass to text label
        
        latitude.text = "\(userLocation.coordinate.latitude)"
        
        longitude.text = "\(userLocation.coordinate.longitude)"
        
        heading.text = "\(userLocation.course)" //course property gives you direction
        
        speed.text = "\(userLocation.speed)"
        
        altitude.text = "\(userLocation.altitude)"
        
        
        //get address with geolocation
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler:{( placemarks, error) in
            
            if error != nil{ println(error)}
            else{
               
                //create variable to access placemark
                let p = CLPlacemark(placemark: placemarks?[0] as CLPlacemark)
                
                var subThoroughfare:String
                
                if ((p.subThoroughfare) != nil){ //if it exist
                    
                    subThoroughfare = p.subThoroughfare
                    
                }else{
                   subThoroughfare = "" //if not make it empty string
                }
                
                
                self.address.text = "\(subThoroughfare)  \(p.thoroughfare) \n  \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \(p.country)"
                
                
            }
            
            
        })
        
    }
            

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

