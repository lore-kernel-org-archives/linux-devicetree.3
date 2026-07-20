Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821F33B9DA4
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565166; cv=none; b=lPei3GCCEZTd2T+pomLW1GGO9sdjaysheo4N6hGoVRygLGYl0Sn6AZW+eSDP7y9qD6+tDEYNp7X4/+OwT7R4T6ycN9I0glrK2eC5MZ6LHEsV2ye+rt6HLZCyb2p+lB3xCrMiWNjxSy9dkTGKjNUumBi8k5n5m689Znk0CM1fkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565166; c=relaxed/simple;
	bh=jjfg+HygRnWND3wPx4GCNln5mGhfWUY5eraXrZMGWsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZuYHGmZ4SsKou7HQ9R8BJaq88gFCJVR+8IwhXCxDVo0NqaNhRxlB8l64zKdxgFWOIomExDILYR9Y6/ZPujC6GFbUYBlQTm2vWsHbtoU/p7Ev/8VSfL8UoQHRNH1VNMGETgoo8za2gPIkgV9f8oBdM7mb8zv3S6YVRF2OBh9q4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojW8lg+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAl7NmAK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojW8lg+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAl7NmAK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KGNxMs3197623
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 16:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ftf0tCwVcMbMptC5JGDd22nsJovvOTUz/SyN9TeQpGk=; b=ojW8lg+8TVK7XaL8
	IcMQd21Csntbt/wxtsOedCuPlP28gPIXty1MNH5+rM/AimegrAj0Dw6W6v3rvf4O
	0DCTAVXuIoMQY6DY/vt9nk2v+wtIzVTkENmVcd5ixtKS/yCp14j/R4pDLSDt9fN4
	y8CL8DUb4zskYw7LBpc2cRUGupGWLTt2OKv965up2p2pt9nWe7dU2On/6dxKr7+h
	ziYgn5mvyj6HuVkUXXEBjpHbugzJ1NukaFEUbGi2FUf8o7mg2HCJDUp2lmmA1eVh
	ifpirbUsS8qTp4pCs7/+WhiqZwc1BDIo+NgM2ew/lQgGjc9os4LIImfOhOuWKNAQ
	r7np9A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxj98d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 16:32:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380b630c505so13089939a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784565164; x=1785169964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ftf0tCwVcMbMptC5JGDd22nsJovvOTUz/SyN9TeQpGk=;
        b=aAl7NmAKe2Jcn7TV3uFviCFrNlBgSqpFzbCpecU3dHgFcistRblWkGhwUZJIehrBDl
         a28x8cjSgEOhckaX35nOKo7Z189v4qEOlVwjl4ES71PtmQAk43N2IdXryMLcf2cgCUjK
         FTrr+2X4uqi93PMxf3Cl1RSfM8FSuFlMD3rNEFC2Cp1XdvG+M0tnwN1RC+Sk+Zt7qWqW
         SmMwR2H4ElJrAhH4XSmmq9rcvgN3hXy5WwcEWNa8pjb3AaC2tE2cWJBoah/735+fzT4F
         BsCTH2iWnK6A8R13EvxKz2uMjEDMCqDM3L69fNLnXI9GSqmrMxq16aEpt92SBlLkiXrW
         SSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565164; x=1785169964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ftf0tCwVcMbMptC5JGDd22nsJovvOTUz/SyN9TeQpGk=;
        b=GfldOxZz3lmp+3oa9sTh3v9I/2skzt1TiLQUrCJInpQrSEu9SjkoSJrvS9KdoX88+n
         iMHCOtCvG3W+4Qhk4FukzCoJ5YPS4rqSFUMF5OMGunzTuYscx7HpZdHdUaGObY8VyimZ
         ExWx+EuqlnDXmuOiyqhwoqTo2APqCwr4qSibw1vsbQNoQzG027WMOmSaPgWOHyg1bMhn
         tEo77zyc2AEi28oUDmtSWLWF/RWjQCjOS+Xg5MUIQ/VRY2/MU+OFNBk7pj1JhD3Hfqe2
         i3B0fkZaizZXsTYjZVGqTkJoscDeBELjTTSZ7BviuX1GnXkycxrlwUd/Wb61diVHm5HV
         78dQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXAwam6ghAKaXx3XI4uMFxvq5V2RdEAP/h8yiPJEYek4RKV4NKUgcX/tpU54UQUuCDE/9D6VSG3ciz@vger.kernel.org
X-Gm-Message-State: AOJu0YzzEe1jxJtf+1Km7kahWwo6bFB/8iuroH0VdP4hGAh7WK4POOdr
	PTd/UYNQdh7ge2gTKCiCfAm9rCfcJjToishS0OiZI9Xub7rUM1et7t/CHXKXMdXCcuIe4fOmKI1
	WbiooH6NhxBI2mWxtMI2BdTmgl+8fbdU0qsSYGnZQrUl/Nwq5wd0wT444rng8rEay31nMIV/o
