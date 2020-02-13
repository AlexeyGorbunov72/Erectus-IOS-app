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

    @IBOutlet weak var topBar: UINavigationBar!
    
    let chatCellYour = "yourCell"
    let chatCellFrom = "fromCell"
    let messages_ = [["12121212", 1], ["13123213213213 234 ", 0]]
    let messages__ = [Message.init(text_: "sasasas as kjdsbf j", dataTime_: "", fromEmail_: "fe fwef ", fromNick_: "dsvjv wvl", chatId_: "121212", isIncoming_: false), Message.init(text_: "fuck fuck fuck fuck fuck fuck fuck fuck fuck fuck fuck fuck fuck ", dataTime_: "", fromEmail_: "", fromNick_: "", chatId_: "", isIncoming_: true), Message.init(text_: "похуй похуй похуй похуй похуй похуй похуй похуй похуй похуй похуй похуй похуй похуй ", dataTime_: "", fromEmail_: "", fromNick_: "", chatId_: "", isIncoming_: false)]
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
            print("Data base is not found!")
        }
        if db != nil{
            print("Data base is found!")
        }
        /*
        guard let stmt = try? db?.prepare("SELECT * FROM messages") else{
            print("Error in SQL-request!")
            return
        }
        
        
        /*
        for row in stmt! {
            print("\(row[0]!)||\(row[1]!)")
        }
 */
 */
            
        
        
        
        tableView.register(ChatMessgesYour.self, forCellReuseIdentifier: chatCellYour)
        tableView.register(ChatMessageFrom.self, forCellReuseIdentifier: chatCellFrom)
        tableView.separatorStyle = .none
        topBar.largeContentTitle = "messages from: " + messages__[0].fromNick
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages__.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messages__[indexPath.row].isIncoming == true{
            let cell = tableView.dequeueReusableCell(withIdentifier: chatCellFrom, for: indexPath) as! ChatMessageFrom
            cell.messageLabel.text = messages__[indexPath.row].text as? String
        
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: chatCellYour, for: indexPath) as! ChatMessgesYour
            cell.messageLabel.text = messages__[indexPath.row].text as? String
                   
            return cell
        }
    }
    

    
    


}
