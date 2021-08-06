// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-9738-OUT;n:type:ShaderForge.SFN_Tex2d,id:5067,x:32284,y:32185,ptovrint:False,ptlb:Main_Tex,ptin:_Main_Tex,varname:node_5067,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0e152d67223ed58409e6cdfffca405da,ntxv:0,isnm:False|UVIN-8672-OUT;n:type:ShaderForge.SFN_Tex2d,id:9059,x:32298,y:33014,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_9059,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:9738,x:33025,y:32784,varname:node_9738,prsc:2|A-6641-OUT,B-7334-OUT,C-3191-OUT,D-1164-RGB,E-1164-A;n:type:ShaderForge.SFN_SwitchProperty,id:7334,x:32477,y:33046,ptovrint:False,ptlb:A/R,ptin:_AR,varname:node_7334,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9059-A,B-9059-R;n:type:ShaderForge.SFN_Tex2d,id:1246,x:31840,y:32780,ptovrint:False,ptlb:Rao_dong,ptin:_Rao_dong,varname:node_1246,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8665-OUT;n:type:ShaderForge.SFN_VertexColor,id:5937,x:32797,y:32210,varname:node_5937,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3191,x:33044,y:32402,varname:node_3191,prsc:2|A-5937-RGB,B-5937-A,C-3442-RGB,D-3442-A;n:type:ShaderForge.SFN_Lerp,id:1208,x:31990,y:32138,varname:node_1208,prsc:2|A-5979-OUT,B-1246-R,T-983-OUT;n:type:ShaderForge.SFN_Slider,id:983,x:31516,y:32331,ptovrint:False,ptlb:Rao_dong_power,ptin:_Rao_dong_power,varname:node_983,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Time,id:7349,x:30735,y:32481,varname:node_7349,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:6478,x:30810,y:32115,varname:node_6478,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:8708,x:30944,y:32414,varname:node_8708,prsc:2|A-6639-OUT,B-7349-T;n:type:ShaderForge.SFN_ValueProperty,id:6639,x:30759,y:32381,ptovrint:False,ptlb:U,ptin:_U,varname:node_6639,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:1468,x:30964,y:32592,varname:node_1468,prsc:2|A-7349-T,B-3709-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3709,x:30756,y:32655,ptovrint:False,ptlb:V,ptin:_V,varname:_U_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:7266,x:31554,y:31893,varname:node_7266,prsc:2|A-6750-OUT,B-1035-OUT;n:type:ShaderForge.SFN_Add,id:6960,x:31503,y:32028,varname:node_6960,prsc:2|A-29-OUT,B-6242-OUT;n:type:ShaderForge.SFN_Append,id:5979,x:31807,y:31981,varname:node_5979,prsc:2|A-7266-OUT,B-6960-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7735,x:31145,y:33104,ptovrint:False,ptlb:Rao_dong_speed,ptin:_Rao_dong_speed,varname:node_7735,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:7480,x:31402,y:33156,varname:node_7480,prsc:2|A-7735-OUT,B-5914-OUT;n:type:ShaderForge.SFN_Multiply,id:6460,x:31402,y:32929,varname:node_6460,prsc:2|A-7957-OUT,B-7735-OUT;n:type:ShaderForge.SFN_Add,id:9788,x:31634,y:32908,varname:node_9788,prsc:2|A-494-OUT,B-6460-OUT;n:type:ShaderForge.SFN_Add,id:6583,x:31653,y:33145,varname:node_6583,prsc:2|A-3784-OUT,B-7480-OUT;n:type:ShaderForge.SFN_Append,id:8665,x:31823,y:33068,varname:node_8665,prsc:2|A-9788-OUT,B-6583-OUT;n:type:ShaderForge.SFN_Tex2d,id:1164,x:32329,y:31964,ptovrint:False,ptlb:Wen_Li,ptin:_Wen_Li,varname:node_1164,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7126-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5792,x:31381,y:31651,ptovrint:False,ptlb:Wen_li_speed,ptin:_Wen_li_speed,varname:_Rao_dong_speed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:3620,x:31650,y:31709,varname:node_3620,prsc:2|A-5792-OUT,B-8069-OUT;n:type:ShaderForge.SFN_Multiply,id:2366,x:31650,y:31482,varname:node_2366,prsc:2|A-696-OUT,B-5792-OUT;n:type:ShaderForge.SFN_Add,id:1790,x:31882,y:31461,varname:node_1790,prsc:2|A-5365-OUT,B-2366-OUT;n:type:ShaderForge.SFN_Add,id:9368,x:31901,y:31698,varname:node_9368,prsc:2|A-7284-OUT,B-3620-OUT;n:type:ShaderForge.SFN_Append,id:7126,x:32071,y:31621,varname:node_7126,prsc:2|A-1790-OUT,B-9368-OUT;n:type:ShaderForge.SFN_Color,id:3442,x:32698,y:32361,ptovrint:False,ptlb:Main_Color,ptin:_Main_Color,varname:_Main_Color_copy,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Set,id:9898,x:31115,y:32354,varname:u_speed,prsc:2|IN-8708-OUT;n:type:ShaderForge.SFN_Set,id:8437,x:31139,y:32673,varname:v_speed,prsc:2|IN-1468-OUT;n:type:ShaderForge.SFN_Get,id:696,x:31360,y:31452,varname:node_696,prsc:2|IN-9898-OUT;n:type:ShaderForge.SFN_Get,id:8069,x:31337,y:31742,varname:node_8069,prsc:2|IN-8437-OUT;n:type:ShaderForge.SFN_Get,id:7957,x:31145,y:32904,varname:node_7957,prsc:2|IN-9898-OUT;n:type:ShaderForge.SFN_Get,id:5914,x:31163,y:33192,varname:node_5914,prsc:2|IN-8437-OUT;n:type:ShaderForge.SFN_Get,id:1035,x:31190,y:31889,varname:node_1035,prsc:2|IN-9898-OUT;n:type:ShaderForge.SFN_Get,id:6242,x:31176,y:32036,varname:node_6242,prsc:2|IN-8437-OUT;n:type:ShaderForge.SFN_Set,id:6892,x:31020,y:32115,varname:u,prsc:2|IN-6478-U;n:type:ShaderForge.SFN_Set,id:2250,x:31020,y:32191,varname:v,prsc:2|IN-6478-V;n:type:ShaderForge.SFN_Get,id:5365,x:31650,y:31391,varname:node_5365,prsc:2|IN-6892-OUT;n:type:ShaderForge.SFN_Get,id:7284,x:31650,y:31635,varname:node_7284,prsc:2|IN-2250-OUT;n:type:ShaderForge.SFN_Get,id:6750,x:31224,y:31808,varname:node_6750,prsc:2|IN-6892-OUT;n:type:ShaderForge.SFN_Get,id:29,x:31176,y:31980,varname:node_29,prsc:2|IN-2250-OUT;n:type:ShaderForge.SFN_Get,id:494,x:31800,y:32796,varname:node_494,prsc:2|IN-6892-OUT;n:type:ShaderForge.SFN_Get,id:3784,x:31516,y:33083,varname:node_3784,prsc:2|IN-2250-OUT;n:type:ShaderForge.SFN_Smoothstep,id:6641,x:32363,y:32499,varname:node_6641,prsc:2|A-4583-OUT,B-5082-OUT,V-5067-R;n:type:ShaderForge.SFN_Slider,id:4583,x:31989,y:32475,ptovrint:False,ptlb:Smooth,ptin:_Smooth,varname:node_4583,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:5082,x:31974,y:32582,ptovrint:False,ptlb:Widthe,ptin:_Widthe,varname:node_5082,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_ValueProperty,id:3024,x:31139,y:32462,ptovrint:False,ptlb:R,ptin:_R,varname:node_3024,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:4292,x:31341,y:32472,varname:node_4292,prsc:2|A-3024-OUT,B-7349-T;n:type:ShaderForge.SFN_Set,id:3126,x:31551,y:32508,varname:r_speed,prsc:2|IN-4292-OUT;n:type:ShaderForge.SFN_Rotator,id:4937,x:32022,y:31799,varname:node_4937,prsc:2|UVIN-5979-OUT,ANG-8500-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:8672,x:32165,y:31951,ptovrint:False,ptlb:Rotator,ptin:_Rotator,varname:node_8672,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1208-OUT,B-4937-UVOUT;n:type:ShaderForge.SFN_Get,id:8500,x:31807,y:31864,varname:node_8500,prsc:2|IN-3126-OUT;proporder:3442-5067-1246-9059-7334-983-6639-3709-8672-3024-7735-1164-5792-4583-5082;pass:END;sub:END;*/

