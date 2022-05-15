#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

out vec3 N;
out vec3 V;
out vec3 L;

uniform bool world;

uniform vec4 lightPosition;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewMatrixInverse;
uniform mat3 normalMatrix;

void main()
{
    //eyeSpace
    if (world){
        N = normalMatrix * normal;
        vec3 P = (modelViewMatrix * vec4(vertex.xyz, 1.0)).xyz;
        V = -P;
        L = lightPosition.xyz - P;
    }
    
    //worldSpace (en este ejercicio worldSpace es objectSpace)
    else {
        N = normal;
        vec3 P = vertex.xyz;
        V = (modelViewMatrixInverse*vec4(0,0,0,1)).xyz-P;
        L = (modelViewMatrixInverse*lightPosition).xyz-P;
    }
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
