//
//  Models.swift
//  Erectus
//
//  Created by Alexey on 19/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Foundation
import RealmSwift
class MessageModel: Object{
    @objc dynamic var text = ""
    @objc dynamic var dataTime = ""
    @objc dynamic var fromEmail = ""
    @objc dynamic var fromNick  = ""
    @objc dynamic var chatId = ""
    @objc dynamic var isIncoming  = true
}

class PersonInChatRoomModel: Object{
    @objc dynamic var lastMessage = ""
    @objc dynamic var dataTimeOfLastMsg = ""
    @objc dynamic var countOfUnreadMessages = 0
    @objc dynamic var dataTimeLastMessage = ""
    @objc dynamic var chatId = ""
}
