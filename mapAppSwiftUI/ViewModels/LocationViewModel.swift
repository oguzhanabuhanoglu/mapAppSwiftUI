//
//  LocationViewModel.swift
//  mapAppSwiftUI
//
//  Created by Oğuzhan Abuhanoğlu on 7.05.2024.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    //Current location
    @Published var currentLocation: Location {
        // everytime the current location has change its going to update mapRegion automaticly
        didSet {
            updateMapRegion(location: currentLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationListView: Bool = false
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.currentLocation = locations.first!
        
        self.updateMapRegion(location: currentLocation)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates,
                                           span: mapSpan)
        }
    }
    
    func toggleLocationList(){
        withAnimation(.easeInOut) {
            showLocationListView = !showLocationListView
        }
    }
    
    func showNextLocation(location: Location) {
        currentLocation = location
        showLocationListView = false
    }
}
