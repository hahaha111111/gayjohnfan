import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    let citise = ["成都": 101270101]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        self.title = "cities"
        
        tableView = UITableView(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let site = "http://t.weather.sojson.com/api/weather/city/101270101"
        let url = URL(string: site)!
        AF.request(url).responseJSON { (response) in
            if let json = try? JSON(data: response.result.value as! Data) {
                let dict = json["weatherinfo"]
                let city = dict["city"].string!
                let temp = dict["temp"].string!
                let wd = dict["WD"].string!
                let ws = dict["WS"].string!
                var weather = "温度: \(temp)\n"
                weather += "风向: \(wd)\n"
                weather += "风力: \(ws)"
                
                let viewController = WeaTherViewController()
                viewController.navTitle = city
                viewController.weather = weather
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            cell?.accessoryType = .disclosureIndicator
        }
        
        cell?.textLabel?.text = Array(citise.keys)[indexPath.row]
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
