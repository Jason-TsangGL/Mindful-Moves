//
//  withdrawalwarning.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-12-02.
//

import SwiftUI

struct withdrawalwarning: View {

    @AppStorage("withdrawalfinal") var withdrawalfinal : Bool = false

    var body: some View {
        NavigationView {
            VStack{
                Text("Withdrawal")
                    .font(.largeTitle)
                    .bold(true)
                Image(systemName: "person.fill.xmark")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .scaledToFit()
                    .frame(width: 200,height: 200,alignment: .center)
                Text("We are sad to have you leave so early. We hope you can participate in our future studies!")
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.title3)
                Text("Please share this study with others that you know who may be interested!")
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .buttonStyle(.bordered)
                    .foregroundColor(.blue)

                WithdrawalConfirmationAlert()
                    .onTapGesture {
                        haptics().WarningHaptic()
                    }
                Text("Please delete this application from your device")
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .bold(true)
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct withdrawalwarning_Previews: PreviewProvider {
    static var previews: some View {
        withdrawalwarning()
    }
}
