Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C76E31717F
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970620; cv=none; b=Z0EyX6q3EBLKqS6NNt3j2K8m6SYGsTq/D4Ektt+whAa5BH9j2mY9ZAmqDIYMEBnaos+7dDkbhp0TyrHlq3tpLchitJDk2OmX5xfmX2r31EnWw1OtBgQTtQhxS1aKinaLPpQGmhSzbKG6VCJJNzFJyWLwyVWB7M+Fqh9Vm++oeyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970620; c=relaxed/simple;
	bh=VMqNg1aH8mwUt2+/tZdXBjlZ8m29H6jeQLMAmh2Ywo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+JO7rQJmSH1LgQjEo5XvH5Aaaczj6ywlV0CFA8NcahXucnyOhKrtaxf2GQLxv9C4oPGOCWjlsP9lv2QsqzFc2SCIURptTC1nvIRywSC79ynaGl+dZYG8s1YbByhUwnKA8YNLbhMUU+Mmbo+JhSfHdRwbjZwzs1ccM1qvA+xVNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LAhpoGRP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eq2SCTO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LAhpoGRP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eq2SCTO/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VEhI4A843082
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pZ9xNMWabmjG2ehCdcqA4CziyQQjQ06q0kly1ppLhG0=; b=LAhpoGRPa3TC5jHY
	sfZ8pXQSP1SRQcnH7YiwZxyjKldDyAbTwiIs98Rh0JhFTZSGgmWs4oA5Z1muLZgi
	fnAeVK5PTeHjyDfBWwEhnAKONUYI34bmdFlqDaRtIX6uthJWlxpJx3fkTUoyrWjH
	zP0LxW5aNnFgj8A1BT4dxiNV9UawC7vL4FGYR9QArXQkIfJlzKddKtWLOIVUIFZJ
	FdYYmJy1bdwIioymvO1BpP/EEn3nlW8p3/QnQdq2oESezLGo+IoylWha9IheWFu0
	mZTQs5UzxL63iQTkGY27kS5kuerXbuCP7zE9BjcWMPsCO8yGr9WVBFnRWJNCmE+U
	j39SWw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86ntaxuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:23:38 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffd797184eso425124137.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774970617; x=1775575417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZ9xNMWabmjG2ehCdcqA4CziyQQjQ06q0kly1ppLhG0=;
        b=Eq2SCTO/lFBnsD3LOGr7qkMOkVg9IvCCFZopf1PQWlkoEdclih277DpGD4HvhR3wSI
         U4IGEqdKQtZGMpoY19qQphPg7lB/66x+8UdJzIZ8s+SuZn/+j92XsIiw5VIx+V3kFPqt
         EvCl7yf3yJSaLzlvWUTyCgo3CYDGmIGF6rGcdESQsd+BxtJGGei9PFWRN5J6l7t2H9vH
         6jdMZOov5eXU65S7j/QpNMjX9PjghXSLI5qq2cyfowRt+iGzqW/mK2Uq0/4UMdRZmZ6h
         SDqfWG7zDBpOfNGFu+ML0sBizkQXjYhxN1heKTFsAw5UOzdwu1zTEpK8QNfJ0aiXC6Lf
         Xq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774970617; x=1775575417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZ9xNMWabmjG2ehCdcqA4CziyQQjQ06q0kly1ppLhG0=;
        b=DQdmrAFamNmgHiQxIJ7k5coFRQNUPj2+SGASTb5gGV6YWEujenmzvpClC+mg40OOAp
         tN4fBJ4izgGNqVD/BBfsbRWsbfLTizaHTwH9Ameg8pRe0diCsOsaK3U905fUyFKuwDaN
         Hz5zyILrWqjezmV2THkAeELKmwZPjXNTTMH4CF+ssZIwwBMMdTVpLv7egjW+yLu0mlLO
         ZyV8w3NBlb4xuUWv/0Z1i8I7UK03zc2e177u45eV17gXkG7Ekae7KrjOdlO5MzdDy+tr
         UZFKTmF6tq4F0cajekxDA7EoakoxwfnFQV160z+N8SvQc0wN35MJq15yn6h9AiO/SU1a
         G/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUoKHVlN9saeuUemGzmmcXXG86fAcZKwjaytbk1c3p56VLc5p67zYsGs1HPMox82ELhXHrjQ3mdj3KL@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTf50WMGyXYqRrqgaLmHBTiaNgRKlLMgNQCiI3PKstSb3MgpU
	QygWFST5tbjf6W+oIpuRzLxaD8oKL9SOzqsVT6i2H5W9SaXuIh6aNVjY0UGfSXBsfMuDwyRn33d
	HmsqkfunhwPX6tjN0oSZt0sIat64UgZPsgfDYqP8xQ/t3C+mY18HWlIB3oosYLPJq
X-Gm-Gg: ATEYQzx55CeUqKVekXuWHhlAoVr2T35K3+ILl1bM5fsn7q6o4jahdKrqwObJYVUSr1u
	DJrZsE++AfQ3bnkr4huqIwdCixfPiAuMLk69laBfxPS3fr8hc1jFzw2coKGjWQomtRNl8dxjjWY
	zH5HZeKNK0ub+8+TnGZU/mj6Jmw1Xqk5+U9kfbipR/9XtNyTFn9CRetzfZN1QuC/j97AYxcTWB5
	sHszi9wp6Uh+RSuMMr073RXAojbpVUU7xKmvL1YPlf2ZvDO64Zp2GSoC4uN7NCUINoVFHoBK5Jh
	cT2y9gWBdIxQakSz8dHHKu9q4x6Ds0pDeSBxGk4etqjJR508Pyg6jAW2hjXYKRho9W/EWyGLclo
	isZL62nY/kZcBU2Ad2yF7uYheR1s6DOfXgscbrSDVYLm3ft0uDRg+X2M7vZamnHlT31P9NYmmNU
	3M0R4=
