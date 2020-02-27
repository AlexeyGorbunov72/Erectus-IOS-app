//
//  FriendCellCollection.swift
//  Erectus
//
//  Created by Alexey on 26/02/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Foundation
import UIKit
class FriendCellCollection: UICollectionViewCell{
    let lastMessage = UILabel()
    let nickName = UILabel()
    let backgroundView_ = UIView()
    
    let profileImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Stupid Retard"
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "бла бла бла"
        label.textColor = .darkGray
        return label
    }()
    let onlinePoint: UILabel = {
       let view = UILabel()
        view.layer.cornerRadius = 5
        view.backgroundColor = .magenta
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(profileImage)
        addSubview(dividerLine)
        addSubview(onlinePoint)
        setupContainer()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat:                    "H:|-12-[v0(68)]",
        metrics: nil,
        views: ["v0" : profileImage]))
        
       NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat:                    "H:|-24-[v0(10)]",
        metrics: nil,
        views: ["v0" : onlinePoint]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-70-[v0(10)]",
        metrics: nil,
        views: ["v0": onlinePoint]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[v0(68)]",
                                                                   metrics: nil,
                                                                   views: ["v0": profileImage]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-82-[v0]-10-|",
        metrics: nil,
        views: ["v0": dividerLine]))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|",
        metrics: nil,
        views: ["v0": dividerLine]))
        NSLayoutConstraint.activate([NSLayoutConstraint.init(item: profileImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)])
        
        profileImage.image = UIImage(named: "profilePhotoShakal")
        
    
    }
    
    func setupContainer(){
        let containrer = UIView()
        containrer.layer.cornerRadius = 10
       
        addSubview(containrer)
        containrer.translatesAutoresizingMaskIntoConstraints = false
        
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-90-[v0]-10-|",
        metrics: nil,
        views: ["v0": containrer]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(60)]",
        metrics: nil,
        views: ["v0": containrer]))
        
        NSLayoutConstraint.activate([NSLayoutConstraint.init(item: containrer, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)])
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-95-[v0]",
            metrics: nil,
            views: ["v0": nameLabel]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]",
            metrics: nil,
            views: ["v0": nameLabel]))
        
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[v0]",
            metrics: nil,
            views: ["v0": messageLabel]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-95-[v0]",
        metrics: nil,
        views: ["v0": messageLabel]))
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
