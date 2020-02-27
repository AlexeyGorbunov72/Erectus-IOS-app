//
//  ChatMessagesFrom.swift
//  Erectus
//
//  Created by Alexey on 10/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class ChatMessageFrom : UITableViewCell{
    
    let messageLabel = UILabel()
    let bubbleView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bubbleView)
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        bubbleView.layer.cornerRadius = 23
        bubbleView.backgroundColor = .magenta
        messageLabel.numberOfLines = 0
        
        let constrains = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
             messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
             
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            bubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            
            bubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor , constant: -16),
            
            bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            
            bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
            
        ]
        NSLayoutConstraint.activate(constrains)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
