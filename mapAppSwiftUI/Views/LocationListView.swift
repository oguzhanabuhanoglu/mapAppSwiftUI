//
//  LocationListView.swift
//  mapAppSwiftUI
//
//  Created by Oğuzhan Abuhanoğlu on 7.05.2024.
//

import SwiftUI

struct LocationListView: View {

    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                
                Button(action: {vm.showNextLocation(location: location)},
                       label: {
                    listRowView(location: location)
                })
                    .padding(.vertical , 4)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationViewModel())
}

extension LocationListView {
    
    //locationa burada erişmek için bu viewı fonksiyondan döndürmemiz gerekti
    private func listRowView(location: Location) -> some View{
        
        HStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
           
                VStack(alignment: .leading){
                    Text(location.name)
                        .font(.headline)
                    Text(location.cityName)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
    }
}
