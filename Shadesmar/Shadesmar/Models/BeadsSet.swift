//
//  Bucket.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 02/05/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

class BeadsSet: Decodable {
    
    var id: String?
    var name: String?
    
    var beadIds: [String]?
    var beads: [Bead]?
    
    // Формирует один общий сет из набора предоставленных сетов путем объединения бусин
    class func generalizedBeadsSet(sets: [BeadsSet], name: String?, id: String?) -> BeadsSet {
        let newGeneralizedSet = BeadsSet()
        newGeneralizedSet.beads = []
        newGeneralizedSet.beadIds = []
        newGeneralizedSet.name = name
        newGeneralizedSet.id = id
        for set in sets {
            // TODO: fixme
            newGeneralizedSet.beads?.append(contentsOf: set.beads!)
            guard let ids = set.beadIds else {
                continue
            }
            newGeneralizedSet.beadIds?.append(contentsOf: ids)
        }
        
        return newGeneralizedSet
    }
    
}
