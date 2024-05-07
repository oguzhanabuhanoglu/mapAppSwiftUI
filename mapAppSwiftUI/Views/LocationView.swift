//
//  LocationView.swift
//  mapAppSwiftUI
//
//  Created by Oğuzhan Abuhanoğlu on 7.05.2024.
//

import SwiftUI

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        
        List{
            ForEach(vm.locations) { location in
                Text(location.name)
            }
        }
    
        
    }
    
    
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
