//
//  BeadsService.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 10/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

class BeadsService {
    
    var bucket: Bucket?

    func bucket(successHandler:@escaping (Bucket) -> (),
                   errorHandler:@escaping (String) -> ()) -> () {
        
        guard let jsonData = Utils.unarchiveJSON(from: "Beads - Emodji Set") else {
            fatalError("Файл с указанным именем не найден")
        }

        var bucketOrNil: Bucket? = nil
        do {
            bucketOrNil = try JSONDecoder().decode(Bucket.self, from: jsonData)
        } catch  {
            errorHandler("Ошибка парсинга")
            print("Decode Error: ", error)
            return
        }
        guard let bucket = bucketOrNil else {
            errorHandler("Не удалось зачерпнуть набор бусин")
            return
        }
        self.bucket = bucket
        successHandler(bucket)
    }
}


