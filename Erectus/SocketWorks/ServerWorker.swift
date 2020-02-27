//
//  ServerWorker.swift
//  Erectus
//
//  Created by Alexey on 22/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ServerWorker{
    var inputStream: InputStream!
    var outputStream: OutputStream!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func networkStuff(){
       var readStream: Unmanaged<CFReadStream>?
       var writeStream: Unmanaged<CFWriteStream>?

       
       CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
                                          "192.168.43.2" as CFString,
                                          1489,
                                          &readStream,
                                          &writeStream)
       inputStream = readStream!.takeRetainedValue()
       outputStream = writeStream!.takeRetainedValue()
       inputStream.schedule(in: .current, forMode: .common)
       outputStream.schedule(in: .current, forMode: .common)
       inputStream.open()
       outputStream.open()
   }
    func senderServer(){
        DispatchQueue.main.async {
            NotificationCenter.default.addObserver(self, selector: #selector(self.prepareMessages(notification:)), name: Notification.Name.NSManagedObjectContextWillSave, object: nil)
        }
    }
    @objc func prepareMessages(notification: Notification){
            
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Messages")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "(isIncoming == false) AND (isHandle == false)")
        request.sortDescriptors = [NSSortDescriptor(key: "dateTime", ascending: false)]
        let result = try! self.context.fetch(request)
        if result.count == 0{
            return
        }
        for data in result as! [NSManagedObject]{
            data.setValue(true, forKey: "isHandle")
            sendMessage(message: data.value(forKey: "text") as! String)
        }
        }
    func sendMessage(message: String){
        
        // a Data value
        let data: Data = Data(bytes: message.utf8);
               _ = data.withUnsafeBytes {
                   outputStream?.write($0, maxLength: data.count)
               }
        
    }
    
    func listenServer(){
        print("Listneer is work!")
       while true{
           var buffer = [UInt8](repeating: 0, count: 1024)
           let nBytes: Int = inputStream!.read(&buffer, maxLength: buffer.count)              //Read from inStream into buffer
           let bufferStr = NSString(bytes: &buffer, length: nBytes, encoding: String.Encoding.utf8.rawValue)

           if  bufferStr != nil{
                let data = Data((bufferStr! as String).utf8)
                
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // try to read out a string array
                        
                        self.saveMessage(text: json["Message"] as! String, chatId: json["ChatID"] as! String)
                        
                        
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
            }
        if bufferStr == ""{
            print("Connection closed")
       }
   }
}
    func saveMessage(text: String, chatId: String){
        DispatchQueue.main.async {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let messages_ = NSEntityDescription.entity(forEntityName: "Messages", in: context)
            let newMessage = NSManagedObject(entity: messages_!, insertInto: context)
            
            newMessage.setValue(chatId, forKey: "chatId")
            newMessage.setValue(true, forKey: "isIncoming")
            newMessage.setValue(text, forKey: "text")
            newMessage.setValue(Date.init(), forKey: "dateTime")
            print("saved...")
            try! context.save()
        }
        
    }
}
