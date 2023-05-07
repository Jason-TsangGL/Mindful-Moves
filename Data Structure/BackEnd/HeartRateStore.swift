/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view controller that  fetches HealthKit data associated with previously games and displays it in a table view.
*/

import Foundation
import UIKit
import HealthKit


class HealthStore {

var healthStore: HKHealthStore?
var latestHr : Double?

init() {
    if HKHealthStore.isHealthDataAvailable(){
        healthStore = HKHealthStore()
        
    }
    

}
//
//    func LatestHR() -> Double {
//        let Array = HRArray
//        return Array
//    }
//
func requestAuthorization(completion: @escaping (Bool) -> Void){
    let heartBeat = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!

    guard let healthStore = self.healthStore else {return completion(false)}

    healthStore.requestAuthorization(toShare: [], read: [heartBeat]) { (success, error) in completion(success)
    }
}

    func HeartRateQuery() -> HKSampleQuery {
    
        let query : HKSampleQuery
    
    let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate)
    let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
    
    let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
    
    let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
    
        query = HKSampleQuery(sampleType: sampleType!, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]){ [self](sample,result,error) in guard error == nil else{
            return
    }
    let data = result![0] as! HKQuantitySample
    let unit = HKUnit(from: "count/min")
        self.latestHr = data.quantity.doubleValue(for: unit)
            print("Latest Hr\(latestHr!) BPM")

}
        return query
    }
    
}

//func CurrentHR() -> AnyObject {
//    if case HKObjectType.quantityType(forIdentifier: .heartRate)! = HKObjectType.quantityType(forIdentifier: .heartRate)! {
//            healthStore.enableBackgroundDelivery(for: HKObjectType.quantityType(forIdentifier: .heartRate)!, frequency: .immediate, withCompletion: { success, error in
//                if !success {
//                    print("failed to enable background delivery")
//                }
//            })
//        }
//}
    

