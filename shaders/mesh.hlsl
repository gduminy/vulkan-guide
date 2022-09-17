struct PSInput
{
    float4 position : SV_POSITION;
    float4 normal : NORMAL;
    float4 color : COLOR;
    float2 uv : TEXCOORD;
};

Texture2D g_texture : register(t0);
SamplerState g_sampler : register(s0);

cbuffer SceneConstantBuffer : register(b0)
{
    float4x4 g_mWorldViewProj;
};

PSInput VSMain(float4 position : POSITION, float4 normal : NORMAL, float4 color : COLOR, float2 uv : TEXCOORD)
{
    PSInput result;

    result.position = mul(position, g_mWorldViewProj);
    result.normal = normal;
    result.color = color;
    result.uv = uv;

    return result;
}

float4 PSMain(PSInput input) : SV_TARGET
{
     return input.color;
}