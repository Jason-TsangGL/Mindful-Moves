/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A collection view controller that displays charts for mobility health data.
//*/
//
//import UIKit
//import HealthKit
//
///// A representation of health data related to mobility.
//class ParticipantDataViewController: DataTypeCollectionViewController {
//
//    
//    let calendar: Calendar = .current
//    
//    
//    var mobilityContent: [String] = [
//        HKQuantityTypeIdentifier.stepCount.rawValue,
//        HKQuantityTypeIdentifier.distanceWalkingRunning.rawValue,
//        HKQuantityTypeIdentifier.activeEnergyBurned.rawValue,
//        HKQuantityTypeIdentifier.basalEnergyBurned.rawValue,
//        HKQuantityTypeIdentifier.appleExerciseTime.rawValue,
//        HKQuantityTypeIdentifier.appleMoveTime.rawValue,
//        HKQuantityTypeIdentifier.appleStandTime.rawValue,
//        HKQuantityTypeIdentifier.restingHeartRate.rawValue,
//        HKQuantityTypeIdentifier.heartRate.rawValue,
//        HKQuantityTypeIdentifier.walkingHeartRateAverage.rawValue,
//        HKObjectType.activitySummaryType().identifier,
//        HKCategoryTypeIdentifier.sleepAnalysis.rawValue,
//        HKObjectType.workoutType().identifier,
//        HKSeriesType.heartbeat().identifier
//        
//    ]
//    
//    
//    var queries: [HKAnchoredObjectQuery] = []
//    
//    // MARK: - View Life Cycle.
//    
//    override func viewDidLoad() {
//        
//        
//        data = mobilityContent.map { ($0, []) }
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        
//        // Authorization
//        if !queries.isEmpty { return }
//        
//        HealthData.requestHealthDataAccessIfNeeded(dataTypes: mobilityContent) { (success) in
//            if success {
//                self.setUpBackgroundObservers()
//            }
//        }
//    }
//    
//    // MARK: - Data Functions
//    
//    func loadData() {
//        performQuery {
//
//        }
//    }
//    
//    func setUpBackgroundObservers() {
//        data.compactMap { getSampleType(for: $0.dataTypeIdentifier) }.forEach { (sampleType) in
//            createAnchoredObjectQuery(for: sampleType)
//        }
//    }
//    
//    func createAnchoredObjectQuery(for sampleType: HKSampleType) {
//        // Customize query parameters
//        let predicate = createLastWeekPredicate()
//        let limit = HKObjectQueryNoLimit
//        
//        // Fetch anchor persisted in memory
//        let anchor = HealthData.getAnchor(for: sampleType)
//        
//        // Create HKAnchoredObjecyQuery
//        let query = HKAnchoredObjectQuery(type: sampleType, predicate: predicate, anchor: anchor, limit: limit) {
//            (query, samplesOrNil, deletedObjectsOrNil, newAnchor, errorOrNil) in
//            
//            // Handle error
//            if let error = errorOrNil {
//                print("HKAnchoredObjectQuery initialResultsHandler with identifier \(sampleType.identifier) error: \(error.localizedDescription)")
//                
//                return
//            }
//            
//            print("HKAnchoredObjectQuery initialResultsHandler has returned for \(sampleType.identifier)!")
//            
//            // Update anchor for sample type
//            HealthData.updateAnchor(newAnchor, from: query)
//            
//            Network.push(addedSamples: samplesOrNil, deletedSamples: deletedObjectsOrNil)
//        }
//        
//        // Create update handler for long-running background query
//        query.updateHandler = { (query, samplesOrNil, deletedObjectsOrNil, newAnchor, errorOrNil) in
//            
//            // Handle error
//            if let error = errorOrNil {
//                print("HKAnchoredObjectQuery initialResultsHandler with identifier \(sampleType.identifier) error: \(error.localizedDescription)")
//                
//                return
//            }
//            
//            print("HKAnchoredObjectQuery initialResultsHandler has returned for \(sampleType.identifier)!")
//            
//            // Update anchor for sample type
//            HealthData.updateAnchor(newAnchor, from: query)
//            
//            // The results come back on an anonymous background queue.
//            Network.push(addedSamples: samplesOrNil, deletedSamples: deletedObjectsOrNil)
//            
//        }
//        HealthData.healthStore.execute(query)
//        queries.append(query)
//    }
//    
//    // MARK: Data Functions
//    
//    func performQuery(completion: @escaping () -> Void) {
//        // Create a query for each data type.
//        for (index, item) in data.enumerated() {
//            // Set dates
//            let now = Date()
//            let startDate = getLastWeekStartDate()
//            let endDate = now
//            
//            let predicate = createLastWeekPredicate()
//            let dateInterval = DateComponents(day: 1)
//            
//            // Process data.
//            let statisticsOptions = getStatisticsOptions(for: item.dataTypeIdentifier)
//            let initialResultsHandler: (HKStatisticsCollection) -> Void = { (statisticsCollection) in
//                var values: [Double] = []
//                statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
//                    let statisticsQuantity = getStatisticsQuantity(for: statistics, with: statisticsOptions)
//                    if let unit = preferredUnit(for: item.dataTypeIdentifier),
//                        let value = statisticsQuantity?.doubleValue(for: unit) {
//                        values.append(value)
//                    }
//                }
//                
//                self.data[index].values = values
//                
//                completion()
//            }
//            
//            // Fetch statistics.
//            HealthData.fetchStatistics(with: HKQuantityTypeIdentifier(rawValue: item.dataTypeIdentifier),
//                                       predicate: predicate,
//                                       options: statisticsOptions,
//                                       startDate: startDate,
//                                       interval: dateInterval,
//                                       completion: initialResultsHandler)
//            
//        }
////        let healthStore = HKHealthStore()
////        let sleepType = HKCategoryType(.sleepAnalysis)
////        let allAsleepPredicate = HKCategoryValueSleepAnalysis.asleep
////        
////        let dateRangePredicate = HKQuery.predicateForSamples(withStart: getLastWeekStartDate() , end: Date(), options: .strictStartDate)
////        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [dateRangePredicate, allAsleepPredicate])
////
////        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate) { (query, result, error) in
////            // handle results
////        }
//    }
  //*/*/*/*/*/*/