X-Received: by 2002:a05:6102:21b6:b0:604:f07b:efbd with SMTP id ada2fe7eead31-604fdd0ecf5mr2032415137.2.1774970617513;
        Tue, 31 Mar 2026 08:23:37 -0700 (PDT)
X-Received: by 2002:a05:6102:21b6:b0:604:f07b:efbd with SMTP id ada2fe7eead31-604fdd0ecf5mr2032400137.2.1774970616908;
        Tue, 31 Mar 2026 08:23:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c5b0f5c6dsm514921a12.15.2026.03.31.08.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:23:35 -0700 (PDT)
Message-ID: <77ea76fe-7f8c-47d7-a697-3e2fcfd8a8e9@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 17:23:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: eliza: Add display
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
 <e4cad76c-09ad-45e9-8725-ec156c121bb8@oss.qualcomm.com>
 <b3b96c87-83dd-422b-a67c-cfe41ae94a35@kernel.org>
 <f4ee7476-74d8-4e88-b14f-64835e6e7fbc@oss.qualcomm.com>
 <918785e7-ab35-4d54-a613-ca56de78cf86@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <918785e7-ab35-4d54-a613-ca56de78cf86@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xLBRBcYSNDt98rWSbFai3fn7ve2_lK05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0OCBTYWx0ZWRfXwKMJnzOp9MO+
 PkYOEhxWZSLd8b9Gs7Ss60yPyALo/5e3iZWuLt4OqdWIeySO7KU0MXqzh86uYpWeDrCy95dTl5S
 CPugdo2MYzRJNdozePXl9ze1IKW4FyVdyjj6yL5vh+H4tt2x1daDs/Xws6edOlL12DlgDKsIGU7
 WfnjHt0OK9aDqr8D03MoNUiMujJHaBgGeZ/2oWhYugiVP5XzGb17nXeywmuG13A/nPtgQgSmyq/
 gFCq++hp0Y5fxlu6yNj1LES9ZABTo813303kIrKogJrsPNXXU19tfCS3cJrgBnVg4mjVHL+YSCg
 CgT93YL+xFtC3O1GWzbtKQqCnN306TVfAxCMcKg9Zg4/lfP2orNqzN2meojFcyPq4zYLHT+8urm
 qcVa+esw0cEGYqY15cjl0p9f/iXwf+SN9ueHulpcS3cq0OzK7YWCwHvlWANCwSWiC0tlzk8X3+W
 6smxwj0doL+/erf4otw==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cbe6fa cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fGO4tVQLAAAA:8 a=5yyciSfWpRQtyKLhTGUA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: xLBRBcYSNDt98rWSbFai3fn7ve2_lK05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310148

On 3/31/26 5:06 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 17:03, Konrad Dybcio wrote:
>> On 3/31/26 5:01 PM, Krzysztof Kozlowski wrote:
>>> On 31/03/2026 16:49, Konrad Dybcio wrote:
>>>> On 3/31/26 4:02 PM, Krzysztof Kozlowski wrote:
>>>>> Dependency
>>>>> ==========
>>>>> Depends on USB patches, which are being reviewed, therefore marking it
>>>>> as RFC as it cannot be applied.
>>>>> https://lore.kernel.org/all/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com/
>>>>>
>>>>> Unmerged bindings used here
>>>>> ===========================
>>>>> dispcc: https://lore.kernel.org/all/20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com/
>>>>> (DRM MDSS bindings were applied)
>>>>>
>>>>> Description
>>>>> ===========
>>>>> I did not enable DisplayPort because it does not work on my board and I
>>>>> don't know why. I double checked QMP combo phy and other bits, and
>>>>> everything is looking fine, but still no USB display, so maybe I miss
>>>>> some other dependencies as this is early upstream.
>>>>
>>>> What was the furthest that you got? We can certainly try to help..
>>>>
>>>> Got USB Type-C mode mux events?
>>>> PHY initialized and configured to 2/4-lane DP mode?
>>>> Are the AUX transfers failling?
>>>
>>> [   43.975329] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_access] dpu_dp_aux: Too many retries, giving up. First error: -110
>>> [   43.975410] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
>>> [   45.780383] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_access] dpu_dp_aux: Too many retries, giving up. First error: -110
>>> [   45.780463] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
>>> [   45.780521] msm_dpu ae01000.display-controller: [drm:msm_dp_pm_runtime_suspend] type=10 core_init=1 phy_init=1
>>>
>>> pastebin: https://pastebin.com/BVXy3Qeq
>>>
>>> Abel pointed me to the phy problems, so I focused on that.
>>> HSR says it is exactly same programming sequence as SM8650
>>> and such was used.
>>>
>>> Just note, that we have ADSP remoteproc up, but no audio including USB mux,
>>
>> Are you talking about wcd939x-mux?
> 
> Yes
> 
>>
>> If so, you need that or the lanes won't be properly connected
> 
> Ha! That would explain, although I had impression that with disabled
> WCD939x mux the SM8750 DP still works.

I don't know what's the power-on-reset setup, but there is a nonzero
chance that if your recollections are correct, flipping the cable may
make it work. But that'd be pure luck.

> Well, I don't have that WCD939x and it is left for other team to finish
> a bit later, so we can leave the USB DP for now. I will re-visit that
> when audio progresses.

But.. can't you just copy-paste the sm8750-mtp node and fix up the reset
pin?

Konrad
