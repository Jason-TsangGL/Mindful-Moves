//
//  eligibility2.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-30.
//

import SwiftUI

struct eligibility2: View {
    var body: some View {
        NavigationView{
            VStack() {
                Text("Before You Join")
                    .font(.largeTitle)
                    .bold(true)
                    .padding()
                    .multilineTextAlignment(.center)
                Text("We must ensure that you meet the eligibility criteria to participate in this study!")
                    .multilineTextAlignment(.center)
                step2items()
                    .padding()
                HStack(alignment: .center,spacing: 50){
                    NavigationLink("Back", destination: eligibilitystep1())
                        .buttonStyle(.borderedProminent)
                        .onTapGesture {
                            haptics().SelectionHaptic()
                        }
                        
                    NavigationLink("Continue", destination: eligibledeviceprep())
                        .buttonStyle(.borderedProminent)
                        .onTapGesture {
                            haptics().SelectionHaptic()
                        }
                }
                .padding()
            }
            .padding(.horizontal)
            .frame(maxWidth: 640)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct eligibility2_Previews: PreviewProvider {
    static var previews: some View {
        eligibility2()
    }
}
