//
//  ViewController.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import UIKit

class ViewController: UIViewController {

    let networkManager = NetworkManager()
//    let networkingManager = SpotNetworkingManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        networkManager.logIn(email: "angeldzambrano12@gmail.com", password: "Sheep787") { movie, error in
//            print(movie)
//        }
        
        
        
        networkManager.getUser { movie, error in
            print(movie)
        }

        
        
    }


}

