Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B3237416F
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022134; cv=none; b=EMJWwKsFHplkb23krF8u8lD3h/KESm2I83DoQpHOHBTZvgIbc59SgSvXjuPGQCjXXiUR8WIBbKT5FUtMR0oWbfC9lSMc7ir0BZZ5c+nYFAUoEK6eQeKtD4Jksr2SMs109svERreMC+Vq4ZgRS1OXjoN3GE7mLWadRIOSPZ1z7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022134; c=relaxed/simple;
	bh=pTBRVxO8jeuFs5lxPvnhQS20M92lgzCTdbJXvtYgC+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUlagiGijRZ1EEbcZ/I3KChaOVNb8WVR3hehBLlYuKgmqOOwVBlQ5RdTJBJ7BPhDFb+yHCNgh3IU9uHEQpRZnly6Wpry6jT636ZD9Hx0FYYxmJRitybjxPEen+CNSapKiq3/0npBAkcCRoaRlcLOYeuHJgUuGJBSdRE8RROaCUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I95i7iP4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9fHW5ar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I95i7iP4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9fHW5ar"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8H7ck2291550
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hz4yBNWVXpTZtnTz4q00WtX2xc5Xp00z/onQNDMKC3g=; b=I95i7iP4oG+gGPFD
	JIS0uM78vwoDEbNLXCXPjonwPqWtwFGsqrszVOBwn54VZ6ujF0Y3NiwD11MB8FNQ
	4haObfgEtm7ME2hlNqcHFdKOgvRnmsNXRcwY2owjTj76M0CUMKVwGiOtpxdrw93i
	J8/WeFV3mHRDEg/W95kod0u4ptCODeXTZjZSCGkWo1XtDS2N2gK0F9oD4UjpTuat
	wuhPxl8SmY5unaHQMILWxrpV5C6SxQRM7rPXN9EA8vYdP81DR/VJDmiBBCqHQTvQ
	Xu1Gk8XcSAzst9iEzXoxc1bF+/dcbhmnd/QwNDH+E10wv0E9hfdE00Ijpin7hgh6
	aGIBjg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqxbp9puj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:15:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ee2dfd63beso52985485a.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777022131; x=1777626931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hz4yBNWVXpTZtnTz4q00WtX2xc5Xp00z/onQNDMKC3g=;
        b=f9fHW5arvAECs/3Pe18+OF3htJEuaGZYZnE0VW9BPIT1yzNkbebkZlZc07vzDejA9O
         U04lxE2XZdDcSkx9TcLavMu7Y5g1NeOKsJIXsDzxItdjgWJCyS/hvMPpdd+doR6Fj3Et
         wTqyQGV4vl3qbBCZqk8fBsopGWmg/yBPTeNvO9gvuxDZkyR836G+KRd3DZEklIWoPeEu
         vB+cqHWRNxxzPc+vt+bvKKKSd1GvLwnSEVQuS0H7lKygYsBiRI55uDx/PFaxgNiU6WRZ
         deShNBc8kVRIFvZjU1ORn/lT/E2iB3bJJPHV1ACLBWgb//yemeEqXMH9Sn/1ZWwSLHQ2
         hm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022131; x=1777626931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hz4yBNWVXpTZtnTz4q00WtX2xc5Xp00z/onQNDMKC3g=;
        b=p5aAsr0oiIVDT1gInHhYxWYbeOVoftlZhpCrJSgynhyN1dQeQ8xHYkv6PJSxEdcVtK
         /PEmPctEXpdJd8BKakjqC0W80CgFZ8YX0KBAiI5OqARcSHXA66WZNiS0PWG+I3AExL9T
         y/o9NH22lON9x8RPY46HDOWW0YcDLyX8+O2jp+5Nc7H1OZPhoyvwFfIDjujeZKOCiJKj
         zo+/EN27F54PpdE1uSFNNe0oL3ZP86dT+8hBH1lq1Q9bXOmGSftO1YZVtygeR7nD5AKc
         r/7+uk9YNTOZSH6iJFna4K21m4nXNEQsHLrdpoateBqLT9BYQomEfcG/PdxSKF8zl/GE
         VsUg==
X-Forwarded-Encrypted: i=1; AFNElJ/3AQXd+0zCpD/bSziibVQF4alxUQM0r3mTjueYn7U3ZYySf8EtIQirqs6fdFmqHFJTa1dAoXWEuin+@vger.kernel.org
X-Gm-Message-State: AOJu0YzFrRqV8q/bApRbo00yQreRMnC6VbGd/9lwuTT3IiPdCeD/jn1Y
	WS6MDZDRguIbT/G6iqHUms8KtHiSUjQXohzUwQP2A9F1nmPFJFxJKIJ6XsRBslyRln0LjgIrgES
	nfCVXvQsMa9nOAl9ndkvQfy9JDckX8y5WQiprirHYjc+0sy2ic2z4wBaeVrqfjipM
