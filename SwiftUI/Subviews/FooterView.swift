//
//  FooterView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        ZStack {
            HStack(spacing: 30){
                Image("EHPL")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                Image("FeaturedIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
            }
            .padding(.horizontal)
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
