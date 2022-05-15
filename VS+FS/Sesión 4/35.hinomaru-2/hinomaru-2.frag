#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

uniform bool classic;

vec4 red = vec4(1,0,0,1);
vec4 white = vec4(1,1,1,1);
uniform float PI = 3.14159265359;

void main()
{
	vec2 C = vec2(0.5, 0.5);
	float d = distance(C, vtexCoord.xy);
	float step = step(0.2, d);			//step es lo mismo que decir if d <= 0.2 haz esto, si d > 0.2 haz esto otro
    
    if (!classic){
    	float anglePhi = PI/16;	
    	vec2 u = vec2(vtexCoord.x-C.x, vtexCoord.y-C.y);
    	float angleTheta = atan(u.t, u.s);
    	if (mod(angleTheta/anglePhi + 0.5, 2) < 1 || step == 0) fragColor = red;
    	else fragColor = white;
    }
    
    else {
    	if (step == 1) fragColor = white;
   		else fragColor = red;
    }
    
 
}
