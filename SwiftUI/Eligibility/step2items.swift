//
//  step2items.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-30.
//

import SwiftUI

struct step2items: View {
    var body: some View {
        VStack(alignment: .leading){
            // Physical Health
            HStack{
                Image(systemName: "heart.circle")
                    .foregroundColor(.accentColor)
                    .padding()
                    .frame(width: 50,height: 50,alignment: .center)
                VStack(alignment:.leading){
                    Text("Physical Health")
                        .bold(true)
                    Text("Free of physical conditions that impact daily life.")
                        .foregroundColor(.gray)
                    
                }
            }
            // Mental Health
            HStack{
                Image(systemName: "brain.head.profile")
                    .foregroundColor(.accentColor)
                    .padding()
                    .frame(width: 50,height: 50,alignment: .center)
                
                VStack(alignment:.leading){
                    Text("Mental Health")
                        .bold(true)
                    Text("Free of any mental health disorders by a healthcare provider.")
                        .foregroundColor(.gray)
                    
                }
            }
            // Physical Health
            HStack{
                Image(systemName: "apps.iphone.badge.plus")
                    .foregroundColor(.accentColor)
                    .padding()
                    .frame(width: 50,height: 50,alignment: .center)
                
                VStack(alignment:.leading){
                    Text("Language Fluency")
                        .bold(true)
                    Text("Ability to read/write/communicate in english")
                        .foregroundColor(.gray)
                    
                }
            }
            // Physical Health
            HStack{
                Image(systemName: "graduationcap")
                    .foregroundColor(.accentColor)
                    .padding()
                    .frame(width: 50,height: 50,alignment: .center)
                VStack(alignment:.leading){
                    Text("Academic Affilitaion")
                        .bold(true)
                    Text("Active student of Western University.")
                        .foregroundColor(.gray)
                }
            }
            // Physical Health
            HStack{
                Image(systemName: "person.crop.circle.badge.exclamationmark")
                    .foregroundColor(.accentColor)
                    .padding()
                    .frame(width: 50,height: 50,alignment: .center)
                
                VStack(alignment:.leading){
                    Text("Minimum Age Requirement")
                        .bold(true)
                    Text("18 years of age or older.")
                        .foregroundColor(.gray)
                    
                }
            }
        }
        .frame(maxWidth: 640)

    }
}

struct step2items_Previews: PreviewProvider {
    static var previews: some View {
        step2items()
    }
}
