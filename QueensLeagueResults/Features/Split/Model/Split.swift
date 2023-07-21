//
//  Split.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 20/7/23.
//

struct Split: Codable {
    var id: Int?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        } catch {

        }
    }
}
