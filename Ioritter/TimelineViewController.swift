//
//  TImelineViewController.swift
//  Ioritter
//
//  Created by 川岸樹奈 on 2019/02/18.
//  Copyright © 2019年 juna.Kawagishi. All rights reserved.
//

import UIKit
import Firebase

class TimelineViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var TweetTextField: UITextField!
    @IBOutlet var TimelineTable: UITableView!
    @IBOutlet var UserIDLabel: UILabel!
    var UserID: String?
    
    var TimelineTweetArray: [String] = []
    var TimelineUserIDArray: [String] = []
    var DBRef:DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Firebaseインスタンス生成
        DBRef = Database.database().reference()
        upDateFirebase()
        
        self.TimelineTable.dataSource = self
        
        //xibファイルの描画
        self.TimelineTable.register(UINib(nibName: "TimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimelineTableViewCell")
        
        //ユーザID&投稿部
        TweetTextField.placeholder = "Why don't you change the World?"
        if UserID == "" {
            UserID = "匿メンター"
        }
        UserIDLabel.text = UserID
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.TimelineTweetArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell") as! TimelineTableViewCell
        cell.UserIDLabel.text = self.TimelineUserIDArray[indexPath.row]
        cell.TweetTextLabel.text = self.TimelineTweetArray[indexPath.row]
        return cell
    }
    
    
    func upDateFirebase() {
        
        self.DBRef.child("postID").observe(.childAdded, with: { (snapshot) -> Void in
            self.TimelineUserIDArray.insert(snapshot.childSnapshot(forPath: "username").value as! String, at:0)
            self.TimelineTweetArray.insert(snapshot.childSnapshot(forPath: "tweet").value as! String, at:0)
            self.TimelineTable.reloadData()
        })
        print("nyoki")
    }
    
    
    @IBAction func send(){
        
        if TweetTextField.text != "" {
            let value: [String: Any] = [
                "username": UserID!,
                "tweet": TweetTextField.text!
            ]
            DBRef.child("postID").childByAutoId().setValue(value)
        }else{
            let alert: UIAlertController = UIAlertController(title: "Warning", message: "なんも書いてないで", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("pushed OK")} ))
            present(alert, animated: true, completion: nil)
        }
        TweetTextField.text = ""
        upDateFirebase()
        
    }
    
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }

}