X-Gm-Gg: AeBDiesgku5c8CjzMCyRr4NbbyNIQz4jGsMa3ru3//swoCedf56DzkhdxW0dljiD5Jk
	ygdMaR5AAe1VLvD1bfz1R7OcLBUWS2MtfxziiGlc+rcYwEKPSZy0HbYea0tS4L3MQ/KMyq7D7mn
	MMiXTQzudw0otoOlVy8qcZWCrTgTbuwtT5fbt1L+M9XKHzBjx3eEEE/uBC8ilUd9ZX1MLXs9oX/
	AddQrislTT28aXtG8zpU6vu1PpIpr8k2fIeGvEnsgu/HvlBIu3dP87eBAmdI3wgnmRQowBh9Mc/
	GygrZ2h7kALhMHOjemyjQElgyKnvI2K9nIoc0VzbomdV3M4Q/C2xV/bC5j6fSXG47uppNmWdy/e
	KRltbwgIEmvRe9L0P21uHEojSKcuRB0TvZ2hJYazXCHz8onI98Olv/97snGlAH7NSh8uo9I/UyL
	VBDK9c/KnS6BaEbw==
X-Received: by 2002:a05:620a:2304:10b0:8ee:a1d:bac6 with SMTP id af79cd13be357-8ee0a1dd0f2mr1120924785a.4.1777022131369;
        Fri, 24 Apr 2026 02:15:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2304:10b0:8ee:a1d:bac6 with SMTP id af79cd13be357-8ee0a1dd0f2mr1120923185a.4.1777022130819;
        Fri, 24 Apr 2026 02:15:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67316a69a46sm4653881a12.1.2026.04.24.02.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:15:29 -0700 (PDT)
Message-ID: <7bd0105f-7e99-4799-a778-56f0131ee79b@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:15:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: Support Motorola Moto G2 (2014)
To: daviewales@disroot.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-device-motorola-titan-mainline-v1-0-e1813a028cc8@disroot.org>
 <20260423-device-motorola-titan-mainline-v1-2-e1813a028cc8@disroot.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-device-motorola-titan-mainline-v1-2-e1813a028cc8@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iAYQGmZtGSJiiDGvqGxz0nVpsCmcFTa4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA4NSBTYWx0ZWRfX/8Wva7oH2wz6
 o1wBhmQsJyuRUfjiOOtjSzwE+QUOY92NT1k7AsN9e15E5f+X7juJ0U0pPIqQPfY856gJyXw8XlB
 kRB0Z7KXqeiU9pDrdl2+9KV8yxKWDVLDy6yTUgmz4FlGMWUF2C+W1mhXtidcJwQ76PSGmTotfrq
 yFiTURDYtm3gicfR+WIHw8dvs+8T8dF60jLujGHwQrYLVl4rqrZITOtS7nAK6/wrTvR8F/2nnbj
 mXRI6WeDJw/l6Z9MvD0YTUcwdOnZ8ijT9wLdCogrfiqg/Rc+awAXI+Yg7wtjrCFey4jkK3OZn17
 zxLwX36pijmoUxlfcMK9nQj8dGXas5mywQ5mi6NYUNOFWoBwEkRNl3IwxgBhchco8B5cBgurCIQ
 4dPcvs9qGJCzmRLc0aEAo7Ao0IM2DgOhdGz6kzk9Xi896wn+BFmnwA9c3A5NNM+O/Pio1l5l8JR
 Ih+4AtK3Tw43cbcH+Mw==
X-Proofpoint-ORIG-GUID: iAYQGmZtGSJiiDGvqGxz0nVpsCmcFTa4
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69eb34b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OQN141zOAAAA:20 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=QizVoDLDYLmPXa_Hf28A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=LqOpv0_-CX5VL_7kjZO3:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240085

On 4/23/26 3:24 PM, David Wales via B4 Relay wrote:
> From: David Wales <daviewales@disroot.org>
> 
> Add device tree for Motorola Moto G2 (2014) (motorola-titan) smartphone
> based on the Qualcomm MSM8226 SoC.
> 
> Initially supported features:
>   - Buttons (Volume Down/Up, Power)
>   - eMMC
>   - Hall Effect Sensor
>   - Simple framebuffer display
>   - Vibrator
> 
> Based on device tree for similar device msm8226-motorola-falcon.
> Initial commit for falcon notes that dhob and shob reserved-memory
> regions seem to be related to a Motorola specific mechanism. [1]
> 
> [1] https://github.com/LineageOS/android_kernel_motorola_msm8226/blob/cm-14.1/Documentation/devicetree/bindings/misc/hob_ram.txt
> 
> Signed-off-by: David Wales <daviewales@disroot.org>
> ---

[...]

> +&tlmm {
> +	reg_lcd_default: reg-lcd-default-state {
> +		pins = "gpio12", "gpio13";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This line will keep these regulators always-enabled, until (which
may perhaps never happen) the driver takes over, it should be
unnecessary

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
