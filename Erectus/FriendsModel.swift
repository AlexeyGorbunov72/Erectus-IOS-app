//
//  FriendsModel.swift
//  Erectus
//
//  Created by Alexey on 21/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Foundation
import CoreData
@objc public class FriendModel: NSManagedObject{
    @NSManaged public var lastMessage: String
    @NSManaged public var dataTimeOfLastMsg: String
    @NSManaged public var countOfUnreadMessages: integer_t
    @NSManaged public var dataTimeLastMessage: String
    @NSManaged public var chatId: String
}
