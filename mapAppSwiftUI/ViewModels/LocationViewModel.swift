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
    
    @Published var showDetailsSheet: Location? = nil
    
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
        withAnimation(.easeInOut) {
            currentLocation = location
            showLocationListView = false
        }
    }
    

    // i dont have next location on preview view so i need to react to next locatiın manuallt in here
    func nextButtonClicked() {
        guard let currentIndex = locations.firstIndex(where: { $0 == currentLocation }) else {
            return
        }
        
        //check if the nextIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            //next index is not valid
            //restart from 0
            guard let firstLocation = locations.first else { 
                return
            }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
}
