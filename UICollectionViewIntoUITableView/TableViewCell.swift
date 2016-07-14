//
//  TableViewCell.swift
//  UICollectionViewIntoUITableView
//
//  Created by Steven_WATREMEZ on 14/07/16.
//  Copyright © 2016 Steven_WATREMEZ. All rights reserved.
//

import UIKit
import Reusable

class TableViewCell: UITableViewCell, NibReusable {

  @IBOutlet weak var collectionView: UICollectionView!
  
  var collectionViewOffset: CGFloat {
    get {
      return collectionView.contentOffset.x
    }
    
    set {
      collectionView.contentOffset.x = newValue
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
  func setCollectionViewDataSourceDelegate
    <D: protocol<UICollectionViewDataSource, UICollectionViewDelegate>>
    (dataSourceDelegate: D, forRow row: Int) {
    collectionView.registerReusableCell(CollectionViewCell)
    collectionView.delegate = dataSourceDelegate
    collectionView.dataSource = dataSourceDelegate
    collectionView.tag = row
    collectionView.reloadData()
  }
  
}
