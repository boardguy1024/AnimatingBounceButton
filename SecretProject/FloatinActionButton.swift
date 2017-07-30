//
//  FloatinActionButton.swift
//  SecretProject
//
//  Created by park kyung suk on 2017/06/11.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import UIKit

class FloatinActionButton: UIButtonX {
    
    // ボタンがタップした際に呼び出される（ここにボタンのアニメーションを加えるd）
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        UIView.animate(withDuration: 0.3) {
            
            if self.transform == .identity {
                self.transform = CGAffineTransform(rotationAngle: 135 * CGFloat(Double.pi / 180))
                //ボタン色をやや暗くする
                self.backgroundColor = #colorLiteral(red: 0.8392, green: 0.4118, blue: 0.6275, alpha: 1) /* #d669a0 */
            } else {
                //ボアン色をもどす
                self.backgroundColor = #colorLiteral(red: 0.9725, green: 0.4745, blue: 0.7176, alpha: 1) /* #f879b7 */
                self.transform = .identity
            }

        }
        return super.beginTracking(touch, with: event)

        
    }
}
