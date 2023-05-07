//
//  eligibility4.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-30.
//

import SwiftUI

struct eligibility4: View {


    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Mental Health")
                    .font(.largeTitle)
                    .bold(true)
                    .padding()
                    .multilineTextAlignment(.center)
         
                Image(systemName: "brain.head.profile")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .scaledToFit()
                    .frame(width: 200,height: 200,alignment: .center)
                
                    
                    
            
                Text("Are you free of any pre-existing mental health disabilities and/or disorders (Disagnosed by a Medical Doctor)")
                    .font(.title3)
                    .padding()
                    .multilineTextAlignment(.center)

                HStack(alignment: .center,spacing: 50){
                    NavigationLink("No", destination: IneligibilityStep())
                        .buttonStyle(.borderedProminent)
                        .onTapGesture {
                            haptics().ErrorHaptic()
                        }
                    NavigationLink("Yes", destination: eligibility5())
                        .buttonStyle(.borderedProminent)
                        .onTapGesture {
                            haptics().SelectionHaptic()
                        }
                }
                .padding()
            }
            .padding(.horizontal)

        }
        .frame(maxWidth: 640)
        .navigationBarBackButtonHidden(true)

    }
}

struct eligibility4_Previews: PreviewProvider {
    static var previews: some View {
        eligibility4()
    }
}
