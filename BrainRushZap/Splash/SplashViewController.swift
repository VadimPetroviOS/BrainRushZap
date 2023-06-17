//
//  SplashViewController.swift
//  BrainRushZap
//
//  Created by Вадим on 28.04.2023.
//

import UIKit
import AVFoundation

final class SplashViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var miniCircleImageView: UIImageView!
    @IBOutlet weak var midleCircleImageView: UIImageView!
    @IBOutlet weak var bigCircleImageView: UIImageView!
    @IBOutlet weak var wheelImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miniCircleImageView.widthAnchor.constraint(equalToConstant: Constants.setSizeY(155)).isActive = true
        miniCircleImageView.heightAnchor.constraint(equalToConstant: Constants.setSizeY(155)).isActive = true
        midleCircleImageView.widthAnchor.constraint(equalToConstant: Constants.setSizeY(245)).isActive = true
        midleCircleImageView.heightAnchor.constraint(equalToConstant: Constants.setSizeY(245)).isActive = true
        bigCircleImageView.widthAnchor.constraint(equalToConstant: Constants.setSizeY(345)).isActive = true
        bigCircleImageView.heightAnchor.constraint(equalToConstant: Constants.setSizeY(345)).isActive = true
        wheelImageView.widthAnchor.constraint(equalToConstant: Constants.setSizeY(90)).isActive = true
        wheelImageView.heightAnchor.constraint(equalToConstant: Constants.setSizeY(90)).isActive = true
        
        self.miniCircleImageView.layer.add(rotationAnimation(2.0, Double.pi * 2.0), forKey: "rotationAnimation")
        self.midleCircleImageView.layer.add(rotationAnimation(3.0, -Double.pi * 2.0), forKey: "rotationAnimation")
        self.bigCircleImageView.layer.add(rotationAnimation(4.0, Double.pi * 2.0), forKey: "rotationAnimation")
        
        let languageValue = self.defaults.object(forKey: "language") ?? "en"
        let soundPlaingValue = self.defaults.object(forKey: "soundPlaing") ?? true
        let valueValue = self.defaults.object(forKey: "value") ?? "0"
        let mainBGValue = self.defaults.object(forKey: "mainBG") ?? "Main BG"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view.window?.rootViewController = UINavigationController(rootViewController: LetsWinViewController(
                language: languageValue as! String,
                soundPlaing: soundPlaingValue as! Bool,
                value: valueValue as! String,
                mainBG: mainBGValue as! String))
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let greenValue = defaults.object(forKey: "GREEN") {
            
        } else {
            defaults.set("GREEN-0", forKey: "GREEN")
        }
        
        if let blueValue = defaults.object(forKey: "BLUE") {
            
        } else {
            defaults.set("BLUE-10", forKey: "BLUE")
        }
        
        if let yellowValue = defaults.object(forKey: "YELLOW") {
            
        } else {
            defaults.set("YELLOW-50", forKey: "YELLOW")
        }
        
        if let redvalue = defaults.object(forKey: "RED") {
            
        } else {
            defaults.set("RED-100", forKey: "RED")
        }
        
        if let greenBlueValue = defaults.object(forKey: "GREEN-BLUE") {
            
        } else {
            defaults.set("GREEN-BLUE-300", forKey: "GREEN-BLUE")
        }
        
        if let yellowRedValue = defaults.object(forKey: "YELLOW-RED") {
            
        } else {
            defaults.set("YELLOW-RED-500", forKey: "YELLOW-RED")
        }
        
        
        
        
        
        
        
    }
    
    fileprivate func rotationAnimation(_ duration: CFTimeInterval, _ angle: Double) -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: angle)
        rotationAnimation.duration = duration
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float.greatestFiniteMagnitude
        return rotationAnimation
    }
    
}
