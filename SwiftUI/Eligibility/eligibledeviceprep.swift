//
//  eligibledeviceprep.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-05.
//
import Foundation
import SwiftUI

struct eligibledeviceprep: View {
    @AppStorage("SleepEnabled") var SE : Bool = false
    @AppStorage("TimeEnabled") var TE : Bool = false
    @AppStorage("HeartEnabled") var HE : Bool = false
    @AppStorage("Calibration") var Calibration : Bool = false
    var body: some View {
        NavigationView{
            ZStack {
                Image("FeaturedIcon")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.15)
                VStack(spacing: 10)
                {
                    Text("Device Set-up")
                        .font(.largeTitle)
                        .bold(true)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    Text("We must ensure that all of your devices are calibrated and with the proper settings enabled.")
                        .foregroundColor(Color(uiColor: .systemGray))
                        .multilineTextAlignment(.center)
                    PrepItemsView()
                    HStack(alignment: .center,spacing: 50){
                        NavigationLink("Back      ", destination: IneligibilityStep())
                            .buttonStyle(.borderedProminent)
                            
                        NavigationLink("Continue", destination: eligibility3())
                            .buttonStyle(.borderedProminent)
                            .disabled(isprepared(SE: SE, TE: TE, HE: HE, Calibration: Calibration))
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            
            .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

func isprepared(SE: Bool,TE: Bool, HE: Bool, Calibration: Bool) -> Bool {
    if SE == true && TE == true && HE == true && Calibration == true {
        return false
    } else {
        return true
    }
}
struct eligibledeviceprep_Previews: PreviewProvider {
    static var previews: some View {
        eligibledeviceprep()
    }
}
