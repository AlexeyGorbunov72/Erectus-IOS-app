//
//  MessageClass.swift
//  Erectus
//
//  Created by Alexey on 10/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Foundation

class Message{
    var text : String
    var dataTime : String
    var fromEmail : String
    var fromNick : String
    var chatId : String
    var isIncoming : Bool
    
    init(text_: String, dataTime_: String, fromEmail_: String, fromNick_: String, chatId_: String, isIncoming_ : Bool){
        self.text = text_
        self.dataTime = dataTime_
        self.fromNick = fromNick_
        self.chatId = chatId_
        self.fromEmail = fromEmail_
        self.isIncoming = isIncoming_
    }
}
