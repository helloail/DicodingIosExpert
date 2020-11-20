//
//  HomeRow.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 02/11/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeRow: View {
    
    var place: PlaceModel
    
    var body: some View {
        HStack(spacing: 16) {
            imageMeal
            content
            spacer
            
        }.frame(height:/*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding(.top, 8)
    }
}

extension HomeRow {
    
    var spacer: some View {
      Spacer()
    }
    
    var imageMeal: some View {
        
        WebImage(url: URL(string: place.image ?? ""))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .cornerRadius(20)
            .foregroundColor(Color("tertary"))
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(place.name ?? "")
                .font(.title3)
                .bold()
                .foregroundColor(Color("text"))
            
            Text(place.address ?? "")
                .font(.subheadline)
                .foregroundColor(Color("text"))
            
            Spacer()
            
            Divider()
        }.frame(alignment: .leading)
        .padding(.top, 8)
        
    }
    
}
