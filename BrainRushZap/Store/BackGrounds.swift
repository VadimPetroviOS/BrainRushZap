//
//  BackGrounds.swift
//  BrainRushZap
//
//  Created by Вадим on 03.05.2023.
//

import UIKit

class StoreData {
    var backGround: String
    var nameButton: String
    
    init(backGround: String, nameButtonKey: String) {
        self.backGround = backGround
        self.nameButton = (UserDefaults.standard.object(forKey: nameButtonKey) as? String)!
    }
}

