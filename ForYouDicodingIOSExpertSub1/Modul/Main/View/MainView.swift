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
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack {
            MainTabView(selectedIndex: $selectedIndex)
                Spacer()
    
            }
            GeometryReader { geometry in
                BottomSheetView(
                    isOpen: self.$bottomSheetShown, index: self.$selectedIndex,
                    maxHeight: geometry.size.height * 0.9
                ) {
                    
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}