//
//  ChatRoomViewController.swift
//  Erectus
//
//  Created by Alexey on 10/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//
/*
 так ебать сделай значит ебать чтоб в бд отправлялось сообщение и нахуй другой поток говна отправлял его на сервер, в общем мы друг друга поняли ебать или придумай попизже что-нибудь а то хуево пиздец так-то дублировать отправленные сообщения нахуй оно надо но лан, может просто класс блять нормально напишешь все оки будет ты долбаеб, и если так то тогда кста добавб параметр statusOfReciving или чот такое чтоб если клиент в офлайне все ок с сообщениями было а то непорядок будет я тебе в рот насру тут уж хуй знает кста мб и норм идея с еще одной таблицей хотя похуй можно просто обработчик сделать для сообщений у который статус false и не ебаться блять. и вообще делай что хочешь ой все иди в пизду
 */
import UIKit
import CoreData
import AVFoundation
class ChatRoomViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    var thisChatId = "228"
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var topBar: UINavigationBar!
    
   
    @IBOutlet var view_: UIView!
    let chatCellYour = "yourCell"
    let chatCellFrom = "fromCell"
    var messages = [Message]()
    var counter = 0
    @IBOutlet weak var textField: UITextField!
    @IBAction func pushBack(_ sender: UIBarButtonItem) {
        let chatBoardController = storyboard?.instantiateViewController(withIdentifier: "tapBar") as! TabBarViewController
               chatBoardController.modalPresentationStyle = .fullScreen
               present(chatBoardController, animated: true, completion: nil)
    }
    @IBAction func tapButtom(_ sender: Any) {
        view.frame.origin.y = 0
        textField.resignFirstResponder()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let messages_ = NSEntityDescription.entity(forEntityName: "Messages", in: context)
        
        let newMessage = NSManagedObject(entity: messages_!, insertInto: context)
        newMessage.setValue(false, forKey: "isIncoming")
        newMessage.setValue(Date.init(), forKey: "dateTime")
        newMessage.setValue(self.thisChatId, forKey: "chatId")
        newMessage.setValue(false, forKey: "isHandle")
        newMessage.setValue(textField.text, forKey: "text")
        textField.text = ""
        try! context.save()
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
       /* let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let messages_ = NSEntityDescription.entity(forEntityName: "Messages", in: context)
        
        let newMessage = NSManagedObject(entity: messages_!, insertInto: context)
        */
        
        
        // listner db
        NotificationCenter.default.addObserver(self, selector: #selector(contextWillSave(_:)), name: Notification.Name.NSManagedObjectContextWillSave, object: nil)
    
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChanged(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        self.getData()
       
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
    @objc func keyboardWillChanged(notification: Notification){
        if notification.name.rawValue == "UIKeyboardWillShowNotification"{
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                view.frame.origin.y = -keyboardRectangle.height
            }
        }
        
    }
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Messages")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "chatId == '\(self.thisChatId)'" )
        request.sortDescriptors = [NSSortDescriptor(key: "dateTime", ascending: true)]
        do{
            let result = try context.fetch(request)
            if (result as! [NSManagedObject]).count == 0{
                return
            }
            let lenCounter = self.counter
            for i in 0...(result as! [NSManagedObject]).count - 1{
                self.counter += 1
                
                let data = (result as! [NSManagedObject])[i]
                messages += [Message.init(text_: data.value(forKey: "text") as! String, dataTime_: "", fromEmail_: "", fromNick_: "", chatId_: data.value(forKey: "chatId") as! String, isIncoming_: data.value(forKey: "isIncoming") as! Bool)]
            }
            self.tableView.reloadData()
            
        }catch{
            print("бля")
        }
           
            
            
       
    }
    @objc func contextWillSave(_ notification: Notification){
        messages = []
        let alertMessage = UIAlertController(title: "Здравствуйте", message:"у вас сообщение" , preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "УРА!", style: .default, handler: nil))
        self.present(alertMessage, animated: true, completion: nil)
        print(notification.name.rawValue)
        self.getData()
    }
}

