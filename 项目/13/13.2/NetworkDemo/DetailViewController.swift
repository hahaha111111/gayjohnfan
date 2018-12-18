//
//  DetailViewController.swift
//  NetworkDemo
//
//  Created by liguiyang on 2018/12/12.
//  Copyright © 2018年 liguiyang. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var person:[String:String]?
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = person?["stuName"]
        genderLabel.text = person?["stuGender"]
        noLabel.text = person?["stuNo"]
        
        if let imagePath = person?["imagePath"] {
            if let url = URL(string: "http://10.0.1.2/\(imagePath)") {
                AF.request(url).responseData { (response) in
                    self.imageView.image = UIImage(data: response.data!)
                }
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
