//
//  SingleMovieViewController.swift
//  Flix
//
//  Created by Youssef Elabd on 11/18/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import AlamofireImage

class SingleMovieViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    var movie: Movie? {
        didSet {
            populate()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populate(){
        print(self.movie?.posterPath)
        //self.posterView.af_setImage(withURL: (self.movie?.posterPath)!)
        //self.backdropView.af_setImage(withURL: (self.movie?.backDropPath)!)
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
