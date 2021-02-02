//
//  Storage.swift
//  HelloFileManager
//
//  Created by ido on 2021/02/02.
//

import Foundation

class Storage {
    
    static let fileManager = FileManager.default
    
    static func store<T: Codable>(_ obj: T, as fileName: String) {
        let path = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(fileName)
        print("saved in '\(path)'.")
        let encoder = PropertyListEncoder() // or json
        do {
            let data = try encoder.encode(obj)
            try data.write(to: path)
        } catch {
            print("Errror: \(error.localizedDescription)")
        }
    }
    
    static func retrive<T: Codable>(_ obj: T, from fileName: String, as type: T.Type) -> T? {
        let path = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(fileName)
        var model: T? = nil
        if let data = try? Data(contentsOf: path) {
            let decorder = PropertyListDecoder()
            do {
                model = try decorder.decode(type, from: data)
                return model
            } catch {
                print("Error: \(error.localizedDescription)")
                return nil
            }
        }
        return model
    }
    
    
}


