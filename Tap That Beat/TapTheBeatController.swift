//
//  TapThatBeatController.swift
//  Tap That Beat
//
//  Created by JHartl on 8/10/18.
//  Copyright © 2018 Ecerea. All rights reserved.
//

import UIKit

class TapTheBeatController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var BPMLabel: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    
    //MARK: - Properties
    var timeIntervals: [TimeInterval] = []
    var currentDate: Date?
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tapButton.showsTouchWhenHighlighted = true
        BPMLabel.text = "     "
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        //Steps
        //1. Upon second tap stops current date object and stores TimeInterval. If this is nil, will not execute.
        let now = Date()
        if let timeInterval = currentDate?.timeIntervalSince(now) {
            timeIntervals.append(-timeInterval)
        }
        
        //2. Creates new date object at present time
        currentDate = Date()
        
        //3. When 5 taps have happened, displays calculated BPM in label and resets tapCount.
        if (timeIntervals.count) > 5 {
            let sumArray = timeIntervals.reduce(0, +)
            let averageTime = sumArray / Double(timeIntervals.count)
            let beatsPerMin = 60 / averageTime
            let beatString = String(Int(beatsPerMin))
            BPMLabel.text = "\(beatString) BPM"
            timeIntervals = []
        }
    }
}


