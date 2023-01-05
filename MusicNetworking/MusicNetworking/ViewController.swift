//
//  ViewController.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import UIKit

class ViewController: UIViewController {

    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.getUser { movie, error in
            print(movie)
        }
    }


}

