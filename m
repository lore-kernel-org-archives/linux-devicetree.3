Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335E440B396
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784634998; cv=none; b=ZAc7hy+4gTXL5MNNjfcf+jYWtpKcTbAVekE7Dc/E7kcngWLPDauJlRN43CTK8RbabO3fMIaFbNE0EN09KsmFRumC25ecCvn08vu6VgwNN48emKDsTaAOfKDAw8fKJ1JidERyU9dDBeW1h/3WgpxN1gsRXW6Zmdrib33pOtEaQlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784634998; c=relaxed/simple;
	bh=R68RRkCspHOR45G3uHhtVWDRAuvS6WIpOzyJNjoxHmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWB1ON2cmoUAmj1u6KuO/Kx7RQhpbzo7w2Hkr7wG4e8RaJh++W0xD83WYXHrSgQusfn1OmTUSNSSgjE+6A+JwK4vltkABTMI4KaFNXF/ZmNiC8sDfgqBz8RO+li80aRDxGH9jLQwfuWHhYgQFMLSmDouoxdarr1kDwCwaK+5vbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JegtUk3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bx2PujDJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JegtUk3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bx2PujDJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARxP81252245
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NeSpfykxd+JnV2juYOjpzOXSoEdtYw7VOCfogOzWOBw=; b=JegtUk3x+zMO1TSg
	KzS7WnuI/cYcUE8VMN8Tx80+i25Aou1qvwtNJ4VO9lArIr9TxRJw3MSL/J+g0VOz
	xUxmzjP8Hax1x2wMwRD2UY9izY3q4dyAFmjWxtC0J/d/vDM9Gt67n+ymP5yLlmCZ
	adHDjkZW5j1g6XEfNqnp+OHQuSLNjQ00X95AD8JSGi5G7COGMp58cUZf22Et54GK
	BYJ1K78Bv8UsH2/a3C2bfgFLrJbIX3DkRLMDEuRdFDFNFa6bEdJuTv7PmFIdB3ES
	3K/5RG/6ESoxkLKJUILNcrC5/xNUm6zDSD90/4z85RMuzLb3AiCi307TeVFdRJaO
	dISo0A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvccb1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:56:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so19356606a91.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784634995; x=1785239795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NeSpfykxd+JnV2juYOjpzOXSoEdtYw7VOCfogOzWOBw=;
        b=Bx2PujDJZguLhlVnics/cMsmSp+b18SbEfysBTXWOLmfBpuFpM0PjeiXYyZsL79yV6
         6OUFVbrEmW4uZ1giqTpYcaPIFlQtDIcyJLr7jkBIZMBNIXWWCxqQel82B9+JyTbyH+AY
         +r+vDsqgDJWF7ngcYdUv3UDQa2Lve17BmZLD7AuJUbfXtuOMXjxKQHNclydYY43gAUlT
         1scGsBTFjBn+7z9menteLV4sinH2plqWrn/EzaOh8yEhgyIro10bCGSFHsJu73Z9H6Rf
         iKEKRPYTyip9RxWEHp5yjI9Wi8F/5UF/FRHDb5CrRPuQwuFEvc87Uh3KwjahKK4WI4BM
         TCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784634995; x=1785239795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NeSpfykxd+JnV2juYOjpzOXSoEdtYw7VOCfogOzWOBw=;
        b=MTC33mmxuKpcAsEnxFybadF0sKGi4YnAZ5V21ogKCzoix2Z74U7Mz24EMpHwYkN0SP
         ruwcFYoScRI+RPjDQReS8yiPzoJvBFpTMQ2qgcPueB3Sbpvl2dbdznxItaf6nREuAhcp
         ZI+f31hWBWyRh7MelWvFZV/wIqDI5+TF7Kkah2JEn6pT3TEz0VJpk9bbCK4I26rAVP9r
         VDXbdNs0+GrpPFLgLwLqb2DtKnpsrR+QwRT17mvVdrJQnFmbMfMssTjFkzuOxj3zBK3d
         w/huC8hqbyKaxW9/PAku/7zCJrqVlGKF5j5LGPQm34OHXeQYEjDBbXJjl3lBxB+gXej+
         ZZIw==
X-Gm-Message-State: AOJu0YxMYIIKf4m2JZFrzA7yfaj1CXb+jqFDFq37MC93jZah779nou2E
	WbrbDO7iiWHkaNLmkfPCUWOCvT6gz4WzK5Tv8j3Vg6BqaGST3nw1QG2UDe2rQt+Q0OLN+TYhF+U
	+ojIeXqSfkOoBugxN6l2uN11n07Mp4LjIN0dXomZGUclU0BWpfLETd4kn6UWEWURbNUlkNEob
X-Gm-Gg: AR+sD13yrMQ2C/k3OKqr3qKxgKdQdGrueRk4+sGg6ktui/XzWqY8h+A5Z0DaB16lJzn
	k7tgnpl1SZCFT6YYTQHUtq+OCiFCRTu5Lw0hl8sHjTEhOKIF2N2tDUqf2TMqt3lubRgG8ujc7+2
	bH36YMc1TUCm73dSgAFXaWq240P5mlZQYmhFj6KNHmDMwH1X6lHbemR8Rjn6T+lw13CzvLxTL0M
	IuUyMdpXPrW5LA8qXNV4Q/1TWs0Yyzv9cV/JIRjLbhYfUXekskPq8vrwmtK09LZSuR72CN7Tl17
	nVpj1NeCAhEwnrC9JdIY6qHBdTh2w92DcoPZEoFdCGb82aBGiMlHzNOhB/J/EbHGyKBurHC63Py
	Ib9hbXk+iwWbtHZv10xyvpWsjiy0S/ZLxng==
