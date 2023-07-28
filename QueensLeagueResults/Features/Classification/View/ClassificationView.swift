//
//  ClassificationView.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 27/7/23.
//

import SwiftUI

struct ClassificationView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(spacing: 100) {
                HStack(spacing: 25) {
                    VStack(spacing: 25) {
                        Text("Pos")
                        ForEach(1..<13) {
                            Text($0.description)
                                .foregroundColor(getPosColor($0))
                                .font(.system(size: 18, weight: .bold))
                        }
                    }

                    VStack(spacing: 16) {
                        Text("Team")
                        ForEach(1..<13) { _ in
                            Image("porcinos")
                                .resizable()
                                .frame(width: 31, height: 31)
                        }
                    }
                    .position(x: 21, y: 295)
                    .frame(width: 50)

                    VStack(spacing: 25) {
                        Text("Pts")
                        ForEach(1..<13) { _ in
                            Text("22")
                        }
                        .font(.system(size: 18, weight: .bold))
                    }

                    VStack(spacing: 25) {
                        Text("V")
                        ForEach(1..<13) { _ in
                            Text("22")
                        }
                    }

                    VStack(spacing: 25) {
                        Text("VP")
                        ForEach(1..<13) { _ in
                            Text("22")
                        }
                    }

                    VStack(spacing: 25) {
                        Text("DP")
                        ForEach(1..<13) { _ in
                            Text("22")
                        }
                    }

                    VStack(spacing: 25) {
                        Text("D")
                        ForEach(1..<13) { _ in
                            Text("22")
                        }
                    }

                    VStack(spacing: 25) {
                        Text("GF")
                        ForEach(1..<13) { _ in
                            Text("22")
                        }
                    }

                    VStack(spacing: 25) {
                        Text("GC")
                        ForEach(1..<13) { _ in
                            Text("22")
                        }
                    }

                    VStack(spacing: 25) {
                        Text("DG")
                        ForEach(1..<13) { _ in
                            Text("22")
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            .font(.system(size: 18))
            .frame(alignment: .leading)
        }
    }
}

private extension ClassificationView {
    func getPosColor(_ pos: Int) -> Color {
        switch pos {
        case 1: return .green
        case 2, 3, 4: return .yellow
        case 5, 6, 7, 8, 9, 10: return .red
        default: return .white
        }
    }
}

struct ClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassificationView()
    }
}
