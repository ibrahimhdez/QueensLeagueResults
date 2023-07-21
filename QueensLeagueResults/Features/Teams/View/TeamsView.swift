//
//  TeamsView.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 21/7/23.
//

import SwiftUI
import Combine

struct TeamsView: View {
    @State var teams: [Teams] = []
    private let firestore = FirestoreRequest.shared
    private let collectionName = "teams"

    var body: some View {
        VStack(spacing: 25) {
            if teams.isEmpty {
                Text("Loading")
            } else {
                ForEach(teams, id: \.self) { team in
                    TeamCell(team)
                        .padding(.horizontal)
                }
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 25)
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        let team = Teams(name: "Ibrahim FC",
                         president: "Ibrahim Hernandez Jorge",
                         image: "porcinos")

        TeamsView()
    }
}
