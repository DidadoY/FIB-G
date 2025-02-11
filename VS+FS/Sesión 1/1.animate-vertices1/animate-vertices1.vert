#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float amplitude = 0.1; 
uniform float freq = 1; // expressada en Hz 
uniform float time;
const float PI = 3.141592;
//formula sinusoidal A*sin(2*pi*f*t+fase)

void main()
{
	vec3 newVertex = vertex + normal* amplitude*sin(2*PI*freq*time);
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(vec3(N.z),1.0);		//color a gris per components la Z de la normal en eye space
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(newVertex, 1.0);
}
