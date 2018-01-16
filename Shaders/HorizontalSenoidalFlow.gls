#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 resolution;

void main( void ) {

	vec2 uv = ( gl_FragCoord.xy / resolution.xy ) * 2.0 - 1.0;

	vec3 finalColor = vec3 ( 0.6, 0.8, 0.5 );
	
	finalColor *= abs( 0.3 / (sin( uv.y + sin(uv.x+time * 3.0)* 0.20 ) * 40.0) );

	gl_FragColor = vec4( finalColor, 1.0 );

