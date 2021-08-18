//
//  NetworkViewController.swift
//  client-server-1436
//
//  Created by zeons on 15.08.2021.
//

import UIKit
import Alamofire

class NetworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        firstRequest()
    }

    func firstRequest(){
        guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1") else {return}
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) {(data, response, error) in
        let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            print(json as Any)
        }
        task.resume()
    }
    
    func secondRequest(){
        
    }
    
    func thirdRequest(){
        
    }
    
}
