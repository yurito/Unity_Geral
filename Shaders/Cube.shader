precision mediump float;

uniform float time;
// uniform vec2 mouse;
uniform vec2 resolution;

void main() {
    
    vec2 p =(gl_FragCoord.xy*2.-resolution.xy)/resolution.y;
    
    vec4 c = vec4(0.);
	
	 c =  	// color
		 vec4(p*.4+.5,1.,1)
		// rect
		 / ((abs((abs( p.x+p.y )+abs (p.x-p.y) )/1.0-.5)/.15)*5.1-vec4(.0))

		// animation
		-abs(p.x*sin(time));
	
	gl_FragColor =c;
}
