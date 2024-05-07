//
//  LocationView.swift
//  mapAppSwiftUI
//
//  Created by Oğuzhan Abuhanoğlu on 7.05.2024.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
    
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
            
        
    }
    
        
}
    


#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
