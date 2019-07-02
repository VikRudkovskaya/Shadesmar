//
//  BeadsService.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 10/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

class BeadsServiceProvider {
    
    // Все существующие сеты
    var allBeadsSets: [BeadsSet] = []
    
    // Объединенный сет
    var generalizedSet: BeadsSet {
        return BeadsSet.generalizedBeadsSet(sets: allBeadsSets, name: "Общий сформированный сет", id: "-bbee03f5dbfaef9a742c7d88d6ad1fca")
    }
    
    var allBeadProperties: [BeadProperty]?
    
    private var beadsSetsJsonNames: [String] {
        return ["Beads - Emodji Set Sweets", "Beads - Emodji Set Birds", "Beads - Emodji Set Fruits", "Beads - Emodji Set Berries"]
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
    
    // Список всех доступных наборов бусин
    func loadBeadsSets(successHandler:@escaping ([BeadsSet]) -> (),
                       errorHandler:@escaping (String) -> ()) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            let downloadGroup = DispatchGroup()
            for jsonName in self.beadsSetsJsonNames {
                downloadGroup.enter()
                self.loadBeadSet(fromJson: jsonName, successHandler: { (beadsSet) in
                    self.allBeadsSets.append(beadsSet)
                    downloadGroup.leave()
                }) { (message) in
                    
                }
                downloadGroup.wait()
            }
        }
        
        DispatchQueue.main.async {
            successHandler(self.allBeadsSets)
        }
        
    }
    
    // Загрузка одного сета
    func loadBeadSet(fromJson fileName: String,
                     successHandler:@escaping (BeadsSet) -> (),
                     errorHandler:@escaping (String) -> ()) {
        
        decodeItem(BeadsSet.self, fromFile: fileName, successHandler: { (beadsSet) in
            successHandler(beadsSet)
        }) { (message) in
            errorHandler(message)
        }
    }
    
    // Извлечение модели из json-файла
    func decodeItem<T>(_ item: T.Type,
                       fromFile jsonFileName: String,
                       successHandler:@escaping (T) -> (),
                       errorHandler:@escaping (String) -> ()) where T : Decodable {
        
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


