//
//  ViewController.swift
//  013.实验十三 .network
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 lipan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Dates: UILabel!
    
    @IBOutlet weak var City: UILabel!
    
    @IBOutlet weak var Weather: UILabel!
    
    @IBOutlet weak var AirQuality: UILabel!

    var cityInformation : [String : Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("-----")
        //print(cityInfo as Any)
        // Do any additional setup after loading the view, typically from a nib.
        //日期和城市
        let information1 = cityInformation!["cityInfo"] as! [String : Any]
        City.text = information1["city"] as? String
        Dates.text = (cityInformation!["date"] as! String)
        //天气和空气质量
        let information2 = cityInformation!["data"] as! [String : Any]
        Weather.text = information2["wendu"] as? String
        AirQuality.text = information2["quality"] as? String
    }


}

