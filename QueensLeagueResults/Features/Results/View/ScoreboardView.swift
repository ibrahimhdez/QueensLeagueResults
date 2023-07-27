//
//  ScoreboardView.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 21/7/23.
//

import SwiftUI

struct ScoreboardView: View {
    let result: Result

    var body: some View {
        VStack(spacing: 5) {
            Text(getResultString())
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .bold))
                .minimumScaleFactor(0.09)
                .lineLimit(1)
            if result.isFinished ?? false {
                Text("game_finished")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
            }
        }
    }
}

private extension ScoreboardView {
    func getResultString() -> String {
        let isPenaltiesResult = result.thereWerePenalties ?? false
        var resultString = "\(isPenaltiesResult ? "(\(result.getPenaltiesLocalGoals())) " : "")"
        resultString += "\(result.getLocalGoals()) - \(result.getAwayGoals())"
        resultString += "\(isPenaltiesResult ? " (\(result.getPenaltiesAwayGoals()))" : "")"

        return resultString
    }
}
