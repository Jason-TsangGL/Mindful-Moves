//
//  EmergencyMHView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-29.
//

import SwiftUI

struct EmergencyMHView: View {
    var body: some View {
        
        VStack(spacing:10){
            Link("I Need Help Now", destination: URL(string: "https://www.uwo.ca/health/crisis.html")!)
            .frame(width: 200,height: 100,alignment: .center)
            .background(.green)
            .foregroundColor(.white)
            .font(.title)
            Text("*Same-day crisis appointments available until 4:30p.m. Monday – Friday. For after-hours crisis support, click here.")
                .italic(true)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Link("Click here", destination: URL(string: "https://www.uwo.ca/health/crisis.html")!)
                .foregroundColor(.purple)
                .bold(true)
            
        }
    }
}

struct EmergencyMHView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyMHView()
    }
}
