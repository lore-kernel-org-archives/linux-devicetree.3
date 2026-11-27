Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769219;
	b=N4FCQ51L2DwqrgdCsFInFmJuObjXVW9jxZh+bcLAAoSbjmQgwU8Gsv7eJPwYStLSKpRM
	 ifIj12MiNLtz20HFxvN1FjU8UozjVG8fHwjcpuwaUP+uWp3bGX2yDxhYRgRFifzrwxKT4
	 M5KvHOxuo91A7GF9X+Wk3RFYss7isv1kxArwggLzgUAs9pU8VXu3kqG9rGNUEMBWj0UYN
	 OhVdFss2851l9bBVgTmc6zez+wEn5gy4U4YHbrKV/n1nRxCeti1DuvpB3pVLeqVUAC0K3
	 wzvpWK8mYG5PK2JR47pXx7yPfe1ie1BrMyFfPuP0TAYiNDa2A0HdyNTIiW3xRix0ymg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=;
	b=nwcKfOalPNHYbS0+Dlxv9yI3ryvi5dV7LDBHxqy9q8rPCwi/+uP2ap8eg1+UKrSllSPH
	 lXRqygSx41L34WGsbGYsexrVg5qSd3n4cVqFusKHRRcexHECd3oQ0BgJv4HG8hbHS8cQh
	 7+yhY+5KXEfyGMmRY0fQH1tjgRIYS/tvxEHegjpYYgCmjSY8jnL2e+Ao6xP+zUCo47oX1
	 lbdTootnkiYJgvUrdYMkmHaP7bF+cB8FfypfB3pHsIO3mx+s47TjaameMwI9jZHKxwAxZ
	 lg5/FlG6567y03NjyvfCh60r9XNNZMX+ZPkI0gSmOVwXXE/VbskCvij9IO1IVkNxjUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrV7kvBP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UFVnSEvm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D51606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D51606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrV7kvBP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UFVnSEvm
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gjws2421555
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=; b=mrV7kvBP9w1hd477
	3ATRoGsHdZgQo8zRAkW1QXkLcKfPktsCUShcN5r/iPdqAYH8H3GDhHmNlW68bDg5
	iVDtbjXbjVtySFsziNBdLro8A0WyvfTlZfrnXio9uOohgmHcbJANNvP2nJiHEEHb
	E6n2WMpEHfT4HLH0WKF4KUqeaBfXHhqerOUn/pfaNyDv9ySDd8wiPsFA6sPMBSD8
	txc96KEp8IZ1CFefkFb4AsGek2fw2shp8VmPkJr+jmxzS08NHSTdKJZJb8RwJsCJ
	rH2ROxsfEIOQ8UVG/MdUawvu8yErnHyEB92J6JzMOU62v3rRH3SoROGiuH3paPmZ
	0bQIvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf92mvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:46:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fbso1083655985a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769217; x=1796374017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=;
        b=UFVnSEvmmKNUNLLs3SAY2oTeyYZ3ldCgnIcoRWprgVlCJlyGyX/sMzN96YFHBz3D4v
         EgStGMXTNQyz7Jq4Va8bXcFnut03lkcHw6o6VFbXstfx+yqdt0r1Y1S19rdT17o2NHu+
         LH4iRkvODaM/sEz2g4YsK3Ph6kDtPcmDDnxM07F5TYOs7rm3Nws1FuYVmZMjAy1yAXmQ
         QhgnqGvNJkFc9/GC5FI7e2mGgCo5WUSp80l+/jA60n2Y1rmSWE7NwQ/DIyAWwFTn1zZ0
         WnM4NMbp+5uv8reqxCElNnW3OEo8EqKxtw0YFtWS3Q+eb3eG59ppUQVZF7dRCLx6Iep2
         2N1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769217; x=1796374017;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=;
        b=Q3uazYZd7VyWmSlN42h5KudP2EeAbVdjOT9rtjSAyzVmZP89QewyiKNGfgfsS4csoW
         vfWEoqWvk8ylrNsmL2iwPMbtzmjRFoMhFy754RbHvxWa32Pa/5xvigbiD2yyxz39aEOP
         OQOzB7CZYs664VxgQsTCMR93Km0OK5Q1hAqWMr9eFnq+o5zyn8rKnacRxgWUARTnyksT
         X+z5eME14ip60cRh10uqkPK7wX71wYc60D9XfURHted3BeRMLzTNMNFrwwdi2tHrY/pF
         NfbFF7YbsJoMEL7Zw4M34xh/FXSimVkGEhkiTgsSW06h1U8Vshb10UOF4Il0MIcp0Pwf
         fBBQ==
X-Gm-Message-State: APuU4Z/MWrMLDetc3lLCVFJI2CdDER46t3p4KidNJibOepQjje4U+VUI
	Ka8DbKwENsownSHhuai3VvjvWp5Djm1x68FsbDwI1oQ+uZhrJhHrgb4hjLOI53EZ5zMtFZ53XMt
	6Bp7O0BjZ2u3EGmKlRWB4IfRK63ul5JfS7LOe+st3rBefcQzg84PNdIZn2apH+sAt
