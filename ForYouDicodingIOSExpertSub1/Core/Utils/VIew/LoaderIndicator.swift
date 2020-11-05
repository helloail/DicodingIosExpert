//
//  LoaderIndicator.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
//

import SwiftUI

struct LoaderIndicator: UIViewRepresentable {

  func makeUIView(context: UIViewRepresentableContext<LoaderIndicator> ) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(style: .large)
  }
  
  func updateUIView( _ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoaderIndicator> ) {
    uiView.startAnimating()
  }

}
