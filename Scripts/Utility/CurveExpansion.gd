extends Curve
class_name OwnCurve

# 커브의 더 많은 기능이 필요해서 만들기로 함


func GetCurveExtent() -> float:
	var extent : float = 0
	for i in range(bake_resolution):
		extent += sample(float(i)/bake_resolution)
	extent /= bake_resolution
	return extent
