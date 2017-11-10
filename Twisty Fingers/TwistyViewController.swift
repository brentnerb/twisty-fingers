//
//  ViewController.swift
//  Twisty Fingers
//
//  Created by Brent Morgan on 11/9/17.
//  Copyright © 2017 Brent Morgan. All rights reserved.
//

import UIKit
import AudioToolbox

@IBDesignable
class TwistyViewController: UIViewController {
    
    var player1 = Hand()
    var player2 = Hand()
    var turn = 0

    @IBOutlet weak var red1: UIButton!
    @IBOutlet weak var blue1: UIButton!
    @IBOutlet weak var yellow1: UIButton!
    @IBOutlet weak var green1: UIButton!
    
    @IBOutlet weak var red2: UIButton!
    @IBOutlet weak var blue2: UIButton!
    @IBOutlet weak var yellow2: UIButton!
    @IBOutlet weak var green2: UIButton!
    
    @IBOutlet weak var red3: UIButton!
    @IBOutlet weak var blue3: UIButton!
    @IBOutlet weak var yellow3: UIButton!
    @IBOutlet weak var green3: UIButton!
    
    @IBOutlet weak var red4: UIButton!
    @IBOutlet weak var blue4: UIButton!
    @IBOutlet weak var yellow4: UIButton!
    @IBOutlet weak var green4: UIButton!
    
    @IBOutlet weak var red5: UIButton!
    @IBOutlet weak var blue5: UIButton!
    @IBOutlet weak var yellow5: UIButton!
    @IBOutlet weak var green5: UIButton!
    
    @IBOutlet weak var red6: UIButton!
    @IBOutlet weak var blue6: UIButton!
    @IBOutlet weak var yellow6: UIButton!
    @IBOutlet weak var green6: UIButton!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        red1.layer.cornerRadius = 50
        blue1.layer.cornerRadius = 50
        yellow1.layer.cornerRadius = 50
        green1.layer.cornerRadius = 50
        
        red2.layer.cornerRadius = 50
        blue2.layer.cornerRadius = 50
        yellow2.layer.cornerRadius = 50
        green2.layer.cornerRadius = 50
        
        red3.layer.cornerRadius = 50
        blue3.layer.cornerRadius = 50
        yellow3.layer.cornerRadius = 50
        green3.layer.cornerRadius = 50
        
        red4.layer.cornerRadius = 50
        blue4.layer.cornerRadius = 50
        yellow4.layer.cornerRadius = 50
        green4.layer.cornerRadius = 50
        
        red5.layer.cornerRadius = 50
        blue5.layer.cornerRadius = 50
        yellow5.layer.cornerRadius = 50
        green5.layer.cornerRadius = 50
        
        red6.layer.cornerRadius = 50
        blue6.layer.cornerRadius = 50
        yellow6.layer.cornerRadius = 50
        green6.layer.cornerRadius = 50
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonTouched(_ sender: UIButton) {
        
        print("Button Down: \(sender.tag)")
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
    }
    
    @IBAction func buttonReleased(_ sender: UIButton) {
        
        print("Released: \(sender.tag)")
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))

    }
    
    @IBAction func spin(_ sender: Any) {
        
        turn += 1
        
        let color = arc4random_uniform(4)
        let finger = arc4random_uniform(5)
        
        var output = ""
        
        switch color {
        case 0:
            output += "Red "
        case 1:
            output += "Blue "
        case 2:
            output += "Yellow "
        case 3:
            output += "Green "
        default:
            output += ""
        }
        
        switch finger {
        case 0:
            output += "Thumb"
        case 1:
            output += "1st finger"
        case 2:
            output += "2nd finger"
        case 3:
            output += "ring finger"
        case 4:
            output += "pinky"
        default:
            "toe"
        }
        
        infoLabel.text = output
    }
    
    
}

















