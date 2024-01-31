//
//  TeamCell.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 21/7/23.
//

import SwiftUI

struct TeamCell: View {
    private let team: Teams

    init(_ team: Teams) {
        self.team = team
    }

    var body: some View {
        HStack(spacing: 15) {
            Image(team.image ?? "")
                .resizable()
                .frame(width: 80, height: 80)

            VStack(spacing: 10) {
                HStack {
                    Text(team.name ?? "")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    Text(team.president ?? "")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .frame(alignment: .leading)

            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(
            LinearGradient(gradient: Gradient(colors: getGradientColors()), startPoint: .leading, endPoint: .trailing)
            )
        .cornerRadius(8)
        .shadow(color: .gray, radius: 5, x: 2, y: 2)
    }
}

private extension TeamCell {
    func getGradientColors() -> [Color] {
        switch team.id {
        case 1: return [.porcinosPink, .porcinosPink]
        case 2: return [.red, .white]
        case 3: return [.indigo, .indigo]
        case 4: return [.blue, .yellow]
        case 5: return [.white, .black]
        case 6: return [.blueJijantes, .red]
        case 7: return [.mint, .purple]
        case 8: return [.black, .gold]
        case 9: return [.black, .porcinosPink]
        case 10: return [.blue, .orange]
        case 11: return [.yellow, .black]
        case 12: return [.greenTroncos, .greenTroncos]
        case .none:
            return [.gray, .gray]
        case .some(_):
            return [.gray, .gray]
        }
    }
}

struct TeamCell_Previews: PreviewProvider {
    static var previews: some View {
        let team = Teams(name: "Ibrahim FC",
                         president: "Ibrahim Hernandez Jorge",
                         image: "porcinos")
        TeamCell(team)
    }
}
