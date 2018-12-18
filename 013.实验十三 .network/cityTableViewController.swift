//
//  cityTableViewController.swift
//  013.实验十三 .network
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 lipan. All rights reserved.
//

import UIKit
import Alamofire
class cityTableViewController: UITableViewController {
    
    let cityURL : String = "http://t.weather.sojson.com/api/weather/city/101270101"
    let City : String = "成都"
    var cityInformation : [String : Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = City
        // Configure the cell...
        return cell
    }
    //解析http://t.weather.sojson.com/api/weather/city/101270101
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = cityURL
        AF.request(url).responseJSON { (response) in
            self.cityInformation = response.value as? [String:Any]
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "CityInformation", sender: self)
            }
            
        }
    }
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //传参数，把cityInformation传给要显示的view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "CityInformation" {
            if let secVC = segue.destination as? ViewController {
                secVC.cityInformation = self.cityInformation
            }
        }
    }
    

}
