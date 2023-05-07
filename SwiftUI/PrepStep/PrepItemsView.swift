//
//  PrepItemsView.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-05.
//
import Foundation
import SwiftUI

struct PrepItemsView: View {
    @AppStorage("SleepEnabled") var SE : Bool = false
    @AppStorage("TimeEnabled") var TE : Bool = false
    @AppStorage("HeartEnabled") var HE : Bool = false
    @AppStorage("Calibration") var Calibration : Bool = false
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
            // Sleep Monitoring
                    VStack(alignment:.center,spacing: 0){
                            Text("Sleep Monitoring")
                                .bold(true)
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding(.bottom)
                            
                        HStack(spacing: 30) {
                            NavigationLink("iPhone",destination: EnableSleepPrepiPhone())
                                .foregroundColor(Color(uiColor: .systemBlue))
                                .buttonStyle(.bordered)
                                .onTapGesture {
                                    haptics().SelectionHaptic()
                                }
                            NavigationLink("Watch",destination: EnableSleepPrepWatch())
                                .foregroundColor(Color(uiColor: .systemBlue))
                                .buttonStyle(.bordered)
                                .onTapGesture {
                                    haptics().SelectionHaptic()
                                }
                    }
                        .padding(.bottom)
                    Toggle("Sleep Monitoring is Enabled", isOn: $SE)
                            .onTapGesture {
                                haptics().SelectionHaptic()
                            }
                }// !Sleep Monitoring
            // Screen Time
                VStack(alignment:.center,spacing: 10){
                    NavigationLink("Screen Time", destination: EnableSTPrep())
                        .frame(width: 300,height:5)
                        .bold(true)
                        .font(.title3)
                        .foregroundColor(.black)
                        .padding(.bottom)
                        .onTapGesture {
                            haptics().SelectionHaptic()
                        }
                    HStack(spacing: 30) {
                        NavigationLink("iPhone",destination: EnableSTPrep())
                            .buttonStyle(.bordered)
                            .foregroundColor(Color(uiColor: .systemBlue))
                            .onTapGesture {
                                haptics().SelectionHaptic()
                            }
                    }
                    Toggle("Screen Time is Enabled", isOn: $TE)
                        .onTapGesture {
                            haptics().SelectionHaptic()
                        }
                }// !Screen Time
            // Vitals & Fitness
                VStack(alignment:.center,spacing: 10){
                    NavigationLink("Vitals & Fitness", destination: EnableHRPrep())
                        .frame(width: 300,height:5)
                        .bold(true)
                        .font(.title3)
                        .foregroundColor(.black)
                        .padding(.bottom)
                        .onTapGesture {
                            haptics().SelectionHaptic()
                        }
                    HStack(spacing: 30) {
                        NavigationLink("iPhone",destination: EnableHRPrep())
                            .foregroundColor(Color(uiColor: .systemBlue))
                            .buttonStyle(.bordered)
                            .onTapGesture {
                                haptics().SelectionHaptic()
                            }
                    }
                    Toggle("Vitals & Fitness is Enabled", isOn: $HE)
                        .onTapGesture {
                            haptics().SelectionHaptic()
                        }
                    Toggle("Devices Recalibrated", isOn: $Calibration)
                        .padding(.bottom)
                        .onTapGesture {
                            haptics().SelectionHaptic()
                        }
                }// !Vitals & Fitness
            }
            .padding()
        }
    }
}
struct PrepItemsView_Previews: PreviewProvider {
    static var previews: some View {
        PrepItemsView()
    }
}
