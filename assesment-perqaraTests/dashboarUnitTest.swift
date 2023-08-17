//
//  dashboarUnitTest.swift
//  assesment-perqaraTests
//
//  Created by fajaradiwasentosa on 16/08/23.
//

import Foundation
import XCTest
@testable import assesment_perqara

class dashboarUnitTest: XCTestCase {
    
    func test_pagination() {
        var page: Int = 1
        var pageCount: Int = 0
        XCTAssertNotNil(Bundle(for: type(of: self)).path(forResource: "gamespage1", ofType: "json"), "Failed load json file")
        
        guard let url = Bundle(for: type(of: self)).path(forResource: "gamespage1", ofType: "json") else {
            fatalError("games.json file not found")
        }
        
        guard let jsonString = try? String(contentsOfFile: url, encoding: .utf8) else {
            fatalError("Unable to convert gamespage1.json to String")
        }
        
        guard let data = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert gamespage1.json to Data")
        }
        
        
        let jsonData = NetworkData.init(data: data)
        
        guard let object = jsonData.decode(Game.self) else {
            fatalError("Failed decode data")
        }
        
        XCTAssertTrue(object.results.count > 0, "Data not ready !!!")
        var objects: [Result] = object.results
        
        pageCount += object.results.count
        page += 1
        
        XCTAssertNotNil(Bundle(for: type(of: self)).path(forResource: "gamespage2", ofType: "json"), "Failed load json file")
        guard let url2 = Bundle(for: type(of: self)).path(forResource: "gamespage2", ofType: "json") else {
            fatalError("games.json file not found")
        }
        guard let jsonString2 = try? String(contentsOfFile: url2, encoding: .utf8) else {
            fatalError("Unable to convert gamespage2.json to String")
        }
        guard let data2 = jsonString2.data(using: .utf8) else {
            fatalError("Unable to convert gamespage2.json to Data")
        }
        let jsonData2 = NetworkData.init(data: data2)
        guard let object2 = jsonData2.decode(Game.self) else {
            fatalError("Failed decode data")
        }
        
        XCTAssertTrue(object2.results.count > 0, "Data page 2 not ready !!!")
        XCTAssertTrue(object2.next.contains("page=\(page + 1)"), "failed get data from json !!!")
        objects.append(contentsOf: object2.results)
        XCTAssert((object.results.count + object.results.count) > pageCount, "New page was added")
    }
    
    func test_searching() {
        XCTAssertNotNil(Bundle(for: type(of: self)).path(forResource: "gamespage1", ofType: "json"), "Failed load json file")
        
        guard let url = Bundle(for: type(of: self)).path(forResource: "gamespage1", ofType: "json") else {
            fatalError("games.json file not found")
        }
        
        guard let jsonString = try? String(contentsOfFile: url, encoding: .utf8) else {
            fatalError("Unable to convert gamespage1.json to String")
        }
        
        guard let data = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert gamespage1.json to Data")
        }
        
        
        let jsonData = NetworkData.init(data: data)
        
        guard let object = jsonData.decode(Game.self) else {
            fatalError("Failed decode data")
        }
        
        XCTAssertTrue(object.results.count > 0, "Data not ready !!!")
        
        let keyword = "a"
        
        XCTAssertTrue(object.results.contains(where: { $0.name == keyword }), "Data not found")
    }
}
