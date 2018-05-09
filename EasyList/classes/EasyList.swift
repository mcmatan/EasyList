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
    private var easyListConfigurationType: EasyListConfigurationType?
    
    public init(_ easyListConfigurationType: EasyListConfigurationType){
        super.init(frame: .zero, style: .plain)
        self.setConfiguration(easyListConfigurationType)
    }
    
    public func setConfiguration(_ easyListConfigurationType: EasyListConfigurationType) {
        self.easyListConfigurationType = easyListConfigurationType
        self.delegate = self.easyListConfigurationType!.getDataSourceAndDelegate()
        self.dataSource = self.easyListConfigurationType!.getDataSourceAndDelegate()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
