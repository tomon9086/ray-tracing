let vec1 = Vector3(x: 1, y: 2, z: 3)
let vec2 = Vector3(x: 1.5, y: 2, z: 3.1415926535)

print("-vec1 =       " + (-vec1).tos())
print("vec1 + vec2 = " + (vec1 + vec2).tos())
print("vec1 - vec2 = " + (vec1 - vec2).tos())
print("vec1 * 2 =    " + (vec1 * 2).tos())
print("vec1 * vec2 = " + (vec1 * vec2).tos())
print("vec1 / 2 =    " + (vec1 / 2).tos())
print("vec1 / vec2 = " + (vec1 / vec2).tos())
print("vec1・vec2 =  " + String(vec1.dot(vec2)))
// print("" + Vector3(x: 1, y: 0, z: 0).cross(Vector3(x: 0, y: 1, z: 0)).tos())
print("vec1 × vec2 = " + vec1.cross(vec2).tos())
print("|vec1| =      " + String(vec1.magnitude()))
print("vec1/|vec1| = " + vec1.normalize().tos())
print("vec1/|vec1| = " + vec1.normalized.tos())

// Image.output(array: [[1, 2, 3], [4, 5, 6], [7, 8, 9]], dir: "./output")

func floatToUInt8(_ n: Float) -> UInt8 {
	return UInt8(min(max(n, 0), 255))
}
func vec3ToColor(_ vec: Vector3) -> [UInt8] {
	let v: Vector3 = vec * 255
	return [floatToUInt8(v.x), floatToUInt8(v.y), floatToUInt8(v.z)]
}

let width: Int = 256
let height: Int = 256

var arr: [[Vector3]]
arr = Array(repeating: Array(repeating: Vector3(x: 0, y: 0, z: 0), count: width), count: height)

let scene: [Shape] = [
	Sphere(
		position: Vector3(x: 0, y: 0, z: 0),
		radius: 0.3)
]
let intersections: [Intersection] = []

for y in 0 ..< height {
	for x in 0 ..< width {
		let ray = Ray(
			origin: Vector3(x: 0, y: 0, z: 10),
			direction: Vector3(
				x: Float(x) / Float(width) - 0.5,
				y: Float(y) / Float(height) - 0.5,
				z: -1
			).normalized)
		// arr[y][x] = Vector3(x: Float(x), y: Float(y), z: Float(255))
		var min: Intersection? = nil
		for shape in scene {
			let intersection: Intersection? = shape.intersect(ray)
			if min == nil || min!.distance > intersection!.distance {
				min = intersection
			}
		}
		if min != nil {
			arr[height - y - 1][x] = min!.normal / 2 + Vector3(x: 0.5, y: 0.5, z: 0.5)
		} else {
			arr[height - y - 1][x] = Vector3(x: 0, y: 0, z: 0)
		}
		// print(ray.direction.tos())
	}
}

Image.output(array: arr, f: vec3ToColor, dir: "./output")
