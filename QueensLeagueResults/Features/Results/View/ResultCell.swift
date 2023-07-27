//
//  ResultCell.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 21/7/23.
//

import SwiftUI

struct ResultCell: View {
    private let result: Result
    private var localTeam: Teams? = nil
    private var awayTeam: Teams? = nil

    init(result: Result, teams: [Teams]) {
        self.result = result
        self.localTeam = teams.filter { $0.id == result.localTeamId }.first
        self.awayTeam = teams.filter { $0.id == result.awayTeamId }.first
    }

    var body: some View {
        HStack {
            ResultTeamView(team: localTeam)
            Spacer()
            ScoreboardView(result: result)
            Spacer()
            ResultTeamView(team: awayTeam)
        }
        .frame(height: 110)
        .padding(.horizontal)
        .background(Color.darkGray)
        .cornerRadius(8)
        .shadow(color: .gray, radius: 5, x: 2, y: 2)
    }
}
