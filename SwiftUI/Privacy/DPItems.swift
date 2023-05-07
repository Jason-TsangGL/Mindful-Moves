//
//  DPItems.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-12-02.
//

import SwiftUI

struct DPItems: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                // Physical Health
                HStack{
                    Image(systemName: "figure.run")
                        .foregroundColor(.accentColor)
                        .padding()
                        .frame(width: 50,height: 50,alignment: .center)
                    VStack(alignment:.leading){
                        Text("Physical Activity")
                            .bold(true)
                        Text("Step Count, Walk + Run Distance, Cadence")
                            .padding(.horizontal)
                            .foregroundColor(.gray)
                        
                    }
                }
                // Mental Health
                HStack{
                    Image(systemName: "figure.walk.motion")
                        .foregroundColor(.accentColor)
                        .padding()
                        .frame(width: 50,height: 50,alignment: .center)
                    
                    VStack(alignment:.leading){
                        Text("Motion Sensors")
                            .bold(true)
                        Text("Stationary, Walking, Running, Sitting, Laying down.")
                            .foregroundColor(.gray)
                            .padding(.horizontal)

                    }
                }
                // Physical Health
                HStack{
                    Image(systemName: "heart.text.square.fill")
                        .foregroundColor(.accentColor)
                        .padding()
                        .frame(width: 50,height: 50,alignment: .center)
                    
                    VStack(alignment:.leading){
                        Text("Heart Rate Sensor")
                            .bold(true)
                        Text("Beat-to-Beat, Heart Rate, Heart Rate Variability, Motion Context")
                            .foregroundColor(.gray)
                            .padding(.horizontal)

                    }
                }
                // Physical Health
                HStack{
                    Image(systemName: "bed.double.fill")
                        .foregroundColor(.accentColor)
                        .padding()
                        .frame(width: 50,height: 50,alignment: .center)
                    VStack(alignment:.leading){
                        Text("Sleeping Habits")
                            .bold(true)
                        Text("Time spent in bed, time spent asleep, time enter/exit bed measured by devices.")
                            .foregroundColor(.gray)
                            .padding(.horizontal)

                    }
                }
                // Physical Health
                HStack{
                    Image(systemName: "battery.100.bolt")
                        .foregroundColor(.accentColor)
                        .padding()
                        .frame(width: 50,height: 50,alignment: .center)
                    
                    VStack(alignment:.leading){
                        Text("Battery & Charging Status")
                            .bold(true)
                        Text("iPhone & Watch battery percentage, battery status, duration of status.")
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                }
            }
            .frame(maxWidth: 640)
        .padding()
        }
    }
}

struct DPItems_Previews: PreviewProvider {
    static var previews: some View {
        DPItems()
    }
}
