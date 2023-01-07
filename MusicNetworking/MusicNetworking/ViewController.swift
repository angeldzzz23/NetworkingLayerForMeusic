//
//  ViewController.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import UIKit

class ViewController: UIViewController {

//    let networkManager = NetworkManager()
    let networkingManager = SpotNetworkingManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        networkingManager.getToken { re, error in
//            print(re)
//        }
        
//        networkManager.logIn(email: "angeldzambrano12@gmail.com", password: "Sheep787") { movie, error in
//            print(movie)
//        }
//
//        networkingManager.getRelatedArtists(artists: ["hah"]) { movie, error in
//            print(movie)
//        }
        
//        networkingManager.getToken { movie, error in
//            print(movie)
//        }
        
//        networkingManager.getRelatedArtists(artist: "790FomKkXshlbRYZFtlgla") { artists, error in
//
//        }
        
        
        networkingManager.getArtists(artists: [""]) { artists, error in
            print(artists)
        }
       

        
        
    }


}

