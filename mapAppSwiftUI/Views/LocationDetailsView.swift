//
//  LocationDetailsView.swift
//  mapAppSwiftUI
//
//  Created by Oğuzhan Abuhanoğlu on 8.05.2024.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    
    @EnvironmentObject var vm: LocationViewModel
    let location: Location
    
    var body: some View {
        ScrollView{
            VStack{
                
                imageSection
                    .shadow(color: .black.opacity(0.3), radius: 20, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

#Preview {
    LocationDetailsView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationViewModel())
}


extension LocationDetailsView {
    
    private var imageSection: some View{
        
        TabView{
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                // to make better transition
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                    
            }
        }
        .frame(height: 450)
        .tabViewStyle(PageTabViewStyle())
        
    }
    
    private var titleSection: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading,spacing: 16){
            Text(location.description)
            
            if let url = URL(string: location.link){
                Link(destination: url, label: {
                    Text("Read more on wikipedia")
                })
                .font(.headline)
                .tint(.blue)
                
            }
        }
        
    }
    
    private var mapLayer: some View {
        
        VStack {
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [location]) { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .shadow(radius: 10)
                }
            }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
            
        }
    }
    
    private var backButton: some View {
        Button(action: {
            //dismiss sheet
            vm.showDetailsSheet = nil
        }) {
            Image(systemName: "xmark")
                .font(.headline)
                .padding()
                .foregroundColor(.primary)
                .background(.thinMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}
