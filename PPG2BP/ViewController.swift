//
//  ViewController.swift
//  PPG2BP
//
//  Created by Justin Kim on 11/25/19.
//  Copyright © 2019 Justin Kim. All rights reserved.
//

import UIKit
import HGRippleRadarView

class ViewController: UIViewController {
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var systolic: UILabel!
    @IBOutlet weak var diastolic: UILabel!
    @IBOutlet weak var LineChart: UIView!
    
    @IBOutlet weak var d_text: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func pressHeart(_ sender: Any) {
        let radarView = RippleView(frame: self.view.frame)
        radarView.numberOfCircles = 0
        radarView.animationDuration = 1
        radarView.diskColor = .red
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.d_text.alpha = 1.0
            self.systolic.alpha = 1.0
            self.diastolic.alpha = 1.0
        })
        self.view.addSubview(radarView)
        someBackgroundTask()
    }

    func someBackgroundTask() {
        DispatchQueue.global(qos: DispatchQoS.background.qosClass).async {
            while(true)
            {
                DispatchQueue.main.sync {
                    self.systolic.text = String(Int.random(in: 100..<120))
                    self.diastolic.text = String(Int.random(in: 70..<80))
                }
                sleep(2)
            }

        }
    }
}

