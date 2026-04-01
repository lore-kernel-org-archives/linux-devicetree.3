Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D473A9629
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035577; cv=none; b=rEuvkXmoQU9AQgfSTkoPkgyJcqD1IgrXd8joNgxd7mZXCSqVxVu7bn6W3ZI5r3W5u1eTRBSLcVhOTIlhvjvzGcpRO6vaLFfWXvs1fxGLzDQOP8HJiA+HUsyGpHh1mCIy4kS6vWAk6uy5kZocnQSCoxjGSSBJOsrYtNE1D0dvdxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035577; c=relaxed/simple;
	bh=N1UOi/5tFrC/OAvc2rlvDo0JIbGDld11JWi2OuSY+JU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uv6TAJuaJin6x9NNo5V5Y7NI/jI5NW/L1ddqtjPFGdUI6XteJlKLse6jsdt/kyGn5UTq0IyCfl5zD46W7e3mwfAaavp2wwuAtF9eKFB6GJtxsMVLWKbTBGGXeFSeCrQyF/SH2Sppeo7h1s8QJh3CFlHl+LZ8fxULsdQ7j6DpGI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFMHORrG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beYxqQe3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFMHORrG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beYxqQe3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317axoa3081559
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUS25DIIXUeo2vJxXPnbHMjNRhI9FjvXA7aN0RaY8ug=; b=UFMHORrGOpJ0IpdZ
	6+ps6JZYUmmFJ9n5FRLGMoRQ77vwWU3IppzGHqmNZH6INn9r84wNrEOiR1rVGlSF
	JUIV9rPrxs7c8luVaIFIuOCmauIIdFXUaLu72gkHONaLoTqmrc5ffayyhxah1tpM
	+IvUTXYqD/Dx2aRB8msfJNYEsy8kcXuvBrqiyIxCxNCHOhH2sdsh3YX8JGPkOPPD
	2AKW8jgDCgQXRrZxcqcAVZ7uk4bSUybDMG30K7d04rOlFf/2CE7+KiIxHNi0CRpu
	MYoAzozxzEztk3Si9MpkHKykvfn/hajHWOa51C2uWRDuoNDO6NquQYWmdwcrWpQq
	J1Xqvw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkubb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:26:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so26515956d6.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035575; x=1775640375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUS25DIIXUeo2vJxXPnbHMjNRhI9FjvXA7aN0RaY8ug=;
        b=beYxqQe3/i1F2xzcjhQK8WLamAsFnxjy9dP8AMixIhOfx22JazFrdBGw35PLsjjplt
         5NECdwtreoHe06gMdqR2TgP1qaNiKrPSttOUgmUtSueUH91rTuEd3HvkXjF3czqALMm5
         8oKqJ7xpn3r9EVeP9+uyTyALSIfKECnR2jLceZNZ3HRQDA1EQMXlfefkupYLN8pJndO2
         1OIGRmFDIpEgquFuljEgfYJgxypEPzUdxlwo8vq08BrF9klMKUV3Vjk+/EoFq/QpURyn
         ypmhhBjs5R8eoSzozvPgYiSOCvDEW42632qnh9lkRn6fi99aONNyawmR1d3P6Vr92xEe
         unjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035575; x=1775640375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUS25DIIXUeo2vJxXPnbHMjNRhI9FjvXA7aN0RaY8ug=;
        b=oKuiT7DtQxeqz+/dGjX7CrEn899iYoiLizWC9bEBPn9556J+kXWwvQrf73e2q3KlJG
         AOtxd5hjz8WnLbF/krKnygUJCPRQWSyM06qJUQQrbluWJmGS5STHb2OHt9+ij4CMGuoQ
         NmG6M9VY7L0ovL84EUtmtKGlpKl3nc2YGAFyyHtSRkmeDxh4pyEm9pMzSTfxAub0DLOp
         NGTbPyZKNrMDWnrMVxXeHrkEm+ma2RivjxiT5p23w4/ef83X0WwfBYxvlBeAqyQt35TU
         4FRSUx8a+pZKnTR7sfNWUz25E7GeMGmZJZ+msovFPbkY6DkbEcZfzpHuIj83Zd3VLl9C
         uW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0p8PltstUljyW0LuoNDarcKSZRHhH4udaLORXitwia0ZamnD9RSblMOyKghcyX3d+RI8ja2crJ95d@vger.kernel.org
