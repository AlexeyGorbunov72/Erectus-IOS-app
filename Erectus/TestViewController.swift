//
//  TestViewController.swift
//  Erectus
//
//  Created by Alexey on 03/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
   
    var inputStream: InputStream!
    var outputStream: OutputStream!
    @IBOutlet weak var labelField: UILabel!
    
    
    func networkStuff(){
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?

        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
                                           "192.168.0.14" as CFString,
                                           1490,
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
        while true{
            var buffer = [UInt8](repeating: 0, count: 1024)
            let nBytes: Int = inputStream!.read(&buffer, maxLength: buffer.count)              //Read from inStream into buffer
            let bufferStr = NSString(bytes: &buffer, length: nBytes, encoding: String.Encoding.utf8.rawValue)
            if  bufferStr != nil{
                print("Read: " + (bufferStr! as String))
                DispatchQueue.main.async { // Correct
                    self.labelField.text = bufferStr! as String
            }
                
        }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        networkStuff()
        print(228)
        self.labelField.text = "смерть жидам"
        DispatchQueue.main.async {
            self.listenServer()
        }
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
