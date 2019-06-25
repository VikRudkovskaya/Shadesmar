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

    func bucket(successHandler:@escaping (BeadsSet) -> (), errorHandler:@escaping (String) -> ()) {
        
        decodeItem(BeadsSet.self, fromFile: "Beads - Emodji Set Sweets", successHandler: { (beadsSet) in
            self.bucket = beadsSet
            successHandler(beadsSet)
        }) { (message) in
            errorHandler(message)
        }
    }
    
    // Список всех возможных свойств
    func loadBeadProperties(successHandler:@escaping ([BeadProperty]) -> (), errorHandler:@escaping (String) -> ()) {
        
        decodeItem([BeadProperty].self, fromFile: "Beads - Properties", successHandler: { (list) in
            self.allBeadProperties = list
            successHandler(list)
        }) { (message) in
            errorHandler(message)
        }
        
    }
    
    // Список доступных наборов бусин
    func loadBeadsSets(successHandler:@escaping ([BeadsSet]) -> (),
                       errorHandler:@escaping (String) -> ()) {
        
        
    }
    
    func decodeItem<T>(_ item: T.Type, fromFile jsonFileName: String, successHandler:@escaping (T) -> (), errorHandler:@escaping (String) -> ()) where T : Decodable {
        guard let jsonData = Utils.unarchiveJSON(from: jsonFileName) else {
            fatalError("Файл с именем \(jsonFileName) не найден")
        }
        
        do {
            let model = try JSONDecoder().decode(item, from: jsonData)
            successHandler(model)
        } catch {
            errorHandler("Ошибка парсинга \(item)")
            print("Decode Error: ", error)
        }
    }
    
    
}


