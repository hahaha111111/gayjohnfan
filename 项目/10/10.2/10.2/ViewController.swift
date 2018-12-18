//
//  ViewController.swift
//  10.2
//
//  Created by student on 2018/12/5.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backview: UIView!
    lazy var animator=UIDynamicAnimator(referenceView: self.backview)
    
    let gravety=UIGravityBehavior()
    let collsion=UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animator.addBehavior(gravety)
        animator.addBehavior(collsion)
        
        collsion.translatesReferenceBoundsIntoBoundary=true
    }


    @IBAction func add(_ sender: Any) {
        let width=Int(view.bounds.width/10)
        let randx=Int(arc4random())%Int(view.bounds.width)
        let lable=UILabel(frame: CGRect(x: randx, y: 20, width: width, height: width))
        lable.backgroundColor=UIColor.red
        lable.text="a"
        lable.textAlignment = .center
        backview.addSubview(lable)
        
        gravety.addItem(lable)
        collsion.addItem(lable)
        
    }
    @IBAction func up(_ sender: Any) {
        gravety.gravityDirection=CGVector(dx: 0, dy: -1)
    }
    @IBAction func down(_ sender: Any) {
        gravety.gravityDirection=CGVector(dx: 0, dy: 1)
    }
    @IBAction func left(_ sender: Any) {
        gravety.gravityDirection=CGVector(dx: -1, dy: 0)
    }
    @IBAction func right(_ sender: Any) {
        gravety.gravityDirection=CGVector(dx: 1, dy: 0)
    }

    @IBAction func mydelete(_ sender: Any) {
        for item in backview.subviews{
            if item is UILabel{
                item.removeFromSuperview()
                gravety.removeItem(item)
                collsion.removeItem(item)
            }
            
        }
    }
}

