//
//  SelectActionViewController.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 20.08.2021.
//

import UIKit

class SelectActionViewController: UIViewController {
    

    
    
    
    @IBAction func frendsViewActions(_ sender: Any) {
        let FriendsVC = DisplayFrendsTableViewController()
        self.navigationController?.pushViewController(FriendsVC, animated: true)
        
    }
    
    @IBAction func photosViewAction(_ sender: Any) {
        let photosVC = DisplayPhotoViewController()
        self.navigationController?.pushViewController(photosVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
 
    }
    


}
