Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A556337C11B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836236; cv=none; b=n+6bw5TtduWz/BCuo1AKctFqYnGhfvL8I0fyim0LJm4/mK1F3mqQPGQXKrpPQ3ejSzpdH/2N9zN8khAI6azpxbVzCcyKzaskofmZfhOMMtp3oIA/euf2Y3P8xtRZZyi7Tnyfdkfk5jz6IPKtazgkU3jAwY2uhtl0yLiq2hF6+ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836236; c=relaxed/simple;
	bh=NAlYr5OBkji2DJxmosxyZUEB0sJ0e4O5IXDaacLjWjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4h+XEn5CAiXthfT4F6PPoilrALoNhyHpl+8hSeQPQsXLBxEC56EX/dYJs5Ziuyjcj+szqSDgRkJ2m/M1CI/1UGedbN+OZPj7izCp65VR3ixjaPk5/hR7NLyxPlPPAVG5jtC7V6kEq2te/lEoCRrHni3XwjSmuc7j7fSK3XrgBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4twMkWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2TzaBV0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4twMkWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2TzaBV0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Vd8w1847948
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y33Kq8jS4pkB9lQwGZwmPZHQOGa7dfJetj4tNP3diP8=; b=K4twMkWsVKO4ydqM
	+x7fLcIUaYUdC4pZjQ4nzmCwJCNDSpko9ngzcGuQ7lfJI5A4gLCXHL81OpCqbGOG
	yhasSoIeNqzJiNwh1/RafZEvUpGZrp0tjybRvB4iP/sRM1zcgO0Iri0a/QKtqQ3a
	QYL4LX60xgHH68IMK/tb9gD87084M5OpiNYKDYHAW6K5MRomzYic50cPbfbfAWFU
	IeMu+4qqlENVZAULizM91LjB4jtfQdv83n2G8H+k8BpUH9obttqNPpZGpSR45cC+
	R2ZS7gpswo00/woXaYryEbWcMeEkQ2xQwQ32hEt2MaCiGrk0DN9DUBPoU0JBKh0+
	dgQr7g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2gum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:10:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6314bbea08dso391607137.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836232; x=1779441032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y33Kq8jS4pkB9lQwGZwmPZHQOGa7dfJetj4tNP3diP8=;
        b=C2TzaBV01qjOFUAjkfk4GhhuZ6zjdAZ4KNwrLseErhUZwCKLch4ygFbUvD2jv/2n0g
         GPf5OSfTo82maKf2Ib3cXpXY1H1YJKR+kIClo45ba10/1LWAxWHnHsN6U7knh0yuLjYb
         CMM1pWokuXSSM0aKFi0APiMcq4sHH5huvlZ4Ihgska4b1d0rN8spNDBUgZ15HtFbjkOs
         PypVbg+SpQyZC4TJB9jY4ZRdQ+tQiZbH8k39kSWHJGNGRZlIB8u8neWaiPA6azMQL2XR
         oEMLW59cp6D8McxZKhFGoGu2yu/MJTvFNVyDYIL7CkWusxMk2cY5+keU+LbG+lfzUULa
         /gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836232; x=1779441032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y33Kq8jS4pkB9lQwGZwmPZHQOGa7dfJetj4tNP3diP8=;
        b=EEgRDyX3PD0bccrbpE8ww4zMLG942egNkCph9zt5Af02xnr0F81SXE05stVWlKf9Eq
         b2LmbW65YlREkrZzKE/tZCy9B3mVRqP/MXtbggIdtBxAWVXhyjhTzcZ4u3lcl0WYRLWu
         fyaOfHidXyDpKDRXrtxm3Me3G29OsHYAR1RhHVy2ppr3T+sMbQEgRtQNmrPnjDyWepAU
         +ZjWlylFWdG4meGB+L5e3OJjMvBSzA8k1FapNuqQp23nsjoaxDiV23cSux3sdPQicsHH
         AeFD8FLsc94z+EQMpPRHgIPsieSR0NVCv6bxnijAPxEO/aEAx2Op2dyvpgPh6IQ4pTcV
         IjHg==
X-Forwarded-Encrypted: i=1; AFNElJ81Z18fi6Z0CQneDDDlRUpXCx7V7COxGpaE1orWmAMYU94swvzRjaw4Zj7FMpArVG0CLtPxMNHnNEVu@vger.kernel.org
X-Gm-Message-State: AOJu0YxgiWXjUWEh8zylDSbBPznMqAkfvGcZHx65584tzc9fooKZCYa2
	eQH/1j3OMu3m9uVuwoNoKzJr6f9dQBwpdx3sBmZYrU8R+iXS2ZTyqw9R7M3ixSX8PWQyN030lhh
	mXgYj3fiAwEV3R/NVez1a3Tcwi5z0iFoiusKA85SXB39yIjqbt8an06OiDsh+3lOs
