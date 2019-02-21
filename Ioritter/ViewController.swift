//
//  ViewController.swift
//  Ioritter
//
//  Created by 川岸樹奈 on 2019/02/18.
//  Copyright © 2019年 juna.Kawagishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var UserIDTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func GoButtonTapped(){
        performSegueToTimeline()
    }

    func performSegueToTimeline(){
        performSegue(withIdentifier: "toTimeline", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTimeline" {
            let timelineViewController = segue.destination as! TimelineViewController
            timelineViewController.UserID = self.UserIDTextField?.text
        }
    }
}

