#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;

void main()
{	
    float angle = 0;
    if (vertex.y > 0.5) angle = (vertex.y-0.5)*sin(time);
    mat4 rotationX = mat4(vec4(1,    0    ,     0    ,       0  ),
    			 		  vec4(0,  cos(angle) ,  sin(angle)  , 0),
    			 		  vec4(0, -sin(angle) ,  cos(angle)  , 0),
    			 		  vec4(0,     0   ,     0    , 		 1));
    vec3 tP = vec3(0, 1, 0);			 			 
    			     		 
    mat4 translation2 =  mat4(vec4(1 , 0 , 0 , 0),
    			     		  vec4(0 , 1 , 0 , 0),
    			      		  vec4(0 , 0 , 1 , 0),
    			     		  vec4(tP.x , -tP.y , tP.z , 1));    		 

    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix*inverse(translation2)*rotationX*translation2*vec4(vertex, 1.0);
}
