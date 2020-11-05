//
//  HomeView.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 01/11/20.
//

import Foundation
import SwiftUI

struct MainView : View {
    
    @State private var bottomSheetShown = true
    @State var selectedIndex  = 0
    
    private let router = MainRouter()
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack(spacing: 8) {
                tabview
                imageProfileView
                
                Spacer()
            }
           geometryBottomSheet
        }
    }
}

extension MainView {
    
     var tabview: some View {
        
        MainTabView(selectedIndex: $selectedIndex)
     }
    
    var imageProfileView: some View {
        
        Image("fotosaya")
            .resizable()
            .clipShape(Circle())
            .frame(width: 100, height: 100)
        
    }
    
    var geometryBottomSheet: some View {
        GeometryReader { geometry in
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.9
            ) {
                router.createNavigation(index: self.selectedIndex)
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
}
