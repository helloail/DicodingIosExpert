//
//  viewindex0.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 01/11/20.
//

import SwiftUI

struct viewindex0: View {
    var body: some View {
        VStack{
            Text("index 0")
        }.background(Color.blue)
    }
}


struct viewindex1: View {
    var body: some View {
        
        VStack{
            Spacer()
            Text("index 1")
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.red)
    }
}

struct viewindex0_Previews: PreviewProvider {
    static var previews: some View {
        viewindex0()
    }
}
