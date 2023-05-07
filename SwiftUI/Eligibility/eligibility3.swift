//
//  eligibility3.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-30.
//

import SwiftUI

struct eligibility3: View {

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Physical Health")
                    .font(.largeTitle)
                    .bold(true)
                    .padding()
         
                Image(systemName: "figure.walk.circle")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .scaledToFit()
                    .frame(width: 200,height: 200,alignment: .center)
                
                Text("Are you free of any physical disabilities, or any accessibility limitations to physical spaces?")
                    .font(.title3)
                    .padding()
                
                HStack(alignment: .center,spacing: 50){
                    NavigationLink("No", destination: IneligibilityStep())
                        .buttonStyle(.borderedProminent)
                        .onTapGesture {
                            haptics().ErrorHaptic()
                        }
                        
                    NavigationLink("Yes", destination: eligibility4())
                        .buttonStyle(.borderedProminent)
                        .onTapGesture {
                            haptics().SelectionHaptic()
                        }
                }
                .padding()
            }
            .padding(.horizontal)

        }
        .navigationBarBackButtonHidden(true)



    }
}

struct eligibility3_Previews: PreviewProvider {
    static var previews: some View {
        eligibility3()
    }
}
