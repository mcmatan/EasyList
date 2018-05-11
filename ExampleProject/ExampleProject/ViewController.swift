//
//  ViewController.swift
//  ExampleProject
//
//  Created by Matan Cohen on 12/16/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit
import EasyList

class ViewController: UIViewController {
    var easyList: EasyList?
    let showAutoSizingCellExample = true
    var dataSource = ["a","b","c","d","e","f","g"]

    override func viewDidLoad() {
        super.viewDidLoad()
        if (self.showAutoSizingCellExample) {
            self.setupAutoSizingConfiguration()
        } else {
            self.setupDefaultConfiguration()
        }
        self.view.addSubview(self.easyList!)
        self.easyList?.translatesAutoresizingMaskIntoConstraints = false
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.easyList?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.easyList?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.easyList?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.easyList?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.changeDataSource()
        }
    }
    
    private func changeDataSource() {
        self.dataSource = ["b","b","b","b","b","b","b","b","b"]
        self.easyList?.reloadData()
    }

    private func setupDefaultConfiguration() {
        
        let cellConfiguration = CellConfiguration { (cell, indexPath) -> UITableViewCell in
            cell.textLabel?.text = self.dataSource[indexPath.row]
            return cell
        }

        let config = EasyListConfigurationDefault.init(
                cellConfiguration: { indexPath -> CellConfigurationType in
                    return cellConfiguration
                }, dataSourceCount: { () -> Int in
            return self.dataSource.count
        }, rowHeight: { indexPath -> CGFloat in
            return 50
        }) { (selectedCell, selectedIndexPath) in
            //
        }
        self.easyList = EasyList.init(config)
    }

    private func setupAutoSizingConfiguration() {
        let cellConfiguration = CellConfiguration { (cell, indexPath) -> AutoSizingCell in
            let text = self.dataSource[indexPath.row]
            cell.setText(text)
            return cell
        }
        let cellConfiguration2 = CellConfiguration { (cell, indexPath) -> AutoSizingCell2 in
            let text = self.dataSource[indexPath.row]
            cell.setText(text)
            return cell
        }
        let config = EasyListConfigurationAutoSizingCells.init(
                cellConfiguration: { indexPath -> CellConfigurationType in
                    if (indexPath.row == 5) {
                        return cellConfiguration2
                    }

                    return cellConfiguration
                }, dataSourceCount: { () -> Int in
            return self.dataSource.count
        }, estimatedRowsHeight: 100) { (selectedCell, selectedIndexPath) in
            ///
        }
        self.easyList = EasyList.init(config)
        
    }

    func dataSourceCount() -> Int {
        return 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
