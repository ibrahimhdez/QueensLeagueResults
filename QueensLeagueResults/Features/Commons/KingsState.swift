//
//  KingsState.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 21/7/23.
//

enum KingsState: CombineState {
    case idle
    case teamsDownloaded([Teams])
}
