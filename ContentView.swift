import SwiftUI
import LocalAuthentication
import Foundation
import WatchConnectivity
import CareKit
import CareKitUI
import UIKit

struct ContentView: View {
    @AppStorage("withdrawalfinal") var withdrawalfinal : Bool = false
    @AppStorage("eligibility") var eligibility : Bool = true
    @AppStorage("onboarding") var onboarding : Bool = false
    @AppStorage("BiometricToggle") var BiometricToggle : Bool = false
    @AppStorage("authentication") var authentication : Bool = false
    @AppStorage("WatchConnectivity") var WatchConnectivity : Bool = true
    @AppStorage("StudyCompletionStatus") var CompletionStatus : Bool = false
    @State var isUnlocked = true
    func StudyDuration() {
        if ProcessInfo.processInfo.systemUptime >= 1300000 {
            CompletionStatus = true
        }
        else {
            CompletionStatus = false
        }
    }
    var body: some View {
        
        ZStack {
            if CompletionStatus {
                CompletionView()
            } else {
                ZStack {
                    if isUnlocked {
                        NavigationStack {
                            
                            TabView{
                                CarefeedView()
                                    .tabItem({Image(systemName: "heart.text.square"); Text("Home")})
                                    .toolbarBackground(Color.init(uiColor: .systemGray6), for: .tabBar)
                                    .background(Color(uiColor: .systemGray6), ignoresSafeAreaEdges: .all)
                                    .onAppear(perform: SelectionHaptic)

                                SimpleHealthDataViews()
                                    .tabItem({Image(systemName: "building" ); Text("Laboratory")})
                                    .toolbarBackground(Color.init(uiColor: .systemGray6), for: .tabBar)
                                    .background(Color(uiColor: .systemGray6), ignoresSafeAreaEdges: .all)
                                    .onAppear(perform: SelectionHaptic)
                            }
                            .foregroundColor(.black)
                            //                    .fullScreenCover(isPresented: $WatchConnectivity) {
                            //                        WatchConnectivityView()
                            //                    }
                            .fullScreenCover(isPresented: $eligibility){
                                eligibilitystep1()}
                            .fullScreenCover(isPresented: $withdrawalfinal){
                                withdrawalconfirmation()
                            }
                        }
                    } else {
                        BiometricAuthView()
                            .transition(.slide)
                    }
                }
                .ignoresSafeArea()
                .onAppear(perform: authenticate)
                .onAppear(perform: StudyDuration)
                .contentTransition(.opacity)
            }
            
        }
    }
    func SelectionHaptic() {
        let Gen = UISelectionFeedbackGenerator()
        Gen.selectionChanged()
    }

    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if BiometricToggle == true { //Is Biometric Authentication Enabled
            // check whether biometric authentication is possible
            isUnlocked = false
            print("Biometric Authentication is enabled")
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                // it's possible, so go ahead and use it
                let reason = "Please authenticate to continue"
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    // authentication has now completed
                    if success {
                        // authenticated successfully
                        isUnlocked = true
                        print("Biometric Authentication Successful")
                    } else {
                        // there was a problem
                        print("Biometric Authentication Unsuccessful")
                    }
                }
            } else {
                print("Biometric Authentication unavailable")
                // no biometrics
            }
        } else
        {
            print("Biometric Authentication is disabled")
            //Biometrics is not Enabled
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

