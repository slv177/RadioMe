//
//  CenterViewController.swift
//  RadioMe
//
//  Created by SS on 30/12/2018.
//  Copyright © 2018 SS. All rights reserved.
//

import UIKit
import FRadioPlayer

class CenterViewController: UIViewController, FRadioPlayerDelegate {
    
    let player = FRadioPlayer.shared

    var menuItem: MenuItem! {
        didSet {
            title = menuItem.title
            view.backgroundColor = menuItem.color
            symbol.text = menuItem.symbol
        }
    }
    
    @IBOutlet weak var symbol: UILabel!
    @IBAction func playButton(_ sender: UIButton) {
        player.togglePlaying()
        player.isPlaying ? sender.setTitle("☐", for: .normal) : sender.setTitle("▷", for: .normal)
    }
    
    // MARK: ViewController
    
    var menuButton: MenuButton!
    var initialStreamingUrl = MenuItem.sharedItems.first!.streamingUrl
    var initialStationTitle = MenuItem.sharedItems.first!.title
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player.delegate = self
        player.radioURL = URL(string: initialStreamingUrl)
        
        menuButton = MenuButton()
        menuButton.tapHandler = {
            if let containerVC = self.navigationController?.parent as? ContainerViewController {

                containerVC.toggleSideMenu()
            }
        self.player.radioURL = URL(string: self.menuItem.streamingUrl)

        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        menuItem = MenuItem.sharedItems.first!

    }
    
    
    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {
    }
    
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {
    }

}
