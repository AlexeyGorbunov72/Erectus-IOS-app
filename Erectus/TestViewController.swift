//
//  TestViewController.swift
//  Erectus
//
//  Created by Alexey on 03/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit
import RealmSwift
import CoreData

class TestViewController: UIViewController {

    var inputStream: InputStream!
    var outputStream: OutputStream!
    @IBOutlet weak var labelField: UILabel!
    
    
    func networkStuff(){
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?

        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
                                           "192.168.0.14" as CFString,
                                           1494,
                                           &readStream,
                                           &writeStream)
        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()
        inputStream.schedule(in: .current, forMode: .common)
        outputStream.schedule(in: .current, forMode: .common)
        inputStream.open()
        outputStream.open()
    }
    
    func listenServer(){
        print(3)
        while true{
            print(555)
            var buffer = [UInt8](repeating: 0, count: 1024)
            let nBytes: Int = inputStream!.read(&buffer, maxLength: buffer.count)              //Read from inStream into buffer
            let bufferStr = NSString(bytes: &buffer, length: nBytes, encoding: String.Encoding.utf8.rawValue)
            
            let 💩 = "💩"
            //print(💩)
            print(1)

            if  bufferStr != nil{
                print("Read: " + (bufferStr! as String))
                DispatchQueue.main.async {
                        self.labelField.text = bufferStr! as String
                }
                
                
        }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
