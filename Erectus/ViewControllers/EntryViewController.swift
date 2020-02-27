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
                self.server.senderServer()
                self.server.networkStuff()
                self.server.listenServer()
            }
    }
    override func viewDidAppear(_ animated: Bool) {
        let chatBoardController = storyboard?.instantiateViewController(withIdentifier: "tapBar") as! TabBarViewController
        chatBoardController.modalPresentationStyle = .fullScreen
        present(chatBoardController, animated: false, completion: nil)
    }
}
