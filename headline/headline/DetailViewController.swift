//
//  DetailViewController.swift
//  headline
//
//  Created by Royal, Cindy L on 3/21/20.
//  Copyright © 2020 Royal, Cindy L. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var message: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //selects subject text from array based on selection passed from previous controller
        subject.text = newsItems[selection]["post"]
        //selects body text from array based on selection
        message.text = newsItems[selection]["story"]

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
