//
//  withdrawalconfirmation.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-12-02.
//

import SwiftUI

struct withdrawalconfirmation: View {
 
    var body: some View {
        NavigationView {
            VStack{
                Text("In-eligible")
                    .font(.largeTitle)
                    .bold(true)
                Image(systemName: "person.fill.xmark")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .scaledToFit()
                    .frame(width: 200,height: 200,alignment: .center)
                Text("We thank you for your interest and hope you can participate in our future studies!")
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.title3)
                Text("Please share this study with others that you know who may be interested!")
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.title3)

                Text("Please delete this application from your device")
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .bold(true)
            }
            .onAppear(perform: haptics().ErrorHaptic)
        }
        .navigationBarBackButtonHidden()
    }
}

struct withdrawalconfirmation_Previews: PreviewProvider {
    static var previews: some View {
        withdrawalconfirmation()
    }
}
