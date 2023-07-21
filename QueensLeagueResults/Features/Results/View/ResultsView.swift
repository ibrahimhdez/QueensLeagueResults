//
//  ResultsView.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 21/7/23.
//

import SwiftUI

struct ResultsView: View {
    @State private var results: [Result]
    private var teams: [Teams]

    init() {
        self.teams = []
        let result = Result(localTeamId: 3,
                            awayTeamId: 7,
                            result: [1, 1],
                            thereWerePenalties: true,
                            penaltiesResult: [2, 1],
                            isFinished: true)
        let result2 = Result(localTeamId: 9,
                            awayTeamId: 10,
                            result: [3, 5],
                            thereWerePenalties: false,
                            penaltiesResult: nil,
                            isFinished: true)

        self.results = [result, result2]
    }

    init(teams: [Teams]) {
        self.teams = teams

        let result = Result(localTeamId: 3,
                            awayTeamId: 7,
                            result: [1, 1],
                            thereWerePenalties: true,
                            penaltiesResult: [2, 1],
                            isFinished: true)
        let result2 = Result(localTeamId: 9,
                            awayTeamId: 10,
                            result: [3, 5],
                            thereWerePenalties: false,
                            penaltiesResult: nil,
                            isFinished: true)
        let result3 = Result(localTeamId: 8,
                            awayTeamId: 12,
                            result: [1, 3],
                            thereWerePenalties: false,
                            penaltiesResult: nil,
                            isFinished: true)
        let result4 = Result(localTeamId: 5,
                            awayTeamId: 6,
                            result: [4, 2],
                            thereWerePenalties: false,
                            penaltiesResult: nil,
                            isFinished: true)
        let result5 = Result(localTeamId: 1,
                            awayTeamId: 11,
                            result: [2, 5],
                            thereWerePenalties: false,
                            penaltiesResult: nil,
                            isFinished: true)
        let result6 = Result(localTeamId: 2,
                            awayTeamId: 4,
                            result: [4, 2],
                            thereWerePenalties: false,
                            penaltiesResult: nil,
                            isFinished: true)

        self.results = [result, result2, result3, result4, result5, result6]
    }

    var body: some View {
        VStack(spacing: 25) {
            ForEach(results, id: \.self) { result in
                ResultCell(result: result, teams: teams)
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}

