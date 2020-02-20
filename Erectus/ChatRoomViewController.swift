//
//  ChatRoomViewController.swift
//  Erectus
//
//  Created by Alexey on 10/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit
import CoreData
class ChatRoomViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    var thisChatId = "228"
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var topBar: UINavigationBar!
    
    let chatCellYour = "yourCell"
    let chatCellFrom = "fromCell"
   
    var messages = [Message]()
    @IBOutlet weak var textField: UITextField!
    @IBAction func tapButtom(_ sender: Any) {
      
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tableView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let messages_ = NSEntityDescription.entity(forEntityName: "Messages", in: context)
        
        let newMessage = NSManagedObject(entity: messages_!, insertInto: context)
        
        newMessage.setValue("хто бля сперма собаки?", forKey: "text")
        newMessage.setValue("228", forKey: "chatId")
        newMessage.setValue(false, forKey: "isIncoming")
        do{
            try context.save()
            print("ну тип сохранил вроде")
        }catch{
            
        }
        self.getData()
        print("len: ")
        print(messages.count)
        tableView.register(ChatMessgesYour.self, forCellReuseIdentifier: chatCellYour)
        tableView.register(ChatMessageFrom.self, forCellReuseIdentifier: chatCellFrom)
        tableView.separatorStyle = .none
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.messages[indexPath.row].isIncoming == true{
            let cell = tableView.dequeueReusableCell(withIdentifier: chatCellFrom, for: indexPath) as! ChatMessageFrom
            cell.messageLabel.text = messages[indexPath.row].text as String
        
            return cell
 
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: chatCellYour, for: indexPath) as! ChatMessgesYour
            cell.messageLabel.text = messages[indexPath.row].text as String
                   
            return cell
        }
 
    }
    func addData(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
 
       

    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Messages")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "chatId == '228'" )
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                messages += [Message.init(text_: data.value(forKey: "text") as! String, dataTime_: "", fromEmail_: "", fromNick_: "", chatId_: "228", isIncoming_: data.value(forKey: "isIncoming") as! Bool)]
            }
        }catch{
            print("бля")
        }
    }
}

