//
//  DataTypes.swift
//  Recover
//
//  Created by Jason Tsang on 2022-08-24.
//

import Foundation
import UIKit
import HealthKit

/// A representation of health data to use for `HealthDataTypeTableViewController`.
struct HealthDataTypeValue {
    let startDate: Date
    let endDate: Date
    var value: Double
}

public enum HKCategoryValueSleepAnalysis: Int {
  case inBed = 0
  case asleepUnspecified  = 1// 👈🏻 Replaces asleep, used when user is asleep but no sleep stage is specified
  case awake = 2
  case asleepCore  = 3// 👈🏻 New
  case asleepDeep = 4 // 👈🏻 New
  case asleepREM  = 5 // 👈🏻 New
}

protocol HealthClientType {
    var healthStore: HKHealthStore? { get set }
}

extension UIViewController {
    
    func injectHealthStore(_ healthStore: HKHealthStore) {
        if var client = self as? HealthClientType {
            client.healthStore = healthStore
        }
        
        for childViewController in children {
            childViewController.injectHealthStore(healthStore)
        }
    }
}


protocol HealthStoreContainer {
    // A required property that contains the health store.
    var healthStore: HKHealthStore! { get set }
}
