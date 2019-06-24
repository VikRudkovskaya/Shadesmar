//
//  BeadsService.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 10/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

class BeadsServiceProvider {
    
    var beadsSets: [BeadsSet]?
    
    var bucket: BeadsSet?
    
    var allBeadProperties: [BeadProperty]?

    func bucket(successHandler:@escaping (BeadsSet) -> (),
                   errorHandler:@escaping (String) -> ()) -> () {
        
        guard let jsonData = Utils.unarchiveJSON(from: "Beads - Emodji Set Sweets") else {
            fatalError("Файл с указанным именем не найден")
        }

        do {
            let bucketObj = try JSONDecoder().decode(BeadsSet.self, from: jsonData)
            self.bucket = bucketObj
            successHandler(bucketObj)
        } catch {
            errorHandler("Ошибка парсинга BeadsSet")
            print("Decode Error: ", error)
            return
        }
    }
    
    // Список всех возможных свойств
    func loadBeadProperties(successHandler:@escaping ([BeadProperty]) -> (),
                        errorHandler:@escaping (String) -> ()) {
        
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
    
    // Список доступных наборов бусин
    func loadBeadsSets(successHandler:@escaping ([BeadsSet]) -> (),
                       errorHandler:@escaping (String) -> ()) {
        
    }
    
    
}


