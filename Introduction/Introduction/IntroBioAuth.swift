//
//  IntroBioAuth.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-06.
//
import CareKit
import UIKit
import Foundation
import ResearchKit
import CareKitUI
import CareKitStore
import SwiftUI
import HealthKit
import CloudKit
import LocalAuthentication
import LocalAuthenticationEmbeddedUI
import SwiftUI

struct IntroBioAuth: View {
    @AppStorage("authenticate.passcode") var passcode : Bool = false
    @AppStorage("authenticate") var biometric : Bool = false

    var body: some View {
        NavigationView {
            VStack{
                Text("Privacy")
                    .font(.largeTitle)
                    .bold(true)
                Image(systemName: "lock.shield.fill")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .scaledToFit()
                    .frame(width: 200,height: 200,alignment: .center)
                    .shadow(radius: 5)
                Text("Would you like to enable your iOS password or Face ID/Touch ID for MindfulMoves?")
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.title3)
                Text("You may choose to add authentication for increased privacy and security.")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                Text("You may change the settings afterwards if you change your mind.")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                

                Toggle(isOn: $biometric) {
                  Text("Protect with Face/Touch ID")
                }
                .padding(.horizontal)
                .padding(.vertical)

                NavigationLink("Tap to Continue", destination: eligibility2())
                    .buttonStyle(.borderedProminent)
                    .padding()
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct IntroBioAuth_Previews: PreviewProvider {
    static var previews: some View {
        IntroBioAuth()
    }
}
