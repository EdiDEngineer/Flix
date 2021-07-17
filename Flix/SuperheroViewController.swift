//
//  SuperheroViewController.swift
//  Flix
//
//  Created by Edidiong Ekong on 16/07/2021.
//

import UIKit

class SuperheroViewController: UIViewController {

    @IBOutlet weak var backdropview: UIImageView!
    var movie : [String:Any]!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        titleLabel?.text = title
        synopsisLabel?.text = synopsis
        posterView.af.setImage(withURL: posterUrl)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)!
        backdropview.af.setImage(withURL: backdropUrl)
        // Do any additional setup after loading the view.

        backdropview.isUserInteractionEnabled = true
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        let viewController  = segue.destination as! TrailerViewController
        viewController.trailerId = String(movie["id"] as! Int)
    }
   

}
