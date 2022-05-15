#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

const vec4 red = vec4(1,0,0,0);
const vec4 yellow = vec4(1,1,0,0);
const vec4 green = vec4(0,1,0,0);
const vec4 cian = vec4(0,1,1,0);
const vec4 blue = vec4(0,0,1,0);


void main()
{
    float yMax = boundingBoxMax.y;
    float yMin = boundingBoxMin.y;
    float pond = 4*(vertex.y-yMin)/(yMax-yMin);
    
    if (pond < 1) frontColor = mix(red, yellow, fract(pond));
    else if (pond < 2) frontColor = mix(yellow, green, fract(pond));
    else if (pond < 3) frontColor = mix(green, cian, fract(pond));
    else if (pond < 4) frontColor = mix(cian, blue, fract(pond));
    else frontColor = blue;
    
    vec3 N = normalize(normalMatrix * normal);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
