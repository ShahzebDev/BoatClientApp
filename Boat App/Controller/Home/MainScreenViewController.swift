//
//  MainScreenViewController.swift
//  Boat App
//
//  Created by shahzeb yousaf on 29/06/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit
import MapKit
import Firebase
class MainScreenViewController: UIViewController {
    
    
    @IBOutlet var mapView: MKMapView!
   
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var locationLabelView: UIView!
    
    @IBOutlet var sideBarViewContainer: UIView!
    @IBOutlet var requestNow: UIButton!
    
    let locationManager = CLLocationManager()
    let reigionInMeters: Double = 500
    var previousLocation: CLLocation?
    var directionArray:[MKDirections] = []

    override func viewDidLoad() {
        super.viewDidLoad()
         checkLoctionServices()
         settingUpLocationLabelView()
    
        setupSideBar()
    }
    
    func setupSideBar() {
        sideBarViewContainer.bounds.origin.x = sideBarViewContainer.bounds.width
        sideBarViewContainer.isHidden = true
        sideBarViewContainer.isUserInteractionEnabled = true
        
        let swipeGesture = UITapGestureRecognizer(target: self, action: #selector(hideBar(_:)))
        sideBarViewContainer.addGestureRecognizer(swipeGesture)
    }
    
    @objc
    func hideBar(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5) {
            self.sideBarViewContainer.bounds.origin.x = self.sideBarViewContainer.bounds.width
        }
        
        self.sideBarViewContainer.isHidden = true
    }
    
