//
//  AutoSizingCell.swift
//  ExampleProject
//
//  Created by Matan Cohen on 5/9/18.
//  Copyright © 2018 Matan. All rights reserved.
//

import Foundation
import UIKit

class AutoSizingCell: UITableViewCell {
    let someLabel = UILabel.init()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        self.contentView.addSubview(someLabel)
        someLabel.numberOfLines = 0
        someLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        someLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        someLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        someLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        someLabel.backgroundColor = UIColor.gray
        someLabel.textColor = UIColor.green
        
        
        someLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setText(_ text: String) {
        self.someLabel.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class AutoSizingCell2: UITableViewCell {
    let someLabel = UILabel.init()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(someLabel)
        someLabel.numberOfLines = 0
        someLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        someLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        someLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        someLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        someLabel.backgroundColor = UIColor.blue
        someLabel.textColor = UIColor.red
        
        
        someLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setText(_ text: String) {
        self.someLabel.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
