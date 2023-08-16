//
//  File.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import Foundation

// Game.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let game = try Game(json)

import Foundation

// MARK: - Game
struct Game: Codable {
    var count: Int
    var next: String
    var previous: String
    var results: [Result]
    var seoTitle, seoDescription, seoKeywords, seoH1: String
    var noindex, nofollow: Bool
    var description: String
    var filters: Filters?
    var nofollowCollections: [String]
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
        case seoTitle = "seo_title"
        case seoDescription = "seo_description"
        case seoKeywords = "seo_keywords"
        case seoH1 = "seo_h1"
        case noindex, nofollow, description, filters
        case nofollowCollections = "nofollow_collections"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decodeIfPresent(Int.self, forKey: .count) ?? 0
        self.next = try container.decodeIfPresent(String.self, forKey: .next) ?? ""
        self.previous = try container.decodeIfPresent(String.self, forKey: .previous) ?? ""
        self.results = try container.decodeIfPresent([Result].self, forKey: .results) ?? []
        self.seoTitle = try container.decodeIfPresent(String.self, forKey: .seoTitle) ?? ""
        self.seoDescription = try container.decodeIfPresent(String.self, forKey: .seoDescription) ?? ""
        self.seoKeywords = try container.decodeIfPresent(String.self, forKey: .seoKeywords) ?? ""
        self.seoH1 = try container.decodeIfPresent(String.self, forKey: .seoH1) ?? ""
        self.noindex = try container.decodeIfPresent(Bool.self, forKey: .noindex) ?? false
        self.nofollow = try container.decodeIfPresent(Bool.self, forKey: .noindex) ?? false
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.filters = try container.decodeIfPresent(Filters.self, forKey: .filters) ?? nil
        self.nofollowCollections = try container.decodeIfPresent([String].self, forKey: .nofollowCollections) ?? []
    }
}

// MARK: Game convenience initializers and mutators

