//
//  main.swift
//  floodfill
//
//  Created by shunnamiki on 2021/08/16.
//

import Foundation

struct Point {
    let x: Int
    let y: Int
}


let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let WIDTH = firstLine[0] // width
let HEIGHT = firstLine[1] // height
var days = [[Int]](repeating: [Int](repeating: -1, count: WIDTH), count: HEIGHT)
var matrix = [[Int]](repeating: [], count: HEIGHT)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: WIDTH), count: HEIGHT)

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


for h in 0..<HEIGHT {
    for w in 0..<WIDTH {
        if matrix[h][w] == 1 {
            days[h][w] = 0
            bfs(x: w, y: h, matrix: matrix, days: &days, visited: &visited)
            for line in visited{ print(line) }
        }
    }
}


for line in days {
    print(line)
}


func bfs(x: Int, y: Int, matrix: [[Int]], days: inout [[Int]], visited: inout [[Bool]]){
    let q = Queue<Point>();
    q.enqueue(item: Point(x: x, y: y))
    while !q.isEmpty() {
        let p = q.dequeue()!
        let x = p.x
        let y = p.y
        visited[y][x] = true
        for set in directions {
            let nx = x + set[0]
            let ny = y + set[1]
            
            // check if valid x,y
            let isInRange = nx >= 0 && nx < WIDTH && ny >= 0 && ny < HEIGHT
            if !isInRange { continue }
            
            // case: empty
            if matrix[ny][nx] == -1 {
                visited[ny][nx] = true
                continue
            }
            
            // case: should update case
            if days[ny][nx] == -1 || days[ny][nx] > days[y][x] + 1 {
                days[ny][nx] = days[y][x] + 1
                q.enqueue(item: Point(x: nx, y: ny))
            }
        }
    }
    
}
