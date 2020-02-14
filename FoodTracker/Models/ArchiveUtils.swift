//
//  ArchiveUtils.swift
//  FoodTracker
//
//  Created by Diego Castaño on 14/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import Foundation

class ArchiveUtils {
    
    let archive: String
    var path: URL?
    
    init(_ archive: String) {
        self.archive = archive
        path = retrievePath(archive)
    }
    
    func save(_ content: Array<Any>) {
        do {
            guard let path = self.path else { return }
            try NSKeyedArchiver.archivedData(withRootObject: content, requiringSecureCoding: false).write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> Array<Any> {
        do {
            guard let path = self.path else { return [] }
            let data = try Data(contentsOf: path)
            guard let saved = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Any> else { return [] }
            return saved
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func retrievePath(_ name: String) -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let path = directory.appendingPathComponent(name)
        return path
    }
    
}
