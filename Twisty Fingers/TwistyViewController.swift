//
//  ViewController.swift
//  Twisty Fingers
//
//  Created by Brent Morgan on 11/9/17.
//  Copyright © 2017 Brent Morgan. All rights reserved.
//

import UIKit
import AudioToolbox     // for vibrating
import AVFoundation     // for system sounds

@IBDesignable
class TwistyViewController: UIViewController {
    
    var player1 = Hand()
    var player2 = Hand()
    var currentPlayer = 1               // by default this will be a 2 player game
    var target = Target()

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
//        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        let colorTouched = sender.tag / 10
        
        if colorTouched == target.color {
            // correct color was selected
            print("good")
            if currentPlayer == 1 {
                switch target.finger! {
                case 0:
                    player1.thumb = target.color
                case 1:
                    player1.firstFinger = target.color
                case 2:
                    player1.secondFinger = target.color
                case 3:
                    player1.ringFinger = target.color
                case 4:
                    player1.pinky = target.color
                default:
                    print("wut")
                }
            } else {
                switch target.finger! {
                case 0:
                    player2.thumb = target.color
                case 1:
                    player2.firstFinger = target.color
                case 2:
                    player2.secondFinger = target.color
                case 3:
                    player2.ringFinger = target.color
                case 4:
                    player2.pinky = target.color
                default:
                    print("wut")
                }
            }
            
            currentPlayer = (currentPlayer == 1 ? 2 : 1)      // switch players....
            
        } else {
            // wrong color was touched
            print("bad")
            AudioServicesPlaySystemSound(1073)  // https://github.com/TUNER88/iOSSystemSoundsLibrary
            flashScreen()
        }
    }
    
    @IBAction func buttonReleased(_ sender: UIButton) {
        
        print("Released: \(sender.tag)")
//        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        let colorReleased = sender.tag / 10
        
        if currentPlayer == 1 {
            switch colorReleased {
            case 0:
                player1.thumb = nil
            case 1:
                player1.firstFinger = nil
            case 2:
                player1.secondFinger = nil
            case 3:
                player1.ringFinger = nil
            case 4:
                player1.pinky = nil
            default:
                print("wut")
            }
        } else {
            switch target.finger! {
            case 0:
                player2.thumb = nil
            case 1:
                player2.firstFinger = nil
            case 2:
                player2.secondFinger = nil
            case 3:
                player2.ringFinger = nil
            case 4:
                player2.pinky = nil
            default:
                print("wut")
            }
        }
        
        if colorReleased != target.color {
            print("Finger was lifted too soon!")
            AudioServicesPlaySystemSound(1073)  // https://github.com/TUNER88/iOSSystemSoundsLibrary
            flashScreen()
        }

    }
    
    @IBAction func spin(_ sender: Any) {
        print("\(player1)")
        let color = arc4random_uniform(4)
        let finger = arc4random_uniform(5)
        
        target.finger = Int(finger)
        
        var output = ""
        
        switch color {
        case 0:
            output += "Red "
            target.color = 1
        case 1:
            output += "Blue "
            target.color = 2
        case 2:
            output += "Yellow "
            target.color = 3
        case 3:
            output += "Green "
            target.color = 4
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
    
    func flashScreen() {
        self.view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(unflashScreen), userInfo: nil, repeats: false)
    }
    
    @objc func unflashScreen() {
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
}

















