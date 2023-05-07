//
//  ProgressGuage.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2023-01-27.
//
import UIKit
import WatchConnectivity
import SwiftUI

func iphonebatterystatus() {
    @AppStorage("AppleWatch.BatteryStatus") var WatchBatteryStatus : Double = 0
    @AppStorage("iPhone.BatteryStatus") var iPhoneBatteryStatus : Double = 0
    @AppStorage("iPhone.BatteryState") var iPhoneBatteryState : String = ""
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

struct ProgressGuage: View {
    let minValue = 0
    let maxValue = 1296000
    var current = ProcessInfo.processInfo.systemUptime
    var body: some View {
        Gauge(value: current, in: 0...1296000) {
            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(.red)
                Text("\(Int(1296000-current)/3600) hr(s) / \(Int(1296000-current)/86400) days() remaining.")
                    .font(.caption)
                    .foregroundColor(.red)
            }
            Text("")
        } currentValueLabel: {
            Text("\(Int(current/86400)) day(s) completed.")
                .foregroundColor(Color.blue)
        } minimumValueLabel: {
            Text("Day \(Int(minValue))")
                .foregroundColor(Color(uiColor: .darkGray))
        } maximumValueLabel: {
            Text("Day \(Int(maxValue/86400)-1)")
                .foregroundColor(Color(uiColor: .darkGray))
        }
        .gaugeStyle(.accessoryLinearCapacity)
        .tint(.blue)
        
    }
}

struct WatchBatteryGuage: View {
    @AppStorage("AppleWatch.BatteryStatus") var WatchBatteryStatus : Double = 0


  
    let minValue = 0
    let maxValue = 100
    var body: some View {
        VStack {
            Gauge(value: WatchBatteryStatus, in: 0...100) {
                HStack {
                    Text("\(Int(WatchBatteryStatus)) % Charged")
                        .font(.caption)
                        .foregroundColor(.black)
                }
            } currentValueLabel: {
                Text("Uncharged")
                    .foregroundColor(.gray)
                
            } minimumValueLabel: {
                Text("\(Int(minValue))")
                    .foregroundColor(Color.black)
            } maximumValueLabel: {
                Text("\(maxValue)")
                    .foregroundColor(Color.black)
            }
            .gaugeStyle(AccessoryLinearCapacityGaugeStyle())
            .tint(.green)
        }
    }
}

struct PhoneBatteryGuage: View {
    @AppStorage("iPhone.BatteryStatus") var iPhoneBatteryStatus : Double = 0

    @AppStorage("iPhone.BatteryState") var iPhoneBatteryState : String = ""
    let minValue = 0
    let maxValue = 100
    var body: some View {
        VStack {
            Gauge(value: iPhoneBatteryStatus, in: 0...100) {
                HStack {
                    Text("\(Int(iPhoneBatteryStatus)) % Charged")
                        .font(.caption)
                        .foregroundColor(.black)
                }
            } currentValueLabel: {
                Text(iPhoneBatteryState)
                    .foregroundColor(.gray)
                
            } minimumValueLabel: {
                Text("\(Int(minValue))")
                    .foregroundColor(Color.black)
            } maximumValueLabel: {
                Text("\(maxValue)")
                    .foregroundColor(Color.black)
            }
            .gaugeStyle(AccessoryLinearCapacityGaugeStyle())
            .tint(.green)
        }
    }
}

struct ProgressGuage_Previews: PreviewProvider {
    static var previews: some View {
        PhoneBatteryGuage()
    }
}

