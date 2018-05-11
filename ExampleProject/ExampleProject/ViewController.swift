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
    }

    private func setupDefaultConfiguration() {
        let cellConfiguration = CellConfiguration { (cell, indexPath) -> UITableViewCell in
            cell.textLabel?.text = "You know you shook me. You shook me all night long. You know you shook me, baby. You shook me all night long. You shook me so hard, baby. Baby, baby, please come home."
            return cell
        }

        let config = EasyListConfigurationDefault.init(
                cellConfiguration: { indexPath -> CellConfigurationType in
                    return cellConfiguration
                }, dataSourceCount: { () -> Int in
            return 50
        }, rowHeight: { indexPath -> CGFloat in
            return 50
        }) { (selectedCell, selectedIndexPath) in
            //
        }
        self.easyList = EasyList.init(config)
    }

    private func setupAutoSizingConfiguration() {
        let cellConfiguration = CellConfiguration { (cell, indexPath) -> AutoSizingCell in
            cell.setText("In the days of my youth, I was told what it means to be a man,Now Ive reached that age, I've tried to do all those things the best I can. No matter how I try, I find my way into the same old jam")
            return cell
        }
        let cellConfiguration2 = CellConfiguration { (cell, indexPath) -> AutoSizingCell2 in
            cell.setText("Good Times, Bad Times, you know I've had my share When my woman left home for a brown eyed man, Well, I still don't seem to care")
            return cell
        }
        let config = EasyListConfigurationAutoSizingCells.init(
                cellConfiguration: { indexPath -> CellConfigurationType in
                    if (indexPath.row == 5) {
                        return cellConfiguration2
                    }

                    return cellConfiguration
                }, dataSourceCount: { () -> Int in
            return 50
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
