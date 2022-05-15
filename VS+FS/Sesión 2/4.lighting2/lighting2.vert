#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;

uniform vec4 lightAmbient;  //Ia
uniform vec4 lightDiffuse;  //Id
uniform vec4 lightSpecular; //Is
uniform vec4 lightPosition;

uniform vec4 matAmbient;    //Ka
uniform vec4 matDiffuse;    //Kd
uniform vec4 matSpecular;   //Ks
uniform float matShininess; //s

vec4 phongLight(vec3 N, vec3 L, vec3 V){
    N = normalize(N);
    L = normalize(L);
    V = normalize(V);
    
    vec3 R = normalize(2*(dot(N,L))*N-L);
    float NL = max(0, dot(N,L));
    float RV = max(0, dot(R, V));
    
    vec4 ambient = matAmbient*lightAmbient;
    vec4 diffuse = matDiffuse*lightDiffuse*NL;
    vec4 specular = matSpecular*lightSpecular*pow(RV, matShininess);
    
    return (ambient+diffuse+specular);
    
}

void main()
{
    vec3 N = normalMatrix * normal;                 //vector normal unitario
    vec3 P = (modelViewMatrix * vec4(vertex.xyz, 1.0)).xyz;   //punto en eyespace
    vec3 V = -P;                                    //vector unitario del vértice a la cámara
    vec3 L = lightPosition.xyz - P;                     //vector unitrario hacia la fuente de luz
    frontColor = phongLight(N, L, V);
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
