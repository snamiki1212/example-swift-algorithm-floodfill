//
//  main.swift
//  floodfill
//
//  Created by shunnamiki on 2021/08/16.
//

import Foundation

print("Hello, World!")


let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let WIDTH = firstLine[0] // width
let HEIGHT = firstLine[1] // height
var days = [[Int?]](repeating: [Int?](repeating: nil, count: WIDTH), count: HEIGHT)
var matrix = [[Int]](repeating: [], count: HEIGHT)

let directions = [
    // [x, y]
    [-1, 0], // left
    [ 1, 0], // right
    [0, -1], // front
    [0,  1], // back
]


for h in 0..<HEIGHT {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    matrix[h] = line
}

//for n in 0..<N {
//    for m in 0..<M {
//        if matrix[n][m] == -1 { days[n][m] = -1 }
//    }
//}

for h in 0..<HEIGHT {
    for w in 0..<WIDTH {
        if matrix[h][w] == 1 {
            print("------------")
            print("call dfs", h, w)
            var visited = [[Bool]](repeating: [Bool](repeating: false, count: WIDTH), count: HEIGHT)
            days[h][w] = 0
            dfs(x: w, y: h, matrix: matrix, days: &days, visited: &visited)
            for line in days { print(line) }
        }
    }
}


print("---")

for line in days {
    print(line)
}


func dfs(x: Int, y: Int, matrix: [[Int]], days: inout [[Int?]], visited: inout [[Bool]]){
    print("[dfs]", x, y)
    if visited[y][x] { return }
    visited[y][x] = true
    for set in directions {
        let nx = x + set[0]
        let ny = y + set[1]
        
        // check valid x/y
        let isInRange = nx >= 0 && nx < WIDTH && ny >= 0 && ny < HEIGHT
        if !isInRange { continue }
        
        // case: already visited
        if visited[ny][nx] { continue }
        
        // case: empty
        if matrix[ny][nx] == -1 {
            visited[ny][nx] = true
            days[ny][nx] = -1
            continue
        }
        
        // case: first case
        if days[ny][nx] == nil {
            days[ny][nx] = days[y][x]! + 1
            dfs(x: nx, y: ny, matrix: matrix, days: &days, visited: &visited)
            continue
        }
        
        // case: should update case
        if days[ny][nx]! > days[y][x]! + 1 {
            days[ny][nx] = days[y][x]! + 1
            dfs(x: nx, y: ny, matrix: matrix, days: &days, visited: &visited)
        }
    }
}
