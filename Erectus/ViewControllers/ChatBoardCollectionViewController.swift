//
//  ChatBoardCollectionViewController.swift
//  Erectus
//
//  Created by Alexey on 26/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit
import CoreData
private let reuseIdentifier = "FriendCell"

class ChatBoardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var usersInChatBoard = [FriendItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        navigationItem.title = "Хуесосы бля"
        collectionView.alwaysBounceVertical = true
    self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    collectionView.register(FriendCellCollection.self, forCellWithReuseIdentifier: reuseIdentifier)
     
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chatRoomController = storyboard?.instantiateViewController(withIdentifier: "ChatRoom") as! ChatRoomViewController
        chatRoomController.modalPresentationStyle = .fullScreen
        chatRoomController.thisChatId = usersInChatBoard[indexPath.row].chatId
        present(chatRoomController, animated: true, completion: nil)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return usersInChatBoard.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendCellCollection
        cell.nameLabel.text = usersInChatBoard[indexPath.row].nickName
        cell.messageLabel.text = self.findLastMessage(chatId: usersInChatBoard[indexPath.row].chatId)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
        request.returnsObjectsAsFaults = false
        request.sortDescriptors = [NSSortDescriptor(key: "dateTimeLastMessage", ascending: true)]
        do{
            
            let result = try! context.fetch(request)
            if result.count == 0{
                createTestPerson()
            }
            for date in result as! [NSManagedObject]{
                print(date.value(forKey: "chatID"))
                if date.value(forKey: "dateTimeLastMessage") == nil{
                    continue
                }
                print(date.value(forKey: "nickname"))
                self.usersInChatBoard += [FriendItem.init(chatId_: date.value(forKey: "chatID") as! String, lastMessage_: "HUI", countOfUnreadMessages_: 1, dataTimeLastMessage_: date.value(forKey: "dateTimeLastMessage") as! Date, nickname_: date.value(forKey: "nickname") as! String)]
            }
        }
        
        }
    func getData_(){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
    request.returnsObjectsAsFaults = false
    request.sortDescriptors = [NSSortDescriptor(key: "dateTimeLastMessage", ascending: true)]
    do{
        
        let result = try! context.fetch(request)
        if result.count == 0{
            createTestPerson()
        }
        for date in result as! [NSManagedObject]{
            print(date.value(forKey: "chatID"))
            if date.value(forKey: "dateTimeLastMessage") == nil{
                continue
            }
            print(date.value(forKey: "nickname"))
            self.usersInChatBoard += [FriendItem.init(chatId_: date.value(forKey: "chatID") as! String, lastMessage_: "HUI", countOfUnreadMessages_: 1, dataTimeLastMessage_: date.value(forKey: "dateTimeLastMessage") as! Date, nickname_: date.value(forKey: "nickname") as! String)]
        }
    }
    
    }
    
    func createTestPerson(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let persons_ = NSEntityDescription.entity(forEntityName: "Friend", in: context)
        
        let newPerson = NSManagedObject(entity: persons_!, insertInto: context)
        newPerson.setValue("Test PERSON", forKey: "nickname")
        newPerson.setValue("228", forKey: "chatID")
        newPerson.setValue(Date.init(), forKey: "dateTimeLastMessage")
        newPerson.setValue("hui", forKey: "lastMessage")
        try! context.save()
    }
    func findLastMessage(chatId: String)->String{
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Messages")
        request.sortDescriptors = [NSSortDescriptor(key: "dateTime", ascending: true)]
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "chatId == \(chatId)")
        let result = try! context.fetch(request) as! [NSManagedObject]
        if result.count != 0 && result != nil{
            let lastMessage = result[result.count - 1].value(forKey: "text")
            if lastMessage != nil{
                return lastMessage as! String
            }
            else{
                return ""
            }
        }
        else{
            return ""
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
