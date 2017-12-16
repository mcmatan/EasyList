//
//  EasyTableView.swift
//  EasyTableView
//
//  Created by Matan Cohen on 12/15/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

public protocol EasyListViewType {
    init(tableConfiguration: EasyListConfigurationType)
}

public class EasyListView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private let customCellIdentifier = "customCellIdentifier"
    private let tableConfiguration: EasyListConfigurationType
    
    public init(tableConfiguration: EasyListConfigurationType){
        self.tableConfiguration = tableConfiguration
        super.init(frame: .zero, style: .plain)
        self.delegate = self
        self.dataSource = self
        self.register(tableConfiguration.cellType, forCellReuseIdentifier: tableConfiguration.cellIdentifier())
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableConfiguration.dataSourceCount()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.tableConfiguration.cellIdentifier()) else {
            return UITableViewCell()
        }
        return self.tableConfiguration.configureCell(cell, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableConfiguration.cellHeight
    }
}
