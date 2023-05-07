//
//  AuthenticationView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-23.
//

import Foundation
import LocalAuthentication
import LocalAuthenticationEmbeddedUI
import UIKit
import HealthKit
 

class AuthenticationView: UIViewController {
    let healthStore = HKHealthStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Biometrics = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        Biometrics.center = view.center
        Biometrics.setTitle("Authorize", for: .normal)
        Biometrics.backgroundColor = .blue
     //   Biometrics.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
  
    }

