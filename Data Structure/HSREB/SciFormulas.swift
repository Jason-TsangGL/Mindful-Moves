

import CareKit
import CareKitStore
import CareKitUI
import ResearchKit
import UIKit
import os.log
import MapKit
import SwiftUI
import Foundation
import HealthKit

struct formulations {
    init() {}
    let healthStore = HKHealthStore()

    func StartObservers() {
        
    }
    func UploadObserved() {
        
    }
    func BMICalaulation() -> Double {
        let KgWeight : Double = 55
        let cmHeight : Double = 168
        let mHeight : Double = cmHeight/100
        
        let BMI = (KgWeight)/(mHeight*mHeight)
        return BMI
    }
    //MARK: BMR FORMULA
    func FemaleBMR() -> Double {
        let yearsAge : Double = 20
        let cmHeight : Double = 168
        let KgWeight : Double = 55
        let BMR = Double(447.593) + (9.247 * KgWeight) + (3.098 * cmHeight) - (4.330 * yearsAge)
        return BMR
    }
    
    func MaleBMR() -> Double {
        let yearsAge : Double = 20
        let cmHeight : Double = 168
        let KgWeight : Double = 55
        let BMR = Double(88.362) + (13.397 * KgWeight) + (4.799 * cmHeight) - (5.677 * yearsAge)
        return BMR
    }
    //MARK: PHYSICAL ACTIVITY INTENSITY - CADENCE (PER/MIN)
    func CollectCadence() {

        let read = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
        let share = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
        healthStore.requestAuthorization(toShare: share, read: read) { (chk, error) in if chk {
            guard let sampleType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
                return  }
            let startDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date())
            let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
            let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]) {(sample,result,error) in guard error == nil else{
                return }
                let dataset = result! as! [HKQuantitySample]
                for i in dataset.indices {
                    let set = dataset[i].quantity.doubleValue(for: .count())
                    let sd = dataset[i].startDate.formatted(date: .numeric, time: .standard).description
                    let MT = dataset[i].endDate.timeIntervalSince(dataset[i].startDate)
                    let de = dataset[i].device?.model
                    let cadence = (set/MT)*60
                    publicDS.CadenceDataSet.append(CadenceDataSet(Value: cadence, Date: sd, TimeInterval: MT, Device: de!))
                }
                print("Cadence Samples Collected: \(publicDS.CadenceDataSet.count)")
            }
            self.healthStore.execute(query)
            }
        }
    }
//    //MARK: PHYSICAL ACTIVITY INTENSITY - HEART RATE PERCENTAGE BASED
    func enableHRBGD() async  {
         do {
             let healthstore = HKHealthStore()
             try await healthstore.enableBackgroundDelivery(for: HKObjectType.quantityType(forIdentifier: .heartRate)!, frequency: .immediate)
             print("Immediate HR Delivery Success")
         } catch {print(error)}
     }
    func CollectBPM() {
        
        let read = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!])
        let share = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!])
        healthStore.requestAuthorization(toShare: share, read: read) { (chk, error) in if chk {
            guard let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
                return
            }
            let startDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date())
            let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
            let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]) {(sample,result,error) in guard error == nil else {
                return
            }
                let dataset = result! as! [HKQuantitySample]
                for i in dataset.indices {
                    let set = dataset[i].quantity.doubleValue(for: HKUnit(from: "count/min")).rounded()
                    let sd = dataset[i].startDate.formatted(date: .numeric, time: .standard).description
                    let MT = dataset[i].metadata!.values.description
                    let de = dataset[i].endDate.timeIntervalSince(dataset[i].startDate)
                    
                    publicDS.HRDataSet.append(HRbpmDataSet(Value: set, Date: sd, MotionContext: MT, Duration: de))
                }
                print("bpm Samples Collected: \(publicDS.HRDataSet.count)")
            }
            self.healthStore.execute(query)
            }
        }
        
    }

//MARK: SEDENTARY BEHAVIOUR INDICATION - STEP COUNT METS BASED
    func CollectStepCount() {
        let read = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
        let share = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
        healthStore.requestAuthorization(toShare: share, read: read) { (chk, error) in if chk {
            guard let sampleType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
                return  }
            let startDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date())
            let anchor = HKQueryAnchor.init(fromValue: Int(HKAnchoredObjectQueryNoAnchor))
            let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
//            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
            let query = HKAnchoredObjectQuery(type: sampleType, predicate: predicate, anchor: anchor, limit: HKObjectQueryNoLimit) { (query, samples, deletedObjects, newAnchor, error) in
                // Process the samples here
                for sample in samples! {
                    let dataset = sample as! HKQuantitySample
                    let set = dataset.quantity.doubleValue(for: .count())
                    let sd = dataset.startDate.formatted(date: .numeric, time: .standard).description
                    let MT = dataset.endDate.formatted(date: .numeric, time: .standard).description
                    let de = dataset.device?.model
                    publicDS.DailySteps.append(StepCountDataSet(Value: set, StartTime: sd, EndTime: MT, Device: de ?? "Error"))
                }
                print("Step Samples Collected: \(publicDS.DailySteps.count)")
            }
            self.healthStore.execute(query)
            }
        }
    }
    
    func CollectMovementDistance() {
        let read = Set([HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!])
        let share = Set([HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!])
        healthStore.requestAuthorization(toShare: share, read: read) { (chk, error) in if chk {
            guard let sampleType = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning) else {
                return  }
            let startDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date())
            let anchor = HKQueryAnchor.init(fromValue: Int(HKAnchoredObjectQueryNoAnchor))
            let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
//            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
            let query = HKAnchoredObjectQuery(type: sampleType, predicate: predicate, anchor: anchor, limit: HKObjectQueryNoLimit) { (query, samples, deletedObjects, newAnchor, error) in
                // Process the samples here
                for sample in samples! {
                    let dataset = sample as! HKQuantitySample
                    let set = dataset.quantity.doubleValue(for: .meter())
                    let sd = dataset.startDate.formatted(date: .numeric, time: .standard).description
                    let MT = dataset.endDate.formatted(date: .numeric, time: .standard).description
                    let de = dataset.device?.model
                    publicDS.StepDistance.append(StepDistanceDataSet(Value: set, StartTime: sd, EndTime: MT, Device: de ?? "Error"))
                }
                print("Step Samples Collected: \(publicDS.StepDistance.count)")
            }
            self.healthStore.execute(query)
            }
        }
    }
    
