//
//  ViewController.swift
//  SwiftExtensions
//
//  Created by Grigory Avdyushin on 01.06.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.traitCollection.deviceInches == .iphone_3_5_inch {
            // iPhone 3.5" with inches screen
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

