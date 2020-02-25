//
//  EntryViewController.swift
//  Erectus
//
//  Created by Alexey on 25/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    let server = ServerWorker()
    override func viewDidLoad() {
        super.viewDidLoad()
            let queue = DispatchQueue.global(qos: .userInteractive)
            queue.async {
                self.server.networkStuff()
                self.server.listenServer()
            }
        let chatBoardController = storyboard?.instantiateViewController(withIdentifier: "ChatBoard") as! ChatBoardViewController
        chatBoardController.modalPresentationStyle = .fullScreen
        present(chatBoardController, animated: false, completion: nil)
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
