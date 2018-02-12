precision mediump float;

uniform float time;
uniform vec2 resolution;

#define LINES 27.0
#define BRIGHTNESS 0.5

const vec3 ORANGE = vec3(10.4, 0.8, 0.4);
const vec3 BLUE = vec3(0.5, 0.9, 1.3);
const vec3 GREEN = vec3(0.9, 0.4, 1.4);
const vec3 RED = vec3(1.8, 0.4, 0.3);
  
void main() {
  float y, x, ypos, xpos;
  float t = time * 10.0;
  vec3 c = vec3(0.0);
  
  xpos = (gl_FragCoord.y / resolution.y);
  ypos = (gl_FragCoord.x / resolution.x);
  
  x = xpos;
  for (float i = -10.0; i < LINES; i += 0.5) {
    y = ypos + (
        0.150 * sin(x * 1.000 + i * 0.4 + t * 0.050 * sin(time+i) * 0.027 )
      + 0.100 * cos(x * 6.350 + i * 0.7 + t * 0.250 )
      + 0.024 * sin(x * 12.35 + i * 0.8 + t * 0.134 * cos(time+i) * 0.027)
      + 0.600
    );
    
    c += vec3(1.0 - pow(
      clamp(abs(1.0 - y) * 60.0, 0.0, 1.0)  
    , 0.25));
  }
 
  c *= mix(
     mix(GREEN, BLUE, xpos)
   , mix(BLUE, RED, ypos)
   ,(sin(t * 0.02) + 1.0) / LINES
  ) * BRIGHTNESS ;
  
  gl_FragColor = vec4(c, 1.0);
}
