//
//  BeadsSetTableViewCell.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 18/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BeadsSetTableViewCell: UITableViewCell {
    
    var model: BeadsSet?

    @IBOutlet weak var separatorImageView: UIImageView!
    @IBOutlet weak var setTitleLabel: UILabel!
    @IBOutlet weak var beadsCollectionView: UICollectionView!
    
    class func reuseIdentifier() -> String {
        return "BeadsSetTableViewCell_ID"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        beadsCollectionView.register(BeadCollectionViewCell.self, forCellWithReuseIdentifier: BeadCollectionViewCell.reuseIdentifier())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(with set: BeadsSet) {
        model = set
        
        
    }
    
}

extension BeadsSetTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.beads?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeadCollectionViewCell.reuseIdentifier(), for: indexPath) as! BeadCollectionViewCell
        
        return cell
    }
    
    
}
