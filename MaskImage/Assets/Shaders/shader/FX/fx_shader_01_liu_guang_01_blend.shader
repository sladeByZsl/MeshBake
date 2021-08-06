// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|emission-8401-OUT,alpha-9671-OUT;n:type:ShaderForge.SFN_Tex2d,id:7498,x:31221,y:32703,ptovrint:False,ptlb:Main_Tex,ptin:_Main_Tex,varname:node_7498,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8462-OUT;n:type:ShaderForge.SFN_TexCoord,id:2314,x:29951,y:32528,varname:node_2314,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:5286,x:29718,y:32408,ptovrint:False,ptlb:U,ptin:_U,varname:node_5286,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:2182,x:29685,y:32757,ptovrint:False,ptlb:V,ptin:_V,varname:node_2182,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:8354,x:29696,y:32528,varname:node_8354,prsc:2;n:type:ShaderForge.SFN_Add,id:876,x:30190,y:32404,varname:node_876,prsc:2|A-1047-OUT,B-2314-U;n:type:ShaderForge.SFN_Add,id:6857,x:30181,y:32665,varname:node_6857,prsc:2|A-2314-V,B-5307-OUT;n:type:ShaderForge.SFN_Append,id:8722,x:30385,y:32534,varname:node_8722,prsc:2|A-876-OUT,B-6857-OUT;n:type:ShaderForge.SFN_Multiply,id:1047,x:29951,y:32394,varname:node_1047,prsc:2|A-5286-OUT,B-8354-T;n:type:ShaderForge.SFN_Multiply,id:5307,x:29951,y:32693,varname:node_5307,prsc:2|A-8354-T,B-2182-OUT;n:type:ShaderForge.SFN_Smoothstep,id:6743,x:31916,y:32201,varname:node_6743,prsc:2|A-7380-OUT,B-9570-OUT,V-7498-R;n:type:ShaderForge.SFN_Slider,id:1187,x:31081,y:31903,ptovrint:False,ptlb:Smooth,ptin:_Smooth,varname:node_1187,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.5;n:type:ShaderForge.SFN_Slider,id:7386,x:31081,y:32054,ptovrint:False,ptlb:Rong_Jie,ptin:_Rong_Jie,varname:node_7386,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0.0411763,max:1;n:type:ShaderForge.SFN_Vector1,id:39,x:31354,y:32180,varname:node_39,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:7380,x:31536,y:31918,varname:node_7380,prsc:2|A-1187-OUT,B-7386-OUT;n:type:ShaderForge.SFN_Add,id:9570,x:31536,y:32147,varname:node_9570,prsc:2|A-7386-OUT,B-39-OUT;n:type:ShaderForge.SFN_Slider,id:5602,x:31498,y:32510,ptovrint:False,ptlb:Width,ptin:_Width,varname:node_5602,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:-0.2366782,max:0;n:type:ShaderForge.SFN_Subtract,id:8012,x:31921,y:32349,varname:node_8012,prsc:2|A-7380-OUT,B-5602-OUT;n:type:ShaderForge.SFN_Subtract,id:6234,x:31921,y:32558,varname:node_6234,prsc:2|A-9570-OUT,B-5602-OUT;n:type:ShaderForge.SFN_Smoothstep,id:2085,x:32108,y:32383,varname:node_2085,prsc:2|A-8012-OUT,B-6234-OUT,V-7498-R;n:type:ShaderForge.SFN_Subtract,id:4469,x:32424,y:32242,varname:node_4469,prsc:2|A-5993-OUT,B-4618-OUT;n:type:ShaderForge.SFN_Color,id:6896,x:32458,y:32093,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_6896,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:3660,x:32746,y:32031,varname:node_3660,prsc:2|A-6896-RGB,B-4469-OUT;n:type:ShaderForge.SFN_Color,id:7378,x:32416,y:32481,ptovrint:False,ptlb:MainColor2,ptin:_MainColor2,varname:node_7378,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:8914,x:32860,y:32538,varname:node_8914,prsc:2|A-7378-RGB,B-2085-OUT;n:type:ShaderForge.SFN_Add,id:9866,x:32928,y:32361,varname:node_9866,prsc:2|A-3660-OUT,B-8914-OUT;n:type:ShaderForge.SFN_Clamp01,id:5993,x:32080,y:32211,varname:node_5993,prsc:2|IN-6743-OUT;n:type:ShaderForge.SFN_Clamp01,id:4618,x:32250,y:32276,varname:node_4618,prsc:2|IN-2085-OUT;n:type:ShaderForge.SFN_Tex2d,id:9469,x:30836,y:33163,ptovrint:False,ptlb:Rao_Dong,ptin:_Rao_Dong,varname:node_9469,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-9695-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9553,x:29672,y:33310,ptovrint:False,ptlb:Rao_Dong_Speed,ptin:_Rao_Dong_Speed,varname:node_9553,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:5488,x:29923,y:33517,varname:node_5488,prsc:2|A-2182-OUT,B-9553-OUT,C-8354-T;n:type:ShaderForge.SFN_Multiply,id:8433,x:29959,y:33081,varname:node_8433,prsc:2|A-5286-OUT,B-9553-OUT,C-8354-T;n:type:ShaderForge.SFN_Append,id:9695,x:30622,y:33211,varname:node_9695,prsc:2|A-9318-OUT,B-3567-OUT;n:type:ShaderForge.SFN_Slider,id:7040,x:30915,y:33563,ptovrint:False,ptlb:Rao_Dong_Pow,ptin:_Rao_Dong_Pow,varname:node_7040,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_TexCoord,id:9780,x:30138,y:33333,varname:node_9780,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:9318,x:30348,y:33209,varname:node_9318,prsc:2|A-8433-OUT,B-9780-U;n:type:ShaderForge.SFN_Add,id:3567,x:30364,y:33435,varname:node_3567,prsc:2|A-9780-V,B-5488-OUT;n:type:ShaderForge.SFN_Multiply,id:9671,x:32935,y:32892,varname:node_9671,prsc:2|A-4529-OUT,B-2521-OUT,C-2653-OUT,D-7349-A;n:type:ShaderForge.SFN_Tex2d,id:3501,x:32177,y:33229,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:node_3501,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6813-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:2653,x:32480,y:33270,ptovrint:False,ptlb:Mask_A/R,ptin:_Mask_AR,varname:node_2653,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3501-A,B-3501-R;n:type:ShaderForge.SFN_TexCoord,id:3306,x:31543,y:33124,varname:node_3306,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Lerp,id:4037,x:31741,y:33288,varname:node_4037,prsc:2|A-3306-UVOUT,B-9469-R,T-7040-OUT;n:type:ShaderForge.SFN_Lerp,id:8462,x:30976,y:32665,varname:node_8462,prsc:2|A-8722-OUT,B-9469-R,T-7040-OUT;n:type:ShaderForge.SFN_Add,id:4529,x:32538,y:32774,varname:node_4529,prsc:2|A-4469-OUT,B-2085-OUT;n:type:ShaderForge.SFN_VertexColor,id:7349,x:32961,y:32092,varname:node_7349,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8401,x:33220,y:32154,varname:node_8401,prsc:2|A-7349-RGB,B-9866-OUT,C-3501-RGB;n:type:ShaderForge.SFN_Multiply,id:7128,x:32723,y:32174,varname:node_7128,prsc:2|A-6896-A,B-4469-OUT;n:type:ShaderForge.SFN_Add,id:2521,x:32860,y:32702,varname:node_2521,prsc:2|A-7128-OUT,B-6662-OUT;n:type:ShaderForge.SFN_Multiply,id:6662,x:32593,y:32651,varname:node_6662,prsc:2|A-7378-A,B-2085-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:6813,x:31986,y:33091,ptovrint:False,ptlb:Mask_Rao_Dong,ptin:_Mask_Rao_Dong,varname:node_6813,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3306-UVOUT,B-4037-OUT;proporder:7498-6896-7378-5286-2182-1187-7386-5602-9469-9553-7040-3501-2653-6813;pass:END;sub:END;*/

