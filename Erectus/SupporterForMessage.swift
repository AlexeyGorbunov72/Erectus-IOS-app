//
//  SupporterForMessage.swift
//  Erectus
//
//  Created by Alexey on 19/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Foundation

class SupporterForMessage{
    public func convertMessageModelToMessage(messageModel: MessageModel)->Message{
        let message = Message.init(text_: messageModel.text, dataTime_: messageModel.dataTime, fromEmail_: messageModel.fromEmail, fromNick_: messageModel.fromNick, chatId_: messageModel.chatId, isIncoming_: messageModel.isIncoming)
        return message
    }
}
