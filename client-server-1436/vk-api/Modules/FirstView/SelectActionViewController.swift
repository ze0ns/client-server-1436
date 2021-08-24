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
        
        guard let photosVC = storyboard?.instantiateViewController(withIdentifier: "DisplayPhotoViewController") else {return}
        self.navigationController?.pushViewController(photosVC, animated: true)
    }
    
    @IBAction func groupsViewActions(_ sender: Any) {
        let groupsVC = DisplayGroupsTableViewController()
        self.navigationController?.pushViewController(groupsVC, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
 
    }
    


}
