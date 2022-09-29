#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrixInverse;
uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin;
uniform vec4 black = vec4(0,0,0,1);

void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
	
	EndPrimitive();

	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = black;
		vec4 v = gl_in[i].gl_Position;
		v.y = boundingBoxMin.y;
		gl_Position = modelViewProjectionMatrix*v;
		EmitVertex();
	}

    EndPrimitive();
}
