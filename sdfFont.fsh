#ifdef GL_ES
precision lowp float;
#endif

varying vec2 v_texCoord;

uniform sampler2D u_texture;
uniform vec4 color;
uniform vec3 borderColor;
uniform vec4 params;

void main() {

    float tx = texture2D(CC_Texture0, v_texCoord).r;
    
    float a = clamp((tx-params.x)*params.y, 0.0, 1.0);
    float b = min((tx-params.z)*params.w, 1.0);
    
    gl_FragColor=vec4(borderColor+(color.rgb-borderColor)*a, b*color.a);
}
