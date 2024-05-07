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
            
            VStack(spacing: 0) {
                
                header
                    .padding()
                
                Spacer()
                
                ZStack{
                    ForEach(vm.locations) { location in
                        if vm.currentLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(radius: 20)
                                .padding()
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
            }
           
        }
            
        
    }
    
        
}
    


#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}

extension LocationView {
    
    private var header: some View {
        
            VStack {
                Button(action: vm.toggleLocationList, label: {
                    Text(vm.currentLocation.name + ", " + vm.currentLocation.cityName)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .overlay(alignment: .leading) {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding()
                                .rotationEffect(Angle(degrees: vm.showLocationListView ? 180 : 0))
                        }
                })
                
                if vm.showLocationListView {
                    LocationListView()
                }
                
            }
            .background(.thickMaterial)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 20,x: 0 , y: 15)
        
    }
}
