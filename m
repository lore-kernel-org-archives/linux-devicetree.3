Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B47438FE7
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903778; cv=none; b=fRGszVqMNyCMtwZCL+bwX/E5hL5jNUBpqmiP4fc8gs2pmUEn0j9Gm6/EYGHtL9QL7bsa2BpkY3hcBMpLxQkGFsfR/lcluyPoRehUhM1SxW1FU0XJV32Zg12u8rmVufknhhlHVpTnP9mp/UT9/v6vd0qZmcQuqkxGQUDnVS8IhzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903778; c=relaxed/simple;
	bh=u0T30LeQQOSUGxQo0pfn/k3f7dJ5+eUKOz5i6sCaeeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loKyFH5k2fHdohL7X8FN4Gm1//eUmOl+6gyQGMNIqYa7hH2IYq3p8owVDtiRyTKfPrgcNYEq+cJAIN+2Z36GmyRi/pXxeTozJU95KymECaE7mORFYQQOKsIhLrV70+FlK8CxCn4jTfah6F+RpTagoFR5yZAnIr0FWsqbgu2BBsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+HzF7h+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXPG9EsJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+HzF7h+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXPG9EsJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGXlh794114
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 11:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=; b=j+HzF7h+yWvHFJaj
	xP6V7MnB5UqGZJ5SKxdy/vefIya+F/K3wbABeyLLp6iW3vizyFNsUHhHAD3nD+r/
	OyXRPuChpj4NhhyEVBEaJhTRn23BrkSBuTbrXB+frWPGvqpg4zn8bsaG1GuuGUYS
	jIeyribqpUAAdzgBV9Q0j8h8rgDnLOTXRg3Y+XFYRMLVSgy3DiW3DM6NxD9gz5ov
	zo3hFyHTk+BLne3oti/HdwiTPyVcXhUgwD5meYkElEey3cX9kDHsp4GL2WLV+z/e
	BGhsYj0RvHoBOdKdqJJVxgM/0AG77l95u5LzLouix7V75x0Qz1lZ1pbDw9CnuSa6
	LrWx4w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ag6u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 11:02:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7392d893428so24432137.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903775; x=1783508575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=;
        b=EXPG9EsJcXONfLwnESpDQ8ftjviXNQYBsk/1ZJnd/ukxqcga8a6ka34mVURIGDUKDB
         Kc7vn/VDR64giUf4LHMQ/AeayW1tYRxYuAPtrUamDKhOqie0uXnEngpLiPMjWEnY5jp7
         mwHMGtFZTifqntNs2V/mbV3hlLkpBYIf7TmwLER1xM+8315B1FjPdJCVLX9sDt+V8tR1
         Ry4ZnWaeYbvIwSGLQKWIGfyhaCEXMPAOp7Zg3O2KJyipQXm+ryXU/YQoRxuoSCtiPzOb
         aAlojL3KU/Trt01yp2DpVsGMnQY7fl43vJaRlXHuCU5BXoDmBu2zek46gOxndnv9Mhb0
         YKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903775; x=1783508575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=;
        b=c4K9du63cdTPZ2mBVv2r5I0yYtROIxAg4W8TZIUrm0jr2r9A3meG+INVjZHhCLiwG1
         qu75CNLJGbj7OGRyXqMwmTMIF302vEpEzJlbt4uQfdI/HgXiSPzkqwhk8VaSjEgQ7w+H
         ekGGJFVewj5C6cozwQ/+dvg9TBlINurL6qfk5T2uTRoGYgyIb7peRb6UEBD1O0vh4J6/
         Or8KR4mDTk8IHgR4CmEIu8JQngmBvnhx4qgmpG5Qpx9dOyMrQRAwjrH1EssP7W9krGj7
         7c0AZ0KMISS3cQT8hB2Fkg3CdVfB9sGewRi4MogvABGk3JOkezijUK6K+rvzWQlIgLnd
         y9zA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8zoZbj/b7unvrFb4rsZRklby7VatRNeZPcZXIUPlILxB+WAJ/fTuACuQ5U0H0UTqAHCs1K41m+kQt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4uC8Vx4GQrX+1tSct7QelkpKW1zbIewoLOs6W7QHeL3wuN5A8
	IrT4TTi44E6xIjlJYK0lTJ8vM523B2I9g6nc2CJpBY9+OfJGZhgN204Yx/H+pAOYfpK9Omlzee4
	NHiq0xBuSdhZ8oPQc4dDStghvVoGIwPOxmtSiz44veSQu4v9efmizkqBLceIloKAC
