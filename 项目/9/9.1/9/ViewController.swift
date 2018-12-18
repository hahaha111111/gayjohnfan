//
//  ViewController.swift
//  9
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addlable(_ sender: Any) {
        let x=Int(arc4random())%Int(view.bounds.width)
        let y=Int(arc4random())%Int(view.bounds.height)
        
        let lable = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        lable.text="a"
        lable.textAlignment = .center
        lable.backgroundColor=UIColor.green
        view.addSubview(lable)
        lable.layer.shadowColor=UIColor.gray.cgColor
        lable.layer.shadowOffset=CGSize(width: 5, height: 5)
        lable.layer.shadowOpacity=1
        
        lable.isUserInteractionEnabled=true
        let panr=UIPanGestureRecognizer(target: self, action: #selector(pan(recongnizer:)))
        lable.addGestureRecognizer(panr)    }
    
    @objc func pan(recongnizer:UIPanGestureRecognizer){
        switch recongnizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation=recongnizer.translation(in: self.view)
            recongnizer.view?.center.x+=translation.x
            recongnizer.view?.center.y+=translation.y
            recongnizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
        
    }
    @IBAction func moelable(_ sender: Any) {
        for lable in view.subviews{
            if lable is UILabel{
                UIView.animate(withDuration: 1) {
                    let x=Int(arc4random())%Int(self.view.bounds.width)
                    let y=Int(arc4random())%Int(self.view.bounds.height)
                    
                    lable.center.x=CGFloat(x)
                    lable.center.y=CGFloat(y)
                }
            }
        }
    }
    @IBAction func deletelable(_ sender: Any) {
        for lable in view.subviews{
            if lable is UILabel{
                lable.removeFromSuperview()
            }
        }
    }
}

