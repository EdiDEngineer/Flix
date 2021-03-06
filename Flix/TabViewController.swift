//
//  TabViewController.swift
//  Flix
//
//  Created by Edidiong Ekong on 16/07/2021.
//

import UIKit
import AlamofireImage

class TabViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    var superheroMovies = [[String:Any]]()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout  =  collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let width = ( view.frame.size.width -  layout.minimumInteritemSpacing * 2) / 3
        
        layout.itemSize = CGSize(width: width, height: 1.5 * width)
        
        
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.superheroMovies = dataDictionary["results"] as! [[String:Any]]
                self.collectionView.reloadData()
             }
        }
        task.resume()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return superheroMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCellCollectionViewCell", for: indexPath) as! MovieGridCellCollectionViewCell
        
        let movie = superheroMovies[indexPath.item]
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        cell.posterView.af.setImage(withURL: posterUrl)
        
        return cell
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //  Get the new view controller using segue.destination.
         let cell = sender  as! MovieGridCellCollectionViewCell
         let  indexPath = collectionView.indexPath(for: cell)!
         let movie = superheroMovies[indexPath.item]
         
         let viewController  = segue.destination as! SuperheroViewController
         viewController.movie = movie
          //Pass the selected object to the new view controller.
 
     }
     
  

}
