//
//  ViewController.swift
//  DQGradientView
//
//  Created by 1137576021@qq.com on 05/11/2021.
//  Copyright (c) 2021 1137576021@qq.com. All rights reserved.
//

import UIKit
import DQGradientView

class ViewController: UIViewController {

    @IBOutlet weak var radialView: DQGradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        radialView.layer.masksToBounds = true
        radialView.layer.cornerRadius = 90.0
        radialView.colors.insert(contentsOf: [UIColor.orange.cgColor, UIColor.yellow.cgColor], at: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

