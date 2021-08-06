Shader "Particles/Additive_hsv(no fog)" {
	Properties{
		_TintColor("Tint Color", Color) = (0.5,0.5,0.5,0.5)
		_MainTex("Particle Texture", 2D) = "white" {}
		_InvFade("Soft Particles Factor", Range(0.01,3.0)) = 1.0
		_H("H",range(0,1)) = 0
		_U("U",range(0,1)) = 0
		_E("E",range(0,1)) = 0
	}

		Category{
			Tags { "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" "PreviewType" = "Plane" }
			Blend SrcAlpha One
			ColorMask RGB
			Cull Off Lighting Off ZWrite Off

			SubShader {
				Pass {

					CGPROGRAM
					#pragma vertex vert
					#pragma fragment frag
					#pragma target 2.0
					#pragma multi_compile_particles
					

					#include "UnityCG.cginc"

					sampler2D _MainTex;
					fixed4 _TintColor;
					float3 RGB2HSV(float3 c)
					{
						float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
						float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
						float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));

						float d = q.x - min(q.w, q.y);
						float e = 1.0e-10;
						return float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
					}

					float3 hsb2rgb(float3 c) {
						float3 rgb = clamp(abs(fmod(c.x * 6.0 + float3(0.0, 4.0, 2.0), 6) - 3.0) - 1.0, 0, 1);
						rgb = rgb * rgb * (3.0 - 2.0 * rgb);
						return c.z * lerp(float3(1, 1, 1), rgb, c.y);
					}
					struct appdata_t {
						float4 vertex : POSITION;
						fixed4 color : COLOR;
						float2 texcoord : TEXCOORD0;
						UNITY_VERTEX_INPUT_INSTANCE_ID
					};

					struct v2f {
						float4 vertex : SV_POSITION;
						fixed4 color : COLOR;
						float2 texcoord : TEXCOORD0;
						

						UNITY_VERTEX_OUTPUT_STEREO
					};

					float4 _MainTex_ST;
					float _H;
					float _U;
					float _E;
					v2f vert(appdata_t v)
					{
						v2f o;
						UNITY_SETUP_INSTANCE_ID(v);
						UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
						o.vertex = UnityObjectToClipPos(v.vertex);

						o.color = v.color;
						o.texcoord = TRANSFORM_TEX(v.texcoord,_MainTex);
						
						return o;
					}

					UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);
					float _InvFade;

					fixed4 frag(v2f i) : SV_Target
					{


						fixed4 col = 2.0f * tex2D(_MainTex, i.texcoord);
						col.rgb = RGB2HSV(col.rgb);
						col.r += _H;
						col.g += _U;
						col.b += _E;
						col.rgb = hsb2rgb(col.rgb);
						col = col * _TintColor * i.color;
						col.a = saturate(col.a); // alpha should not have double-brightness applied to it, but we can't fix that legacy behaior without breaking everyone's effects, so instead clamp the output to get sensible HDR behavior (case 967476)

						return col;
					}
					ENDCG
				}
			}
		}
}

