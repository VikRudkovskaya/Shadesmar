//
//  BeadsService.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 10/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

class BeadsService {
    
    var bucket: BeadsSet?
    
    var allBeadProperties: [BeadProperty]?

    func bucket(successHandler:@escaping (BeadsSet) -> (),
                   errorHandler:@escaping (String) -> ()) -> () {
        
        guard let jsonData = Utils.unarchiveJSON(from: "Beads - Emodji Set") else {
            fatalError("Файл с указанным именем не найден")
        }

        var bucketOrNil: BeadsSet? = nil
        do {
            bucketOrNil = try JSONDecoder().decode(BeadsSet.self, from: jsonData)
        } catch {
            errorHandler("Ошибка парсинга Bucket")
            print("Decode Error: ", error)
            return
        }
        guard let bucket = bucketOrNil else {
            errorHandler("Не удалось зачерпнуть бусин")
            return
        }
        self.bucket = bucket
        successHandler(bucket)
    }
    
    // Список всех возможных свойств
    func beadProperties(successHandler:@escaping ([BeadProperty]) -> (),
                        errorHandler:@escaping (String) -> ()) -> () {
        
        guard let jsonData = Utils.unarchiveJSON(from: "Beads - Properties") else {
            fatalError("Файл с указанным именем не найден")
        }
        
        do {
            let beadPropertiesList = try JSONDecoder().decode([BeadProperty].self, from: jsonData)
            allBeadProperties = beadPropertiesList
            successHandler(beadPropertiesList)
        } catch {
            errorHandler("Ошибка парсинга [BeadProperty]")
            print("Decode Error: ", error)
            return
        }
        
    }
}


