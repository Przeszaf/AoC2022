// Copyright © 2022 xDesign. All rights reserved.

import Foundation

print("Hello, World!")

let rangesArray = data
    .split(separator: "\n")
    .map { str -> [ClosedRange<Int>] in
        let arr = str.split(separator: ",")
        let firstRanges = arr[0].split(separator: "-").map { Int(String($0))! }
        let secondRanges = arr[1].split(separator: "-").map { Int(String($0))! }
        let firstRange = firstRanges[0] ... firstRanges[1]
        let secondRange = secondRanges[0] ... secondRanges[1]
        return [firstRange, secondRange]
    }

let firstAnswer = rangesArray
    .map { ranges in
        ranges[0].contains(ranges[1]) || ranges[1].contains(ranges[0])
    }
    .reduce(0) { partialResult, bool in
        if bool {
            return partialResult + 1
        } else {
            return partialResult
        }
    }

let secondAnswer = rangesArray
    .map { ranges in
        ranges[0].overlaps(ranges[1]) || ranges[1].overlaps(ranges[0])
    }
    .reduce(0) { partialResult, bool in
        if bool {
            return partialResult + 1
        } else {
            return partialResult
        }
    }

print(firstAnswer)
print(secondAnswer)
