Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E6C486622
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330018; cv=none; b=lIouvIcJAK3nG1ZB695OZKruP+asxMaCj2sVts63SCFoK8OtdZ7NrkBlkZEaMuAjdqfsxH64qw8hpxUBqpiy15eOixqNGD5ikT8gRSEpBFTiw+f84oDjSvdCJJQFG3ewef/sSmcUJR5zDJ17suJsUqItS2HfCz0ndk1ef1766YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330018; c=relaxed/simple;
	bh=usS5ZvvfleDq+b5anpht/xfqW4DM0ICjkN/d+9cZryU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvroCN+DucSe8bVzEoNBKt3jsttp25d8O/CAsexUP1UVZMt6rJV4QCPfYuq1145NTr56tgwdiTc0tXCjeYNCNgoLB9mdHZkLMkGl6FllaqFNtFCpIlEaxpvcRJE43NwokJhQ9eFbFe9V+IGsPbbiN2+Fxud2nT3u4OpT4ykfRlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFdJTcpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDCIw6iK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFdJTcpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDCIw6iK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBX9Vp1846866
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQuLxiXgQrlaPB545yvWNYECiZsH/JayHHgnDnwTqzo=; b=ZFdJTcpgwPRxl7yL
	GUep+UFfx4OkU4ya/iL/f5lq1nQ2+2oIlYOaxsILHmY+DWypk3UOJ9jUCQomIJ8Y
	8xlfw2rQodH9Dz7G63unP7WtdOfJ/RHEVSnixemkcc/OnsqRwyre9+h6TeB9zgm8
	ZPM+BBmFUvQoAhaeqLwzSx7ffJdP03kA9v7F764Kn4vjU0TYqHJMPKy3ihlkwIgW
	AtlA7c8eWnZAzU9+NXNCcsATvpMIwbzZcC7XtenbsYwu4tKv73nOtFcZjFztuLLx
	0MBU9HHxwnXh1Jwj4YxpZwqNbQkuR9xAnTX5lkGt+xtvlTjR1OZ/SFMUT8EJYc/D
	JL67cQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcgadc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:00:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1400451a12.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785330015; x=1785934815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQuLxiXgQrlaPB545yvWNYECiZsH/JayHHgnDnwTqzo=;
        b=MDCIw6iKN2P8wU18zg/xJ47jx1ktlKc9o0e6Wr2xQuy3hHUsXd0VOGkDRNY/YUBX4J
         tSX64ssYiWI3HNfbnr54Ls7B145iigc0iCWNDlsjRO7kN15Loee6lHiVuqGzs5LI5WvJ
         koniOC4O/B2mS5GyFHdrZeHqzf9BwZegWq1lAloxr/aQ5/zBWNFsSAOkdTrzidjVhvhK
         yXldY3WjYVpbFBqCCZtfKzOVuRPHrvV/sw7Nk4PQWxRCuEPbA63mnV+vR2tiqynAD0E9
         qnsV34NEMkhM5c3DVIzflw02J/HyL1V9Lm0vvi0eOwJuyFzkmAY5SjhmX/rDq6DOCdaD
         dXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330015; x=1785934815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQuLxiXgQrlaPB545yvWNYECiZsH/JayHHgnDnwTqzo=;
        b=mNsmF5Dc8zhi+UJYVUeGxNMtRxUUf9Vw2ajFWQ6etRrd+LhD9JpJ600Ecj7l5qCqa9
         zvr7VPXqny9yojVGH5qx3/FvK6Grq0c/c9rvdVU0iBApJ2pKZDa2uRuAazygScR8JeOD
         NX1PJCkhcum2St3ABofJM2WgmQkmTI1M+8ZmtFkea1akqIEowQO7LSqKZC82PFk+f5WT
         HGga0MuBgHyyzINS847mdHvYjzpUsQ9NRlU8ztWYifc+UITnn8XSbvuXllPm9ycOiIpj
         9m2QoRV1GwPLM0DRV0+BGKIn5oQSVBCj12IjHznViFQHSnZGhQGXVhUWlgwcG4sbOET4
         eyAw==
X-Forwarded-Encrypted: i=1; AHgh+RrCWdX3RNrFpzn+BcHEV8gvm4kGKURokQJ9RmtRgQwU/x1LbRGukCU35Cvjb4sCDHtCjB7y/KTzqyui@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw4jzl9FbwBiFPey5jMbh3oQVKNf4C282QvyZaczdF6RziTqPL
	5h3VvUjFurOLRAsmxbTGplF3HHGUMyWiQy+3fMCCXWmKbY/ZA64tyZt/45pHFY5Nyq5M0g4KJHJ
	VpG8iqJeyEIPDRqqyPnQt/Zn6ppKwKjsu848z96gsT8SCOjOoTvz2s5RTKttdxg/1
X-Gm-Gg: AR+sD11GHgLGwxsfdQ+nRvS1ny/AmSjW8Xf+sotumsyHpv5OsvH2m1pCRRZmXtdmJU0
	tFxCYFv478g6EnnY7FPzB/ScroPxEDBoo34B69k8PLqyfKXkdngBTRCgJ1jCJTXtqbBZCsZ4uTK
	nJ5gm2hjg6CvDFLiFM2kWknE3JBYW2dnOFfXYeqRszP/stCMD8Zr3AJ2aruysiKEbJksPOVGzwP
	/YBxK/f5O2uxh2FKgReuLf0IoDVw4LnuKi7PQMbffvm17WKKVHgSjhOZIdnj1w5Xh7EdJK+HIK5
	IJa13i/yhY9DHQfpVgvTw/BqIHAjFkuVtxeVMrmSOkv0wBpGXrB89JRlDaFcdkyokScY1k6GylY
	md47gGF67yXG5Gq6dNMnKd9LaJWnpWs5o3HmVOrzRWSkPWyjw2YjH/OlP51sNBnh3LcacC5DZSy
	2F8r2QEjJdVzqn
