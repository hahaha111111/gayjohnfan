//
//  CircleView.swift
//  9
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
@IBDesignable
class CircleView: UIView {
    
    
    @IBInspectable var fillcolor:UIColor?
    @IBInspectable var strokecolor:UIColor?

    func setup(){
        let panr=UIPanGestureRecognizer(target: self, action: #selector(pan(recongnizer:)))
        self.addGestureRecognizer(panr)
        let pinchr=UIPinchGestureRecognizer(target: self, action: #selector(pinch(recongnizer:)))
        self.addGestureRecognizer(pinchr)
        let tapr=UITapGestureRecognizer(target: self, action: #selector(tap(recongnizer:)))
        self.addGestureRecognizer(tapr)
        
        tapr.numberOfTouchesRequired=1
        tapr.numberOfTouchesRequired=2
    }
    @objc func tap(recongnizer:UITapGestureRecognizer){
        switch recongnizer.state {
        case .recognized:
            print("double tap")
        default:
            break
        }
    }
    @objc func pan(recongnizer:UIPanGestureRecognizer){
        switch recongnizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation=recongnizer.translation(in: self)
            center.x+=translation.x
            center.y+=translation.y
            recongnizer.setTranslation(.zero, in: self)
        default:
            break
        }
    }
    @objc func pinch(recongnizer:UIPinchGestureRecognizer){
        switch recongnizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size=CGSize(width: bounds.width*recongnizer.scale, height: bounds.height*recongnizer.scale)
            recongnizer.scale=1
        default:
            break
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    override func draw(_ rect: CGRect) {
        let path=UIBezierPath(ovalIn: rect)
        fillcolor?.setFill()
        strokecolor?.setStroke()
        path.fill()
        path.stroke()
    }

}
