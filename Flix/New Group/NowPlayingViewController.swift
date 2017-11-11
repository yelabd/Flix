//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Youssef Elabd on 11/10/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NowPlayingViewController: UIViewController {
    
    
    
    let baseURL = "https://api.themoviedb.org/3/movie/"
    let apiKey = "d47f9b3e5df8cfa4bf8683444da0c6d9"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovies()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMovies(){
        let url = baseURL + "now_playing?api_key="+apiKey
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.error{
                print(error.localizedDescription)
            }
            
            guard let value = response.result.value else {
                return
            }
            
            let json = JSON(value)
            
            let movies = json["results"].arrayValue
            
            for movie in movies {
                print(movie["title"].stringValue)
            }
            
            
        }
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension NowPlayingViewController: UITableViewDelegate, UITableViewDataSource {
//
//}

