import bpy
from bpy import data as D
from bpy import context as C
from mathutils import *
from math import *

# bpy.ops.mesh.primitive_grid_add(
#   x_subdivisions=10, y_subdivisions=10,
#   radius=1, view_align=False, enter_editmode=False,
#   location=(0, 0, 0), rotation=(0, 0, 0))
def new_grid(name='Grid',
             x_subdivisions=10,
             y_subdivisions=10,
             radius=1,
             location=(0, 0, 0),
             rotation=(0, 0, 0),
             scale=(1,1,1)):

    bpy.ops.object.select_all(action='DESELECT')

    bpy.ops.mesh.primitive_grid_add(
        x_subdivisions=x_subdivisions,
        y_subdivisions=y_subdivisions,
        radius=radius,
        location=location, rotation=rotation)

    bpy.context.object.scale = scale
    bpy.context.object.name = name
    return bpy.context.object

x_scale = 1
x_subdivisions = 10 * x_scale

y_scale = 20
y_subdivisions = 10 * y_scale

g = new_grid(x_subdivisions=x_subdivisions, y_subdivisions=y_subdivisions, scale=(x_scale, y_scale, 1))
# g.data.vertices.foreach_set(attr, seq)

import random
for v in g.data.vertices:
    if abs(v.co.x) != 1 and abs(v.co.y) != 1:
        v.co += Vector((0, 0, random.uniform(0, 0.24)))
    else:
        v.co += Vector((0, 0, random.uniform(0.08, 0.16)))
