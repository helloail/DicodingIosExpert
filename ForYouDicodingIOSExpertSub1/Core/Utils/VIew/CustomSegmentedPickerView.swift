//
//  CustomSegmentedPickerView.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 01/11/20.
//

import Foundation
import SwiftUI

struct CustomSegmentedPickerView : View {
 
    @Binding  var selectedIndex : Int
     var titles = ["Round Trip", "One Way"]
     var colors = [Color.red, Color.green, Color.blue]
    @State var frames = Array<CGRect>(repeating: .zero, count: 2)

  var body: some View {
    VStack {
      ZStack {
        HStack(spacing: 10) {
          ForEach(self.titles.indices, id: \.self) { index in
            Button(action: { self.selectedIndex = index }) {
              Text(self.titles[index])
            }
            .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
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
            .frame(width: self.frames[self.selectedIndex].width, height: self.frames[self.selectedIndex].height, alignment: .topLeading)
            .offset(x: self.frames[self.selectedIndex].minX - self.frames[0].minX), alignment: .leading
        )
      }
      .animation(.default)
      .background(Capsule()
                    .stroke(Color.gray, lineWidth: 1))
     
      Spacer()
    }
  }

  func setFrame(index: Int, frame: CGRect) {
    self.frames[index] = frame
  }
}
