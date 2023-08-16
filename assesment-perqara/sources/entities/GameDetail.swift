//
//  GameDetail.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 15/08/23.
//

import Foundation

struct GameDetail: Codable {
    var id: Int
    var slug, name, nameOriginal, description: String
    var metacritic: Int
    var metacriticPlatforms: [MetacriticPlatform]
    var released: String
    var tba: Bool
    var updated: String
    var backgroundImage, backgroundImageAdditional: String
    var website: String
    var rating: Double
    var ratingTop: Int
    var ratings: [Rating]
    var reactions: [String: Int]
    var added: Int
    var addedByStatus: AddedByStatus
    var playtime, screenshotsCount, moviesCount, creatorsCount: Int
    var achievementsCount, parentAchievementsCount: Int
    var redditURL: String
    var redditName, redditDescription, redditLogo: String
    var redditCount, twitchCount, youtubeCount, reviewsTextCount: Int
    var ratingsCount, suggestionsCount: Int
    var alternativeNames: [String]
    var metacriticURL: String
    var parentsCount, additionsCount, gameSeriesCount: Int
    var userGame: JSONNull?
    var reviewsCount: Int
    var saturatedColor, dominantColor: String
    var parentPlatforms: [ParentPlatform]
    var platforms: [PlatformElement]
    var stores: [Store]
    var developers, genres, tags, publishers: [Developer]
    var esrbRating: EsrbRating
    var clip: JSONNull?
    var descriptionRaw: String
    
    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal = "name_original"
        case description, metacritic
        case metacriticPlatforms = "metacritic_platforms"
        case released, tba, updated
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website, rating
        case ratingTop = "rating_top"
        case ratings, reactions, added
        case addedByStatus = "added_by_status"
        case playtime
        case screenshotsCount = "screenshots_count"
        case moviesCount = "movies_count"
        case creatorsCount = "creators_count"
        case achievementsCount = "achievements_count"
        case parentAchievementsCount = "parent_achievements_count"
        case redditURL = "reddit_url"
        case redditName = "reddit_name"
        case redditDescription = "reddit_description"
        case redditLogo = "reddit_logo"
        case redditCount = "reddit_count"
        case twitchCount = "twitch_count"
        case youtubeCount = "youtube_count"
        case reviewsTextCount = "reviews_text_count"
        case ratingsCount = "ratings_count"
        case suggestionsCount = "suggestions_count"
        case alternativeNames = "alternative_names"
        case metacriticURL = "metacritic_url"
        case parentsCount = "parents_count"
        case additionsCount = "additions_count"
        case gameSeriesCount = "game_series_count"
        case userGame = "user_game"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case parentPlatforms = "parent_platforms"
        case platforms, stores, developers, genres, tags, publishers
        case esrbRating = "esrb_rating"
        case clip
        case descriptionRaw = "description_raw"
    }
}

// MARK: GameDetail convenience initializers and mutators

