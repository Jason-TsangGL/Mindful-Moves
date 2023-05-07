//
//  BiometricAuthView.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-18.
//

import SwiftUI
import LocalAuthentication
import CoreHaptics

struct BiometricAuthView: View {
    @AppStorage("BiometricToggle") var BiometricToggle : Bool = false
    @AppStorage("authentication") var authentication : Bool = false
    @State var isUnlocked = false
    private var selectedType: UINotificationFeedbackGenerator.FeedbackType = .success
    private var UnselectedType: UINotificationFeedbackGenerator.FeedbackType = .error

    var body: some View {
        ZStack {
            Color(uiColor: .clear)
                .blur(radius: 10)
            Image("FeaturedIcon")
                .resizable()
                .scaledToFit()
                .opacity(0.2)
                .blur(radius: 10)
            VStack {
                Spacer(minLength: 275)
                Text("Welcome back!")
                    .font(.title)
                    .shadow(radius: 1)
                    .padding()
                
                Image(systemName: "faceid")
                    .resizable()
                    .scaledToFit()
                
                    .frame(width: 50 ,height: 50,alignment: .center )
                    .foregroundColor(.purple)
                    .padding()
                Button("Sign In with Face ID"){
                    authenticate()
                }
                .buttonBorderShape(.roundedRectangle)
                .buttonStyle(.bordered)
                .foregroundColor(.purple)
                .padding()
                Spacer()
                HStack {
                    Image("EHPLFooter")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 125/2,alignment: .center )
                    .padding()
                    Spacer()
                    Image("UWOCREST")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150/2,alignment: .center )
                    .padding()
                }//MARK: HSTACK*
                .padding(.horizontal)

            }//MARK: VSTACK*
            .onTapGesture(perform: authenticate)
        }//MARK: ZStack*
    }//MARK: View**
    func SuccessHaptic(){
        let hap = UINotificationFeedbackGenerator()
        hap.notificationOccurred(selectedType)
    }
    func ErrorHaptic() {
        let h = UINotificationFeedbackGenerator()
        h.notificationOccurred(UnselectedType)
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if BiometricToggle == true { //Is Biometric Authentication Enabled
            // check whether biometric authentication is possible
            isUnlocked = false
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                // it's possible, so go ahead and use it
                let reason = "Please authenticate to continue"
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    // authentication has now completed
                    if success {
                        // authenticated successfully
                        SuccessHaptic()
                        isUnlocked = true
                    } else {
                        ErrorHaptic()
                        // there was a problem
                    }
                }
            } else {
                // no biometrics
            }
        } else
        {
            //Biometrics is not Enabled
        }
    }
}

struct BiometricAuthView_Previews: PreviewProvider {
    static var previews: some View {
        BiometricAuthView()
    }
}
