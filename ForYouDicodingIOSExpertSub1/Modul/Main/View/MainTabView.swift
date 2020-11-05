//
//  CustomSegmentedPickerView.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 01/11/20.
//

import Foundation
import SwiftUI

struct MainTabView : View {
    
    @Binding var selectedIndex: Int
    var titles = ["Home", "Favorites"]
    var imagetitles = ["house.fill", "heart.fill"]
    var colors = [Color.red, Color.green]
    @State var frames = Array<CGRect>(repeating: .zero, count: 2)
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: UIScreen.main.bounds.width/4) {
                    ForEach(self.titles.indices, id: \.self) { index in
                        Button(action: { self.selectedIndex = index }) {
                            HStack(spacing : 8) {
                                
                                Image(systemName: self.imagetitles[index])
                                
                                Text(self.titles[index])
                                    .font(Font.footnote)
                                    .fontWeight(.bold)
                            }
                            
                        }.buttonStyle(PlainButtonStyle())
                        .padding(8)
                        .background(
                            GeometryReader { geo in
                                Color.clear.onAppear { self.setFrame(index: index, frame: geo.frame(in: .global)) }
                            }
                        )
                    }
                }
                .background(
                    Capsule().fill(
                        self.colors[self.selectedIndex].opacity(0.4))
                        .frame(width: self.frames[self.selectedIndex].width,
                               height: self.frames[self.selectedIndex].height,
                               alignment: .topLeading)
                        .offset(x: self.frames[self.selectedIndex].minX - self.frames[0].minX), alignment: .leading
                )
            }
            .animation(.default)
            Spacer()
        }
    }
    
    func setFrame(index: Int, frame: CGRect) {
        self.frames[index] = frame
    }
}
