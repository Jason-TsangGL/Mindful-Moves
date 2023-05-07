//
//  UIKitSwiftUIBridge.swift
//
//  Created by Jason Tsang on 2022-11-30.
//

import SwiftUI
import HealthKit
import ResearchKit
import Foundation
import CareKit
import CareKitUI
import HealthKitUI

// MARK: SwiftUI Preview
//----------------------------------
struct CarefeedView: UIViewControllerRepresentable {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    typealias UIViewControllerType = CareFeedViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = CareFeedViewController(storeManager: appDelegate.storeManager)
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
//----------------------------------

//----------------------------------
struct MobilityView: UIViewControllerRepresentable {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    typealias UIViewControllerType = MobilityChartDataViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = MobilityChartDataViewController()
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
//----------------------------------
struct WeekReportView: UIViewControllerRepresentable {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    typealias UIViewControllerType = WeeklyReportTableViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = WeeklyReportTableViewController()
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct LOIViewer: UIViewControllerRepresentable {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    typealias UIViewControllerType = CSEPViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = CSEPViewController()
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct FAQViewer: UIViewControllerRepresentable {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    typealias UIViewControllerType = FAQViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = FAQViewController()
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