X-Gm-Gg: AZFdTZcNWlDo/tgdS/+TArKiQ6OS1qtHki4KF+zsZD6a3XDNuvCMg2uOG/33Emy1qSY
	5We8LIpHz28P2rFjriyYvfRo3l+ifHe6z59MaVnPBUZ3Lx8BR7EcvDCEXyuE8Ejzjl28xzoc6SY
	FsYQ+0c93u2BUU6NLXkQJjs8HiaXQJOx+qQCXAx1WWC3KDI5vmJpHdkg7kNftOYQOAQCmVzS/7Y
	8+2O25BDvu7lcG4u5ki9XAt+qT+MeMbLREEOh9WdbViQ7q6nIamCnMjgBK/YLV9LmbDT3UNZcNC
	dFowANVjUpIfO3en5yVuE92YBbPg3QNaqon3BKAA5LmtjWx/7UruOlBf5Mcbea48ystLBMn1euv
	W/55uXKYAsNt1M2UTgz5jTKtw8+UHJW/y+P9GtK0eDemdscRK4Fa6zRq4utWtsT/4xg7ev7/9bL
	EcQQ==
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr4060254985a.49.1795769216918;
        Fri, 27 Nov 2026 00:46:56 -0800 (PST)
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr4060252985a.49.1795769216378;
        Fri, 27 Nov 2026 00:46:56 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm42897480f8f.18.2026.11.27.00.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:46:55 -0800 (PST)
Message-ID: <1f55126a-10c2-4ab8-a7d2-0511d9385733@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 08:46:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: glymur: add LPASS macros and RX/TX
 SoundWire
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-2-srinivas.kandagatla@oss.qualcomm.com>
 <sashiko-outbox-236036@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-236036@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kk4G1LXPr4ZtBjIX5MErKtS1z3tNrYxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX5inridiPYcsW
 Li6xxBK9D+jC++3iPzO5se+9c+zYF+NRSfqH7LbF2mdx0DvXd0P1wXnw9TLaX+/d7pOm4c3ea55
 HVBeDDv3pyhavRUvNyK4u0fbfeJwjTvq9rVbsXH2L/9NWCd4X1KcUmsQCHde9lthQLVXAdwX0dH
 ryg9ujFjmyZXfgWfU6RJvHFNlCgwOX7k/rxIgjuezfqj10SZz2sY5xqlA8H/7ziE2M1SOFzigyK
 p8xJoPyjqkLohHksfF22jEsbYPlhtG42r90nN6Qwy5rOHhBNn/buLRR4XKnQKVxZ0OyNXKE72cQ
 NbxhvVp/yAIzFB1mlh9dMHJCt6GJKaazXpO4KzCIac+G6yD0wrUCM+9lTcrrjHi886XUDW+6spe
 5yYu8NcWI4FKpv3Sdd9A/tLqz2USrOW9ug/2V19al+ghotbNe02z1s2WsHQgWyO+xKXopCQnXoG
 nijYY2p44jq6y7gIdiw==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b094382 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C1eMqFb1E5RMPDysGHcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX2aRK0XX/2Otf
 k4RFPQ5Cd5DVpU7b1lCPSzr7ADUZ7xyUMjsdxnR1gcz1dLrtNa5Uw03/GD5zDeHezDCCpi2+PS0
 fq+0lDWKvJi8H/5eTiyuN1OmcaLsqNo=
X-Proofpoint-GUID: kk4G1LXPr4ZtBjIX5MErKtS1z3tNrYxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

On 11/26/26 6:53 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] arm64: dts: qcom: glymur: missing qcom,glymur-lpasscc.h breaks
>   DTB build
> - [High] arm64: dts: qcom: glymur: unmatched lpasscc compatibles defer
>   swr1/swr2
> - [Low] arm64: dts: qcom: glymur: invalid qcom,ports-ch-mask property on
>   swr2
> - [Low] arm64: dts: qcom: glymur: undocumented macro compatibles and
>   node order
> --
> 
> commit b4bcd1d941eb74e432e52172d9eb6873d424ecc0
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
> 
> This commit adds the LPASS RX/TX macro codecs, LPASS audio clock
> controllers, and RX/TX SoundWire controller nodes to glymur.dtsi.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 165dfa11f17f5..e3bba14bf36c7 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -9,6 +9,7 @@
>>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
>>  #include <dt-bindings/clock/qcom,glymur-gpucc.h>
>>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
>> +#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
> 
> [Severity: High]
> Does dt-bindings/clock/qcom,glymur-lpasscc.h exist in the tree?  That
> header is missing (LPASS_AUDIO_SWR_RX_CGCR and LPASS_AUDIO_SWR_TX_CGCR are
> defined in dt-bindings/clock/qcom,sc8280xp-lpasscc.h), which breaks the
> DTB build for all Glymur and Mahua boards.  Also, this #include is placed

There is a dependeny of
https://lore.kernel.org/all/20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com/
patches that are acked, I will add that explicity in next version.

