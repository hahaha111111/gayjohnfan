//
//  ViewController.swift
//  10
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myview2: UIView!
    @IBOutlet var myview: UIView!
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak weakSelf=self](mytimer) in
//            self.myview2.center.x+=20
//        })
    }

    @IBAction func stop(_ sender: Any) {
        
        
        let imageview=UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        imageview.image=UIImage(named: "1")
        UIView.transition(from: myview2, to: imageview, duration: 2, options: .transitionFlipFromRight, completion: nil)
        
//        UIView.transition(with: myview2, duration: 1, options: .transitionCurlUp, animations: {
//            self.myview2.backgroundColor=UIColor.red
//        }, completion: nil)
//
//        timer?.invalidate()
        
//
//        UIView.transition(with: myview2, duration: 1, options: .transitionCurlUp, animations: {
//            self.myview2.backgroundColor=UIColor.red
//
//        }, completion: nil)
        
        
        
//        UIView.animate(withDuration: 2, delay: 1, options: [.curveEaseIn], animations: {
////            self.myview2.alpha=0
////            self.myview2.center.x=self.view.bounds.width
////            self.myview2.backgroundColor=UIColor.green
////            self.myview2.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.5, y: 0.5)
//            self.myview2.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            self.myview2.transform=CGAffineTransform.identity
//            self.myview2.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            self.myview2.transform=CGAffineTransform.identity
//            self.myview2.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            self.myview2.transform=CGAffineTransform.identity
//            self.myview2.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            self.myview2.transform=CGAffineTransform.identity
//            self.myview2.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            self.myview2.transform=CGAffineTransform.identity
//            self.myview2.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            self.myview2.transform=CGAffineTransform.identity
//
//        }) { (finished) in
//            self.myview2.removeFromSuperview()
//        }
//        }
    }

}