Shader "Custom/fx_shader_01_liu_guang_01_blend" {
    Properties {
        _Main_Tex ("Main_Tex", 2D) = "white" {}
        _MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)
        _MainColor2 ("MainColor2", Color) = (0.5,0.5,0.5,1)
        _U ("U", Float ) = 0
        _V ("V", Float ) = 0
        _Smooth ("Smooth", Range(0, 0.5)) = 0
        _Rong_Jie ("Rong_Jie", Range(-1, 1)) = 0.0411763
        _Width ("Width", Range(-1, 0)) = -0.2366782
        _Rao_Dong ("Rao_Dong", 2D) = "white" {}
        _Rao_Dong_Speed ("Rao_Dong_Speed", Float ) = 0
        _Rao_Dong_Pow ("Rao_Dong_Pow", Range(0, 1)) = 0
        _Mask ("Mask", 2D) = "white" {}
        [MaterialToggle] _Mask_AR ("Mask_A/R", Float ) = 0
        [MaterialToggle] _Mask_Rao_Dong ("Mask_Rao_Dong", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform float _U;
            uniform float _V;
            uniform float _Smooth;
            uniform float _Rong_Jie;
            uniform float _Width;
            uniform float4 _MainColor;
            uniform float4 _MainColor2;
            uniform sampler2D _Rao_Dong; uniform float4 _Rao_Dong_ST;
            uniform float _Rao_Dong_Speed;
            uniform float _Rao_Dong_Pow;
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
            uniform fixed _Mask_AR;
            uniform fixed _Mask_Rao_Dong;
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
////// Emissive:
                float node_7380 = (_Smooth+_Rong_Jie);
                float node_9570 = (_Rong_Jie+0.5);
                float4 node_8354 = _Time;
                float2 node_9695 = float2(((_U*_Rao_Dong_Speed*node_8354.g)+i.uv0.r),(i.uv0.g+(_V*_Rao_Dong_Speed*node_8354.g)));
                float4 _Rao_Dong_var = tex2D(_Rao_Dong,TRANSFORM_TEX(node_9695, _Rao_Dong));
                float2 node_8462 = lerp(float2(((_U*node_8354.g)+i.uv0.r),(i.uv0.g+(node_8354.g*_V))),float2(_Rao_Dong_var.r,_Rao_Dong_var.r),_Rao_Dong_Pow);
                float4 _Main_Tex_var = tex2D(_Main_Tex,TRANSFORM_TEX(node_8462, _Main_Tex));
                float node_2085 = smoothstep( (node_7380-_Width), (node_9570-_Width), _Main_Tex_var.r );
                float node_4469 = (saturate(smoothstep( node_7380, node_9570, _Main_Tex_var.r ))-saturate(node_2085));
                float2 _Mask_Rao_Dong_var = lerp( i.uv0, lerp(i.uv0,float2(_Rao_Dong_var.r,_Rao_Dong_var.r),_Rao_Dong_Pow), _Mask_Rao_Dong );
                float4 _Mask_var = tex2D(_Mask,TRANSFORM_TEX(_Mask_Rao_Dong_var, _Mask));
                float3 emissive = (i.vertexColor.rgb*((_MainColor.rgb*node_4469)+(_MainColor2.rgb*node_2085))*_Mask_var.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,((node_4469+node_2085)*((_MainColor.a*node_4469)+(_MainColor2.a*node_2085))*lerp( _Mask_var.a, _Mask_var.r, _Mask_AR )*i.vertexColor.a));
            }
            ENDCG
        }
    }
    //CustomEditor "ShaderForgeMaterialInspector"
}
