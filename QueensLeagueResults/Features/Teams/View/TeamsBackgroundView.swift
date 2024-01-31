//
//  TeamsBackgroundView.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 21/7/23.
//

import SwiftUI

struct TeamsBackgroundView: View {
    private let team: Teams?

    var body: some View {
        Text(team?.name ?? "")
    }
}
