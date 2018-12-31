//
//  CenterViewController.swift
//  RadioMe
//
//  Created by SS on 30/12/2018.
//  Copyright © 2018 SS. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {

    var menuItem: MenuItem! {
        didSet {
            title = menuItem.title
            view.backgroundColor = menuItem.color
            symbol.text = menuItem.symbol
        }
    }
    
    @IBOutlet weak var symbol: UILabel!
    
    // MARK: ViewController
    
    var menuButton: MenuButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton = MenuButton()
        menuButton.tapHandler = {
            print(self)
            print(self.parent)
            print(self.parent?.parent)
            if let containerVC = self.navigationController?.parent as? ContainerViewController {
                containerVC.toggleSideMenu()
                print("tapped menu button, in if")
            }
            print("tapped menu button, after if")
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        menuItem = MenuItem.sharedItems.first!
    }

}
