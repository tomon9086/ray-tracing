import Foundation

public struct Ray {
	public var origin: Vector3
	public var direction: Vector3
	public init(origin: Vector3, direction: Vector3) {
		self.origin = Vector3(x: origin.normalized.x, y: origin.normalized.y, z: origin.normalized.z)
		self.direction = Vector3(x: direction.x, y: direction.y, z: direction.z)
	}
}

public struct Intersection {
	var position: Vector3
	var normal: Vector3
	var distance: Float
	public init(position: Vector3, normal: Vector3, distance: Float) {
		self.position = Vector3(x: position.x, y: position.y, z: position.z)
		self.normal = Vector3(x: normal.normalized.x, y: normal.normalized.y, z: normal.normalized.z)
		self.distance = distance
	}
}

public protocol Shape {
	// var eps: Float { get set }
	func intersect(_ ray: Ray) -> Intersection?
}
extension Shape {
	public var eps: Float {
		return 0.001
	}
}

public struct Sphere: Shape {
	public var position: Vector3
	public var radius: Float
	public init(position: Vector3, radius: Float) {
		self.position = position
		self.radius = radius
	}
	public func intersect(_ ray: Ray) -> Intersection? {
		let po = ray.origin - self.position
		let b = ray.direction.dot(po)
		let c = po.magnitude() - self.radius * self.radius
		let det = b * b - c
		if det < 0.0 {
			return nil
		}
		let t1 = -b - sqrt(det)
		let t2 = -b + sqrt(det)
		if t1 < self.eps && t2 < self.eps {
			return nil
		}
		let distance = t1 > self.eps ? t1 : t2
		let position = ray.origin + ray.direction * distance
		let normal = (position - self.position).normalize()
		return Intersection(position: position, normal: normal, distance: distance)
	}
}
