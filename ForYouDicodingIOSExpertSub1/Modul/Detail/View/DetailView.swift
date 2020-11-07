//
//  DetailView.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
// ??

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    @ObservedObject private var locationManager = LocationManager() 
    @ObservedObject var presenter: DetailPresenter
    @State private var bottomSheetShown = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            MapView(latitude: self.presenter.place.latitude ?? 0.0, longtitude: self.presenter.place.longitude ?? 0.0, title: self.presenter.place.name ?? "")
            
            backButton
            Spacer()
            mainBottomSheet
        }.navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

extension DetailView {
    var imageMeal: some View {
        
        WebImage(url: URL(string: self.presenter.place.image ?? ""))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .cornerRadius(20)
    }
    
    var mainBottomSheet: some View {
        GeometryReader { geometry in
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.87,
                minHeight: geometry.size.height * 0.2
            ) {
                imageMeal
            }
        }
    }
    
    var backButton : some View {
        HStack {
            Button(action: {
                
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                
            }.buttonStyle(CircleBackButtonStyle())
            .padding(EdgeInsets(top: 48, leading: 16, bottom: 0, trailing: 0))
            
            Spacer()
        }
    }
    
}
