#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

uniform sampler2D fbm;
uniform float time;
const float pi = 3.14159;

vec4 red = vec4(1,0,0,1);
vec4 yellow = vec4(1,1,0,1);
vec4 green = vec4(0,1,0,1);
vec4 cian = vec4(0,1,1,1);
vec4 blue = vec4(0,0,1,1);
vec4 magenta = vec4(1,0,1,1);

void main()
{
    float r = texture(fbm, vtexCoord).r;
    float A = 1;
    float f = 0.1;
    float phi = 2*pi*r;
    float v = A*sin(2*pi*time*f + phi);
    
    float t = 6*(v+1.)/2.;
    
    if(t < 0) fragColor = red;
    else if(t < 1) fragColor = mix(red,yellow,fract(t));
    else if(t < 2) fragColor = mix(yellow,green,fract(t));
    else if(t < 3) fragColor = mix(green,cian,fract(t));
    else if(t < 4) fragColor = mix(cian,blue,fract(t));
    else if(t < 5) fragColor = mix(blue,magenta,fract(t));
    else if(t < 6) fragColor = mix(magenta,red,fract(t));
    else fragColor = red;

}
