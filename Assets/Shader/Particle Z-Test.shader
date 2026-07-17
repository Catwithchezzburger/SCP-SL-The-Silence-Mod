Shader "Particle Z-Test"
{
	Properties
	{
		_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
		_MainTex ("Particle Texture", 2D) = "white" {}
		_InvFade ("Soft Particles Factor", Range(0.01, 90)) = 1
		_Glow ("Intensity", Range(0, 300)) = 1
	}
	SubShader
	{
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass
		{
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Blend SrcAlpha One, SrcAlpha One
			ColorMask RGB
			ZWrite Off
			ZTest Always
			Cull Off
			GpuProgramID 36437

			HLSLPROGRAM

			// https://docs.unity3d.com/Manual/SL-PragmaDirectives.html
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 4.0
			#pragma shader_feature DIRECTIONAL
			#pragma multi_compile _ FOG_LINEAR
			#pragma multi_compile _ LIGHTPROBE_SH
			#pragma multi_compile _ SHADOWS_SCREEN
			#pragma multi_compile _ VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifndef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // !FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifndef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // !FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef LIGHTPROBE_SH
			#ifndef FOG_LINEAR
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // LIGHTPROBE_SH
			#endif // !FOG_LINEAR
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef LIGHTPROBE_SH
			#ifndef FOG_LINEAR
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // LIGHTPROBE_SH
			#endif // !FOG_LINEAR
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef SHADOWS_SCREEN
			#ifndef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // SHADOWS_SCREEN
			#endif // !FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef SHADOWS_SCREEN
			#ifndef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // SHADOWS_SCREEN
			#endif // !FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef LIGHTPROBE_SH
			#ifdef SHADOWS_SCREEN
			#ifndef FOG_LINEAR
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // LIGHTPROBE_SH
			#endif // SHADOWS_SCREEN
			#endif // !FOG_LINEAR
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef LIGHTPROBE_SH
			#ifdef SHADOWS_SCREEN
			#ifndef FOG_LINEAR
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // LIGHTPROBE_SH
			#endif // SHADOWS_SCREEN
			#endif // !FOG_LINEAR
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef VERTEXLIGHT_ON
			#ifndef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // VERTEXLIGHT_ON
			#endif // !FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN


			#ifdef DIRECTIONAL
			#ifdef VERTEXLIGHT_ON
			#ifndef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // VERTEXLIGHT_ON
			#endif // !FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN


			#ifdef DIRECTIONAL
			#ifdef LIGHTPROBE_SH
			#ifdef VERTEXLIGHT_ON
			#ifndef FOG_LINEAR
			#ifndef SHADOWS_SCREEN
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // LIGHTPROBE_SH
			#endif // VERTEXLIGHT_ON
			#endif // !FOG_LINEAR
			#endif // !SHADOWS_SCREEN


			#ifdef DIRECTIONAL
			#ifdef LIGHTPROBE_SH
			#ifdef VERTEXLIGHT_ON
			#ifndef FOG_LINEAR
			#ifndef SHADOWS_SCREEN
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // LIGHTPROBE_SH
			#endif // VERTEXLIGHT_ON
			#endif // !FOG_LINEAR
			#endif // !SHADOWS_SCREEN


			#ifdef DIRECTIONAL
			#ifdef SHADOWS_SCREEN
			#ifdef VERTEXLIGHT_ON
			#ifndef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // SHADOWS_SCREEN
			#endif // VERTEXLIGHT_ON
			#endif // !FOG_LINEAR
			#endif // !LIGHTPROBE_SH


			#ifdef DIRECTIONAL
			#ifdef SHADOWS_SCREEN
			#ifdef VERTEXLIGHT_ON
			#ifndef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // SHADOWS_SCREEN
			#endif // VERTEXLIGHT_ON
			#endif // !FOG_LINEAR
			#endif // !LIGHTPROBE_SH


			#ifdef DIRECTIONAL
			#ifdef LIGHTPROBE_SH
			#ifdef SHADOWS_SCREEN
			#ifdef VERTEXLIGHT_ON
			#ifndef FOG_LINEAR
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // LIGHTPROBE_SH
			#endif // SHADOWS_SCREEN
			#endif // VERTEXLIGHT_ON
			#endif // !FOG_LINEAR


			#ifdef DIRECTIONAL
			#ifdef LIGHTPROBE_SH
			#ifdef SHADOWS_SCREEN
			#ifdef VERTEXLIGHT_ON
			#ifndef FOG_LINEAR
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // LIGHTPROBE_SH
			#endif // SHADOWS_SCREEN
			#endif // VERTEXLIGHT_ON
			#endif // !FOG_LINEAR


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef SHADOWS_SCREEN
			#ifndef LIGHTPROBE_SH
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // SHADOWS_SCREEN
			#endif // !LIGHTPROBE_SH
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef SHADOWS_SCREEN
			#ifndef LIGHTPROBE_SH
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // SHADOWS_SCREEN
			#endif // !LIGHTPROBE_SH
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef LIGHTPROBE_SH
			#ifdef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // LIGHTPROBE_SH
			#endif // SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef LIGHTPROBE_SH
			#ifdef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // LIGHTPROBE_SH
			#endif // SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef VERTEXLIGHT_ON
			#ifndef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // VERTEXLIGHT_ON
			#endif // !LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef VERTEXLIGHT_ON
			#ifndef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // VERTEXLIGHT_ON
			#endif // !LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef LIGHTPROBE_SH
			#ifdef VERTEXLIGHT_ON
			#ifndef SHADOWS_SCREEN
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // LIGHTPROBE_SH
			#endif // VERTEXLIGHT_ON
			#endif // !SHADOWS_SCREEN


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef LIGHTPROBE_SH
			#ifdef VERTEXLIGHT_ON
			#ifndef SHADOWS_SCREEN
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // LIGHTPROBE_SH
			#endif // VERTEXLIGHT_ON
			#endif // !SHADOWS_SCREEN


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef SHADOWS_SCREEN
			#ifdef VERTEXLIGHT_ON
			#ifndef LIGHTPROBE_SH
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // SHADOWS_SCREEN
			#endif // VERTEXLIGHT_ON
			#endif // !LIGHTPROBE_SH


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef SHADOWS_SCREEN
			#ifdef VERTEXLIGHT_ON
			#ifndef LIGHTPROBE_SH
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // SHADOWS_SCREEN
			#endif // VERTEXLIGHT_ON
			#endif // !LIGHTPROBE_SH


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef LIGHTPROBE_SH
			#ifdef SHADOWS_SCREEN
			#ifdef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;
			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			static float4 vertex_uniform_buffer_0[5];
			static float4 vertex_uniform_buffer_1[4];
			static float4 vertex_uniform_buffer_2[21];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float2 vertex_input_2;
			static float4 vertex_output_1;
			static float2 vertex_output_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION; // POSITION
				float4 vertex_input_1 : COLOR; // COLOR
				float2 vertex_input_2 : TEXCOORD0; // TEXCOORD
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_1 : COLOR; // COLOR
				float2 vertex_output_2 : TEXCOORD; // TEXCOORD
				float4 gl_Position : SV_Position;
			};

			void vert_main()
			{
				precise float vertex_unnamed_46 = vertex_input_0.y * vertex_uniform_buffer_1[1u].x;
				precise float vertex_unnamed_47 = vertex_input_0.y * vertex_uniform_buffer_1[1u].y;
				precise float vertex_unnamed_48 = vertex_input_0.y * vertex_uniform_buffer_1[1u].z;
				precise float vertex_unnamed_49 = vertex_input_0.y * vertex_uniform_buffer_1[1u].w;
				precise float vertex_unnamed_83 = mad(vertex_uniform_buffer_1[2u].x, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].x, vertex_input_0.x, vertex_unnamed_46)) + vertex_uniform_buffer_1[3u].x;
				precise float vertex_unnamed_84 = mad(vertex_uniform_buffer_1[2u].y, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].y, vertex_input_0.x, vertex_unnamed_47)) + vertex_uniform_buffer_1[3u].y;
				precise float vertex_unnamed_85 = mad(vertex_uniform_buffer_1[2u].z, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].z, vertex_input_0.x, vertex_unnamed_48)) + vertex_uniform_buffer_1[3u].z;
				precise float vertex_unnamed_86 = mad(vertex_uniform_buffer_1[2u].w, vertex_input_0.z, mad(vertex_uniform_buffer_1[0u].w, vertex_input_0.x, vertex_unnamed_49)) + vertex_uniform_buffer_1[3u].w;
				precise float vertex_unnamed_94 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].x;
				precise float vertex_unnamed_95 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].y;
				precise float vertex_unnamed_96 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].z;
				precise float vertex_unnamed_97 = vertex_unnamed_84 * vertex_uniform_buffer_2[18u].w;
				gl_Position.x = mad(vertex_uniform_buffer_2[20u].x, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].x, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].x, vertex_unnamed_83, vertex_unnamed_94)));
				gl_Position.y = mad(vertex_uniform_buffer_2[20u].y, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].y, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].y, vertex_unnamed_83, vertex_unnamed_95)));
				gl_Position.z = mad(vertex_uniform_buffer_2[20u].z, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].z, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].z, vertex_unnamed_83, vertex_unnamed_96)));
				gl_Position.w = mad(vertex_uniform_buffer_2[20u].w, vertex_unnamed_86, mad(vertex_uniform_buffer_2[19u].w, vertex_unnamed_85, mad(vertex_uniform_buffer_2[17u].w, vertex_unnamed_83, vertex_unnamed_97)));
				precise float vertex_unnamed_150 = vertex_input_1.x * vertex_uniform_buffer_0[2u].x;
				precise float vertex_unnamed_151 = vertex_input_1.y * vertex_uniform_buffer_0[2u].y;
				precise float vertex_unnamed_152 = vertex_input_1.z * vertex_uniform_buffer_0[2u].z;
				precise float vertex_unnamed_153 = vertex_input_1.w * vertex_uniform_buffer_0[2u].w;
				precise float vertex_unnamed_157 = vertex_unnamed_150 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_158 = vertex_unnamed_151 * vertex_uniform_buffer_0[3u].x;
				precise float vertex_unnamed_159 = vertex_unnamed_152 * vertex_uniform_buffer_0[3u].x;
				vertex_output_1.x = vertex_unnamed_157;
				vertex_output_1.y = vertex_unnamed_158;
				vertex_output_1.z = vertex_unnamed_159;
				vertex_output_1.w = vertex_unnamed_153;
				vertex_output_2.x = mad(vertex_input_2.x, vertex_uniform_buffer_0[4u].x, vertex_uniform_buffer_0[4u].z);
				vertex_output_2.y = mad(vertex_input_2.y, vertex_uniform_buffer_0[4u].y, vertex_uniform_buffer_0[4u].w);
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				vertex_uniform_buffer_0[2] = float4(_TintColor[0], _TintColor[1], _TintColor[2], _TintColor[3]);

				vertex_uniform_buffer_0[3] = float4(_Glow, vertex_uniform_buffer_0[3][1], vertex_uniform_buffer_0[3][2], vertex_uniform_buffer_0[3][3]);

				vertex_uniform_buffer_0[4] = float4(_MainTex_ST[0], _MainTex_ST[1], _MainTex_ST[2], _MainTex_ST[3]);

				vertex_uniform_buffer_1[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				vertex_uniform_buffer_1[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				vertex_uniform_buffer_1[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				vertex_uniform_buffer_1[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				vertex_uniform_buffer_2[17] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				vertex_uniform_buffer_2[18] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				vertex_uniform_buffer_2[19] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				vertex_uniform_buffer_2[20] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_1 = vertex_output_1;
				stage_output.vertex_output_2 = vertex_output_2;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // LIGHTPROBE_SH
			#endif // SHADOWS_SCREEN
			#endif // VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef LIGHTPROBE_SH
			#ifdef SHADOWS_SCREEN
			#ifdef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _TintColor;
			float _Glow;
			float4 _MainTex_ST;

			static float4 unity_ObjectToWorld__array[4];
			static float4 unity_MatrixVP__array[4];
			static float4 gl_Position;
			static float4 vertex_input_0;
			static float4 vertex_input_1;
			static float4 vertex_output_0;
			static float2 vertex_output_1;
			static float2 vertex_input_2;

			struct Vertex_Stage_Input
			{
				float4 vertex_input_0 : POSITION;
				float4 vertex_input_1 : COLOR;
				float2 vertex_input_2 : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float4 vertex_output_0 : UNKNOWN0;
				float2 vertex_output_1 : TEXCOORD0; // vs_TEXCOORD0
				float4 gl_Position : SV_Position;
			};

			static float4 vertex_unnamed_9;
			static float4 vertex_unnamed_48;

			void vert_main()
			{
				vertex_unnamed_9 = vertex_input_0.yyyy * unity_ObjectToWorld__array[1];
				vertex_unnamed_9 = (unity_ObjectToWorld__array[0] * vertex_input_0.xxxx) + vertex_unnamed_9;
				vertex_unnamed_9 = (unity_ObjectToWorld__array[2] * vertex_input_0.zzzz) + vertex_unnamed_9;
				vertex_unnamed_9 += unity_ObjectToWorld__array[3];
				vertex_unnamed_48 = vertex_unnamed_9.yyyy * unity_MatrixVP__array[1];
				vertex_unnamed_48 = (unity_MatrixVP__array[0] * vertex_unnamed_9.xxxx) + vertex_unnamed_48;
				vertex_unnamed_48 = (unity_MatrixVP__array[2] * vertex_unnamed_9.zzzz) + vertex_unnamed_48;
				gl_Position = (unity_MatrixVP__array[3] * vertex_unnamed_9.wwww) + vertex_unnamed_48;
				vertex_unnamed_9 = vertex_input_1 * _TintColor;
				float3 vertex_unnamed_95 = vertex_unnamed_9.xyz * _Glow.xxx;
				vertex_output_0 = float4(vertex_unnamed_95.x, vertex_unnamed_95.y, vertex_unnamed_95.z, vertex_output_0.w);
				vertex_output_0.w = vertex_unnamed_9.w;
				vertex_output_1 = (vertex_input_2 * _MainTex_ST.xy) + _MainTex_ST.zw;
			}

			Vertex_Stage_Output vert(Vertex_Stage_Input stage_input)
			{
				unity_ObjectToWorld__array[0] = float4(unity_ObjectToWorld[0][0], unity_ObjectToWorld[1][0], unity_ObjectToWorld[2][0], unity_ObjectToWorld[3][0]);
				unity_ObjectToWorld__array[1] = float4(unity_ObjectToWorld[0][1], unity_ObjectToWorld[1][1], unity_ObjectToWorld[2][1], unity_ObjectToWorld[3][1]);
				unity_ObjectToWorld__array[2] = float4(unity_ObjectToWorld[0][2], unity_ObjectToWorld[1][2], unity_ObjectToWorld[2][2], unity_ObjectToWorld[3][2]);
				unity_ObjectToWorld__array[3] = float4(unity_ObjectToWorld[0][3], unity_ObjectToWorld[1][3], unity_ObjectToWorld[2][3], unity_ObjectToWorld[3][3]);

				unity_MatrixVP__array[0] = float4(unity_MatrixVP[0][0], unity_MatrixVP[1][0], unity_MatrixVP[2][0], unity_MatrixVP[3][0]);
				unity_MatrixVP__array[1] = float4(unity_MatrixVP[0][1], unity_MatrixVP[1][1], unity_MatrixVP[2][1], unity_MatrixVP[3][1]);
				unity_MatrixVP__array[2] = float4(unity_MatrixVP[0][2], unity_MatrixVP[1][2], unity_MatrixVP[2][2], unity_MatrixVP[3][2]);
				unity_MatrixVP__array[3] = float4(unity_MatrixVP[0][3], unity_MatrixVP[1][3], unity_MatrixVP[2][3], unity_MatrixVP[3][3]);

				vertex_input_0 = stage_input.vertex_input_0;
				vertex_input_1 = stage_input.vertex_input_1;
				vertex_input_2 = stage_input.vertex_input_2;
				vert_main();
				Vertex_Stage_Output stage_output;
				stage_output.gl_Position = gl_Position;
				stage_output.vertex_output_0 = vertex_output_0;
				stage_output.vertex_output_1 = vertex_output_1;
				return stage_output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_0;
			static float2 fragment_input_1;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_0 : UNKNOWN0;
				float2 fragment_input_1 : TEXCOORD0; // vs_TEXCOORD0
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			static float4 fragment_unnamed_9;
			static float4 fragment_unnamed_15;

			void frag_main()
			{
				fragment_unnamed_9 = fragment_input_0 + fragment_input_0;
				fragment_unnamed_15 = _MainTex.Sample(sampler_MainTex, fragment_input_1);
				fragment_output_0 = fragment_unnamed_9 * fragment_unnamed_15;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_0 = stage_input.fragment_input_0;
				fragment_input_1 = stage_input.fragment_input_1;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // LIGHTPROBE_SH
			#endif // SHADOWS_SCREEN
			#endif // VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifndef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_1;
			static float2 fragment_input_2;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_1 : COLOR; // COLOR
				float2 fragment_input_2 : TEXCOORD; // TEXCOORD
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			void frag_main()
			{
				precise float fragment_unnamed_45 = fragment_input_1.x + fragment_input_1.x;
				precise float fragment_unnamed_46 = fragment_input_1.y + fragment_input_1.y;
				precise float fragment_unnamed_47 = fragment_input_1.z + fragment_input_1.z;
				precise float fragment_unnamed_48 = fragment_input_1.w + fragment_input_1.w;
				float4 fragment_unnamed_56 = _MainTex.Sample(sampler_MainTex, float2(fragment_input_2.x, fragment_input_2.y));
				precise float fragment_unnamed_62 = fragment_unnamed_45 * fragment_unnamed_56.x;
				precise float fragment_unnamed_63 = fragment_unnamed_46 * fragment_unnamed_56.y;
				precise float fragment_unnamed_64 = fragment_unnamed_47 * fragment_unnamed_56.z;
				precise float fragment_unnamed_65 = fragment_unnamed_48 * fragment_unnamed_56.w;
				fragment_output_0.x = fragment_unnamed_62;
				fragment_output_0.y = fragment_unnamed_63;
				fragment_output_0.z = fragment_unnamed_64;
				fragment_output_0.w = fragment_unnamed_65;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_1 = stage_input.fragment_input_1;
				fragment_input_2 = stage_input.fragment_input_2;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // !FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef LIGHTPROBE_SH
			#ifndef FOG_LINEAR
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_1;
			static float2 fragment_input_2;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_1 : COLOR; // COLOR
				float2 fragment_input_2 : TEXCOORD; // TEXCOORD
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			void frag_main()
			{
				precise float fragment_unnamed_45 = fragment_input_1.x + fragment_input_1.x;
				precise float fragment_unnamed_46 = fragment_input_1.y + fragment_input_1.y;
				precise float fragment_unnamed_47 = fragment_input_1.z + fragment_input_1.z;
				precise float fragment_unnamed_48 = fragment_input_1.w + fragment_input_1.w;
				float4 fragment_unnamed_56 = _MainTex.Sample(sampler_MainTex, float2(fragment_input_2.x, fragment_input_2.y));
				precise float fragment_unnamed_62 = fragment_unnamed_45 * fragment_unnamed_56.x;
				precise float fragment_unnamed_63 = fragment_unnamed_46 * fragment_unnamed_56.y;
				precise float fragment_unnamed_64 = fragment_unnamed_47 * fragment_unnamed_56.z;
				precise float fragment_unnamed_65 = fragment_unnamed_48 * fragment_unnamed_56.w;
				fragment_output_0.x = fragment_unnamed_62;
				fragment_output_0.y = fragment_unnamed_63;
				fragment_output_0.z = fragment_unnamed_64;
				fragment_output_0.w = fragment_unnamed_65;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_1 = stage_input.fragment_input_1;
				fragment_input_2 = stage_input.fragment_input_2;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // LIGHTPROBE_SH
			#endif // !FOG_LINEAR
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef SHADOWS_SCREEN
			#ifndef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_1;
			static float2 fragment_input_2;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_1 : COLOR; // COLOR
				float2 fragment_input_2 : TEXCOORD; // TEXCOORD
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			void frag_main()
			{
				precise float fragment_unnamed_45 = fragment_input_1.x + fragment_input_1.x;
				precise float fragment_unnamed_46 = fragment_input_1.y + fragment_input_1.y;
				precise float fragment_unnamed_47 = fragment_input_1.z + fragment_input_1.z;
				precise float fragment_unnamed_48 = fragment_input_1.w + fragment_input_1.w;
				float4 fragment_unnamed_56 = _MainTex.Sample(sampler_MainTex, float2(fragment_input_2.x, fragment_input_2.y));
				precise float fragment_unnamed_62 = fragment_unnamed_45 * fragment_unnamed_56.x;
				precise float fragment_unnamed_63 = fragment_unnamed_46 * fragment_unnamed_56.y;
				precise float fragment_unnamed_64 = fragment_unnamed_47 * fragment_unnamed_56.z;
				precise float fragment_unnamed_65 = fragment_unnamed_48 * fragment_unnamed_56.w;
				fragment_output_0.x = fragment_unnamed_62;
				fragment_output_0.y = fragment_unnamed_63;
				fragment_output_0.z = fragment_unnamed_64;
				fragment_output_0.w = fragment_unnamed_65;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_1 = stage_input.fragment_input_1;
				fragment_input_2 = stage_input.fragment_input_2;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // SHADOWS_SCREEN
			#endif // !FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef LIGHTPROBE_SH
			#ifdef SHADOWS_SCREEN
			#ifndef FOG_LINEAR
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_1;
			static float2 fragment_input_2;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_1 : COLOR; // COLOR
				float2 fragment_input_2 : TEXCOORD; // TEXCOORD
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			void frag_main()
			{
				precise float fragment_unnamed_45 = fragment_input_1.x + fragment_input_1.x;
				precise float fragment_unnamed_46 = fragment_input_1.y + fragment_input_1.y;
				precise float fragment_unnamed_47 = fragment_input_1.z + fragment_input_1.z;
				precise float fragment_unnamed_48 = fragment_input_1.w + fragment_input_1.w;
				float4 fragment_unnamed_56 = _MainTex.Sample(sampler_MainTex, float2(fragment_input_2.x, fragment_input_2.y));
				precise float fragment_unnamed_62 = fragment_unnamed_45 * fragment_unnamed_56.x;
				precise float fragment_unnamed_63 = fragment_unnamed_46 * fragment_unnamed_56.y;
				precise float fragment_unnamed_64 = fragment_unnamed_47 * fragment_unnamed_56.z;
				precise float fragment_unnamed_65 = fragment_unnamed_48 * fragment_unnamed_56.w;
				fragment_output_0.x = fragment_unnamed_62;
				fragment_output_0.y = fragment_unnamed_63;
				fragment_output_0.z = fragment_unnamed_64;
				fragment_output_0.w = fragment_unnamed_65;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_1 = stage_input.fragment_input_1;
				fragment_input_2 = stage_input.fragment_input_2;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // LIGHTPROBE_SH
			#endif // SHADOWS_SCREEN
			#endif // !FOG_LINEAR
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifndef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_1;
			static float2 fragment_input_2;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_1 : COLOR; // COLOR
				float2 fragment_input_2 : TEXCOORD; // TEXCOORD
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			void frag_main()
			{
				precise float fragment_unnamed_45 = fragment_input_1.x + fragment_input_1.x;
				precise float fragment_unnamed_46 = fragment_input_1.y + fragment_input_1.y;
				precise float fragment_unnamed_47 = fragment_input_1.z + fragment_input_1.z;
				precise float fragment_unnamed_48 = fragment_input_1.w + fragment_input_1.w;
				float4 fragment_unnamed_56 = _MainTex.Sample(sampler_MainTex, float2(fragment_input_2.x, fragment_input_2.y));
				precise float fragment_unnamed_62 = fragment_unnamed_45 * fragment_unnamed_56.x;
				precise float fragment_unnamed_63 = fragment_unnamed_46 * fragment_unnamed_56.y;
				precise float fragment_unnamed_64 = fragment_unnamed_47 * fragment_unnamed_56.z;
				precise float fragment_unnamed_65 = fragment_unnamed_48 * fragment_unnamed_56.w;
				fragment_output_0.x = fragment_unnamed_62;
				fragment_output_0.y = fragment_unnamed_63;
				fragment_output_0.z = fragment_unnamed_64;
				fragment_output_0.w = fragment_unnamed_65;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_1 = stage_input.fragment_input_1;
				fragment_input_2 = stage_input.fragment_input_2;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // !LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef LIGHTPROBE_SH
			#ifndef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_1;
			static float2 fragment_input_2;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_1 : COLOR; // COLOR
				float2 fragment_input_2 : TEXCOORD; // TEXCOORD
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			void frag_main()
			{
				precise float fragment_unnamed_45 = fragment_input_1.x + fragment_input_1.x;
				precise float fragment_unnamed_46 = fragment_input_1.y + fragment_input_1.y;
				precise float fragment_unnamed_47 = fragment_input_1.z + fragment_input_1.z;
				precise float fragment_unnamed_48 = fragment_input_1.w + fragment_input_1.w;
				float4 fragment_unnamed_56 = _MainTex.Sample(sampler_MainTex, float2(fragment_input_2.x, fragment_input_2.y));
				precise float fragment_unnamed_62 = fragment_unnamed_45 * fragment_unnamed_56.x;
				precise float fragment_unnamed_63 = fragment_unnamed_46 * fragment_unnamed_56.y;
				precise float fragment_unnamed_64 = fragment_unnamed_47 * fragment_unnamed_56.z;
				precise float fragment_unnamed_65 = fragment_unnamed_48 * fragment_unnamed_56.w;
				fragment_output_0.x = fragment_unnamed_62;
				fragment_output_0.y = fragment_unnamed_63;
				fragment_output_0.z = fragment_unnamed_64;
				fragment_output_0.w = fragment_unnamed_65;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_1 = stage_input.fragment_input_1;
				fragment_input_2 = stage_input.fragment_input_2;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // LIGHTPROBE_SH
			#endif // !SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef SHADOWS_SCREEN
			#ifndef LIGHTPROBE_SH
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_1;
			static float2 fragment_input_2;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_1 : COLOR; // COLOR
				float2 fragment_input_2 : TEXCOORD; // TEXCOORD
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			void frag_main()
			{
				precise float fragment_unnamed_45 = fragment_input_1.x + fragment_input_1.x;
				precise float fragment_unnamed_46 = fragment_input_1.y + fragment_input_1.y;
				precise float fragment_unnamed_47 = fragment_input_1.z + fragment_input_1.z;
				precise float fragment_unnamed_48 = fragment_input_1.w + fragment_input_1.w;
				float4 fragment_unnamed_56 = _MainTex.Sample(sampler_MainTex, float2(fragment_input_2.x, fragment_input_2.y));
				precise float fragment_unnamed_62 = fragment_unnamed_45 * fragment_unnamed_56.x;
				precise float fragment_unnamed_63 = fragment_unnamed_46 * fragment_unnamed_56.y;
				precise float fragment_unnamed_64 = fragment_unnamed_47 * fragment_unnamed_56.z;
				precise float fragment_unnamed_65 = fragment_unnamed_48 * fragment_unnamed_56.w;
				fragment_output_0.x = fragment_unnamed_62;
				fragment_output_0.y = fragment_unnamed_63;
				fragment_output_0.z = fragment_unnamed_64;
				fragment_output_0.w = fragment_unnamed_65;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_1 = stage_input.fragment_input_1;
				fragment_input_2 = stage_input.fragment_input_2;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // SHADOWS_SCREEN
			#endif // !LIGHTPROBE_SH
			#endif // !VERTEXLIGHT_ON


			#ifdef DIRECTIONAL
			#ifdef FOG_LINEAR
			#ifdef LIGHTPROBE_SH
			#ifdef SHADOWS_SCREEN
			#ifndef VERTEXLIGHT_ON
			#define ANY_SHADER_VARIANT_ACTIVE

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			static float4 fragment_input_1;
			static float2 fragment_input_2;
			static float4 fragment_output_0;

			struct Fragment_Stage_Input
			{
				float4 fragment_input_1 : COLOR; // COLOR
				float2 fragment_input_2 : TEXCOORD; // TEXCOORD
			};

			struct Fragment_Stage_Output
			{
				float4 fragment_output_0 : SV_Target0;
			};

			void frag_main()
			{
				precise float fragment_unnamed_45 = fragment_input_1.x + fragment_input_1.x;
				precise float fragment_unnamed_46 = fragment_input_1.y + fragment_input_1.y;
				precise float fragment_unnamed_47 = fragment_input_1.z + fragment_input_1.z;
				precise float fragment_unnamed_48 = fragment_input_1.w + fragment_input_1.w;
				float4 fragment_unnamed_56 = _MainTex.Sample(sampler_MainTex, float2(fragment_input_2.x, fragment_input_2.y));
				precise float fragment_unnamed_62 = fragment_unnamed_45 * fragment_unnamed_56.x;
				precise float fragment_unnamed_63 = fragment_unnamed_46 * fragment_unnamed_56.y;
				precise float fragment_unnamed_64 = fragment_unnamed_47 * fragment_unnamed_56.z;
				precise float fragment_unnamed_65 = fragment_unnamed_48 * fragment_unnamed_56.w;
				fragment_output_0.x = fragment_unnamed_62;
				fragment_output_0.y = fragment_unnamed_63;
				fragment_output_0.z = fragment_unnamed_64;
				fragment_output_0.w = fragment_unnamed_65;
			}

			Fragment_Stage_Output frag(Fragment_Stage_Input stage_input)
			{
				fragment_input_1 = stage_input.fragment_input_1;
				fragment_input_2 = stage_input.fragment_input_2;
				frag_main();
				Fragment_Stage_Output stage_output;
				stage_output.fragment_output_0 = fragment_output_0;
				return stage_output;
			}

			#endif // DIRECTIONAL
			#endif // FOG_LINEAR
			#endif // LIGHTPROBE_SH
			#endif // SHADOWS_SCREEN
			#endif // !VERTEXLIGHT_ON


			// Fallback Shader Code
			#ifndef ANY_SHADER_VARIANT_ACTIVE

			// https://docs.unity3d.com/Manual/SL-UnityShaderVariables.html
			float4x4 unity_MatrixMVP;

			struct Vertex_Stage_Input
			{
				float3 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixMVP, float4(input.pos, 1.0));
				return output;
			}

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				// Output solid grey color (e.g., 50% grey)
				return float4(0.5, 0.5, 0.5, 1.0); // RGBA
			}

			#endif // !ANY_SHADER_VARIANT_ACTIVE


			ENDHLSL
		}
	}
}
