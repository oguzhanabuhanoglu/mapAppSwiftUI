//
//  LocationPreviewView.swift
//  mapAppSwiftUI
//
//  Created by Oğuzhan Abuhanoğlu on 7.05.2024.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 0){
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
               learnMoreButton
                nextButton
            }
        }
        
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
    
    
}

#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
    
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            Image(location.imageNames.first!)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
            .cornerRadius(10)
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 3.0) {
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            //details popup open
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 120, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            // change currentLocation
            
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 120, height: 35)
        }
        .buttonStyle(.bordered)
    }
    
}
