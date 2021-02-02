//
//  ViewController.swift
//  HelloFileManager
//
//  Created by ido on 2021/02/01.
//

import UIKit

class ViewController: UIViewController {

    var launchSet = [Launch]()
    let menu = "Menu.plist"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveMenu(_ sender: UIButton) {
        let main = mainDish.text ?? ""
        let apetizer = self.apetizer.text ?? ""
        let dessert = self.dessert.text ?? ""
        let beverage = self.beverage.text ?? ""
        let chosenApetizer = option(apetizer)
        let chosenDessert = option(dessert)
        let chosenBeverage = option(beverage)
        let launch = Launch(getApetizer: chosenApetizer, getDessert: chosenDessert, getBeverage: chosenBeverage, main: main, apetizer: apetizer, dessert: dessert, beverage: beverage)
        launchSet.append(launch)
        Storage.store(launchSet, as: menu)
    }
    
    func option(_ choose: String) -> Bool {
        if choose == "" {
            return false
        } else {
            return true
        }
    }
    
    @IBAction func loadMenu(_ sender: UIButton) {
        launchSet = Storage.retrive(launchSet, from: menu, as: [Launch].self) ?? []
        print("Someone order \(launchSet)")
    }
    
    @IBOutlet weak var mainDish: UITextField!
    @IBOutlet weak var apetizer: UITextField!
    @IBOutlet weak var dessert: UITextField!
    @IBOutlet weak var beverage: UITextField!
    
}

struct Launch: Codable {
    var getApetizer: Bool
    var getDessert: Bool
    var getBeverage: Bool
    var main: String
    var apetizer: String
    var dessert : String
    var beverage: String
}
