//
//  FloatinActionButton.swift
//  SecretProject
//
//  Created by park kyung suk on 2017/06/11.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import UIKit

class FloatinActionButton: UIButtonX {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        UIView.animate(withDuration: 0.3) {
            
            if self.transform == .identity {
                self.transform = CGAffineTransform(rotationAngle: 135 * CGFloat(Double.pi / 180))

            } else {
                self.transform = .identity
            }

        }
        return super.beginTracking(touch, with: event)

        
    }
}
