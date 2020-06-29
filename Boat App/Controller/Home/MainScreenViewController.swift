//
//  MainScreenViewController.swift
//  Boat App
//
//  Created by shahzeb yousaf on 29/06/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit
import MapKit
class MainScreenViewController: UIViewController {
    
    
    @IBOutlet var mapView: MKMapView!
   
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var locationLabelView: UIView!
    let locationManager = CLLocationManager()
    let reigionInMeters: Double = 500
    var previousLocation: CLLocation?
    var directionArray:[MKDirections] = []

    override func viewDidLoad() {
        super.viewDidLoad()
         checkLoctionServices()
         settingUpLocationLabelView()
    
    }
    
    
    func settingUpLocationLabelView(){
        locationLabelView.alpha = 0.8
        locationLabelView.backgroundColor = UIColor.lightGray
    }
    
    
    func getDirection(){
        guard let location = locationManager.location?.coordinate else {return}
        
        
        let request = createDirectionRequest(frm: location)
        let directions = MKDirections(request: request)
        resetMapView(withNew: directions)
        
        directions.calculate { [unowned self](response, error) in
            if let err = error{
                print("Error: \(error?.localizedDescription)")
                return
            }
            guard let response = response else {return}
            for routes in response.routes{
                self.mapView.addOverlay(routes.polyline)
                self.mapView.setVisibleMapRect(routes.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    
    func createDirectionRequest(frm coordinate: CLLocationCoordinate2D)->MKDirections.Request{
        let destinationCoordinates = getCenterLocation(for: mapView).coordinate
        let startingLocation = MKPlacemark(coordinate: coordinate)
        let destination = MKPlacemark(coordinate: destinationCoordinates)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startingLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        
        return request
    }
    
    func resetMapView(withNew directions: MKDirections){
        mapView.removeOverlays(mapView.overlays)
        directionArray.append(directions)
        let _ = directionArray.map {$0.cancel()}
        
    }
    
    
    
//Just to add direction button on maain sccreen and connect that button to this method.
    @IBAction func GoButtonTapped(_ sender: UIButton){
        getDirection()
    }
    
    
    func showingCenterViewOfUserLocation(){
        if let location = locationManager.location?.coordinate{
            let reigion = MKCoordinateRegion.init(center: location, latitudinalMeters: reigionInMeters, longitudinalMeters: reigionInMeters)
            mapView.setRegion(reigion, animated: true)
        }
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    func checkLoctionServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        }
        else
        {
            let ac = UIAlertController(title: "Location Services is disabled", message: "Please make sure you've allowed location services, to check please visit Setting->privacy->location is must be turned on", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(ac, animated: true) {
                print("Location Services alert is showing") }
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTrackingUserLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        default:
            break
        }
    }
    
    func startTrackingUserLocation(){
        mapView.showsUserLocation = true
        showingCenterViewOfUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation{
        let lat = mapView.centerCoordinate.latitude
        let long = mapView.centerCoordinate.longitude
        return CLLocation(latitude: lat, longitude: long)
    }


}
extension MainScreenViewController: CLLocationManagerDelegate{
    
//    //This function will let you know as user is moving and its location is being updating.
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
//        guard let lastLocation = locations.last else {return}
//        let center = CLLocationCoordinate2D(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)
//        let reigion = MKCoordinateRegion.init(center: center, latitudinalMeters: reigionInMeters, longitudinalMeters: reigionInMeters)
//        mapView.setRegion(reigion, animated: true)
//    }
    
    
    //This function will let you know whenever user change authorization for accessing mobile maps.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension MainScreenViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else {return}
        
        guard center.distance(from: previousLocation) > 50 else {return}
        self.previousLocation = center
        
        
        geoCoder.cancelGeocode()
        geoCoder.reverseGeocodeLocation(center){ [weak self] (placemarks,error) in
            guard let self = self else {return}
            if let _ = error {
                return
            }
            guard let placemark = placemarks?.first else {
                return
                
            }
            
            let streatNumber = placemark.subThoroughfare ?? "" //nilcolison
            let streatName = placemark.thoroughfare ?? ""
            let countryName = placemark.country ?? ""
            
            DispatchQueue.main.async {
                self.locationLabel.text = "\(streatName) \(streatNumber), \(countryName) "
                print("\(streatName) \(streatNumber)")
            }
        }
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .blue
        return render
    }
}