//
//  DetailView.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
// ??

import SwiftUI
import SDWebImageSwiftUI

struct DetailHomeView: View {
    
    @ObservedObject private var locationManager = LocationManager() 
    @ObservedObject var presenter: DetailHomePresenter
    @State private var bottomSheetShown = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            MapView(latitude: self.presenter.place.latitude ?? 0.0, longtitude: self.presenter.place.longitude ?? 0.0, title: self.presenter.place.name ?? "")
            
            navigation
            Spacer()
            mainBottomSheet
        }.navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

extension DetailHomeView {
    
    var navigation : some View {
        HStack {
            backButton
            Spacer()
            favoriteButton
        }
        .padding(EdgeInsets(top: 48, leading: 16, bottom: 0, trailing: 16))
    }
    
    var mainBottomSheet: some View {
        GeometryReader { geometry in
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.87,
                minHeight: geometry.size.height * 0.2
            ) {
                content
            }
        }
    }
    var content : some View {
        VStack {
            imageDetail
            titledetail
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
    
    var backButton : some View {
        
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }){
            Image(systemName: "chevron.left")
            
        }.buttonStyle(CircleBackButtonStyle())
        
    }
    
    var favoriteButton : some View {
        Button(action: {
            presenter.addFavourites()
        }){
            Image(systemName: "heart.fill")
            
        }.buttonStyle(CircleBackButtonStyle())
        
    }
    
    var imageDetail: some View {
        
        WebImage(url: URL(string: self.presenter.place.image ?? ""))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .aspectRatio(contentMode: .fill)
            .frame(width: .infinity, height: 200)
            .cornerRadius(20)
    }
    
    var titledetail : some View {
        Text(self.presenter.place.placeDescription ?? "")
            .fixedSize(horizontal: false, vertical: true)
    }
    
}
