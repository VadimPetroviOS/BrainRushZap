//
//  Constants.swift
//  BrainRushZap
//
//  Created by Вадим on 25.05.2023.
//

import UIKit

struct Constants {
    
    static func setSizeX(_ size: CGFloat) -> CGFloat {
        var x: CGFloat = UIScreen.main.bounds.size.width/393
        
        return size * x
    }
    
    static func setSizeY(_ size: CGFloat) -> CGFloat {
        var y: CGFloat = UIScreen.main.bounds.size.height/852
        
        return size * y
    }
    
    static func setSizeZ(_ size: CGFloat) -> CGFloat {
        var y: CGFloat = UIScreen.main.bounds.size.height/896
        if y == 1 {
            y = 10
        }
        
        
        return size * y
    }
}
