//
//  ChatRoomViewController.swift
//  Erectus
//
//  Created by Alexey on 10/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit
import SQLite
class ChatRoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

   
    let chatCellYour = "yourCell"
    let chatCellFrom = "fromCell"
    let messages_ = [["12121212", 1], ["13123213213213 234 ", 0]]
    var db : Connection?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!

        do {
            db = try Connection("\(path)/Erectus-IOS.db")

        }catch{
            db = nil
        }
        
        
        let messages = Table("messages")
        messages.insert()
        
            do{
                for message in (try db?.prepare(messages))!{
            
            print("YAS")
        }
            
            }catch{
                print("idk")
            }
        
        
        tableView.register(ChatMessgesYour.self, forCellReuseIdentifier: chatCellYour)
        tableView.register(ChatMessageFrom.self, forCellReuseIdentifier: chatCellFrom)
        tableView.separatorStyle = .none
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages_.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatCellFrom, for: indexPath) as! ChatMessageFrom
        cell.messageLabel.text = messages_[indexPath.row][0] as? String
        
        return cell
    }
    

    
    


}
