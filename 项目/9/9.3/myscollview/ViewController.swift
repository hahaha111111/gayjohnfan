//
//  ViewController.swift
//  myscollview
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 hahaha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pagecontroller: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...6{
            let imageview=UIImageView(image: UIImage(named: "\(i)"))
            imageview.contentMode = .scaleAspectFit
            imageview.frame=CGRect(x: CGFloat(i-1)*scrollview.bounds .width, y: 0, width: scrollview.bounds.width, height: scrollview.bounds.height)
            scrollview.addSubview(imageview)
            scrollview.isPagingEnabled=true
            
        }
        scrollview.contentSize=CGSize(width: 6*scrollview.bounds.width, height: scrollview.bounds.height)
        scrollview.delegate=self
        
        pagecontroller.numberOfPages=6
        pagecontroller.currentPage=0
        pagecontroller.isUserInteractionEnabled=true
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pagecontroller.currentPage=Int(scrollView.contentOffset.x/scrollView.bounds.width)
    }

    @IBAction func pageclicked(_ sender: UIPageControl) {
        let  rect = CGRect(x: CGFloat(pagecontroller.currentPage)*scrollview.bounds .width, y: 0, width: scrollview.bounds.width, height: scrollview.bounds.height)
        
        scrollview.scrollRectToVisible(rect, animated: true)
    }
}