//MARK: SLEEP DURATION TRACKER - HOURS PER DAY & START SLEEP AND END SLEEP TIME
    func getSleepAnalysis() {
        let read = Set([HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!])
        let share = Set([HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!])
        healthStore.requestAuthorization(toShare: share, read: read) { (chk, error) in if chk {
            guard let sampleType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
                return
            }
            let startDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date())
            let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
            let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]) {(sample,result,error) in guard error == nil else {
                return
            }
                
                let dataset = result! as! [HKCategorySample]
                for i in dataset.indices {
                    let sd = dataset[i].startDate
                    let ed = dataset[i].endDate
                    let duration = ed.timeIntervalSince(sd)
                    let source = dataset[i].sourceRevision.productType?.description
                    let sleeptime = Double(duration/60)
                    publicDS.saDS.append(SleepAnalysis(Duration: sleeptime,SleepType: dataset[i].description[36 ... 38], SleepTime: sd.formatted(date: .numeric, time: .shortened), WakeTime: ed.formatted(date: .numeric, time: .shortened), Device: source!))

                }
                print("Sleep Analysis Samples Collected: \(publicDS.saDS.count)")
            }
            self.healthStore.execute(query)
        }
    }
}
    
    func getMoveTime() {
        let standingTimeType = HKObjectType.quantityType(forIdentifier: .appleMoveTime)!

        let now = Date()
        let startDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: now, options: .strictStartDate)

        let query = HKSampleQuery(sampleType: standingTimeType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
            // process the standing time samples here
            let dataset = samples as! [HKQuantitySample]
            for i in dataset.indices {
                let StandTime = dataset[i].quantity.doubleValue(for: .minute())
                let sd = dataset[i].startDate.formatted(date: .numeric, time: .standard).description
                let ed = dataset[i].endDate.formatted(date: .numeric, time: .standard).description
                print("\(StandTime) / \(sd) / \(ed)")
            }
        }

        HKHealthStore().execute(query)

    }
    
    func getExerciseTime() {
        let standingTimeType = HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!

        let now = Date()
        let startDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: now, options: .strictStartDate)

        let query = HKSampleQuery(sampleType: standingTimeType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
            // process the standing time samples here
            let dataset = samples! as! [HKQuantitySample]
            for i in dataset.indices {
                let StandTime = dataset[i].quantity.doubleValue(for: .minute())
                let sd = dataset[i].startDate.formatted(date: .numeric, time: .standard).description
                let ed = dataset[i].endDate.formatted(date: .numeric, time: .standard).description
                print("\(StandTime) / \(sd) / \(ed)")
            }
        }

        HKHealthStore().execute(query)

    }
    
    func getStandTime() {
        let standingTimeType = HKObjectType.quantityType(forIdentifier: .appleStandTime)!
        let now = Date()
        let startDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: now, options: .strictStartDate)
        let query = HKSampleQuery(sampleType: standingTimeType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
            // process the standing time samples here
            let dataset = samples as! [HKQuantitySample]
            for i in dataset.indices {
                let StandTime = dataset[i].quantity.doubleValue(for: .second())
                let sd = dataset[i].startDate.formatted(date: .numeric, time: .standard).description
                let ed = dataset[i].endDate.formatted(date: .numeric, time: .standard).description
                publicDS.DailyStandTime.append(DailyStandTime(Duration: StandTime, StartTime: sd, EndTime: ed))
            }
            print("Standing Time Samples Collected: \(publicDS.DailyStandTime.count)")
        }
        HKHealthStore().execute(query)
    }
    
    func getrestingHR(){
        let heartRateType = HKObjectType.quantityType(forIdentifier: .restingHeartRate)!
        let now = Date()
        let startOfDay = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        let query = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
            // process the resting heart rate samples here
            let dataset = samples! as! [HKQuantitySample]
            for i in dataset.indices {
                let RHR = dataset[i].quantity.doubleValue(for: HKUnit(from: "count/s"))
                let SStart = dataset[i].startDate
                let SDuration = dataset[i].endDate.timeIntervalSince(SStart)
                let SEnd = dataset[i].endDate
                publicDS.RestingHeartRate.append(RHRDataSet(Value: RHR*60, StartTime: SStart.formatted(), EndTime: SEnd.formatted(), Duration: SDuration))
            }
            print("RHR Samples Collected: \(publicDS.RestingHeartRate.count)")
        }
        HKHealthStore().execute(query)
    }
}