extension Game {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Game.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Filters.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let filters = try Filters(json)

import Foundation

// MARK: - Filters
struct Filters: Codable {
    var years: [FiltersYear]
}

// MARK: Filters convenience initializers and mutators

extension Filters {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Filters.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        years: [FiltersYear]? = nil
    ) -> Filters {
        return Filters(
            years: years ?? self.years
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// FiltersYear.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let filtersYear = try FiltersYear(json)

import Foundation

// MARK: - FiltersYear
struct FiltersYear: Codable {
    var from, to: Int
    var filter: String
    var decade: Int
    var years: [YearYear]
    var nofollow: Bool
    var count: Int
}

// MARK: FiltersYear convenience initializers and mutators

extension FiltersYear {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FiltersYear.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        from: Int? = nil,
        to: Int? = nil,
        filter: String? = nil,
        decade: Int? = nil,
        years: [YearYear]? = nil,
        nofollow: Bool? = nil,
        count: Int? = nil
    ) -> FiltersYear {
        return FiltersYear(
            from: from ?? self.from,
            to: to ?? self.to,
            filter: filter ?? self.filter,
            decade: decade ?? self.decade,
            years: years ?? self.years,
            nofollow: nofollow ?? self.nofollow,
            count: count ?? self.count
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// YearYear.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let yearYear = try YearYear(json)

import Foundation

// MARK: - YearYear
struct YearYear: Codable {
    var year, count: Int
    var nofollow: Bool
}

// MARK: YearYear convenience initializers and mutators

extension YearYear {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(YearYear.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        year: Int? = nil,
        count: Int? = nil,
        nofollow: Bool? = nil
    ) -> YearYear {
        return YearYear(
            year: year ?? self.year,
            count: count ?? self.count,
            nofollow: nofollow ?? self.nofollow
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Result.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let result = try Result(json)

import Foundation

// MARK: - Result
struct Result: Codable {
    var id: Int
    var slug, name, released: String
    var tba: Bool
    var backgroundImage: String
    var rating: Double
    var ratingTop: Int
    var ratings: [Rating]
    var ratingsCount, reviewsTextCount, added: Int
    var addedByStatus: AddedByStatus?
    var metacritic, playtime, suggestionsCount: Int
    var updated: String
    var userGame: String
    var reviewsCount: Int
    var saturatedColor, dominantColor: Color?
    var platforms: [PlatformElement]
    var parentPlatforms: [ParentPlatform]
    var genres: [Genre]
    var stores: [Store]
    var clip: String
    var tags: [Genre]
    var esrbRating: EsrbRating?
    var shortScreenshots: [ShortScreenshot]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.released = try container.decodeIfPresent(String.self, forKey: .released) ?? ""
        self.tba = try container.decodeIfPresent(Bool.self, forKey: .tba) ?? false
        self.backgroundImage = try container.decodeIfPresent(String.self, forKey: .backgroundImage) ?? ""
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating) ?? 0.0
        self.ratingTop = try container.decodeIfPresent(Int.self, forKey: .ratingTop) ?? 0
        self.ratings = try container.decodeIfPresent([Rating].self, forKey: .ratings) ?? []
        self.ratingsCount = try container.decodeIfPresent(Int.self, forKey: .ratingsCount) ?? 0
        self.reviewsCount = try container.decodeIfPresent(Int.self, forKey: .reviewsCount) ?? 0
        self.added = try container.decodeIfPresent(Int.self, forKey: .added) ?? 0
        self.addedByStatus = try container.decodeIfPresent(AddedByStatus.self, forKey: .addedByStatus) ?? nil
        self.metacritic = try container.decodeIfPresent(Int.self, forKey: .metacritic) ?? 0
        self.playtime = try container.decodeIfPresent(Int.self, forKey: .playtime) ?? 0
        self.suggestionsCount = try container.decodeIfPresent(Int.self, forKey: .suggestionsCount) ?? 0
        self.updated = try container.decodeIfPresent(String.self, forKey: .updated) ?? ""
        self.userGame = try container.decodeIfPresent(String.self, forKey: .userGame) ?? ""
        self.reviewsTextCount = try container.decodeIfPresent(Int.self, forKey: .reviewsTextCount) ?? 0
        self.saturatedColor = try container.decodeIfPresent(Color.self, forKey: .saturatedColor) ?? nil
        self.dominantColor = try container.decodeIfPresent(Color.self, forKey: .dominantColor) ?? nil
        self.platforms = try container.decodeIfPresent([PlatformElement].self, forKey: .platforms) ?? []
        self.parentPlatforms = try container.decodeIfPresent([ParentPlatform].self, forKey: .parentPlatforms) ?? []
        self.genres = try container.decodeIfPresent([Genre].self, forKey: .genres) ?? []
        self.stores = try container.decodeIfPresent([Store].self, forKey: .stores) ?? []
        self.clip = try container.decodeIfPresent(String.self, forKey: .clip) ?? ""
        self.tags = try container.decodeIfPresent([Genre].self, forKey: .tags) ?? []
        self.esrbRating = try container.decodeIfPresent(EsrbRating.self, forKey: .esrbRating) ?? nil
        self.shortScreenshots = try container.decodeIfPresent([ShortScreenshot].self, forKey: .shortScreenshots) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case id, slug, name, released, tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratings
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case added
        case addedByStatus = "added_by_status"
        case metacritic, playtime
        case suggestionsCount = "suggestions_count"
        case updated
        case userGame = "user_game"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case platforms
        case parentPlatforms = "parent_platforms"
        case genres, stores, clip, tags
        case esrbRating = "esrb_rating"
        case shortScreenshots = "short_screenshots"
    }
    
    
}

// MARK: Result convenience initializers and mutators

extension Result {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Result.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// AddedByStatus.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let addedByStatus = try AddedByStatus(json)

import Foundation

// MARK: - AddedByStatus
struct AddedByStatus: Codable {
    var yet, owned, beaten, toplay: Int
    var dropped, playing: Int
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.yet = try container.decodeIfPresent(Int.self, forKey: .yet) ?? 0
        self.owned = try container.decodeIfPresent(Int.self, forKey: .owned) ?? 0
        self.beaten = try container.decodeIfPresent(Int.self, forKey: .beaten) ?? 0
        self.toplay = try container.decodeIfPresent(Int.self, forKey: .toplay) ?? 0
        self.dropped = try container.decodeIfPresent(Int.self, forKey: .dropped) ?? 0
        self.playing = try container.decodeIfPresent(Int.self, forKey: .playing) ?? 0
    }
}


// Color.swift

import Foundation

enum Color: String, Codable {
    case the0F0F0F = "0f0f0f"
}

// EsrbRating.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let esrbRating = try EsrbRating(json)

import Foundation

// MARK: - EsrbRating
struct EsrbRating: Codable {
    var id: Int
    var name, slug: String
}

// MARK: EsrbRating convenience initializers and mutators

extension EsrbRating {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(EsrbRating.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: Int? = nil,
        name: String? = nil,
        slug: String? = nil
    ) -> EsrbRating {
        return EsrbRating(
            id: id ?? self.id,
            name: name ?? self.name,
            slug: slug ?? self.slug
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Genre.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let genre = try Genre(json)

import Foundation

// MARK: - Genre
struct Genre: Codable {
    var id: Int
    var name, slug: String
    var gamesCount: Int
    var imageBackground: String
    var domain: Domain?
    var language: Language?
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
        self.gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount) ?? 0
        self.imageBackground = try container.decodeIfPresent(String.self, forKey: .imageBackground) ?? ""
        self.domain = try container.decodeIfPresent(Domain.self, forKey: .domain) ?? nil
        self.language = try container.decodeIfPresent(Language.self, forKey: .language) ?? nil
    }
}

// MARK: Genre convenience initializers and mutators

extension Genre {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Genre.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Domain.swift

import Foundation

enum Domain: String, Codable {
    case appsAppleCOM = "apps.apple.com"
    case epicgamesCOM = "epicgames.com"
    case gogCOM = "gog.com"
    case marketplaceXboxCOM = "marketplace.xbox.com"
    case microsoftCOM = "microsoft.com"
    case nintendoCOM = "nintendo.com"
    case playGoogleCOM = "play.google.com"
    case storePlaystationCOM = "store.playstation.com"
    case storeSteampoweredCOM = "store.steampowered.com"
}

// Language.swift

import Foundation

enum Language: String, Codable {
    case eng = "eng"
    case rus = "rus"
}

// ParentPlatform.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let parentPlatform = try ParentPlatform(json)

import Foundation

// MARK: - ParentPlatform
struct ParentPlatform: Codable {
    var platform: EsrbRating
}

// MARK: ParentPlatform convenience initializers and mutators

extension ParentPlatform {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ParentPlatform.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        platform: EsrbRating? = nil
    ) -> ParentPlatform {
        return ParentPlatform(
            platform: platform ?? self.platform
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// PlatformElement.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let platformElement = try PlatformElement(json)

import Foundation

// MARK: - PlatformElement
struct PlatformElement: Codable {
    var platform: PlatformPlatform?
    var releasedAt: String
    var requirementsEn, requirementsRu: Requirements?
    
    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirementsEn = "requirements_en"
        case requirementsRu = "requirements_ru"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.platform = try container.decodeIfPresent(PlatformPlatform.self, forKey: .platform) ?? nil
        self.releasedAt = try container.decodeIfPresent(String.self, forKey: .releasedAt) ?? ""
        self.requirementsEn = try container.decodeIfPresent(Requirements.self, forKey: .requirementsEn) ?? nil
        self.requirementsRu = try container.decodeIfPresent(Requirements.self, forKey: .requirementsRu) ?? nil
    }
}

// MARK: PlatformElement convenience initializers and mutators

extension PlatformElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PlatformElement.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// PlatformPlatform.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let platformPlatform = try PlatformPlatform(json)

import Foundation

// MARK: - PlatformPlatform
struct PlatformPlatform: Codable {
    var id: Int
    var name, slug: String
    var image: String
    var yearStart, yearEnd: Int
    var gamesCount: Int
    var imageBackground: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug, image
        case yearEnd = "year_end"
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.yearEnd = try container.decodeIfPresent(Int.self, forKey: .yearEnd) ?? 0
        self.yearStart = try container.decodeIfPresent(Int.self, forKey: .yearStart) ?? 0
        self.gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount) ?? 0
        self.imageBackground = try container.decodeIfPresent(String.self, forKey: .imageBackground) ?? ""
    }
}

// MARK: PlatformPlatform convenience initializers and mutators

extension PlatformPlatform {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PlatformPlatform.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Requirements.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let requirements = try Requirements(json)

import Foundation

// MARK: - Requirements
struct Requirements: Codable {
    var minimum: String
    var recommended: String?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.minimum = try container.decodeIfPresent(String.self, forKey: .minimum) ?? ""
        self.recommended = try container.decodeIfPresent(String.self, forKey: .recommended) ?? ""
    }
}

// MARK: Requirements convenience initializers and mutators

extension Requirements {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Requirements.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Rating.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rating = try Rating(json)

import Foundation

// MARK: - Rating
struct Rating: Codable {
    var id: Int
    var title: Title?
    var count: Int
    var percent: Double
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.title = try container.decodeIfPresent(Title.self, forKey: .title) ?? nil
        self.count = try container.decodeIfPresent(Int.self, forKey: .count) ?? 0
        self.percent = try container.decodeIfPresent(Double.self, forKey: .percent) ?? 0.0
    }
}

// MARK: Rating convenience initializers and mutators

extension Rating {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Rating.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Title.swift

import Foundation

enum Title: String, Codable {
    case exceptional = "exceptional"
    case meh = "meh"
    case recommended = "recommended"
    case skip = "skip"
}

// ShortScreenshot.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let shortScreenshot = try ShortScreenshot(json)

import Foundation

// MARK: - ShortScreenshot
struct ShortScreenshot: Codable {
    var id: Int
    var image: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
    }
}

// MARK: ShortScreenshot convenience initializers and mutators

extension ShortScreenshot {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ShortScreenshot.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Store.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let store = try Store(json)

import Foundation

// MARK: - Store
struct Store: Codable {
    var id: Int
    var store: Genre?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.store = try container.decodeIfPresent(Genre.self, forKey: .store) ?? nil
    }
}

// MARK: Store convenience initializers and mutators

extension Store {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Store.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// JSONSchemaSupport.swift

import Foundation

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public func hash(into hasher: inout Hasher) {
        // No-op
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
