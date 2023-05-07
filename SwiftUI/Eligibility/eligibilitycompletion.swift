//
//  eligibilitycompletion.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-30.
//

import SwiftUI

struct eligibilitycompletion: View {
    @AppStorage("eligibility") var eligibility : Bool = true

    var body: some View {
        ZStack {
            Image("FeaturedIcon")
                .resizable()
                .scaledToFit()
                .opacity(0.15)
            VStack{
                Text("Eligibility Complete!")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                    .bold(true)
                Text("You have been determined to be eligible for this research study!")
                    .multilineTextAlignment(.center)
                step2items()
                    .padding()
                Text("Your interest in participating is much appreciated and valued.")
                    .multilineTextAlignment(.center)                
                Button("Finish"){
                    eligibility.toggle()
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .onTapGesture {
                    haptics().SuccessHaptic()
                }
            }
        }
    }
}
struct eligibilitycompletion_Previews: PreviewProvider {
    static var previews: some View {
        eligibilitycompletion()
    }
}
