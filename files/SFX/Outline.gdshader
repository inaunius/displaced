shader_type canvas_item;


const float _bounds_shift = 3.0;

uniform float _thickness = 3.0;
uniform float _occlude = 0.5;
uniform float _animation_speed = 6.0;
uniform vec4 _color: hint_color = vec4(1.0);
uniform bool _extend_bounds = false;


vec2 rotate(vec2 uv, vec2 pivot, float angle) {
	mat2 rotation = mat2(vec2(sin(angle), -cos(angle)),vec2(cos(angle), sin(angle)));
	uv -= pivot;
	uv = uv * rotation;
	uv += pivot;
	return uv;
}

bool is_in_bounds(vec2 uv) {
 return uv.x > 0.0 && uv.x < 1.0 && uv.y > 0.0 && uv.y < 1.0;
}

vec2 polar_uv(vec2 uv, float rotated) {
	
	uv -= 0.5;
	uv *= 2.0;
	
	float dist = length(uv);
	uv = rotate(uv, vec2(0.0),rotated);
	float angle = atan(uv.y, uv.x);
	return vec2(angle / 3.14*2.0, dist);
}

vec2 not_scaled_uv(vec2 uv) {
	return (uv*_bounds_shift)-vec2(1.7, 0.35);
}

float outline_mask(vec2 uv, sampler2D tex) {
	vec2 size = vec2(_thickness);
	
	float mask = texture(tex, uv).a;
	
	mask += texture(tex, uv + vec2(-size.x, 0.0)).a;
	mask += texture(tex, uv + vec2(size.x, 0.0)).a;
	mask += texture(tex, uv + vec2(0.0, -size.y)).a;
	mask += texture(tex, uv + vec2(0.0, size.y)).a;
	mask += texture(tex, uv + vec2(size.x, size.y)).a;
	mask += texture(tex, uv + vec2(-size.x, size.y)).a;
	mask += texture(tex, uv + vec2(size.x, -size.y)).a;
	mask += texture(tex, uv + vec2(-size.x, -size.y)).a;
	mask = min(mask, 1.0);
	
	return mask;
}
float rotation_angle() {
	return TIME*_animation_speed;
}

void vertex() {
	if (_extend_bounds) {
		VERTEX.xy *= _bounds_shift;
		VERTEX.xy -= _bounds_shift*13.4;
	}
}

void fragment() {
	vec2 original_uv = not_scaled_uv(UV);
	if (!_extend_bounds) { original_uv = UV;}
	
	vec4 image = texture(TEXTURE, original_uv);
	 
	if (!is_in_bounds(UV)) { image.a = 0.0; }
	
	vec2 occluder = step(_occlude, polar_uv(original_uv, rotation_angle()));
	
	float outline_a = outline_mask(original_uv, TEXTURE) - (image.a);
	vec4 outline = vec4(_color.rgb, outline_a-occluder.x);
	vec4 color = mix(image, outline, outline_a);
	
	
	COLOR = color;
	//COLOR = vec4(vec3(occluder.x, occluder.y, 1.0), 1.0);
}

