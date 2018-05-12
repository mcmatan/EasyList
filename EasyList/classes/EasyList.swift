//
//  EasyTableView.swift
//  EasyTableView
//
//  Created by Matan Cohen on 12/15/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

public class EasyList: UITableView {
    private var listType: ListType?

    public init(_ listType: ListType? = nil) {
        super.init(frame: .zero, style: .plain)
        if let isConfig = listType {
            self.setListType(isConfig)
        }
    }

    public func setListType(_ listType: ListType) {
        self.listType = listType
        self.delegate = self.listType!.getDataSourceAndDelegate()
        self.dataSource = self.listType!.getDataSourceAndDelegate()
        self.listType!.configureTableView(tableView: self)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