extension GameDetail {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GameDetail.self, from: data)
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
        slug: String? = nil,
        name: String? = nil,
        nameOriginal: String? = nil,
        description: String? = nil,
        metacritic: Int? = nil,
        metacriticPlatforms: [MetacriticPlatform]? = nil,
        released: String? = nil,
        tba: Bool? = nil,
        updated: String? = nil,
        backgroundImage: String? = nil,
        backgroundImageAdditional: String? = nil,
        website: String? = nil,
        rating: Double? = nil,
        ratingTop: Int? = nil,
        ratings: [Rating]? = nil,
        reactions: [String: Int]? = nil,
        added: Int? = nil,
        addedByStatus: AddedByStatus? = nil,
        playtime: Int? = nil,
        screenshotsCount: Int? = nil,
        moviesCount: Int? = nil,
        creatorsCount: Int? = nil,
        achievementsCount: Int? = nil,
        parentAchievementsCount: Int? = nil,
        redditURL: String? = nil,
        redditName: String? = nil,
        redditDescription: String? = nil,
        redditLogo: String? = nil,
        redditCount: Int? = nil,
        twitchCount: Int? = nil,
        youtubeCount: Int? = nil,
        reviewsTextCount: Int? = nil,
        ratingsCount: Int? = nil,
        suggestionsCount: Int? = nil,
        alternativeNames: [String]? = nil,
        metacriticURL: String? = nil,
        parentsCount: Int? = nil,
        additionsCount: Int? = nil,
        gameSeriesCount: Int? = nil,
        userGame: JSONNull?? = nil,
        reviewsCount: Int? = nil,
        saturatedColor: String? = nil,
        dominantColor: String? = nil,
        parentPlatforms: [ParentPlatform]? = nil,
        platforms: [PlatformElement]? = nil,
        stores: [Store]? = nil,
        developers: [Developer]? = nil,
        genres: [Developer]? = nil,
        tags: [Developer]? = nil,
        publishers: [Developer]? = nil,
        esrbRating: EsrbRating? = nil,
        clip: JSONNull?? = nil,
        descriptionRaw: String? = nil
    ) -> GameDetail {
        return GameDetail(
            id: id ?? self.id,
            slug: slug ?? self.slug,
            name: name ?? self.name,
            nameOriginal: nameOriginal ?? self.nameOriginal,
            description: description ?? self.description,
            metacritic: metacritic ?? self.metacritic,
            metacriticPlatforms: metacriticPlatforms ?? self.metacriticPlatforms,
            released: released ?? self.released,
            tba: tba ?? self.tba,
            updated: updated ?? self.updated,
            backgroundImage: backgroundImage ?? self.backgroundImage,
            backgroundImageAdditional: backgroundImageAdditional ?? self.backgroundImageAdditional,
            website: website ?? self.website,
            rating: rating ?? self.rating,
            ratingTop: ratingTop ?? self.ratingTop,
            ratings: ratings ?? self.ratings,
            reactions: reactions ?? self.reactions,
            added: added ?? self.added,
            addedByStatus: addedByStatus ?? self.addedByStatus,
            playtime: playtime ?? self.playtime,
            screenshotsCount: screenshotsCount ?? self.screenshotsCount,
            moviesCount: moviesCount ?? self.moviesCount,
            creatorsCount: creatorsCount ?? self.creatorsCount,
            achievementsCount: achievementsCount ?? self.achievementsCount,
            parentAchievementsCount: parentAchievementsCount ?? self.parentAchievementsCount,
            redditURL: redditURL ?? self.redditURL,
            redditName: redditName ?? self.redditName,
            redditDescription: redditDescription ?? self.redditDescription,
            redditLogo: redditLogo ?? self.redditLogo,
            redditCount: redditCount ?? self.redditCount,
            twitchCount: twitchCount ?? self.twitchCount,
            youtubeCount: youtubeCount ?? self.youtubeCount,
            reviewsTextCount: reviewsTextCount ?? self.reviewsTextCount,
            ratingsCount: ratingsCount ?? self.ratingsCount,
            suggestionsCount: suggestionsCount ?? self.suggestionsCount,
            alternativeNames: alternativeNames ?? self.alternativeNames,
            metacriticURL: metacriticURL ?? self.metacriticURL,
            parentsCount: parentsCount ?? self.parentsCount,
            additionsCount: additionsCount ?? self.additionsCount,
            gameSeriesCount: gameSeriesCount ?? self.gameSeriesCount,
            userGame: userGame ?? self.userGame,
            reviewsCount: reviewsCount ?? self.reviewsCount,
            saturatedColor: saturatedColor ?? self.saturatedColor,
            dominantColor: dominantColor ?? self.dominantColor,
            parentPlatforms: parentPlatforms ?? self.parentPlatforms,
            platforms: platforms ?? self.platforms,
            stores: stores ?? self.stores,
            developers: developers ?? self.developers,
            genres: genres ?? self.genres,
            tags: tags ?? self.tags,
            publishers: publishers ?? self.publishers,
            esrbRating: esrbRating ?? self.esrbRating,
            clip: clip ?? self.clip,
            descriptionRaw: descriptionRaw ?? self.descriptionRaw
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - MetacriticPlatform
struct MetacriticPlatform: Codable {
    var metascore: Int
    var url: String
    var platform: MetacriticPlatformPlatform
}

// MARK: MetacriticPlatform convenience initializers and mutators

extension MetacriticPlatform {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MetacriticPlatform.self, from: data)
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
        metascore: Int? = nil,
        url: String? = nil,
        platform: MetacriticPlatformPlatform? = nil
    ) -> MetacriticPlatform {
        return MetacriticPlatform(
            metascore: metascore ?? self.metascore,
            url: url ?? self.url,
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


// MARK: - MetacriticPlatformPlatform
struct MetacriticPlatformPlatform: Codable {
    var platform: Int
    var name, slug: String
}

// MARK: MetacriticPlatformPlatform convenience initializers and mutators

extension MetacriticPlatformPlatform {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MetacriticPlatformPlatform.self, from: data)
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
        platform: Int? = nil,
        name: String? = nil,
        slug: String? = nil
    ) -> MetacriticPlatformPlatform {
        return MetacriticPlatformPlatform(
            platform: platform ?? self.platform,
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

// MARK: - Developer
struct Developer: Codable {
    var id: Int
    var name, slug: String
    var gamesCount: Int
    var imageBackground: String
    var domain: String?
    var language: Language?
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
}

// MARK: Developer convenience initializers and mutators

extension Developer {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Developer.self, from: data)
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
        slug: String? = nil,
        gamesCount: Int? = nil,
        imageBackground: String? = nil,
        domain: String?? = nil,
        language: Language?? = nil
    ) -> Developer {
        return Developer(
            id: id ?? self.id,
            name: name ?? self.name,
            slug: slug ?? self.slug,
            gamesCount: gamesCount ?? self.gamesCount,
            imageBackground: imageBackground ?? self.imageBackground,
            domain: domain ?? self.domain,
            language: language ?? self.language
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

