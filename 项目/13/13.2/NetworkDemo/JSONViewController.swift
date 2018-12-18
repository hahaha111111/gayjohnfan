//
//  JSONViewController.swift
//  NetworkDemo
//
//  Created by liguiyang on 2018/12/12.
//  Copyright © 2018年 liguiyang. All rights reserved.
//

import UIKit
import Alamofire

class JSONViewController: UIViewController {
    
    let url = URL(string: "http://10.0.1.2/piclist.php")!
    var persons:[[String:String]]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loadWithURL(_ sender: Any) {
        if let data = try? Data(contentsOf: url) {
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:String]] {
                self.persons = json
                self.performSegue(withIdentifier: "ShowPersons", sender: self)
            }
        }
    }
    
    @IBAction func loadWithSession(_ sender: Any) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String:String]] {
                self.persons = json
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "ShowPersons", sender: self)
                }
            }
        }
        task.resume()
    }
    @IBAction func loadWithAF(_ sender: Any) {
        AF.request(url).responseJSON { (response) in
            self.persons = response.value as? [[String:String]]
            self.performSegue(withIdentifier: "ShowPersons", sender: self)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowPersons" {
            if let secVC = segue.destination as? PersonsTableViewController {
                secVC.persons = self.persons
            }
        }
    }
    

}
