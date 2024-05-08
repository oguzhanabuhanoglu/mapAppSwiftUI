//
//  LocationMapAnnotationView.swift
//  mapAppSwiftUI
//
//  Created by Oğuzhan Abuhanoğlu on 8.05.2024.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
       
        VStack{
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.accentColor)
                .clipShape(.circle)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundColor(Color.accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -11)
                
        }
        //bu paddingi annotation yerleştirildiğinde konumu kapatmaması ve okun tam lokasyonnu göstermesi için kullandım
        .padding(.bottom)
        
    }
}

#Preview {
    LocationMapAnnotationView()
}
