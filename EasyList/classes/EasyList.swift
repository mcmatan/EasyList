//
//  EasyTableView.swift
//  EasyTableView
//
//  Created by Matan Cohen on 12/15/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

public protocol EasyListType {
    init(tableConfiguration: EasyListConfigurationType)
}

public class EasyList: UITableView {
    
    private let customCellIdentifier = "customCellIdentifier"
    private let tableConfiguration: EasyListConfigurationType
    
    public init(tableConfiguration: EasyListConfigurationType){
        self.tableConfiguration = tableConfiguration
        super.init(frame: .zero, style: .plain)
        self.delegate = tableConfiguration.dataSourceAndDelegate
        self.dataSource = tableConfiguration.dataSourceAndDelegate
        self.register(tableConfiguration.cellType, forCellReuseIdentifier: tableConfiguration.cellIdentifier())
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
