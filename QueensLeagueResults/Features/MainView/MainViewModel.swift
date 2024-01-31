//
//  MainViewModel.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 31/1/24.
//

struct MainViewModel {
    private let firestore = FirestoreRequest.shared
    private let teamsCollectionName = "teams"

    func getTeams(completion: @escaping (([Teams]) -> ()),
                  error: @escaping (() -> ())) {
        firestore.getData(collectionName: teamsCollectionName, Teams.self, success: { teams in
            completion(teams)
        }, error: {
            //TODO: Implement error handler
            error()
        })
    }
}
