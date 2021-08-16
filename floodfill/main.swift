//
//  main.swift
//  floodfill
//
//  Created by shunnamiki on 2021/08/16.
//

import Foundation


//print(question1())

func question2() -> Int {
    // helpers
    struct Point { let x: Int; let y: Int }
    let directions = [
        [-1, 0], // left
        [ 1, 0], // right
        [0, -1], // front
        [0,  1], // back
    ]
    
    // inputs
    let N = Int(readLine()!)!
    var country = [[Int]](repeating: [], count: N)
    var colored = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    
    for h in 0..<N {
        country[h] = readLine()!.split(separator: " ").map { Int($0)! }
    }

    func colorize(x: Int, y: Int, color: Int, country: [[Int]], colored: inout [[Int]], visited: inout[[Bool]]){
        let q = Queue<Point>()
        q.enqueue(item: Point(x: x, y: y))
        visited[y][x] = true
        colored[y][x] = color
        while !q.isEmpty() {
            let p = q.dequeue()!
            for set in directions {
                let nx = set[0] + p.x
                let ny = set[1] + p.y
                let isInCountry = nx >= 0 && nx < N && ny >= 0 && ny < N
                if !isInCountry { continue }
                if country[ny][nx] == 0 { continue }
                if visited[ny][nx] { continue }
                colored[ny][nx] = color
                visited[ny][nx] = true
                q.enqueue(item: Point(x: nx, y: ny))
            }
        }
    }
    
    // 1.get lands
    var color = 1;
    for y in 0..<N {
        for x in 0..<N {
            if country[y][x] == 1 && colored[y][x] == 0 {
                var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
                colorize(x: x, y: y, color: color, country: country, colored: &colored, visited: &visited)
                color += 1
            }
        }
    }
//    for line in colored { print(line) }
    
    // 2.lands len have to be more than equall 2
    if color <= 2 {
        print("Error: Invalid number of island. Island should be more than equal 2.")
        return -1
    }

    
    return 0
}




// 3.get shortest distances by each land till n-1 land(no need to run for last land)
// 4.return shortest

let r = question2()
