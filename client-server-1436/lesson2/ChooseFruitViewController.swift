//
//  ChooseFruitViewController.swift
//  client-server-1436
//
//  Created by zeons on 15.08.2021.
//

// Первый контроллер
import UIKit
//Мы сделали композицию , расширив наш контроллер протоколом
class ChooseFruitViewController: UIViewController, DisplayFruitsTableViewControllerDelegate {


    @IBOutlet var fruitLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    func fruitDidSelect(fruit: String) {
        fruitLabel.text = fruit
    }
    

    //
    @IBAction func choiseFruitAction(_ sender: Any) {
        //Второй контроллер
       // let displayFruitsVC = DisplayFruitsTableViewController()
        DisplayFruitsTableViewController().delegate = self
       //displayFruitsVC.delegate = self
        navigationController?.pushViewController(DisplayFruitsTableViewController(), animated: true)

    }
    
}
