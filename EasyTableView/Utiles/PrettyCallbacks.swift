//
// Created by Matan Cohen on 12/15/17.
// Copyright (c) 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

public typealias CompletionBlock = () -> Void
public typealias CompletionBlockParam<T> = (_ object: T) -> Void
public typealias CellConfigurationBlock = (_ cell: UITableViewCell, _ indexPath: IndexPath) -> UITableViewCell
