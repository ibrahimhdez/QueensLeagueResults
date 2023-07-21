//
//  ResultTeamView.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 21/7/23.
//

import SwiftUI

struct ResultTeamView: View {
    let team: Teams?

    var body: some View {
        VStack(spacing: 5) {
            Image(team?.image ?? "")
                .resizable()
                .frame(width: 50, height: 50)
            Text(team?.name ?? "")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
                .multilineTextAlignment(.center)
        }
        .frame(width: 110, height: 110)
    }
}
