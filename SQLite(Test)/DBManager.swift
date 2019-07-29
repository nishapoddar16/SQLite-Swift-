//
//  DBManager.swift
//  SQLite(Test)
//
//  Created by nishapoddar on 29/07/19.
//  Copyright © 2019 Nisha Poddar. All rights reserved.
//

import Foundation
import SQLite

class DBManager {
    
    static let shared = DBManager()
    
    var db : Connection!
    var usersTable = Table("users")
    
    var id = Expression<Int>("id")
    var name = Expression<String>("name")
    var email = Expression<String>("email")

    func createDatabase() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileUrl = documentDirectory.appendingPathComponent("users   ").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            print(database)
        self.db = database
        } catch {
            print("error in creating database")
        }
    }
    
    func getTable() {
        do {
         let users = try self.db.prepare(usersTable)
            for user in users {
                print("user == \(user[self.name])")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func createTable() {
        let createQuery = usersTable.create { (table) in
            table.column(id, primaryKey: true)
            table.column(name)
            table.column(email, unique: true)
        }
            do {
                try self.db.run(createQuery)
            } catch {
                print(error.localizedDescription)
            }
    }
    
    func insertInTable() {
        let insertQuery = usersTable.insert(name <- "Nisha", email <- "nisha@gmail.com")
        usersTable.insert(name <- "ABC", email <- "abc@gmail.com")
        usersTable.insert(name <- "XYZ", email <- "xyz@gmail.com")
        do {
            try self.db.run(insertQuery)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateTable() {
        let user = usersTable.filter(self.id == 2)
        let updateQuery = try usersTable.update(self.name <- "abcd")
        do {
          try self.db.run(updateQuery)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteData() {
        let user = usersTable.filter(self.id == 3)
        let deleteQuery = try usersTable.delete()
        do {
            try self.db.run(deleteQuery)
        } catch {
            print(error.localizedDescription)
        }
    }
}
