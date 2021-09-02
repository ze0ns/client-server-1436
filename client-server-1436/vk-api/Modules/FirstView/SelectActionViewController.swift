//
//  SelectActionViewController.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 20.08.2021.
//

import UIKit

class SelectActionViewController: UIViewController {
    //Блок работы с друзьями
    var friends: [Friend] = []
    let friendsAPI = FriendsAPI()
    let friendDB = FriendsDB()
    
    //Блок работы с группами
    let groupsAPI = GroupsAPI()
    var groups: [Group] = []
    let groupDB = GroupsDB()
    
    //Блок работы с фотографиями
    let photoAPI = PhotosAPI()
    var photos: [Photo] = []
    let photoDB = PhotoDB()
    
    
    @IBAction func loadDataAction(_ sender: Any) {
        friendDB.addData(friends)
        groupDB.addData(groups)
        photoDB.addData(photos)
  
    }
    
    @IBAction func deletaDataAction(_ sender: Any) {
        friendDB.delete()
    }
    
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
        
        //Загружаем данные из API, друзья
        friendsAPI.getFrends {[weak self]  users in
          self?.friends = users!
          }
        
        //Загружаем данные из API, группы
        groupsAPI.getGroups {[weak self]  users in
            self?.groups = users!
          }
        
        photoAPI.getPhotos {[weak self]  users in
            self?.photos = users!
          }
        
        
 
    }
    


}