X-Received: by 2002:a17:90b:5546:b0:38d:ec31:4843 with SMTP id 98e67ed59e1d1-38e4b5f2212mr19989848a91.41.1784634995099;
        Tue, 21 Jul 2026 04:56:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5546:b0:38d:ec31:4843 with SMTP id 98e67ed59e1d1-38e4b5f2212mr19989810a91.41.1784634994595;
        Tue, 21 Jul 2026 04:56:34 -0700 (PDT)
Received: from [10.217.217.176] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92169210sm1475947a91.9.2026.07.21.04.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:56:34 -0700 (PDT)
Message-ID: <d9bff36f-4400-4b2e-8fbe-a902ca41a316@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:26:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
 <20260716142445.2767955-2-monish.chunara@oss.qualcomm.com>
 <20260716143511.080B41F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260716143511.080B41F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyNiBTYWx0ZWRfX7wjR5/j/NbpK
 JlL4aJg4horL+uARcA/plti4JGyM6ydjFDiSnshNc6Wped+qozyRJHdKcmwMfTKrU6XA3tQhNaW
 Oayl+jQtW1aBoMZL7YK2DPToxAx0nho=
X-Proofpoint-GUID: zgElmlDO2HQGhu32GZ107cbYbom5Nk92
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f5e74 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T0wSgTMCz-9BSj2qRU4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: zgElmlDO2HQGhu32GZ107cbYbom5Nk92
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyNiBTYWx0ZWRfXzBAHMjrgJbpM
 PtH7rbFCYULTE8ggaRT6ZZpIg7M5N9Owal54lfIlLSeJV7vbdvFNYr+gCxi5eK2M56eAayOXJXC
 YP3oo8AogX1KX0dzoZ2iqKO0auFB0K+cWy4M0DG3j1ltTbrXP6EIFVmDfvqyRjFKvnMVT1utWFY
 LrjliMH448sCqax+dtTts2DcGb1vQpcPOeHCYa0/dc12Slv3i1/0s6eA+jPQu8B5iiQpcg98FO4
 iG8pyGDIbzHZRqe0TLMbYDSd8qENXf4KZ/7X1NzMjrwLK5G6E9ZFbv3Y7B4Y5DeRt08K943Ql6P
 kJPLg4u1zLTlqbVqnPRxqYtCi3KHMQLR+ECTuBEZpd3WuomLiYpEl3o1FDIhKkxbuzEyqvEI9c4
 XKC/0CMBFfzE6N3OkesGGvDOVLEqnRoP6NmgBPNBlF8eeIxOPh4prvuZT+ly0Raw8FMwcjsHxmo
 QQZ+SaOiJXVucvuwCtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210126



On 7/16/2026 8:05 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The 'supports-cqe' property was removed from the common SoC DTSI but was not added to the 'monaco-evk.dts' board, silently breaking its eMMC CQE support.
> --
> 
> --- Patch [1]: [PATCH V4 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT ---
> commit 37093e152f8a2bb5db199eff4358061ebc24561c
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> 
> This commit removes the supports-cqe property from the common Monaco SoC
> device tree to prevent conflicts with SD card operation. It explicitly adds
> the property back to the qcs8300-ride and monaco-monza-som board device
> trees to maintain eMMC Command Queue Engine (CQE) support.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 7b1d57460f1e6..e5f316897706b 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> [ ... ]
>> @@ -4828,7 +4828,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>  			qcom,dll-config = <0x000f64ee>;
>>  			qcom,ddr-config = <0x80040868>;
>>  			bus-width = <8>;
>> -			supports-cqe;
> 
> [Severity: Medium]
> By removing this property from the common SoC DTSI, does the monaco-evk
> board lose CQE support?
> 
> Looking at arch/arm64/boot/dts/qcom/monaco-evk.dts, it configures &sdhc_1
> in strict eMMC mode:
> 
> &sdhc_1 {
>         vmmc-supply = <&vreg_l8a>;
>         vqmmc-supply = <&vreg_s2s>;
> 
>         no-sd;
>         no-sdio;
>         non-removable;
> 
>         status = "okay";
> };
> 
> Since the EVK relies on the base DTSI for CQE support, and supports-cqe
> was not explicitly added to monaco-evk.dts in this patch, it seems the eMMC
> driver will fall back to legacy single-command mode on the EVK board.
> 
>>  			dma-coherent;
>>  
>>  			mmc-ddr-1_8v;
> 
The incomplete and strictly eMMC based configuration is removed from the 
monaco-evk.dts via 2/3 patch of the same series -
https://lore.kernel.org/all/20260716142445.2767955-4-monish.chunara@oss.qualcomm.com/

For monaco-evk board, all eMMC properties are added via patch 3/3 of this series.
https://lore.kernel.org/all/20260716142445.2767955-4-monish.chunara@oss.qualcomm.com/

Thanks and Regards,
Monish
