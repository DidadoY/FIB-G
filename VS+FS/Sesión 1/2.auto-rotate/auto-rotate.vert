#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float speed = 0.5;
uniform float time;

void main()
{	
	float angle = speed*time;
	mat3 rotacionY = mat3(vec3(cos(angle), 0, -sin(angle)),
						  vec3(    0     , 1,    0       ),
						  vec3(sin(angle), 0, cos(angle)));
						  
	vec3 newV = rotacionY*vertex;
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0); //El VS escriurà el color original del vèrtex, sense cap il·luminació. (quitar N.z)
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(newV, 1.0);
}
