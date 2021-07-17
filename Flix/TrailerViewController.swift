//
//  TrailerViewController.swift
//  Flix
//
//  Created by Edidiong Ekong on 17/07/2021.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate{

    var trailerId = String()
        
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self

        let url = URL(string: "https://api.themoviedb.org/3/movie/" + self.trailerId + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movie = dataDictionary["results"] as! [[String:Any]]
                let key =   movie[0]["key"] as! String
                
                let eUrl = URL(string: "https://www.youtube.com/watch?v=" + key)!
                let req = URLRequest(url: eUrl)
                self.webView.load(req)

             }
        }
        task.resume()
    

        // Do any additional setup after loading the view.
    }
    

    
//    override func loadView() {
//           let webConfiguration = WKWebViewConfiguration()
//           webView = WKWebView(frame: .zero, configuration: webConfiguration)
//           webView.uiDelegate = self
//           view = webView
//       }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
