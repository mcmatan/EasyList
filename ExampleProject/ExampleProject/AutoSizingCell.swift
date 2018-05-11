//
//  AutoSizingCell.swift
//  ExampleProject
//
//  Created by Matan Cohen on 5/9/18.
//  Copyright © 2018 Matan. All rights reserved.
//

import Foundation
import UIKit

let cellGreenColor = UIColor.init(red: 160 / 255, green: 196 / 255, blue: 163 / 255, alpha: 1)
let cellPurpleColor = UIColor.init(red: 136 / 255, green: 119 / 255, blue: 177 / 255, alpha: 1)
let cellOrangeColor = UIColor.init(red: 240 / 255, green: 183 / 255, blue: 114 / 255, alpha: 1)

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
        someLabel.backgroundColor = cellGreenColor
        someLabel.textColor = cellPurpleColor
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
        someLabel.backgroundColor = cellPurpleColor
        someLabel.textColor = cellOrangeColor
        someLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func setText(_ text: String) {
        self.someLabel.text = text
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
