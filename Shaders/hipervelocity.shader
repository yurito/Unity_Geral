// https://www.shadertoy.com/view/XsXBzM

#ifdef GL_ES
precision mediump float;
precision highp float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

float Cell(vec2 c) {
	vec2 uv = fract(c);c -= uv;
	return (1.-length(uv*2.-1.)) * step(fract(sin(c.x+c.y*1e2)*1e3), .04);
}

void main( void )
{
	vec2 p = gl_FragCoord.xy / resolution.xy -.5;
	float a = fract(atan(p.x, p.y) / 6.2832);
	float d = length(p);
	float z = time / 1.5;
    vec3 col;
    
    for(int i=0; i<3 ;i++)
	{
    	z += 0.02;
		vec2 coord = vec2(pow(d, .04), a)*128.;
		vec2 delta = vec2(1. + z*20., 1.);
		float c = Cell(coord-=delta);
		c += Cell(coord-=delta);
        col[i]=c*d*3.;
    }    
	
	gl_FragColor = vec4(col,1);
}
