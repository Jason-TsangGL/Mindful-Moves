//
//  MentalHealthResourceType.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2023-03-21.
//

import SwiftUI

struct MentalHealthResourceType: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color(uiColor: .systemGray6)
                    .ignoresSafeArea()
                VStack(spacing:2) {
                    HStack {
                        Image("FeaturedIcon")
                            .resizable()
                            .frame(width: 256/3,height: 256/3)
                            .scaledToFit()
                        VStack {
                            Text("Mindful Moves")
                                .foregroundColor(.purple)
                                .font(.largeTitle)
                            Text("By Exercise & Health Psychology Laboratory")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                    Form {
                        Section("Resource Type") {
                                NavigationLink("Western University") {
                                    HealthWellnessView()
                                }
                                NavigationLink("Canada-Wide"){
                                    
                                }
                            
                        }
                    }
                    .padding(.vertical)
                    .scrollDisabled(true)
                    VStack(spacing:10){
                        Link("I Need Help Now", destination: URL(string: "https://www.uwo.ca/health/crisis.html")!)
                        .frame(width: 200,height: 100,alignment: .center)
                        .background(.green)
                        .foregroundColor(.white)
                        .font(.title)
                        Text("*If this is an emergency please call (911) or go to your nearest Emergency Room")
                            .italic(true)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Link("Click here", destination: URL(string: "https://www.uwo.ca/health/crisis.html")!)
                            .foregroundColor(.purple)
                            .bold(true)
                        
                    }
                }
            }
        }
    }
}

struct MentalHealthResourceType_Previews: PreviewProvider {
    static var previews: some View {
        MentalHealthResourceType()
    }
}
