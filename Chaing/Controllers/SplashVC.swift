//
//  SplashVC.swift
//  Gron
//
//  Created by Bharat Shankar on 30/04/20.
//  Copyright © 2020 Bharat Shankar. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            Navigation.navigateTo(screen: UserDefaultConfig.AppState)
        }
        
    }
    
}
