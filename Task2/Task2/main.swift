// Copyright © 2022 xDesign. All rights reserved.

import Foundation

print("Hello, World!")

enum RPS {
    case rock
    case paper
    case scissor

    var selectionPoint: Int {
        switch self {
        case .rock: return 1
        case .paper: return 2
        case .scissor: return 3
        }
    }

    func pointForWinning(against: RPS) -> Int {
        if self == against {
            return 3
        } else if self == .rock && against == .scissor ||
            self == .scissor && against == .paper ||
            self == .paper && against == .rock {
            return 6
        } else {
            return 0
        }
    }
}

enum RPSResult {
    case win
    case tie
    case lose

    var resultPoint: Int {
        switch self {
        case .lose: return 0
        case .tie: return 3
        case .win: return 6
        }
    }

    func pointForSelection(against: RPS) -> Int {
        switch (self, against) {
        case (.win, .rock), (.lose, .scissor): return RPS.paper.selectionPoint
        case (.win, .paper), (.lose, .rock): return RPS.scissor.selectionPoint
        case (.win, .scissor), (.lose, .paper): return RPS.rock.selectionPoint
        case (.tie, _):
            return against.selectionPoint
        }
    }
}

let map1: [String: RPS] = [
    "A": .rock,
    "B": .paper,
    "C": .scissor,
    "X": .rock,
    "Y": .paper,
    "Z": .scissor
]

let map2: [String: RPS] = [
    "A": .rock,
    "B": .paper,
    "C": .scissor
]

let map3: [String: RPSResult] = [
    "X": .lose,
    "Y": .tie,
    "Z": .win
]

let answer1 = data
    .split(separator: "\n")
    .map { $0
        .split(separator: " ")
        .map { map1[String($0)]! }
    }
    .reduce(0) { res, arr in
        res + arr.last!.selectionPoint + arr.last!.pointForWinning(against: arr.first!)
    }

print(answer1)

let answer2 = data
    .split(separator: "\n")
    .map {
        let arr = $0.split(separator: " ")
        let opponentMove = map2[String(arr[0])]!
        let endSituation = map3[String(arr[1])]!
        return endSituation.resultPoint + endSituation.pointForSelection(against: opponentMove)
    }
    .reduce(0, +)

print(answer2)
