//
//  EnergyViewController.swift
//  HealthKit~Swift
//
//  Created by EdenLi on 2014/9/17.
//  Copyright (c) 2014年 Darktt Personal Company. All rights reserved.
//

import UIKit
import HealthKit

class EnergyViewController: UITableViewController
{
    var healthStore: HKHealthStore?
    
    // Private class and variables
    private class Energy {
        
        var activeEnergyBurned: Double = 0.0
        var restingEnergyBurned: Double = 0.0
    
    }
    
    private let energyStore: Energy = Energy()
    private var menu: Array<String> = ["Resting Burn", "Active Burn"]
    
    private var energyFormatter: EnergyFormatter {
        
        let energyFormatter = EnergyFormatter()
        energyFormatter.unitStyle = Formatter.UnitStyle.long
        energyFormatter.isForFoodEnergyUse = true
        energyFormatter.numberFormatter.maximumFractionDigits = 2
        
        return energyFormatter
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.refreshStatistics()
        
        NotificationCenter.default.addObserver(self, selector: #selector(EnergyViewController.refreshStatistics), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = self.navigationController?.title
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(EnergyViewController.refreshStatistics), for: .valueChanged)
        
        self.refreshControl = refreshControl
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Actions -

fileprivate extension EnergyViewController
{
    //MARK: - Reading HealthKit Data
    
    @objc
    func refreshStatistics()
    {
        self.refreshControl!.beginRefreshing()
        
        let completion: HKHealthStore.CompletionHandler = {
            
            (mostRecentQuantity, error) -> Void in

            guard mostRecentQuantity != nil else {

                print("Either an error occured fetching the user's height information or none has been stored yet. In your app, try to handle this gracefully.")
                return
            }
            

        }
        
        let BasalEnergyBurnType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!
        let activeEnergyBurnType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        

//            }
            
        self.healthStore?.mostRecentQauntitySampleOfType(activeEnergyBurnType, completion: completion)
//        }

        
        self.healthStore?.mostRecentQauntitySampleOfType(BasalEnergyBurnType, completion: completion)
    }
    

    //MARK: - Convenience
    
    private func predicateForSamplesToday() -> NSPredicate
    {
        let (starDate, endDate): (Date, Date) = self.datesFromToday()
        
        let predicate: NSPredicate = HKQuery.predicateForSamples(withStart: starDate, end: endDate, options: HKQueryOptions.strictStartDate)
        
        return predicate
    }
    
    /// Returns BMR value in kilocalories per day. Note that there are different ways of calculating the
    /// BMR. In this example we chose an arbitrary function to calculate BMR based on weight, height, age,
    /// and biological sex.
//    private func calculateBMRFromWeight(weightInKilograms: Double, height heightInCentimeters: Double, age ageInYears: Int, biologicalSex: HKBiologicalSex) -> Double
//    {
//        var BMR: Double = 0
//
//        if biologicalSex == .male {
//            BMR = 66.0 + (13.8 * weightInKilograms) + (5.0 * heightInCentimeters) - (6.8 * Double(ageInYears))
//
//            return BMR
//        }
//
//        BMR = 655 + (9.6 * weightInKilograms) + (1.8 * heightInCentimeters) - (4.7 * Double(ageInYears))
//
//        return BMR
//    }
    
    private func datesFromToday() -> (Date, Date)
    {
        let calendar = Calendar.current
        
        let nowDate = Date()
        
        let starDate: Date = calendar.startOfDay(for: nowDate)
        let endDate: Date = calendar.date(byAdding: Calendar.Component.day, value: 1, to: starDate)!
        
        return (starDate, endDate)
    }
    
    //MARK: Convert Energy Formatter
    
    private func stringFromJoules(_ joules: Double) -> String
    {
        let stringOfJourle: String = self.energyFormatter.string(fromJoules: joules)
        
        return stringOfJourle
    }
}

// MARK: - Delegate Methods -

extension EnergyViewController
{
    //MARK: #UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int 
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let CellIdentifier: String = "CellIdentifier"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: CellIdentifier)
            cell!.selectionStyle = .none
        }
        
        let title: String = self.menu[indexPath.row]
        var detailText: String? = nil
        
        switch indexPath.row {
            case 0:
            detailText = self.stringFromJoules(self.energyStore.restingEnergyBurned)
            
            case 1:
                detailText = self.stringFromJoules(self.energyStore.activeEnergyBurned)
//
//            case 2:
//                detailText = self.stringFromJoules(self.energyStore.energyConsumed)
//
//            case 3:
//                detailText = self.stringFromJoules(self.energyStore.netEnergy)
//
            default:
                break
        }
        
        cell!.textLabel!.text = title
        cell!.detailTextLabel!.text = detailText
        
        return cell!
    }
}
