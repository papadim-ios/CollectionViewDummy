//
//  ViewController.swift
//  CollectionViewProject
//
//  Created by Dimitris Papaioannou on 12/10/21.
//

import UIKit

// https://stackoverflow.com/questions/31735228/how-to-make-a-simple-collection-view-with-swift
// https://stackoverflow.com/questions/35281405/fit-given-number-of-cells-in-uicollectionview-per-row
// https://medium.com/@NickBabo/equally-spaced-uicollectionview-cells-6e60ce8d457b  !!!

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let margin: CGFloat = 10

    let reuseIdentifier = "cell" // Also enter this string as the cell identifier in the storyboard
    
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                 "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
                 "41", "42", "43", "44", "45", "46", "47", "48"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let collectionView = collectionView,
                let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

            flowLayout.minimumInteritemSpacing = margin
            flowLayout.minimumLineSpacing = margin
            flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // Tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // Make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        // The row value is the same as the index of the desired text within the array
        cell.myLabel.text = self.items[indexPath.row]
        
        // Make cell more visible in our example project
        cell.backgroundColor = UIColor.cyan
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Number of column you want
        let noOfCellsInRow = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
//        print(CGSize(width: size, height: size))
        return CGSize(width: size, height: size)
    }
}
