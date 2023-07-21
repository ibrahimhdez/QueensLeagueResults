//
//  Teams.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 21/7/23.
//

struct Teams: Codable {
    var id: Int?
    var name: String?
    var president: String?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case president = "president"
        case image = "image"
    }

    init(name: String, president: String, image: String) {
        self.name = name
        self.president = president
        self.image = image
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        president = try values.decodeIfPresent(String.self, forKey: .president)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }
}

extension Teams: Hashable {
    
}

