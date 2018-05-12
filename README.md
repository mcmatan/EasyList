

[![Pod version](https://img.shields.io/cocoapods/v/EasyList.svg?style=flat)](http://cocoadocs.org/docsets/EasyList)
[![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat)](https://developer.apple.com/swift)

<p align = "center"><img src="https://i.imgur.com/GlCRkUL.png" alt="EasyList Icon"/></p>


## Why EasyList?


EasyList is a UITableView subclass, that will help you create type-safe lists, with less code, easier to read and maintain.

As you probably know, using UITableView forces you to implement delegate pattern, switch statements (In case of different cell types) force casting (UITableViewCell to your custom cell type), and redundant code as 'cellIdentifier'.

EasyList is a new way of dealing with simple to complex table views; it wrapped logic for you, so you have a less boilerplate redundant code.

## Basic usage
ListTypeStaticCellHeight, Supports multiple cell types, static height

```Swift

let cellConfiguration = CellConfiguration { (cell, indexPath) -> YourCustomCell in
    cell.setText(self.dataSource[indexPath.row])
    return cell
}
let listType = ListTypeStaticCellHeight.init(
        cellConfiguration: { indexPath -> CellConfigurationType in
            return cellConfiguration
        }, dataSourceCount: { () -> Int in
    return self.dataSource.count
}, rowHeight: { indexPath -> CGFloat in
    return 50
}) { (selectedCell, selectedIndexPath) in
        ///Did select cell
}
self.easyList = EasyList.init(listType)

```

## Advanced usage
ListTypeAutoSizingCells, Supports multiple cell types, dynamic cell height

```Swift

let cellConfiguration = CellConfiguration { (cell, indexPath) -> YourCustomCell in
    cell.setText(self.dataSource[indexPath.row])
    return cell
}
let cellConfiguration2 = CellConfiguration { (cell, indexPath) -> YourCustomCellWithDinamicSize in
    cell.setText(self.dataSource[indexPath.row])
    return cell
}
let listType = ListTypeAutoSizingCells.init(
        cellConfiguration: { indexPath -> CellConfigurationType in
         if (indexPath.row == 5) {
                return cellConfiguration2
         }
          return cellConfiguration 
        }, dataSourceCount: { () -> Int in
     return self.dataSource.count
}, estimatedRowsHeight: 100) { (selectedCell, selectedIndexPath) in
        ///Did select cell
}
self.easyList = EasyList.init(listType)

```

## In detail

**CellConfiguration** block is used to define different cell types.
Set Its return type to your custom cell, and set Its params.
After creating the amount of cell configuration blocks you need, choose your ListType:
- ListTypeAutoSizingCells for auto sizing cells
- ListTypeStaticCellHeight static cell sizes

Create it, pass CellConfiguration for index path, and the rest of the params (Should be autocompleted)

Reloading data on change is the same as using UITableView (Because it is, in fact, a UITableView)  call: reloadData()

You are ready to go! (:

## Installation

#### Cocoapods
**EasyList** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyList'
```

#### Manually
1. Download and drop ```/EasyList``` folder in your project.  
2. Congratulations!  

## Author

[Matan](https://github.com/mcmatan) made this with ❤️.
