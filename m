Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8B3433BC8
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620286; cv=none; b=iE/w30ZE1VM5hG3LZpTDuAxNR10cVKi/9kX2+E8v0FOE5cP2FZPtSKnoJs160zuN/pNi9l1fmEYVsD83zkwffBLYAOWqgU4LpCKRadVTkG7Rv20aikb8l02IVVHlse2o3BG0sJti6BtYvx8fjDXCyI3qDvmYVEkPP9vKI1kWLog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620286; c=relaxed/simple;
	bh=QHJW3siNgVmjc3aSobEsxJMCM7AgcuQE4rep5BisgJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FviABMYdfz7va3FSzZnPuFYdOeVY3XyAgAamUYvGfzAEATe5AvlPY3tGwuvpbYDxjq9Mk3DPO2OST/TajvF/wAb8VGpj0Uwx4j9EgI/uRf8DUoDiRUYtLmHOcSvSbk25ja4nwQOsf/VCn7PEPE8118l57MvLvWoVnT8Z5PSqxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zo9aFlyt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qq/cmTvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zo9aFlyt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qq/cmTvg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6CoYO3884161
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZD7JCH11xpW947rrsKkL3xINONomQp6T3v293UueOQ=; b=Zo9aFlytQ9yO6NqU
	SkGESjdG839aocem9TkEI1g0dOaCOFMSb8oqgFZRUcxoiwOxC9CrSojAC/ZqWtoC
	vsRB00rdtG2IXhBOD2NB7v43x2LGtlXPh2+opnka2eoBo9IAA06chxjBH1fKaV/l
	QgabzJGmo32Kad3sd+QaM/BlzibzFWBs84vwNXmAzGSseIBuwfnppRbD5CYyriBx
	S8TSw2NB4rSsv8dQmPxYNwXXg5QQEUFGsK/53ZXr57psAl+VplPhJwNwBU8UxBxL
	P8Q36C7vLgB8cSwESMKQjuHPIfXJ1iUKzHUgb9qvlehagp/sjRoQcwRgUzr/VyjX
	JAtXsg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcb33c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:51:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso231923035ad.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784620283; x=1785225083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZD7JCH11xpW947rrsKkL3xINONomQp6T3v293UueOQ=;
        b=Qq/cmTvgp9ggIh5luzbKFqbD0KF0dHudfW3ZSrC8BHj2RyY9Dcimckqcbyyf7CTqNS
         fyIcsP4SqJqcT0aCEAMekOtxsTt4SDWYve1zz5Of+iVOIbMT2/FF9TaN9QTAFeMHGryc
         IjyXtd+IwvUSau0UnWVfU2XcovLDqf8qgZhLOVAVy8oh3H83n29Kqeq+KOLPgaNkJYmR
         1bdasLIRb/pyHESIMFukApyAkv2Qi9PiIEuL6zvwcXcT5k833VSQXoXA+oTQTI1qBxPS
         2iR9BqfhWVFGxh9wMQqxrpWyHd0tIfuxayNt1ttEaCxs0oA+NdySydrSDWdg4YHlmGMd
         4A2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620283; x=1785225083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZD7JCH11xpW947rrsKkL3xINONomQp6T3v293UueOQ=;
        b=mqPBtmg7vrxwP8DWxA7aAV/HvBK7wILxX7CE/SGqZwxFGNg5yt75v4PhM34aZTBlNn
         wgJEzvkf6zvC6X87LCYw76kTCwiSddBYWtzDmfTCVwQ6eNJD0Vi14q0WsGcnfA7/ovjh
         4pnWETbBRRyVHhlNAWY6PwS7DLjat4DrX0PAnsqGh2of+xkkbN5efmmXS93Be8Dy3ZK9
         74lYnhpKZGzdWAoIfZsAp8GnuYvLZYK+uet9ZaW3aEjYVclEiIlKOeCE3PSPHVrWHHJx
         WHYvqPB/iHh9v96zBDaiGzzKzmPP8jBfhv9UKZsa0mNkWWX5bhukjP3B/VaVfhhZD6sw
         V54g==
X-Forwarded-Encrypted: i=1; AHgh+RoUH7yNUKHPiLNWakBf4LfYWNAcN7GUoIaGzh1qELe/vjLROZ/f1B3sc8X983S0SskCLEA0R1lpEw5U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2dwXCtcIKfSUZ0R8HD6k+JHItyuB/bAlgsdYfsOTIUvF0kPAJ
	5LaqVaMsuV1LbRl3CJ9g8wG95e1Ws4Acbprl7BYMw6zvcJo+XABj5Xj+lpEEwZRLDvF1uyYGxQv
	RXtlDusI8DahaK3a3rwLPoY7zPMvglLksNsT4mgBRymY/AZj4aJYU1RPql7rXx392
X-Gm-Gg: AR+sD12EPtFBPN8k9gqS3nOuVQ00wFdCytJWxhSzbpcXkkO/ZBceHdbYV7yqbvY0ISy
	Tzv46KxpgVog2ixxDOvJK9KUx50Z1NYOOx4lesrFOgOzjb6m8yd0mZtEWjm0epae+DXiX3EqGJ4
	bfUE12aRozOGtNqy3iYfbwGTU+QBy7nRmju+/BKQAtBHmK9m2kj7DTBbzfAaHi2BXu2qupaXIfo
	D1JmXQBK40Ha6g0MNmCjnnvkxD3AvnEu76WivU4FXKK0bW4tSw5Po07L0gozjhJCM3qrxtzRW87
	NKP/LyL70u77wLuSGf93esmQ/Q6yxxpEvihEbUwcDydrYFLglTemGg0WK7rAXBVgdA2LIAKNiBX
	kMZBVUTw3+CbzYeuBVxWnAsfabWPxE4gpmqUuNJY=
