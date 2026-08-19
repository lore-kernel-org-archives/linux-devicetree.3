Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99F0470E83
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152398; cv=none; b=hf6CBfn2MQrm4ABI4BkE7gnvuyWRdlE8GpCMrmEhjl+NSp6suegwIgAFFD+3YWZdPTe5UUIeCRu6wqN86wSIIBqg4XvVTEI9CNJcAxmkj3TkBJpIbWg6beOGSECL2jsWB1GOpHnZOKZIGsxd5In0K6HwLNV2OdMNTCpxFC/bLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152398; c=relaxed/simple;
	bh=MspQfYjkNKU2aisWJVBn+usjt36DwQAF4r0yuw9VnlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDGRBBNSku5wIaz6bxrDNw0g9/fZ+u+S4Va+XESHdmL2zi929+xXnxkFm7T82N4znT3EiIfnL71N8qOjVypBtHKrDtdDqmshlj9T3LcGqqqJRaKYLrOaSkF9kBzhrPWnhUzhONbhIqf9B5e5ccrtObG8UFXS+b+wHPoMByVrq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frn5ZiPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKq+klnp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frn5ZiPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKq+klnp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1jHY537263
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7UA7Pbmz7/S+O0bQY8mO7qxLDV27cSL+jSNTx1QVSc=; b=frn5ZiPsJyk74kSD
	oClY9Xn045UamMRBzkCkZSBWtvgcUj1kpgbWBCW5wJnpKNRULESfKHmGqQ6Ybqz4
	9sln/AJz2eR1PEBox5BK9Hir82OEL6Y4Pzau+K62kxIx/0p3QJ2fnDsGVxiASMjG
	jxULmK7UohMFDu93htYYJ2SN6EKFGwpdiRz2NpY/lJODZA6J0iYDUpWUl0Kyujh3
	5Kt0Sjwuf3nyO40fsJ099e3GXx+3uzGZJsdNu8pUShNBXgkkpkbyT4oRyqwzadof
	kGMewEuVNHUnK78L+b6BZXMDyaB91SVMRrcLR3gsqkE3b9uC0HxrVuRKBJVZ6wVf
	Nq5bqw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es581se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:13:14 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7570225606dso24815137.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152394; x=1787757194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7UA7Pbmz7/S+O0bQY8mO7qxLDV27cSL+jSNTx1QVSc=;
        b=ZKq+klnpziXs+LODvNiMM5+CJ/aBQTjUWBsRpH2pRPalxQsnJJ3zfXVViqPqSPxK37
         CwHbMYUHrNoA4vmdIc+wTuGvD9UbTS90ky61YfHjpOqbQF7gw2lylZzPEF5rBiVFuf8u
         A1BVviklu6o/9o8v5JOKX0xIMPeENzp585BKTwwtIwpeq3kRSXCAfepdGII+krMJvi4B
         NEwRRdXMsF5gi4BEEVoBZWhtjQh1KWPjE3/ksh/rPo4yEshMLOqZLsAv3CtX8miToEz9
         EyE06IPkXjfu7jLmO9ViKWE+63cj/jytI3yk39dP0AyZU7VSKQzT+UVRtAam2srGX6th
         8VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152394; x=1787757194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7UA7Pbmz7/S+O0bQY8mO7qxLDV27cSL+jSNTx1QVSc=;
        b=UUWo4Y4ymnhQZ9t6Ow9/fT4QWklIaODbUZT/ssnf6nx2PAv5Jok6+WobWdBcs9988z
         yjANogD5VLViAmJXYGQpOdaxCth+6Z67EKPU5CeaPPhnecBN9sg2rnKMfDTsg09O0sNz
         HOx/dc+NRVCpkkcqxE1gcgkQSMs5aNvxXCBQ1FMYHkuQKTUzNxC26A6gAPvG4UiAKioq
         XnD1GHGS7P9aHV/NiGRbEtNEqGPPt2pe8DwQ+hdRnGhHZqAQZEMjh0khTUTPk9HbLS+I
         EBwWvSSZsfXFTzNZ+zJvu0Owdl2zR2r/5cj99v6x1GCx1YDxPQ04V+BRuoQj+JB9JIfy
         UFiw==
X-Forwarded-Encrypted: i=1; AHgh+RqCPZuaLZMcv835aItVGaSaC5L3D2hAkxwGQLzd4F8vyiEtlzg1IHRADyBBTweER5x6ApKAdfq1VEGY@vger.kernel.org
X-Gm-Message-State: AOJu0YwGfKHeiS5yds2PAnH5ugLAiUk/lazP/7LfUzYxmJmEhBjY1b0k
	tqJy17rI/+89fn7SIgwFfdwZ5mTCe7gXXvg/kD/Jiv/vyp13RRdOzS1ljZiMSeZuORcEAAQY2gu
	sXG49d7fhYSM1OLTOqb6lHCxiSQ1zjYz9tf4UNGKutEn+PTi4QuT3C5V19LgtVEHn
