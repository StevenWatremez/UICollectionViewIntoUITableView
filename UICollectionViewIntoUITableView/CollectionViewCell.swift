//
//  CollectionViewCell.swift
//  UICollectionViewIntoUITableView
//
//  Created by Steven_WATREMEZ on 14/07/16.
//  Copyright © 2016 Steven_WATREMEZ. All rights reserved.
//

import UIKit
import Reusable

class CollectionViewCell: UICollectionViewCell, NibReusable {

  @IBOutlet weak var rootView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func setup(cellColor cellColor: UIColor) {
    rootView.backgroundColor = cellColor
  }

}
