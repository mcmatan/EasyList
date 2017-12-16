//
// Created by Matan Cohen on 12/15/17.
// Copyright (c) 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

typealias CompletionBlock = () -> Void
typealias CompletionBlockParam<T> = (_ object: T) -> Void
typealias CellConfigurationBlock = (_ cell: UITableViewCell, _ indexPath: IndexPath) -> UITableViewCell