X-Gm-Gg: AfdE7cnyc54hEV0ke73FEJrzT3SnCCQ4HOG4Kbpmglplv/hd+KrfmWNNQPr6POF+aRH
	bxp7qW72GSSIeNvVe1iy8PWDzKz5tLn8NUV8a69F2goZNjU4F5xI2xjwd5nnPK2LpEYWAKPtcg6
	dP0CbXhUcEKZuEOJvN+RyOSRu8bUbt1NIHKu+JIUNP+AAAuSMjUG5ZwH11zR4DO8WINy+vr+sUQ
	79hgajZF7xAeS1PoBTe3P7TehW8g4lx7vB0arGYVdLCv/lB0OukF5yS3TZwceN90IoITbxzbUhY
	oLpO7SvmMkwQMbIFGtqLVYHudA6lw1hqUjf4/XfKG/iuqUS9Per35NYpjsJOROco3+acJmERerk
	HYUgOuc7T5xqDuVulIi+wcQK58pH6yISlA9g=
X-Received: by 2002:a05:6102:f98:b0:739:97bf:9180 with SMTP id ada2fe7eead31-73daa8b28f0mr87660137.8.1782903774610;
        Wed, 01 Jul 2026 04:02:54 -0700 (PDT)
X-Received: by 2002:a05:6102:f98:b0:739:97bf:9180 with SMTP id ada2fe7eead31-73daa8b28f0mr87636137.8.1782903774186;
        Wed, 01 Jul 2026 04:02:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288dba380sm256467966b.26.2026.07.01.04.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:02:51 -0700 (PDT)
Message-ID: <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:02:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
 <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JOO59q5TrWPYL7KQObjEgvWBiV_YHlsY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX9jEXrrxpVas0
 aAE1f7uU1T/h4ID8FPx6rCinlMm7bc0/ChtI5Ug2OQowbbQRsigl6G2CojdDPJJjmstiP0h/2vj
 4lcpyVQx4JkImjlczR8CS+gAAKTwdFVQJGvF47DTffJ6hK45rKD8n8XCNVvf68Pm8iazEwdUz12
 teIVaZ84nzyVev2G2XCxgxd3+OUl/+jxnHgZVYf5aufhgHSW9iyWq5eIYDUP8iXZexLeOG6XBHW
 /MkCHza1k+RnPA0S+Hj9JJapSg/fc19ZLSfqtqVyUV5gevoN8hA4dI2V5Rlx3uTklGwavok4sup
 aWOwmLJef5LQ27XgWN9q8DuhDGRGMKfR5AzN3o4VlroomtlIjm8A+n0a35nheXRF6qu3hh0tji2
 XStsufeYWkoTG2bwHl3BCvascefNi81jWD8LIbMN1VGKdVaNVbJjDlDtWQX+6zYrtmzLqdFrmp2
 dLTLLNyPKTauaIc+83A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX4hohiazEEuL1
 jY1WjKSOjcHeVAhOXBcEUw3OZlkP6WUXDTuGNjrHnMn10D6sfWdPImxO78NcDpjsOS20y7tYHob
 Vq/Mv1PGp4kaNSIRxakmRpa5dQNC2v8=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a44f3df cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=TUQMdDBI74RIm7-lXFYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: JOO59q5TrWPYL7KQObjEgvWBiV_YHlsY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115

On 7/1/26 9:31 AM, Jie Gan wrote:
> 
> 
> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>> On 01/07/2026 09:16, Jie Gan wrote:
>>>
>>>
>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>> AMBA bus.
>>>>>
>>>>> Convert the compatible to a oneOf and add a standalone
>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>> created on the platform bus instead of the AMBA bus.

[...]

>>> AMBA primecell identification. The purpose of the new compatible is to
>>> clearly distinguish this platform-specific case from the standard
>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>
>>> We already have a similar pattern for the interconnect TraceNoC device,
>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>> I do not see there a fake, duplicated compatible for the same device.
>> Can you elaborate how is that relevant?
> 
> Will fix it by removing AMBA related description.
> 
> Shall I update the clock name from apb_pclk to apb as a platform device?

Why?

Konrad