X-Gm-Message-State: AOJu0YytEuMQvY12lmpg1kfhzjXZvYRXHGW3MPC0deaGqCj2aWUn7Kff
	guMNj/15Y8LpURGYl3/O6/urWqPLcy+/lf0Zio1L9jHTm8iCrkb19WcjRMoa8Hq6h7clGcvC6Ko
	wK5jJq6eFAdG71+vj9uczWF87DawOVMCvOAz20G6jw8xyWS92ElKfYBwRseaNI1sE
X-Gm-Gg: ATEYQzw0fHr/ZG/6pHwtKZdRcjAqZ1w8OaI2muUVLMnxgJ2TXNejpVPzpsto0h3d4i4
	Ny2P4fhoSbU817nQMA//XsU/vXcD9rJkWumLspP3WTQ3qtT8jdHq2CRIv5tw+KyCGawlItOhs7d
	zZYavob2tTcV0E0B55/my8OnoJdzScYjezdUTg86658vhJeJvyPQQL+QaosQhpLGLddRX0JpaJa
	GC55We6zX3YlGii691sboOOC4LEpVVCyh+urWwoQgrTKyR6SORAwaTps2HWAyPE9B5nBWZrYSvi
	ETiUxYb9Wv7LbvLi8TAc5812IympYSCMjsZaodOaB3bzaSh0Es3BmF+r1Lg4JXcyg3sP/DdHd6f
	0jr7vhkMSvp59sHMB5/zc7eMAs26xbrv3NWXkECbKyDn7MnRJX4zU6lAB4+9/MA4MT7xvaGvETb
	vEZ6w=
X-Received: by 2002:ad4:5ae9:0:b0:89a:595c:b805 with SMTP id 6a1803df08f44-8a43a84f421mr30800766d6.6.1775035574625;
        Wed, 01 Apr 2026 02:26:14 -0700 (PDT)
X-Received: by 2002:ad4:5ae9:0:b0:89a:595c:b805 with SMTP id 6a1803df08f44-8a43a84f421mr30800586d6.6.1775035574130;
        Wed, 01 Apr 2026 02:26:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e472dsm500780566b.50.2026.04.01.02.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:26:13 -0700 (PDT)
Message-ID: <796991b9-6f97-486e-8c38-3a9696c04032@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:26:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: qcom: msm8960: Add GSBI5 I2C controller
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
 <20260401-expressatt_fuel_guage-v2-2-947922834df1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v2-2-947922834df1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfX84ssQYZyOYbP
 nGlEWVCmaGC6SwaX++Ir4GHIVkWdCUyWd78A9vPISHqC+2ce09Yk159sHZRAyV7KwMGA+jEni/R
 6MEcf0wYygSkyCxw+/Dc2qPveE+57fZhzVnTbV2TtCAlTJw+1g3EVgBrMOYApCc/NBm0LenM8PZ
 GDPuWIK8DqOv+p+XmvP3yYoLEldoqEflXPVpiKJbtml5UFkgMioUulPhNzUAYQK4vCZtZlrunI6
 pJuBzlKqnMcfjT676fBgFCLZZFb0tvrRoSRyxvfLG+EDJD0xUwLCuf1cPtlIBRwyv6H08pemGTE
 JHUXOClFcZDwd6Q9JZrqIxtBgRSn72mXJk5bowPB69bxNtwjq6OudGjO3+LTozuEPpbVJLj6rwm
 tulnSKZexkIgyhzpGCb8i8ZwcuU+yxXOgj/mJVfqA8Sfpz//d+3lhaptEtsz44u5waJFZgTKjwn
 VbPxea+DR9o3BEgirAg==
X-Proofpoint-GUID: -kIcq4zNcPG2t6l9DL-x-4vUZkqHCGqu
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cce4b7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Apu4DP7LmR_xVQy10KIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: -kIcq4zNcPG2t6l9DL-x-4vUZkqHCGqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010082

On 4/1/26 10:28 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the I2C controller node for GSBI5 (gpio24/gpio25) alongside
> its pinctrl default and sleep states.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index fd28401cebb5..2088baef6c30 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -185,6 +185,24 @@ i2c3-pins {
>  				};
>  			};
>  
> +			i2c5_default_state: i2c5-default-state {
> +				i2c5-pins {

You can drop this inner layer (i2c5-pins {}) and store the properties
directly under the -state {} node

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
