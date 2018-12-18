//
//  firstViewController.swift
//  helloworld_fl
//
//  Created by student on 2018/10/17.
//  Copyright © 2018年 fl. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {
    var lable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.yellow
        
        lable=UILabel(frame:CGRect(x: 100, y: 100, width: 200, height: 100))
        lable.text="hello world"
        lable.textAlignment = .center
        lable.backgroundColor=UIColor.cyan
        lable.center=self.view.center
        self.view.addSubview(lable)
        
        let button = UIButton(frame:CGRect(x: 150, y: 500, width: 100, height: 50))
        button.setTitle("click me", for: .normal)
        button.setTitle("i am happy", for: .highlighted)
        button.setTitleColor(UIColor.red, for: .normal)
        view.addSubview(button)
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(btnclicked), for: .touchUpInside)
        
        self.title="first"
        
    }
    @IBAction func btnclicked(){
        lable.text="i am clicked"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
