//
//  ViewController.swift
//  UICollectionViewIntoUITableView
//
//  Created by Steven_WATREMEZ on 14/07/16.
//  Copyright © 2016 Steven_WATREMEZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableview: UITableView!
  
  let model: [[UIColor]] = generateRandomData()
  var storedOffsets = [Int: CGFloat]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableview.registerReusableCell(TableViewCell)
    tableview.dataSource = self
    tableview.delegate = self
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(indexPath: indexPath) as TableViewCell
    return cell
  }
  
  func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    guard let tableViewCell = cell as? TableViewCell else { return }
    tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
    tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
  }
  
  func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    guard let tableViewCell = cell as? TableViewCell else { return }
    storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
  }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return model[collectionView.tag].count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(indexPath: indexPath) as CollectionViewCell
    cell.setup(cellColor: model[collectionView.tag][indexPath.item])
    return cell
  }
}

func generateRandomData() -> [[UIColor]] {
  let numberOfRows = 20
  let numberOfItemsPerRow = 15
  
  return (0..<numberOfRows).map { _ in
    return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
  }
}

extension UIColor {
  class func randomColor() -> UIColor {
    
    let hue = CGFloat(arc4random() % 100) / 100
    let saturation = CGFloat(arc4random() % 100) / 100
    let brightness = CGFloat(arc4random() % 100) / 100
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
  }
}

