//
//  HSBannerView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-17.
//

import SwiftUI

struct HSBannerView: View {
    var body: some View {
        HStack {
            Image("UWOLOGO")
                .scaleEffect(0.4)
            VStack {
                Text("Western")
                    .font(.title)
                    .scaleEffect(2)
                    .foregroundColor(Color(uiColor: .)
                Text("Health Sciences")
                    .font(.title)
                    .scaleEffect(2)
                
            
            }
        }
        .offset(x:-60)
    }
}

struct HSBannerView_Previews: PreviewProvider {
    static var previews: some View {
        HSBannerView()
    }
}
