//
//  ChatMessagesYour.swift
//  Erectus
//
//  Created by Alexey on 10/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//
import UIKit
class ChatMessgesYour: UITableViewCell{
    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        bubbleBackgroundView.layer.cornerRadius = 23
        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
        let leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        leadingConstraint.isActive = false
        let trailingonstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingonstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