X-Gm-Gg: AfdE7ckxaskX4lbkVNz8TSY8EmmEnENyih9XuGRPmtyT3ZiHu58s4VLRSh3PPUt0ksU
	yYwSAaeIeVERrwJvgDjIJ8AxQ84Luyb7jGucHycU8KrLiQxFWWVt4ufwF4FGIia3UY77NmlHvqT
	0KhpE1KApuCuL+dtsMVCU3NPILl8nEoh10MkTy3dKjW0lEhvokSkMUiw5aXRVBymbvA79kBROfK
	k9MKkhqpZ7Kbnd155pdEWZJZDS4E6uKCT1+oD2AkZVIHmlOkjGRT+QzOs63NU3DFf/rS300lqC5
	YzxKTXCgwxVhLZ6ezWW0eMCG6Gjw00iKfTTYBTT29fuKY7TadlsA5xGUzouhzhoD1wL6XIPFvuu
	yavaRWRA/RIMtZIdfF72ppI2APSStZBokmqkGzQ==
X-Received: by 2002:a05:6a20:d52f:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c3ad938d60mr16715468637.56.1784565163930;
        Mon, 20 Jul 2026 09:32:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52f:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c3ad938d60mr16715410637.56.1784565163285;
        Mon, 20 Jul 2026 09:32:43 -0700 (PDT)
Received: from [192.168.1.5] ([122.175.27.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb77csm42732068eec.18.2026.07.20.09.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 09:32:42 -0700 (PDT)
Message-ID: <2efd7e96-d0ea-478d-bfc8-bf7380ff8982@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:02:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720161033.5277A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260720161033.5277A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e4dac cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=N7nrzEgeNKolxVRjxaDX4A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=llNIWFV95VOWQGKaZW0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE4MyBTYWx0ZWRfX90+qfUSlgkyZ
 wL/wE+u/ELNbS3f6BDW8sxDp7jebmM1wPg5quky4VHyZSALTB9FEqELhs8AI1MFxP6R4A9tHW9I
 o9sFTsVsoBYwhaJKgjYoJY/C4Q9RnPU=
X-Proofpoint-GUID: Tr3Jzl2LR-d5a7wsf_CNdQrz7eFSwu19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE4MyBTYWx0ZWRfX79VhQxhXc7Cb
 KjoP+9tZldGUMcbk7IMVbghsRXYCJupoBiDr7HvTZHBfaJ/wh7Yx/vgznpeVM6RZ82y/EnNIuDf
 QJRLZVG/OoSkOoE2MZIW7nIpur+mf90iXL2q8+YKconDPIKMX+SKDSBxDPVJ8FQFsVbxOQWCBS7
 uUjFatJ59As8g7sjBEF8jQSa71rSw3M30cEseTNV4JbsipszFOXX9uG4CgSslctBTHikiYTlRIT
 mm8d5nCoO6LSw5QvBjw5yvCnSe6n3oHuAodBKJUaDDtnjmAsrBkkrqAMFvQTgufZEjGe57LOGcb
 drFQk4P8uZwZUkYsR0cL46YREqgLW+GyAZBTCQDww4g6eTWD2li7T+C6gMJMAjpGJnpS88gk8rz
 3M1/tM/OQpE+lWQANWl0WKyBNWbxJ52lD8nwtFPBbDmT/4MA+hhmfvR1obQ5Iy1WBlmjsHMavmJ
 ZHDXRuc7+S6jJwtld9w==
X-Proofpoint-ORIG-GUID: Tr3Jzl2LR-d5a7wsf_CNdQrz7eFSwu19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200183



On 7/20/2026 9:40 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Contradictory array lengths and definitions between `clocks` and `clock-names`, making valid hardware clock combinations fail validation.
> --
> 
> --- Patch [1]: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode ---
> commit cca2bfa9278ee0dba4fe02f999f9bda9ec6f258f
> Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
> 
> This commit extends the qcom,q6apm-lpass-dais device tree binding to explicitly
> describe Digital Audio Interface (DAI) child nodes. It adds address and size
> cells to allow multiple DAI instances and defines a pattern to document per-DAI
> properties like interface IDs and clocks.
> 
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> [ ... ]
>> +      clocks:
>> +        minItems: 1
>> +        items:
>> +          - description: MI2S bit clock
>> +          - description: MI2S external bit clock
>> +          - description: MI2S master clock
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        items:
>> +          - enum: [bclk, eclk, mclk]
>> +          - const: mclk
> 
> [Severity: Medium]
> Will this cause device tree validation to fail for valid hardware clock
> combinations?
> 
> The clocks list defines 3 items, but clock-names defines only 2 items.
> Because dt-schema limits arrays to the size of the items list when defined
> in this way, providing 3 clocks in a device tree will trigger a "too long"
> array error for clock-names.
> 
> Additionally, do the array index descriptions mismatch? The clocks array
> defines index 1 as the external bit clock, but clock-names index 1 strictly
> requires "mclk". This would prevent configuring "bclk" and "eclk" together
> if "mclk" is not present.


The sashiko review assumes that bclk and eclk may be used together.

However, the hardware supports either bclk or eclk, optionally with 
mclk. A bclk + eclk configuration is not valid hardware usage,so the 
reported issue is not applicable to the valid clock configurations.

Thanks & regards,
Rafi

> 

