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
            Text("\(result.getLocalGoals()) - \(result.getAwayGoals())")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .bold))
            if result.isFinished ?? false {
                Text("game_finished")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
            }
        }
    }
}