X-Received: by 2002:a17:902:da8c:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d015d48a03mr68747715ad.32.1785330014679;
        Wed, 29 Jul 2026 06:00:14 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d015d48a03mr68747205ad.32.1785330014098;
        Wed, 29 Jul 2026 06:00:14 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a1586esm11028135ad.12.2026.07.29.06.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:00:13 -0700 (PDT)
Message-ID: <587a9ac1-dd81-4f88-ad6a-c9cad03ac0c2@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 18:30:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
 <b7a45a38-008f-45e1-b138-91ca34704bde@kernel.org>
 <d1af3fcb-f2cd-4e37-b1b1-d8caff984c84@oss.qualcomm.com>
 <e9dec9e9-afcc-45a1-9d52-2c4ff34958a0@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <e9dec9e9-afcc-45a1-9d52-2c4ff34958a0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ovFEY0-ozUVodhiwhy_iMjloXZIQ67QQ
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a69f95f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=88PRl8AvwKtk7Un-c6EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ovFEY0-ozUVodhiwhy_iMjloXZIQ67QQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwNyBTYWx0ZWRfX3dV9OmN7AKcv
 QM3AskNQheDGexnpu5jQO4baLFR2Rw0lzx52KaCEGt94uqJNL324SKWskyxEPPLu192PSRAM0g+
 eNqtJIw8O/CBJRyg8sp3p/Lv/pOG+60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwNyBTYWx0ZWRfXw87VkGiadGau
 j4a61IUknoeCux2UVFkdYz37qLfOGag/NncFUhnpV4RB6zdqizMaMgklApgr56dA0PIuXgcVVD2
 M+qemzvkdEZ8ZS1WFyfmk5r5+hx+DOn8+fKJztfhMMPcC4tyYrTbjLaVlpg5vod24eP9GR4sWvY
 PfNRIg8kqGjLEGVpZIXCxy2GI8EbgLX7D2VUHFLu7PTplQIRnK1JnvLGv6WRwBokp4Ccqn1X8K0
 yyKanUP2/4T8hRXXogh9HB95ilgnNNqTkN1zLyWX7RxSN6OaAgttf1bnmLb+0AvJO28jw10lNp+
 fT9+w88yka8tBKOQa1Xs3u+Ak7vyZzelmU1I/5gE7qLMBcAFOkeLOlo1Bu/6d69YyNccngVANVf
 CQ9Zj5PIKrkW+7VkYgaaSOAO+oHDy5BJx2irpwvoux8ZnVahNcf8KNeHGnce40vT4EPVyoC+jW0
 lMf+2VXpWAHMo2GJHFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290107



On 7/29/2026 6:02 PM, Krzysztof Kozlowski wrote:
> On 29/07/2026 13:54, Anvesh Jain P wrote:
>>
>>
>> On 7/29/2026 4:38 PM, Krzysztof Kozlowski wrote:
>>> On 28/07/2026 19:44, Anvesh Jain P wrote:
>>>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>>>> providers, and how many leading sensor IDs on each, whose readings the
>>>> driver averages to compute the SoC junction temperature reported to
>>>> the EC for fan control.
>>>>
>>>> The generic thermal-sensors property has no standard semantic for
>>>> selecting a range of sensor IDs from a provider without enumerating
>>>> each one, so a vendor-specific phandle-array with an explicit sensor
>>>> count is used instead.
>>>>
>>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>>> ---
>>>>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 31 ++++++++++++++++++++++
>>>>  1 file changed, 31 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>>>> index c07483aa5937..ec809fcd03ab 100644
>>>> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>>>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>>>> @@ -33,11 +33,40 @@ properties:
>>>>    interrupts:
>>>>      maxItems: 1
>>>>  
>>>> +  # A generic "thermal-sensors" phandle only identifies individual sensor
>>>> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
>>>> +  # a devicetree concept the EC cares about. What the driver actually needs
>>>> +  # is raw readings from a contiguous range of leading sensor IDs on each
>>>> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
>>>> +  # phandle with a count instead of enumerating every sensor cell.
>>>> +  qcom,tsens:
>>>
>>>
>>> What is the point of having internal review and then IGNORE that review?
>>>
>>> NAK
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Krzysztof — for context: I did move to thermal-sensors after your
>> review, but Konrad separately suggested keeping just the provider
>> phandle instead of enumerating every sensor cell, since we only need a
>> leading range per provider. qcom,tsens was meant to combine both
>> suggestions, not ignore yours. Happy to instead just go with your
>> original suggestion and use plain thermal-sensors, enumerating each
>> sensor — let me know which you'd prefer.
> 
> How does <"thermal-sensors" phandle only identifies individual sensor>
> and this phandlel does not? I see absolutely no difference thus you
> duplicated the property, which I EXPLICITLY asked NOT TO during internal
> review.
>

Fair — there's no real difference in shape, qcom,tsens is still just
a phandle plus an integer cell, same as thermal-sensors. The only
thing that changed is what the integer means (a count instead of a
sensor ID), which isn't enough to justify a separate property.

I'll drop qcom,tsens and go back to thermal-sensors, enumerating
each sensor ID explicitly, as you originally suggested. Will send a v2.

> 
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Anvesh

