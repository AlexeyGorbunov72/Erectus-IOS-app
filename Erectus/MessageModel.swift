//
//  MessageModel.swift
//  Erectus
//
//  Created by Alexey on 21/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Foundation
import CoreData
@objc public class MessageModel:  NSManagedObject{
    @NSManaged public var text : String
    @NSManaged public var dataTime : Data
    @NSManaged public var fromEmail : String
    @NSManaged public var fromNick  : String
    @NSManaged public var chatId : String
    @NSManaged public var isIncoming  : Bool
}
