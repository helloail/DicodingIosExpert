//
//  ContentView.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 01/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var favoritePresenter: FavouritePresenter
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView(presenter: homePresenter)
            }.tabItem {
                TabItem(imageName: "house", title: "Home")
            }
            
            NavigationView {
                FavoriteView(presenter: favoritePresenter)
            }.tabItem {
                TabItem(imageName: "heart", title: "Fsvourites")
            }
            
            NavigationView {
                AboutView()
            }.tabItem {
                TabItem(imageName: "heart", title: "About")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
