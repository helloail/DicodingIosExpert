//
//  CustomSegmentedPickerView.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 01/11/20.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    
    @Binding var selectedIndex: Int
    var titles = ["Home", "Favorites"]
    var imagetitles = ["house.fill", "heart.fill"]
    @State var frames = Array<CGRect>(repeating: .zero, count: 2)
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: UIScreen.main.bounds.width / 4) {
                    tabbutton
                }
                .background(
                    Capsule()
                        .fill(Color("cyanactive"))
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

extension MainTabView {
    var tabbutton  : some View {
        ForEach(self.titles.indices, id: \.self) { index in
            Button(action: { self.selectedIndex = index }) {
                HStack(spacing: 8) {
                    
//                    Text("\(self.frames[self.selectedIndex].width)")
                    
                    Image(systemName: self.imagetitles[index])
                        .foregroundColor(Color("texttab"))
                    
                    Text(self.titles[index])
                        .font(Font.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(Color("texttab"))
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
}
