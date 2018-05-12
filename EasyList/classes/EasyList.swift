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
    init(tableConfiguration: ConfigurationType)
}

public class EasyList: UITableView {
    private var configurationType: ConfigurationType?

    public init(_ configurationType: ConfigurationType? = nil) {
        super.init(frame: .zero, style: .plain)
        if let isConfig = configurationType {
            self.setConfiguration(isConfig)
        }
    }

    public func setConfiguration(_ configurationType: ConfigurationType) {
        self.configurationType = configurationType
        self.delegate = self.configurationType!.getDataSourceAndDelegate()
        self.dataSource = self.configurationType!.getDataSourceAndDelegate()
        self.configurationType!.configureTableView(tableView: self)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