Shader "Custom/fx_shader_01_liu_guang_01_add" {
    Properties {
        [HDR]_Main_Color ("Main_Color", Color) = (0.5,0.5,0.5,1)
        _Main_Tex ("Main_Tex", 2D) = "white" {}
        _Rao_dong ("Rao_dong", 2D) = "white" {}
        _mask ("mask", 2D) = "white" {}
        [MaterialToggle] _AR ("A/R", Float ) = 0
        _Rao_dong_power ("Rao_dong_power", Range(0, 1)) = 0
        _U ("U", Float ) = 0
        _V ("V", Float ) = 0
        [MaterialToggle] _Rotator ("Rotator", Float ) = 0
        _R ("R", Float ) = 0
        _Rao_dong_speed ("Rao_dong_speed", Float ) = 0
        _Wen_Li ("Wen_Li", 2D) = "white" {}
        _Wen_li_speed ("Wen_li_speed", Float ) = 0
        _Smooth ("Smooth", Range(0, 1)) = 0
        _Widthe ("Widthe", Range(0, 1)) = 1
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
			Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            //#define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            //#pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _Main_Tex; uniform float4 _Main_Tex_ST;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform fixed _AR;
            uniform sampler2D _Rao_dong; uniform float4 _Rao_dong_ST;
            uniform float _Rao_dong_power;
            uniform float _U;
            uniform float _V;
            uniform float _Rao_dong_speed;
            uniform sampler2D _Wen_Li; uniform float4 _Wen_Li_ST;
            uniform float _Wen_li_speed;
            uniform float4 _Main_Color;
            uniform float _Smooth;
            uniform float _Widthe;
            uniform float _R;
            uniform fixed _Rotator;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float u = i.uv0.r;
                float4 node_7349 = _Time;
                float u_speed = (_U*node_7349.g);
                float v = i.uv0.g;
                float v_speed = (node_7349.g*_V);
                float2 node_5979 = float2((u+u_speed),(v+v_speed));
                float2 node_8665 = float2((u+(u_speed*_Rao_dong_speed)),(v+(_Rao_dong_speed*v_speed)));
                float4 _Rao_dong_var = tex2D(_Rao_dong,TRANSFORM_TEX(node_8665, _Rao_dong));
                float r_speed = (_R*node_7349.g);
                float node_4937_ang = r_speed;
                float node_4937_spd = 1.0;
                float node_4937_cos = cos(node_4937_spd*node_4937_ang);
                float node_4937_sin = sin(node_4937_spd*node_4937_ang);
                float2 node_4937_piv = float2(0.5,0.5);
                float2 node_4937 = (mul(node_5979-node_4937_piv,float2x2( node_4937_cos, -node_4937_sin, node_4937_sin, node_4937_cos))+node_4937_piv);
                float2 _Rotator_var = lerp( lerp(node_5979,float2(_Rao_dong_var.r,_Rao_dong_var.r),_Rao_dong_power), node_4937, _Rotator );
                float4 _Main_Tex_var = tex2D(_Main_Tex,TRANSFORM_TEX(_Rotator_var, _Main_Tex));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float2 node_7126 = float2((u+(u_speed*_Wen_li_speed)),(v+(_Wen_li_speed*v_speed)));
                float4 _Wen_Li_var = tex2D(_Wen_Li,TRANSFORM_TEX(node_7126, _Wen_Li));

				float3 finalColor = (smoothstep( _Smooth, _Widthe, _Main_Tex_var.r )*lerp( _mask_var.a, _mask_var.r, _AR )*(i.vertexColor.rgb*i.vertexColor.a*_Main_Color.rgb*_Main_Color.a)*_Wen_Li_var.rgb*_Wen_Li_var.a);
				return fixed4(finalColor,smoothstep( _Smooth, _Widthe, _Main_Tex_var.r )*lerp( _mask_var.a, _mask_var.r, _AR ) * i.vertexColor.a * _Main_Color.r * _Wen_Li_var.r);
            }
            ENDCG
        }
    }
    // CustomEditor "ShaderForgeMaterialInspector"
}
