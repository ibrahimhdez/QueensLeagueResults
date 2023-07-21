//
//  MainView.swift
//  QueensLeagueResultados
//
//  Created by Ibrahim Hernández Jorge on 18/7/23.
//

import SwiftUI

struct MainView: View {
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

    @State var teams: [Teams] = []
    @State private var selectedTab = Tab.results
    @State private var currentJourney: String = "J11"
    private let firestore = FirestoreRequest.shared
    private let teamsCollectionName = "teams"
    let journeys: [String] = ["J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10", "J11"].reversed()

    var body: some View {
        VStack {
            Text(LocalizedStringKey(selectedTab.title))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.vertical)
                .font(.system(size: 35))
                .foregroundColor(.white)

            switch selectedTab {
            case .clasification:
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Clasification")
                }
            case .results:
                journeysSelectorView
                ScrollView(.vertical, showsIndicators: false) {
                    ResultsView(teams: teams)
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                }
            case .teams:
                ScrollView(.vertical, showsIndicators: false) {
                    TeamsView(teams: teams)
                }
            }
            bottomTabView
        }
        .background  (
            LinearGradient(gradient: Gradient(colors: [.darkPurple, .mint]), startPoint: .topTrailing, endPoint: .bottomLeading)
        )
        .onAppear {
            getTeams()
        }
    }
}

private extension MainView {
    func getTeams() {
        firestore.getData(collectionName: teamsCollectionName, Teams.self, success: { teams in
            self.teams = teams.sorted { $0.id ?? 0 < $1.id ?? 0 }
        }, error: {
            self.teams = []
        })
    }
    
    var journeysSelectorView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(journeys, id: \.self) { journey in
                    VStack(spacing: 12) {
                        Text(journey)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        ZStack {
                            if currentJourney == journey {
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .fill(.purple)
                            } else {
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .fill(.clear)
                            }
                        }
                        .padding(.horizontal, 8)
                        .frame(height: 4)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            currentJourney = journey
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }

    var bottomTabView: some View {
        TabView(selection: $selectedTab) {
            Text("")
                .tabItem {
                    Image(systemName: Tab.results.iconName)
                    Text(LocalizedStringKey(Tab.results.title))
                }
                .tag(Tab.results)

            Text("")
                .tabItem {
                    Image(systemName: Tab.clasification.iconName)
                    Text(LocalizedStringKey(Tab.clasification.title))
                }
                .tag(Tab.clasification)

            Text("")
                .tabItem {
                    Image(systemName: Tab.teams.iconName)
                    Text(LocalizedStringKey(Tab.teams.title))
                }
                .tag(Tab.teams)
        }
        .tint(.purple)
        .frame(height: 50)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