    //Initialling we cannot show this UIView on our user map screen
    //we will show this view when we want to show boat driver details.
    func creatingIncomingBottomView(){
        let bottomView = UIView()
        bottomView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        mapView.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.clipsToBounds = true
        bottomView.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 670).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: 415).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        bottomView.centerXAnchor.constraint(equalTo: mapView.centerXAnchor).isActive = true
        
        
        
        
        
        let incomingIcone = UIImageView()
        // We will extract image of our driver and show it here
        incomingIcone.image = #imageLiteral(resourceName: "sunny")
        incomingIcone.layer.cornerRadius = 40
        incomingIcone.layer.borderWidth = 1
        incomingIcone.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        bottomView.addSubview(incomingIcone)
        
        
        incomingIcone.translatesAutoresizingMaskIntoConstraints = false
        incomingIcone.clipsToBounds = true
        
        incomingIcone.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20).isActive = true
        incomingIcone.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 30).isActive = true
        incomingIcone.widthAnchor.constraint(equalToConstant: 80).isActive = true
        incomingIcone.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        
        let incominglable = UILabel()
        // We will extract name of our driver and show it here
        incominglable.text = "Shahzeb Yousaf"
        incominglable.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        incominglable.font = UIFont.boldSystemFont(ofSize: 20)
        bottomView.addSubview(incominglable)
           
           
        incominglable.translatesAutoresizingMaskIntoConstraints = false
        incominglable.clipsToBounds = true
           
        incominglable.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30).isActive = true
        incominglable.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 150).isActive = true
        incominglable.widthAnchor.constraint(equalToConstant: 150).isActive = true
        incominglable.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        let incomingAdress = UILabel()
        // We will extract location of our driver and show it here
         incomingAdress.text = "One infinite loop"
         incomingAdress.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         incomingAdress.font = UIFont.boldSystemFont(ofSize: 15)
         bottomView.addSubview(incomingAdress)
        
        
         incomingAdress.translatesAutoresizingMaskIntoConstraints = false
         incomingAdress.clipsToBounds = true
        
         incomingAdress.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 60).isActive = true
         incomingAdress.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 150).isActive = true
         incomingAdress.widthAnchor.constraint(equalToConstant: 150).isActive = true
         incomingAdress.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        
        let bottomView2 = UIView()
        bottomView2.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        mapView.addSubview(bottomView2)
           
           
           
        bottomView2.translatesAutoresizingMaskIntoConstraints = false
        bottomView2.clipsToBounds = true
           
        bottomView2.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 800).isActive = true
           
        bottomView2.widthAnchor.constraint(equalToConstant: 415).isActive = true
           bottomView2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        bottomView2.centerXAnchor.constraint(equalTo: mapView.centerXAnchor).isActive = true
        
        
        let acceptButton = UIButton()
              acceptButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                 
              bottomView2.addSubview(acceptButton)
              acceptButton.addTarget(self, action: #selector(self.requestAction), for: .touchUpInside)
              acceptButton.tag = 1
          
              acceptButton.translatesAutoresizingMaskIntoConstraints = false
              acceptButton.clipsToBounds = true
          
              acceptButton.topAnchor.constraint(equalTo: bottomView2.topAnchor, constant: 20).isActive = true
              acceptButton.leftAnchor.constraint(equalTo: bottomView2.leftAnchor, constant: 330).isActive = true
              acceptButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
              acceptButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
          
          
          
          let declineButton = UIButton()
              declineButton.setImage(#imageLiteral(resourceName: "error"), for: .normal)
              declineButton.addTarget(self, action: #selector(self.requestAction), for: .touchUpInside)
              declineButton.tag = 2
              bottomView2.addSubview(declineButton)
          
              declineButton.translatesAutoresizingMaskIntoConstraints = false
              declineButton.clipsToBounds = true
          
              declineButton.topAnchor.constraint(equalTo: bottomView2.topAnchor, constant: 20).isActive = true
              declineButton.leftAnchor.constraint(equalTo: bottomView2.leftAnchor, constant: 230).isActive = true
              declineButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
              declineButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
          
        
          
          
          let messageButton = UIButton()
              messageButton.setImage(#imageLiteral(resourceName: "email"), for: .normal)
              messageButton.addTarget(self, action: #selector(self.requestAction), for: .touchUpInside)
              messageButton.tag = 3
              bottomView2.addSubview(messageButton)
          
              messageButton.translatesAutoresizingMaskIntoConstraints = false
              messageButton.clipsToBounds = true
          
              messageButton.topAnchor.constraint(equalTo: bottomView2.topAnchor, constant: 20).isActive = true
              messageButton.leftAnchor.constraint(equalTo: bottomView2.leftAnchor, constant: 130).isActive = true
              messageButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
              messageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
          
          
          
          let callButton = UIButton()
              callButton.setImage(#imageLiteral(resourceName: "telephone"), for: .normal)
              callButton.addTarget(self, action: #selector(self.requestAction), for: .touchUpInside)
              callButton.tag = 4
              bottomView2.addSubview(callButton)
                 
              callButton.translatesAutoresizingMaskIntoConstraints = false
              callButton.clipsToBounds = true
                 
              callButton.topAnchor.constraint(equalTo: bottomView2.topAnchor, constant: 20).isActive = true
              callButton.leftAnchor.constraint(equalTo: bottomView2.leftAnchor, constant: 30).isActive = true
              callButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
              callButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }
    @objc func requestAction(sender:UIButton){
               if (sender.tag == 1){
                 print("accept button is called")
               }else if(sender.tag == 2){
               print("request decline button is called")
               }else if (sender.tag == 3){
                print("Chat button is called")
               }else if (sender.tag == 4){
               print("make a phone call")
           }
       }
    
    
    @IBAction func displaySideBar(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.sideBarViewContainer.isHidden = false
            self.sideBarViewContainer.bounds.origin.x = 0
        }
    }
    
    @IBAction func requestNowBtnPressed(){
        print("Request Now!!!")
//        guard let coordinates = locationManager.location?.coordinate else {return}
//        print("this is our current coordinates \(coordinates)")
        requestNow.isHidden = true
        getDirection()
        
        
        // after implementation of request now functionality based on logic we should display this our own created bottom view to show the details of driver to the user.
        creatingIncomingBottomView()
        
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
                print("Error: \(err.localizedDescription)")
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
        guard let uid = UserDefaults.standard.string(forKey: "uid") else {return}
        guard let latitude = locationManager.location?.coordinate.latitude else {return}
        guard let lontitude = locationManager.location?.coordinate.longitude else {return}
         let refereceVariable = Firebase.Database.database().reference(fromURL: "https://boat-user.firebaseio.com/")
         let userReference = refereceVariable.child("users").child(uid)
        let values = ["latitude":latitude,"longtitude":lontitude]
        userReference.updateChildValues(values) { (error, dbref) in
            if let err = error {
                print("Error: \(err.localizedDescription)")
                return
            }
        }
        
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
class Core {
    static let shared = Core()
    
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}

extension MainScreenViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser(){
            //we'll show walkthrough screens
            
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! WalkthroughViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true) {
                print("Walkthrough screens is showing.")
            }
        }else{
            print("This is our old user")
        }
    }
}
