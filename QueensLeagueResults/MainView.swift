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
        case teams

        var title: String {
            switch self {
            case .results: return "results_bottomBar"
            case .teams: return "teams_bottomBar"
            }
        }

        var iconName: String {
            switch self {
            case .results: return "soccerball"
            case .teams: return "tshirt.fill"
            }
        }
    }

    @State private var selectedTab = Tab.results
    @State private var currentJourney = "J1"
    let journeys = ["J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10", "J11"]

    var body: some View {
        VStack {
            Text(LocalizedStringKey(selectedTab.title))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.vertical)
                .font(.system(size: 35))

            ScrollView(.vertical, showsIndicators: false) {
                if selectedTab  == .results {
                    journeysSelectorView
                    
                } else {

                }
            }

            bottomTabView
        }
    }
}

private extension MainView {
    var journeysSelectorView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(journeys, id: \.self) { journey in
                    VStack(spacing: 12) {
                        Text(journey)
                            .fontWeight(.bold)
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
                    Image(systemName: Tab.teams.iconName)
                    Text(LocalizedStringKey(Tab.teams.title))
                }
                .tag(Tab.teams)
        }
        .tint(.purple)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
