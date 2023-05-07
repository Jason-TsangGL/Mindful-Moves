//
//  SimpleHealthDataViews.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2023-01-02.
//

import SwiftUI
import WatchConnectivity
import UIKit
import Foundation
struct SimpleHealthDataViews: View {
    @AppStorage("AppleWatch.BatteryStatus") var WatchBatteryStatus : Double = 0
    @AppStorage("iPhone.BatteryStatus") var iPhoneBatteryStatus : Double = 0
    @AppStorage("iPhone.BatteryState") var iPhoneBatteryState : String = ""
    @AppStorage("DevMode") var DevMode : Bool = false
    var StudyComplete : Bool = false
    var DurationTracking : Bool = false
    var StartDate : Date = Date()
    var body: some View {
        
        NavigationView() {
            ZStack {
                    Color(uiColor: .systemGray6)
                        .ignoresSafeArea()
                    VStack() {
                        HStack {
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
                            Button("*"){
                                DevMode.toggle()
                            }
                        }
                        ProgressGuage()
                            .padding()
                        Button("Complete Study"){
                            SelectionHaptic()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(StudyComplete ? .gray : .blue)
                        .disabled(!StudyComplete)

                        Form {
                            Section("Your Phone ") {
                                HStack {
                                    Label("Model", systemImage: "iphone")
                                        .foregroundColor(.black)

                                    Spacer()
                                    Text("\(UIDevice.current.model) \(UIDevice.current.systemName) \(UIDevice.current.systemVersion)")
                                        .foregroundColor(.blue)

                                }
                                HStack {
                                    Label("Battery", systemImage:"battery.100.bolt")
                                        .padding(.trailing)
                                        .foregroundColor(.black)
                                    Spacer()
                                        
                                    PhoneBatteryGuage()
                                        .padding(.leading)
                                        .padding(.leading)
                                        .foregroundColor(.black)
                                }
                            }
                            Section("Your Smart Watch ") {
                                HStack {
                                    Label("Model", systemImage: "applewatch")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Text(" Watch SE watchOS 9.3")
                                        .foregroundColor(.blue)

                                }

//                                HStack {
//                                    Label("Battery", systemImage:"battery.100.bolt")
//                                        .padding(.trailing)
//                                        .foregroundColor(.black)
//                                    Spacer()
//                                    WatchBatteryGuage()
//                                        .padding(.leading)
//                                    .padding(.leading)
//                                }
                            }
//
                            NavigationLink("Frequently Asked Questions"){
                                FAQViewer()
                                    .toolbar {
                                        ShareLink(item: Bundle.main.url(forResource: "FAQ", withExtension: "pdf")!)
                                    }
                            }
                            .onTapGesture {
                                SelectionHaptic()
                            }
                            NavigationLink("Research Legal & Privacy"){
                                StudySettingsView()
                            }
                            .onTapGesture {
                                SelectionHaptic()
                            }
                            NavigationLink("Developer Tools") {
                                DataTableView()
                            }
                            .disabled(!DevMode)
                            .foregroundColor(DevMode ? .black : .gray)
                            
                    }
                    .onAppear(perform: iphonebatterystatus)
                    .ignoresSafeArea()
                    .scrollDisabled(true)
                }
                    .scrollDisabled(false)

            }
        }
    }

    func SelectionHaptic() {
        let Gen = UISelectionFeedbackGenerator()
        Gen.selectionChanged()
    }
    func iphonebatterystatus() {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        // Check if the device is battery monitoring enabled
        if device.isBatteryMonitoringEnabled {
          // Get the battery level and other battery-related information
          let batteryLevel = device.batteryLevel
            iPhoneBatteryStatus = Double(batteryLevel*100)
          let batteryState = device.batteryState
            if batteryState.rawValue == 0 {
                iPhoneBatteryState = "Unknown"
            }
            if batteryState.rawValue == 1 {
                iPhoneBatteryState = "Unplugged"
            }
            if batteryState.rawValue == 2 {
                iPhoneBatteryState = "Charging"
            }
            if batteryState.rawValue == 3 {
                iPhoneBatteryState = "Fully Charged"
            }
            
          // Use the battery level and state to update your UI or perform other tasks
          print("Battery level: \(batteryLevel)")
          print("Battery state: \(batteryState)")
        } else {
          // Battery monitoring is not enabled, so you can't get the battery level or state
          print("Battery monitoring is not enabled")
        }
    }
}
struct SimpleHealthDataViews_Previews: PreviewProvider {
    static var previews: some View {
        SimpleHealthDataViews()
    }
}
