//
//  FavoriteView.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 01/11/20.
//

import Foundation
import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var presenter: FavouritePresenter
    
    var body: some View {
        
        ZStack {
            
            if presenter.places.count == 0 {
                emptyState
            }
            
            switch presenter.state {
            
            case .idle, .loading :
                
                loadingIndicator
            case .empty :
                loadingIndicator
            case .error(let error):
                Text("Error \(error.localizedDescription)")
            case .loaded:
                content
                
            }
        }.onAppear {
            self.presenter.getPlace()
            
        }
    }
}

extension FavoriteView {
    
    var emptyState: some View {
        VStack {
            Spacer()
            Text("Ikan Hiu Makan Tomat")
                .foregroundColor(Color("textempty"))
                .font(Font.headline.bold())
            
            Text("Kamu Belum Punya Favorit Nih !")
                .foregroundColor(Color("textempty"))
                .font(Font.title2.bold())
            Spacer()
            
            Image("emptystate")
                .resizable()
                .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
                .foregroundColor(Color("text"))
            LoaderIndicator()
        }
    }
    
    var content : some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach( self.presenter.places, id: \.id ) { place in
                
                ZStack {
                    self.presenter.linkBuilder(for: place) {
                        HomeRow(place: place)
                    }
                    .buttonStyle(PlainButtonStyle())
                }.padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
        }
    }
}
