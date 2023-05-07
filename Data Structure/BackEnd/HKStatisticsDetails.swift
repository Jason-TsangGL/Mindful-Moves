/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An extension that adds detail string support to statistics objects.
*/

import HealthKit

extension HKStatistics: Detailable {
    
    // You use summaryString to provide a summary of the statistics.
    var summaryString: String {
        // You can use beats per minute (BPM) as the unit for heart rate.
        let BPM = HKUnit(from: "count/min")
        
        if let averageQuantity = self.averageQuantity() {
            return "\(Int(averageQuantity.doubleValue(for: BPM))) BPM"
        }
        return "Average: nil BPM"
    }
    
    // You use overviewStrings to provide overview information about the statistics.
    // You can choose any properties on the statistics object for the overview.
    var overviewStrings: [String] {
        var overviewItems: [String] = [HKQuantityTypeIdentifier.heartRate.rawValue]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_US")
        
        overviewItems.append("Start: \(dateFormatter.string(from: self.startDate))")
        overviewItems.append("End:   \(dateFormatter.string(from: self.endDate))")
        
        let BPM = HKUnit(from: "count/min")
        
        if let averageQuantity = self.averageQuantity() {
            overviewItems.append("Average: \(Int(averageQuantity.doubleValue(for: BPM))) BPM")
        }
        if let minimumQuantity = self.minimumQuantity() {
            overviewItems.append("Minimum: \(Int(minimumQuantity.doubleValue(for: BPM))) BPM")
        }
        if let maximumQuantity = self.maximumQuantity() {
            overviewItems.append("Maximum: \(Int(maximumQuantity.doubleValue(for: BPM))) BPM")
        }
        
        return overviewItems
    }
    
    // Use this utility function to get a detail string from an HKQuantity and DateInterval.
    func heartRateDetailsString(quantity: HKQuantity, dateInterval: DateInterval) -> String {
        let BPM = HKUnit(from: "count/min")
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_US")
        
        return "\(dateFormatter.string(from: dateInterval.start)) \(Int(quantity.doubleValue(for: BPM))) BPM"
    }
    
    // You use this function to provide detailStrings for the statistics.
    func getDetailStrings(_ healthStore: HKHealthStore, with completion: @escaping ([String]) -> Void) {
        var details: [String] = []
        
        // First you construct a predicate for the quantity samples you want to enumerate.
        // In this case you can use the statistics startDate and endDate to construct a predicate.
        let predicate = HKQuery.predicateForSamples(withStart: self.startDate, end: self.endDate, options: [])
        
        // Instantiate the query with the statistics quantityType and the predicate you created.
        let query = HKQuantitySeriesSampleQuery(quantityType: self.quantityType, predicate: predicate) {
            (query, quantity, dateInterval, sample, done, error) in
            
            guard let quantity = quantity, let dateInterval = dateInterval else {
                // Handle errors during query enumeration
                fatalError("Error during query: \(String(describing: error))")
            }
            
            // Append the detailsString for the quantity and dateInterval to your details array.
            details.append(self.heartRateDetailsString(quantity: quantity, dateInterval: dateInterval))
            if done == true {
                // Once the enumeration is done, you can call the function's completion closure.
                completion(details)
            }
        }
        
        // Execute your query on healthStore
        healthStore.execute(query)
    }
}
