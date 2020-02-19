//
//  ChatRoomViewController.swift
//  Erectus
//
//  Created by Alexey on 10/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit
import RealmSwift
class ChatRoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let realm = try! Realm()
    var thisChatId = "228"
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var topBar: UINavigationBar!
    
    let chatCellYour = "yourCell"
    let chatCellFrom = "fromCell"
   
    var messages__ = [Message]()
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func tapButtom(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.bufferMessages = realm.objects(MessageModel.self).filter("chatId == '\(self.thisChatId)'")
        tableView.register(ChatMessgesYour.self, forCellReuseIdentifier: chatCellYour)
        tableView.register(ChatMessageFrom.self, forCellReuseIdentifier: chatCellFrom)
        tableView.separatorStyle = .none
        DispatchQueue.global().async {
            self.addData()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages__.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.messages__[indexPath.row].isIncoming == true{
            let cell = tableView.dequeueReusableCell(withIdentifier: chatCellFrom, for: indexPath) as! ChatMessageFrom
            cell.messageLabel.text = messages__[indexPath.row].text as String
        
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: chatCellYour, for: indexPath) as! ChatMessgesYour
            cell.messageLabel.text = messages__[indexPath.row].text as String
                   
            return cell
        }
    }
    func addData(){
        DispatchQueue.main.async {
            self.messages__ += [Message.init(text_: "TEST", dataTime_: "", fromEmail_: "", fromNick_: "", chatId_: "228", isIncoming_: true)]
            self.tableView.reloadData()
        }
    }
}
