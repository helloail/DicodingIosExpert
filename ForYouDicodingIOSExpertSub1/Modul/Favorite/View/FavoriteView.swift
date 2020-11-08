//
//  FavoriteView.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 01/11/20.
//

import Foundation
import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var presenter: FavouritesPresenter
    
    var body: some View {
        ZStack {
            switch presenter.state {
            
            case .idle, .loading :
                loadingIndicator
            case .error(let error):
                Text("Error \(error.localizedDescription)")
            case .loaded:
                content
            }
            
        }.onAppear {
            if self.presenter.places.count == 0 {
                self.presenter.getPlace()
            }
        }
    }
}

extension FavoriteView {
    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
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