X-Gm-Gg: Acq92OGzDczqpQCKa1kt63x2fulN2xfymoZgspoKzjyU++61CEwf/TI7w0+5RQptPri
	P8iYt0exIZqSg3hAotxSzGRlNmJH7W8OpSsYFzD8UUYBTsBKAOwTt5WC4Q6IMabkYyRp44Yx8Qd
	K2Z4mPD1DggN6btnPF515AxRdb9dtidMNLixsPHhln4liuWsQyspAqNxVC4IZfqEHV5cbG/4jnC
	Jc41SF7McIIWNXqQNgdoZxgVtym3ynpA/aEnNKFqjrwtL0BPl9ko4HFC+fqqPOTzBTz4mpUMaof
	ANMEMhhmN67ioIoEXNv8y/rQU6uwQVlvaaaAljGIXSbVjZtfg3+LUQT0PGqzLzCJwaWxv9kTDgE
	A6ntCrai/U8MRJri4MQaY76C+qNLY6TADKwI1E97Ib1E7yRVI4PQZKZoSCzCfZcixhIG4z1gAx6
	h1XMA=
X-Received: by 2002:a05:6102:1242:b0:62f:46c:40bb with SMTP id ada2fe7eead31-63a402a0379mr383763137.5.1778836231748;
        Fri, 15 May 2026 02:10:31 -0700 (PDT)
X-Received: by 2002:a05:6102:1242:b0:62f:46c:40bb with SMTP id ada2fe7eead31-63a402a0379mr383755137.5.1778836231245;
        Fri, 15 May 2026 02:10:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c23feasm200169966b.14.2026.05.15.02.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:10:30 -0700 (PDT)
Message-ID: <934d6876-3c83-43de-b155-d435af4c3547@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:10:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI
 and LLCC nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
 <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-2-05814d24f4cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-2-05814d24f4cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06e308 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=olRgGBVlyjl6rEf_PyYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MSBTYWx0ZWRfXxXE3ycNfiIuy
 JH3jJ+htGm1r6UlYazjCjvEfmqnCvxNgeN4HEE0lwLGu+YvBmYilzUzH+MahjzPxwdif+OaETcn
 B6VbDnPokpXgSPhBbTal8NLsvo4erMuX8oX+f7kvjLNLufpfpeWwE4ucJEVZaSDETDAH7UmKg6k
 nIrULLk15ACFLesefosH4CHiZ4EFbBUV7NiUD70R1tW1r+Z3ksmHeSdae1VhJvudmpIhJhdu3xs
 q7sq49TMLanBGS7hbl66JfkDNC4aedXJEV4/vhW9s3nA0xEf1eF2rHX8mmtFgbFvfNO0MESYiHJ
 oZHVVIjvIV/AC5vC36bMmLyc4oQfFz46yEks7I0xHAR8PO9N1JMiHTvmHtKFztK54a7Yz6SMS0h
 HZwuo83YnhdKyRvHkoRolDC507JETbLamsUlgs9PVdlMl+gw4VMUpN8uD2EbM43TRAiiTH1JhMT
 XMlBiHlYAuMoYNbK1Rg==
X-Proofpoint-ORIG-GUID: 5jgRxpfq730lzRplPpUf-RUM23lBQFPv
X-Proofpoint-GUID: 5jgRxpfq730lzRplPpUf-RUM23lBQFPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150091

On 5/13/26 2:33 PM, Abel Vesa wrote:
> Describe the missing Eliza SoC nodes for the QUPv3 WRAP1 and WRAP2 serial
> engines, add the matching GPI DMA controllers, the SDHCI controllers and
> the LLCC system cache controller.
> 
> Also add the TLMM pinctrl states for the QUPv3 serial engines and the
> SD card/eMMC interfaces, plus OPP tables for the SDHCI controllers.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +		gpi_dma1: dma-controller@a00000 {
> +			compatible = "qcom,eliza-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00a00000 0x0 0x60000>;
> +
> +			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			dma-channels = <12>;
> +			dma-channel-mask = <0x3f>;
> +			#dma-cells = <3>;
> +
> +			iommus = <&apps_smmu 0xb6 0x0>;
> +			dma-coherent;
> +
> +			status = "disabled";

Let's keep the GPIs enabled

[...]

> +		sdhc_1: mmc@f44000 {
> +			compatible = "qcom,eliza-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x0 0x00f44000 0x0 0x1000>,
> +			      <0x0 0x00f45000 0x0 0x1000>,
> +			      <0x0 0x00f48000 0x0 0x8000>;
> +			reg-names = "hc",
> +				    "cqhci",
> +				    "ice";

This should be a separate node

> +
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			interconnects = <&aggre2_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc1_opp_table>;
> +
> +			qcom,dll-config = <0x000f44ec>;
> +			qcom,ddr-config = <0x80040868>;
> +
> +			iommus = <&apps_smmu 0x520 0x0>;
> +			dma-coherent;
> +
> +			bus-width = <4>;

That's definitely 8

> +			max-sd-hs-hz = <37500000>;

This should be fixed in Eliza

[...]

> +			max-sd-hs-hz = <37500000>;

ditto for sdcc2

> +
> +			resets = <&gcc GCC_SDCC2_BCR>;
> +
> +			status = "disabled";
> +
> +			sdhc2_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;

The clock plan says 100, but the SDC doc says 50. What does
downstream set here?

Konrad
