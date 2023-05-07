//
//  LinkViews.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-29.
//

import SwiftUI

struct LinkViews: View {
        var title: String
        var URL : URL
        var subtitle: String
        
        var body: some View {
            
            VStack(alignment: .center, spacing: 10) {
                Link(title, destination: URL)
                    .font(.title2)
                    .bold(true)
                Text(subtitle)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)

            }
            
        }
}

struct LinkViews_Previews: PreviewProvider {

    static var previews: some View {
        LinkViews(title: "health", URL: URL(string: "https://owl.uwo.ca/portal/directtool/91d607ca-3f5d-4b17-9c83-f8ae54b2a529/")!, subtitle: "lol")
    }
}
