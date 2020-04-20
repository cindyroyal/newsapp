//
//  ViewController.swift
//  headline
//
//  Created by Royal, Cindy L on 3/19/20.
//  Copyright © 2020 Royal, Cindy L. All rights reserved.
//

import UIKit
import FirebaseFirestore

var selection:Int = 0
var newsItems = [[String: String]]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //test array of headlines
     var db = Firestore.firestore()
    //var newsItems = ["News 1", "News 2", "News 3"]
    
    //var newsItems = [String]()
    
    @IBOutlet weak var theNews: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = (newsItems[indexPath.row]["post"] as! String)
        return cell!
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selection = indexPath.row
            performSegue(withIdentifier: "TheSegue", sender: self)
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        theNews.delegate = self
        theNews.dataSource = self
        
        db.collection("Posts").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    var documentData = document.data()
                    print (documentData)
                    newsItems.append(documentData as! [String : String])
                }
                self.theNews.reloadData()
            }
        }
    }


}

