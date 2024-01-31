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

            }
            .padding(.horizontal)
            .foregroundColor(.white)
            .font(.system(size: 18))
            .frame(alignment: .leading)
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