X-Received: by 2002:a17:902:d588:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cf348669c4mr201710715ad.18.1784620283215;
        Tue, 21 Jul 2026 00:51:23 -0700 (PDT)
X-Received: by 2002:a17:902:d588:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cf348669c4mr201710505ad.18.1784620282715;
        Tue, 21 Jul 2026 00:51:22 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a7c9fsm70041285ad.84.2026.07.21.00.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 00:51:22 -0700 (PDT)
Message-ID: <44eb0b26-08cf-42c4-b5b4-93cbcfd2d2cf@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:21:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720161033.5277A1F000E9@smtp.kernel.org>
 <2efd7e96-d0ea-478d-bfc8-bf7380ff8982@oss.qualcomm.com>
 <20260721-blond-tortoise-of-authority-ab3dca@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260721-blond-tortoise-of-authority-ab3dca@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4MSBTYWx0ZWRfX25LNAs8/2AJQ
 NYmTbfb/toEjcmW035xhIWFXBJc+mdjn+TaxE+WkAJxd3M9pin7CAEkN6U6+CtqDeAtNQ1DMnsn
 nouVar9UBmVpa0vV301pt2TXJzbozMM=
X-Proofpoint-GUID: MkG1arDDIiA7WFOGh1o1SQqsxSxYLpkx
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f24fc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n4nC-CJ8elYlXPpnoCwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: MkG1arDDIiA7WFOGh1o1SQqsxSxYLpkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4MSBTYWx0ZWRfXxQ6sWlGPIbZz
 R4/hMHrp6q0GFyDgBcQ3wMD15YuG1lLQxk2sdd9g5dZKusmXPVkk8ToO3fD/x9qHQbZG7e8eh4Y
 /pGI5bwefDQDLQNqxkymD59UsXCStgN7pfogOGMS200jRrMsfXlBQ6ei/yPB7Hln+G056LqjuWe
 ZZAASoX7ar6jx9M+Fn4HKMPgFyy9YoS8Atu6GwArPHD3p6gJgC+KJj2EhN+tTUljHBUqD1i4xeE
 LqhU+6N+bEFee0tDuBQnshLuplRjnDW8j+iXUiS16m5VDGsE2qrRe8ewlryX/uyGoNWc3CPuUhy
 FuwZBByTtBuwPrBFw19CrsaaQOwq83tKqyhh+vFWgyNeLOHE+VsPFrMH5kphYyBtZnqbPNGOYZH
 tb6/0VqnQrxGPmRMdKEuy8uUdZ56de1a/iArMcBr47JGE9zPY4bn/xbu6LsPvnvwCteccC5BUhd
 737vPx1lio97KmpKtlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210081



On 7/21/2026 12:19 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 10:02:39PM +0530, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/20/2026 9:40 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [Medium] Contradictory array lengths and definitions between `clocks` and `clock-names`, making valid hardware clock combinations fail validation.
>>> --
>>>
>>> --- Patch [1]: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode ---
>>> commit cca2bfa9278ee0dba4fe02f999f9bda9ec6f258f
>>> Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>> ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
>>>
>>> This commit extends the qcom,q6apm-lpass-dais device tree binding to explicitly
>>> describe Digital Audio Interface (DAI) child nodes. It adds address and size
>>> cells to allow multiple DAI instances and defines a pattern to document per-DAI
>>> properties like interface IDs and clocks.
>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>> [ ... ]
>>>> +      clocks:
>>>> +        minItems: 1
>>>> +        items:
>>>> +          - description: MI2S bit clock
>>>> +          - description: MI2S external bit clock
>>>> +          - description: MI2S master clock
>>>> +
>>>> +      clock-names:
>>>> +        minItems: 1
>>>> +        items:
>>>> +          - enum: [bclk, eclk, mclk]
>>>> +          - const: mclk
>>>
>>> [Severity: Medium]
>>> Will this cause device tree validation to fail for valid hardware clock
>>> combinations?
>>>
>>> The clocks list defines 3 items, but clock-names defines only 2 items.
>>> Because dt-schema limits arrays to the size of the items list when defined
>>> in this way, providing 3 clocks in a device tree will trigger a "too long"
>>> array error for clock-names.
>>>
>>> Additionally, do the array index descriptions mismatch? The clocks array
>>> defines index 1 as the external bit clock, but clock-names index 1 strictly
>>> requires "mclk". This would prevent configuring "bclk" and "eclk" together
>>> if "mclk" is not present.
>>
>>
>> The sashiko review assumes that bclk and eclk may be used together.
>>
>> However, the hardware supports either bclk or eclk, optionally with mclk. A
>> bclk + eclk configuration is not valid hardware usage,so the reported issue
>> is not applicable to the valid clock configurations.
> 
> But you wrote that eclk ALWAYS follows bclk! Look!
> 
> +        items:
> +          - description: MI2S bit clock
> +          - description: MI2S external bit clock
> 
> What is the meaning of this?

your right, The item descriptions are misleading because they imply an 
ordered bclk + eclk configuration. I'll drop those descriptions.

The hardware supports either bclk or eclk.

will keep only

clocks:
   minItems: 1
   maxItems: 2


Thanks & Regards,
Rafi.

> 



> Best regards,
> Krzysztof
> 

