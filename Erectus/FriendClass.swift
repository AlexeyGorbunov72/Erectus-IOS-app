//
//  FriendClass.swift
//  Erectus
//
//  Created by Alexey on 25/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Foundation

class FriendItem{
    var lastMessage: String
    var countOfUnreadMessages: Int
    var dataTimeLastMessage: Date
    var chatId: String
    var nickName: String
    init(chatId_: String, lastMessage_: String, countOfUnreadMessages_: Int, dataTimeLastMessage_: Date, nickname_: String){
        self.lastMessage = lastMessage_
        self.countOfUnreadMessages = countOfUnreadMessages_
        self.chatId = chatId_
        self.dataTimeLastMessage = dataTimeLastMessage_
        self.nickName = nickname_
    }
}
