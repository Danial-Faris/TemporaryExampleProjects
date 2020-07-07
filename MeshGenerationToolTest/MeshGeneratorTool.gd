tool
extends MeshInstance

export(float) var radius = 50.0 setget setRadius
export(int) var trianglesCount = 5 setget setTrianglesCount
export(Color) var innerColor = Color.blue setget setInnerColor
export(Color) var outerColor = Color.red setget setOuterColor


func regenerateMesh():
	var st = SurfaceTool.new()
	
	st.begin(Mesh.PRIMITIVE_TRIANGLE_FAN)
	
	st.add_color(innerColor)
	st.add_vertex(Vector3.ZERO)
	
	st.add_color(outerColor)
	for i in range(0, trianglesCount + 1):
		var angle = i * TAU / trianglesCount
		st.add_vertex((radius * Vector3.RIGHT).rotated(Vector3.DOWN, angle))
	
	mesh = st.commit()


func setRadius(value):
	value = max(value, 0.0)
	if radius == value:
		return
	radius = value
	regenerateMesh()

func setTrianglesCount(value):
	value = max(value, 3)
	if trianglesCount == value:
		return
	trianglesCount = value
	regenerateMesh()

func setInnerColor(value):
	if innerColor == value:
		return
	innerColor = value
	regenerateMesh()

func setOuterColor(value):
	if outerColor == value:
		return
	outerColor = value
	regenerateMesh()