X-Gm-Gg: AR+sD131qBKFESeY4sPSCiFYlSysbe9a5WojTNU1UTQ2Lt0Hx6cs1wZiFjlvyVufGyN
	IaTGzQEQcy8loY7Wyd77+OOF0JwGfDh6y7oat/5sjCZxKsJHQGUgNaStfqAkLXa5o4jWc/ahXsL
	93G9SkY+ZVXsGHucP+wW6ID5HaF0yljs4Z8G3giFLOJurp3J3Yrz4bwHasg9U1iliCXkgz/WsJI
	RP5omBkgZkVJCWa8NTnF8OSyrpKt6UaibGqqdCV1NciRp9oRf66Ss4vRw/yraeQWjAZ6nKhSCJl
	7jhCMmb1STbvtztLMkj3M4e4H3kXBhXO64n+Q+rHsSq9FqzRlEByCbdjpqltU+Y2LMlJZmv8z6g
	L9Mx+X6NE1oPjnMGpiw4IY8Wr
X-Received: by 2002:a05:6102:14a8:b0:778:9d46:6dbf with SMTP id ada2fe7eead31-7789d46e53cmr372434137.1.1787152394309;
        Wed, 19 Aug 2026 08:13:14 -0700 (PDT)
X-Received: by 2002:a05:6102:14a8:b0:778:9d46:6dbf with SMTP id ada2fe7eead31-7789d46e53cmr372419137.1.1787152393762;
        Wed, 19 Aug 2026 08:13:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1111546a12.14.2026.08.19.08.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:13:12 -0700 (PDT)
Message-ID: <3e65e037-219d-40c9-b205-3ade0974e46c@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:13:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260723-pocketds-v5-0-74508388c716@gmail.com>
 <20260723-pocketds-v5-3-74508388c716@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-pocketds-v5-3-74508388c716@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DMWmHX3EMoni_4chuKr_9HgqCB-RF5xv
X-Proofpoint-GUID: DMWmHX3EMoni_4chuKr_9HgqCB-RF5xv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX00Czc8rXu3FV
 6wpFlpCmAALSdz6wkER0qUvP7LBgjLpbiSSDCpuGAIdXlTyoBNwS40z4zJXIKYwTdYUyMHJQDLY
 WjpvnNvUtF5e2jS0jfh24MVwa9nkYt8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX1kFQoXlOa+/X
 VYbOz7a94Ej4sPozB39sE+181HgyXtps1fvJo3u9cgpeeasCMXQjiNR8T84Nyn9EAZQwXnL1Hrj
 4R0FdBHzJ4wcnEKN4uQYLX9S7anvlFZg7GFu848efjaGY2PV/eUdErbLiBAvJuHrxJ7+2hvPhLj
 kdvwwa6uENl3wo3N62FnmKtI88BQn0cJz/nYodZztamOyMLKrQEg4lfhSivBX+dk05G0HvlXEEU
 jIKODVd2ImXnEreCap5ciniW0TPVQp56Vq9sOCc/MejBkrzhuhy+7kKG0rPxheK7jKencZPyKSH
 0DcOJF7Cg7AKwc2SpCEtqeMWLc9Jdz4iow/AqDh0rZLcWCyWWPXze2vpJd2EABLXO4SLbZQJ9JI
 4LCRc3ddnUGXKUZ+rLCb+H3muVNn9sUikocOyUuLXj//faMwzsBbuS5YemQAvXkLnTRsaCCrVkR
 7gV0E1234Vkc3DmPkEw==
X-Authority-Analysis: v=2.4 cv=Oc+oyBTY c=1 sm=1 tr=0 ts=6a85c80a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RSv7_VIIX-cU5JMv_t8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190118

On 7/23/26 3:24 PM, Alexandre Hamamdjian via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add initial Device Tree for the Ayaneo Pocket DS gaming console based
> on the Qualcomm QCS8550 platform.

[...]

> +/ {
> +	model = "AYANEO Pocket DS";
> +	compatible = "ayaneo,pocket-ds", "qcom,qcs8550", "qcom,sm8550";
> +
> +	aliases {
> +		serial0 = &uart7;
> +		serial1 = &uart14;
> +		hsuart0 = &uart11;

serial2?

[...]

> +	fan_pwr_active: fan-pwr-active-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

This is already done by the driver via the GPIO APIs

[...]

> +	gamepad_pwr_en: gamepad-pwr-en-active-state {
> +		pins = "gpio52";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

ditto

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