> out of alphabetical order after qcom,glymur-tcsr.h.
> 
>> @@ -4669,6 +4670,73 @@ q6prmcc: clock-controller {
>>  			};
>>  		};
>>  
>> +		lpass_rxmacro: codec@6a70000 {
>> +			compatible = "qcom,glymur-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
>> +			reg = <0 0x06a70000 0 0x1000>;
>> +			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&lpass_vamacro>;
>> +			clock-names = "mclk",
>> +				      "macro",
>> +				      "dcodec",
>> +				      "fsgen";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +		};
>> +
>> +		swr1: soundwire@6a80000 {
>> +			compatible = "qcom,soundwire-v3.1.0";
>> +			reg = <0 0x06a80000 0 0x10000>;
>> +			clocks = <&lpass_rxmacro>;
>> +			clock-names = "iface";
>> +			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>> +			label = "RX";
>> +
>> +			pinctrl-0 = <&rx_swr_active>;
>> +			pinctrl-names = "default";
>> +
>> +			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
>> +			reset-names = "swr_audio_cgcr";
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		lpass_txmacro: codec@6a90000 {
>> +			compatible = "qcom,glymur-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
>> +			reg = <0 0x06a90000 0 0x1000>;
>> +			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&lpass_vamacro>;
>> +			clock-names = "mclk",
>> +				      "macro",
>> +				      "dcodec",
>> +				      "fsgen";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +		};
>> +
>> +		lpass_audiocc: clock-controller@6a94000 {
>> +			compatible = "qcom,glymur-lpassaudiocc";
>> +			reg = <0 0x06a94000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>> +		lpasscc: clock-controller@7680000 {
>> +			compatible = "qcom,glymur-lpasscc";
>> +			reg = <0 0x07680000 0 0x10000>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
> 
> [Severity: High]
> Will lpass_audiocc and lpasscc ever bind to a driver without fallback
> compatibles such as "qcom,sc8280xp-lpassaudiocc" and
> "qcom,sc8280xp-lpasscc"?
> 
> Neither "qcom,glymur-lpassaudiocc" nor "qcom,glymur-lpasscc" is matched by
> drivers/clk/qcom/lpasscc-sc8280xp.c (or documented in
> Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml), so no
> reset controller is registered for either node.  When swr1 and swr2 probe
> with "qcom,soundwire-v3.1.0" (where sw_clk_gate_required is true),
> qcom_swrm_probe() calls devm_reset_control_get_optional_exclusive(dev,
> "swr_audio_cgcr"), and __fwnode_reset_control_get() returns -EPROBE_DEFER
> indefinitely because the resets phandles resolve to unbound provider
> nodes.
> 
>> @@ -4787,6 +4855,38 @@ lpass_vamacro: codec@7660000 {
>>  			#sound-dai-cells = <1>;
>>  		};
>>  
>> +		swr2: soundwire@7630000 {
>> +			compatible = "qcom,soundwire-v3.1.0";
>> +			reg = <0 0x07630000 0 0x10000>;
>> +			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&lpass_txmacro>;
>> +			clock-names = "iface";
>> +			label = "TX";
>> +
>> +			resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
>> +			reset-names = "swr_audio_cgcr";
>> +
>> +			pinctrl-0 = <&tx_swr_active>;
>> +			pinctrl-names = "default";
>> +
>> +			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x03 0x03 0x00 0x03 0x1f 0x1f 0 0 0 0 0 0>;
>> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x02 0x00 0x00 0x00 0x00 0x0b 0 0 0 0 0 0>;
>> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0xff 0x00 0x00 0x0b 0 0 0 0 0 0>;
>> +			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-hstop =		/bits/ 8 <0xff 0x0f 0xff 0xff 0xff 0x0f 0x0f 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x01 0x07 0x04 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x01 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x00 0x01 0xff 0x03 0x02 0x02 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-ch-mask =		/bits/ 8 <0xff 0x01 0xff 0xff 0xff 0x03 0x01 0x03 0xff 0xff 0xff 0xff 0xff 0xff>;
> 
> [Severity: Low]
> Is qcom,ports-ch-mask a valid property for qcom,soundwire-v3.1.0?  It is
> not defined in Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
nope, we should remove it, will fix that in next spin.

--srini
> (which sets unevaluatedProperties: false) and is never parsed by

> drivers/soundwire/qcom.c.
> 
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <0>;
>> +			#sound-dai-cells = <1>;
>> +
>> +			status = "disabled";
>> +		};
> 
> [Severity: Low]
> Are "qcom,glymur-lpass-rx-macro" and "qcom,glymur-lpass-tx-macro"
> documented in Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> and qcom,lpass-tx-macro.yaml?  Neither compatible is in the bindings yet,
> which causes dtbs_check warnings.  Also, under /soc@0, lpasscc
> (clock-controller@7680000) is placed before soundwire@6c80000 and swr2
> (soundwire@7630000) is placed after codec@7660000, out of ascending
> unit-address order.
> 

