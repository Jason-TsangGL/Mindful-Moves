//
//  HealthKitData.swift
//  Recover
//
//  Created by Jason Tsang on 2022-08-21.
//

import Foundation
import HealthKit
import CoreData
import CloudKit

struct HKVar {
    
    static let caloriesburned = "caloriesburned"
    
    static let dailystepcount = "dailystepcount"
    
    static let dailystandingtime = "dailystandingtime"
}

//class DataMarkedForExport: NSPersistentCloudKitContainer {
//    func testGenerateData() throws {
//        let context = self.persistentStoreCoordinator.addPersistentStore(type: .inMemory, at: NSURL(fileURLWithPath: "https://reqres.in/api/synergy") as URL)
//        
//        
//    }
//}

