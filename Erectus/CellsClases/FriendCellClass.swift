//
//  FriendCellClass.swift
//  Erectus
//
//  Created by Alexey on 26/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell{
    let lastMessage = UILabel()
    let nickName = UILabel()
    let backgroundView_ = UIView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nickName)
    
        nickName.translatesAutoresizingMaskIntoConstraints = false
        let constrains = [
            nickName.topAnchor.constraint(equalTo: self.topAnchor , constant: 10),
            nickName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
