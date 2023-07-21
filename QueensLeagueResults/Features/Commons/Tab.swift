//
//  Tab.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 21/7/23.
//

enum Tab: Int {
    case results = 0
    case clasification
    case teams

    var title: String {
        switch self {
        case .results: return "results_bottomBar"
        case .clasification: return "clasification_bottomBar"
        case .teams: return "teams_bottomBar"
        }
    }

    var iconName: String {
        switch self {
        case .results: return "soccerball"
        case .clasification: return "list.bullet"
        case .teams: return "tshirt.fill"
        }
    }
}
