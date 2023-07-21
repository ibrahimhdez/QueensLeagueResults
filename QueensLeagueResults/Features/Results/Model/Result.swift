//
//  Result.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 18/7/23.
//

struct Result: Codable {
    var id: Int?
//    var date: String?
    var localTeamId: Int?
    var awayTeamId: Int?
    var thereWerePenalties: Bool?
    var isFinished: Bool?
    private var result: [Int]?
    private var penaltiesResult: [Int]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
//        case date = "date"
        case localTeamId = "localTeamId"
        case awayTeamId = "awayTeamId"
        case result = "result"
        case thereWerePenalties = "thereWerePenalties"
        case penaltiesResult = "penaltiesResult"
        case isFinished = "isFinished"
    }

    init(localTeamId: Int, awayTeamId: Int, result: [Int], thereWerePenalties: Bool, penaltiesResult: [Int]?, isFinished: Bool) {
        self.localTeamId = localTeamId
        self.awayTeamId = awayTeamId
        self.result = result
        self.thereWerePenalties = thereWerePenalties
        self.penaltiesResult = penaltiesResult
        self.isFinished = isFinished
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = try values.decodeIfPresent(Int.self, forKey: .id)
//            date = try values.decodeIfPresent(String.self, forKey: .date)
            localTeamId = try values.decodeIfPresent(Int.self, forKey: .localTeamId)
            awayTeamId = try values.decodeIfPresent(Int.self, forKey: .awayTeamId)
            result = try values.decodeIfPresent([Int].self, forKey: .result)
            thereWerePenalties = try values.decodeIfPresent(Bool.self, forKey: .thereWerePenalties)
            penaltiesResult = try values.decodeIfPresent([Int].self, forKey: .penaltiesResult)
            isFinished = try values.decodeIfPresent(Bool.self, forKey: .isFinished)
        } catch {

        }
    }

    func getLocalGoals() -> String {
        guard let result else { return "0" }
        return !result.isEmpty ? String(result[0]) : "0"
    }

    func getAwayGoals() -> String {
        guard let result else { return "0" }
        return result.count > 1 ? String(result[1]) : "0"
    }
}

extension Result: Hashable {}
