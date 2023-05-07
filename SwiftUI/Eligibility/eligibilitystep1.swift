//
//  eligibilitystep1.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-30.
//

import SwiftUI

struct eligibilitystep1: View {

    var body: some View {
        NavigationView {
            ZStack {
                Image("FeaturedIcon")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.15)
                    .padding()
                VStack{
                    Text("Welcome to the Mindful Moves!")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                        .bold(true)
                    Text("Your interest in participating is much appreciated and valued.")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .padding()
                    NavigationLink("Tap to Continue", destination: eligibility2())
                        .buttonStyle(.borderedProminent)
                        .padding()
                        .onTapGesture {
                            haptics().SelectionHaptic()
                        }
                    
                }
            }// VStack
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct eligibilitystep1_Previews: PreviewProvider {
    static var previews: some View {
        eligibilitystep1()
    }
}
