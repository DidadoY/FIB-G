#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 N;
in vec2 vtexCoord;
uniform sampler2D colormap;

vec4 black = vec4(0,0,0,1);
void main()
{
    vec2 C1 = vec2(0.34, 0.65) -0.1*N.xy;
    vec2 C2 = vec2(0.66, 0.65)-0.1*N.xy;
    
    float d1 = distance(C1, vtexCoord.xy);
    float d2 = distance(C2, vtexCoord.xy);
    
    float step1 = step(0.05, d1);
    float step2 = step(0.05, d2);
    
    vec4 color = texture(colormap, vtexCoord);
    vec4 color2 = mix(black, color, step1);
    
    fragColor = mix(black, color2, step2);
}
