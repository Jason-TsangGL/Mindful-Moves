/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view controller that presents detail information about a specified item.
*/

import UIKit
import HealthKit
import CareKit
import ResearchKit
import CareKitUI
import HealthKitUI
import SwiftUI
import CareKitStore



class DetailViewController: OCKListViewController {
    
    
    let healthStore = HKHealthStore()
    
    let storeManager: OCKSynchronizedStoreManager
    
    init(storeManager: OCKSynchronizedStoreManager) {
        self.storeManager = storeManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        

        appendView(UIView(), animated: false)
        let HDView = OCKHeaderView()
        HDView.titleLabel.text = "Health & Fitness Data"
        HDView.titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        HDView.titleLabel.textAlignment = .center
        appendView(HDView, animated: true)
        let HealthDataView = UIHostingController(rootView: HealthDataView())
        appendView(HealthDataView.view, animated: true)
        
//        let painSeries = OCKDataSeriesConfiguration(
//            taskID: TaskIDs.HAMD6,
//            legendTitle: "Sleep Quality (1-10)",
//            gradientStartColor: UIColor.systemRed,
//            gradientEndColor: UIColor.systemRed,
//            markerSize: 10,
//            eventAggregator:
//                    .custom({ events in
//                events
//                    .first?
//                    .answer(kind: Surveys.SocSTHR)
//                ?? 0}))
//        let sleepSeries = OCKDataSeriesConfiguration(
//            taskID: TaskIDs.HAMD6,
//            legendTitle: "Sleep (hours)",
//            gradientStartColor: UIColor.systemBlue,
//            gradientEndColor: UIColor.systemBlue,
//            markerSize: 10,
//            eventAggregator: .custom({ events in
//                events
//                    .first?
//                    .answer(kind: Surveys.SocSTMIN)
//                ?? 0}))
//        
//        let ChartView = OCKHeaderView()
//        ChartView.titleLabel.text = "Sleep Analysis"
//        ChartView.titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
//        ChartView.titleLabel.textAlignment = .center
//        ChartView.detailLabel.text = "Chart 1 Description...."
//        appendView(ChartView, animated: true)
//        
//        let barChart = OCKCartesianChartViewController(
//            plotType: .bar,
//            selectedDate: Date(),
//            configurations: [painSeries, sleepSeries],
//            storeManager: storeManager)
//        
//        appendViewController(barChart, animated: false)
        
        let ChartView2 = OCKHeaderView()
        ChartView2.titleLabel.text = "Activity Summary"
        ChartView2.titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        ChartView2.titleLabel.textAlignment = .center
        ChartView2.detailLabel.text = "Chart 2 Description...."
        
        appendView(ChartView2, animated: false)
//        OCKEventAggregator.custom({events in events
//                print(<#T##items: Any...##Any#>)
//        })
        let rangeSeries = OCKDataSeriesConfiguration(
            taskID: TaskIDs.demographics,
            legendTitle: "Fatigue",
            gradientStartColor: view.tintColor,
            gradientEndColor: view.tintColor,
            markerSize: 3,
            eventAggregator: .custom({ events in
                events
                    .first?
                    .answer(kind: Surveys.HAMDFormAnxiety)
                ?? 0}))
        let scatterChart = OCKCartesianChartViewController(
            plotType: .scatter,
            selectedDate: Date(),
            configurations: [rangeSeries],
            storeManager: storeManager
        )
        appendViewController(scatterChart, animated: false)
        
        appendView(UIView(), animated: false)
    }
}
    
