// Copyright © 2022 xDesign. All rights reserved.

import Foundation

print("Hello, World!")

let elvesCalories = data
    .split(separator: "\n\n")
    .map { substring in
        substring.split(separator: "\n")
    }
    .map { stringArray -> Int in
        stringArray
            .compactMap { Int($0) }
            .reduce(0, +)
    }
    .sorted()
    .reversed()

let elevesCaloriesArray = Array(elvesCalories)

let mostCalories = elevesCaloriesArray.first!
let top3Calories = elevesCaloriesArray[0...2].reduce(0, +)

print(mostCalories)
print(top3Calories)
