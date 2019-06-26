//
//  BeadsSetTableViewCell.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 18/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BeadsSetTableViewCell: UITableViewCell {
    
    var model: BeadsSet!

    @IBOutlet weak var separatorImageView: UIImageView!
    @IBOutlet weak var setTitleLabel: UILabel!
    @IBOutlet weak var beadsCollectionView: UICollectionView!
    
    class func reuseIdentifier() -> String {
        return "BeadsSetTableViewCell_ID"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib.init(nibName: "BeadCollectionViewCell", bundle: nil)
        beadsCollectionView.register(nib, forCellWithReuseIdentifier: BeadCollectionViewCell.reuseIdentifier())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(with set: BeadsSet) {
        model = set
        
        setTitleLabel.text = set.name
        beadsCollectionView.reloadData()
    }
    
}

extension BeadsSetTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let number = model.beads?.count else {
            return 0
        }
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeadCollectionViewCell.reuseIdentifier(), for: indexPath) as! BeadCollectionViewCell
        cell.beadImageView.image = UIImage.init(named: model.beads?[indexPath.row].textureName ?? "")
        return cell
    }
    
    
}
