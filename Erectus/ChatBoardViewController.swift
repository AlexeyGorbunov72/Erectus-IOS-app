//
//  ChatBoardViewController.swift
//  Erectus
//
//  Created by Alexey on 04/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

let usersInChatBoard = ["хуесос бля", "дебил бля", "лох бля"]

class ChatBoardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var chatBoard: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersInChatBoard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatBoard.dequeueReusableCell(withIdentifier: "cellIndentifer", for: indexPath)
        cell.textLabel?.text = usersInChatBoard[indexPath.row]
        return cell
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
