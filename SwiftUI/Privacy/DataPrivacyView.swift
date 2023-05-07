//
//  DataPrivacyView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-12-02.
//

import SwiftUI

struct DataPrivacyView: View {
    var body: some View {
        NavigationView() {
                ZStack{
                    Color(uiColor: .systemGray6)
                        .ignoresSafeArea()
                VStack{
                        Image("dataheader")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal)

                    Text("Data & Privacy")
                        .font(.title2)
                        .bold(true)
                    .padding()
                    Text("These are the following personal health data that are being collected from your Apple Devices.")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                    DPItems()
                }
            }// VStack
        }
    }
}

struct DataPrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        DataPrivacyView()
    }
}
