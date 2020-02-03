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
    @IBOutlet weak var label: UILabel!
    
    
    func networkStuff(){
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?

        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
                                           "192.168.0.14" as CFString,
                                           1488,
                                           &readStream,
                                           &writeStream)
        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()
        inputStream.schedule(in: .current, forMode: .common)
        outputStream.schedule(in: .current, forMode: .common)
        inputStream.open()
        outputStream.open()
        DispatchQueue.global(qos: .background).async {
                DispatchQueue.main.async {
                    self.listenServer()
                }
        }
    }

    func listenServer(){
        self.label.text = "ну нихуя себе..."
        while true{
        var buffer = [UInt8](repeating: 0, count: 1024)
        let nBytes: Int = inputStream!.read(&buffer, maxLength: buffer.count)              //Read from inStream into buffer
        let bufferStr = NSString(bytes: &buffer, length: nBytes, encoding: String.Encoding.utf8.rawValue)
        print(1)
        if  bufferStr != nil{
                print("Read: " + (bufferStr! as String))
            self.label.text = bufferStr! as String
        }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        networkStuff()
        print(228)
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
