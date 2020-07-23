//
//  ViewController.swift
//  WeatherCool
//
//  Created by ankuradhikari on 22/07/20.
//  Copyright © 2020 Color. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setMapview()
        // Do any additional setup after loading the view.
    }

    func setMapview(){
      let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureReconizer:)))
        tapGesture.minimumPressDuration = 0.5
      self.mapView.addGestureRecognizer(tapGesture)
    }

    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
     
        if gestureReconizer.state == UILongPressGestureRecognizer.State.ended {
            let touchLocation = gestureReconizer.location(in: mapView)
            let locationCoordinate = mapView.convert(touchLocation,toCoordinateFrom: mapView)
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
            vc?.latitiude = locationCoordinate.latitude
            vc?.longitude = locationCoordinate.longitude
            
            self.navigationController?.pushViewController(vc!, animated: true)
            
      }
    }

}

