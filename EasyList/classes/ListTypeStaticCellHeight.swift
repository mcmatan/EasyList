//
//  ListTypeStaticCellHeight.swift
//  EasyList
//
//  Created by Matan Cohen on 5/9/18.
//

//
//  ListTypeAutoSizingCells.swift
//  EasyList
//
//  Created by Matan Cohen on 5/9/18.
//

import Foundation
import UIKit

//Supports multiple cell types, static height
public class ListTypeStaticCellHeight: ListType {
    public let cellConfigurationType: (_ indexPath: IndexPath) -> CellConfigurationType
    public let didSelectCellBlock: DidSelectCellBlock
    public let dataSourceCount: () -> Int
    public let rowHeight: (_ forIndexPath: IndexPath) -> CGFloat

    lazy var dataSourceAndDelegate: UITableViewDelegate & UITableViewDataSource = {
        return ListTypeStaticCellHeightDataSourceDelegateProvider(configuration: self)
    }()

    public func configureTableView(tableView: UITableView) {
        //
    }

    public func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource {
        return self.dataSourceAndDelegate
    }

    public init(cellConfiguration: @escaping (_ indexPath: IndexPath) -> CellConfigurationType,
                dataSourceCount: @escaping () -> Int,
                rowHeight: @escaping (_ forIndexPath: IndexPath) -> CGFloat,
                didSelectCellBlock: @escaping DidSelectCellBlock
    ) {
        self.cellConfigurationType = cellConfiguration
        self.dataSourceCount = dataSourceCount
        self.didSelectCellBlock = didSelectCellBlock
        self.rowHeight = rowHeight
    }
}

private class ListTypeStaticCellHeightDataSourceDelegateProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var listType: ListTypeStaticCellHeight!

    init(configuration: ListTypeStaticCellHeight) {
        self.listType = configuration
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.listType.rowHeight(indexPath)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listType.dataSourceCount()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfigurationForIndexPath = self.listType.cellConfigurationType(indexPath)
        let cell = reuseCellFor(indexPath: indexPath, tableView: tableView, listType: self.listType)
        return cellConfigurationForIndexPath.configure(cell, indexPath)
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            self.listType.didSelectCellBlock(isCell, indexPath)
        } else {
            print("ERROR: EasyList did select unknown cell")
        }
    }
}
