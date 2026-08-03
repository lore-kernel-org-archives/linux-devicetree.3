Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D237883E
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752935; cv=none; b=ntnmiGeCEvmKFSq/czaFoHtu321dzbTPY9IQ/7sjoyfPt62InIR0EAL/ZQu53YrtzAYg582/oOzKIE0bYgO3WihYhfk+g8dZknssI9Tn21tekk0gPGALdb+mVFg62wVZepw4ANH+xmsMXwLuCgbIr/Bkj++VnS3UQBsjQHdVyY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752935; c=relaxed/simple;
	bh=YI+SeCXwe3QTLmdnaISpUAOdff3psaCPzk+4QqEjGC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLg7dEJcJoOmy9mhdc5KNyd/mXKNUmAwjXI+lu0c9XeQhuh1FSVtEuBVTw3qbA07qvwvLb001KvCM7SPKGqqsE2PoSN8wPQbQxbvgC7Ef3hy9fnuZUE6oZhZiPhBoPJQUZhY90pMBJXYFC6jT1mKTp6i2fyqDTyRQzhBsRyIedQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwiN0Mx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qha4TP7k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwiN0Mx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qha4TP7k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bXVT3957265
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 10:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Awud7FmFVBbftdi8mV4xuz2E3JQyxCXhFkWyr+GNJ38=; b=MwiN0Mx5BKR/F6I4
	uqweJyOgADhPfHdriE3f9k5zS0JqcnsKy5R7j0+DUv6J8MwOJHO4OdgpONGuIidx
	IDAOGm3rxSyZBnNAZRIf+xMC+Z9++C2ejecIY53uwEo1dN0Fv9vLRcLK7tNcI9Lo
	z+KrSrhi6t43ppImzdh1TKgn6KX2EiwplpVcSoJTe0heLAz9AiXdPNosg/yUCEtf
	5wjgoCLo/7B30v7PIjWBHoWe1PEtarUI0OubhmAWW613doe96uD0wUwShV95IF22
	OROQ5UakQuQSUwj4VPK+YBYz5dTZQ/dwvKuUAMU2jhqFuhz/EE0Oe2Pd1HLBgo9e
	QPZhOg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnh0ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:28:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb835525b10so4341452a12.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785752931; x=1786357731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awud7FmFVBbftdi8mV4xuz2E3JQyxCXhFkWyr+GNJ38=;
        b=Qha4TP7k0HQ+QAMPFKft5zxzoU9pePk8WMQ/Cgb48mK+MNfzQw+GsZluWpUuEFZTFF
         kRIL3alZnsv/U68uex2o7MHtosvDp1JT918Y4hlLrm91VyXc+IB/HNpWk8WpOWwmY7fE
         ywvIFnqwT35iAQ92SH4tTpVZPWgQxx5dtRFmQca7w2qCBGfRg7Edg0FGp7cKTWpTtdAv
         6i3zWbObfDPKDsDINc/E4HMGS4w5KtuK4NP1jySUU25oTXuMuHMAmgLBT4yU1mHQRxt+
         Y+DhEDaIaDgbf1ni4wFadx9jaoVOO8rs7c28HrlcVkDjiyBBfTOzM2xXqZK5N1/MLMCS
         cWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785752931; x=1786357731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Awud7FmFVBbftdi8mV4xuz2E3JQyxCXhFkWyr+GNJ38=;
        b=oh/wPGjq+Jhvz9uD2/UCwIT0DvYCO0XgD+YKWhzZP6sBm6rG/pcG2ZGZstiND9JiIa
         8mZUtpVN1f5g+qOhIj6C40cuWRW2jFadJwyuhU0qZ9GsCwQgng79FbIz0tObqbzycgLH
         PvWFaw3pqHhP3D11/wDDi4QAuM/Bb67uN7sgWs9WOvsmSDhXz+KDCbSsCEyf/2dxXL/I
         0QfKJNZSGC1vDwpCNcYaPLIcDcDI0Tfclqne21hvMwo1Zp+Ox549C8zGHL5MOra8vI/W
         JIzSpfm0504vwVukLmEkxb9z4RtAeUg39WPrI8eDdnuoy9CwP2f2fylZQVISsZ1vpKgE
         Br1A==
X-Forwarded-Encrypted: i=1; AHgh+RqcyomZvJCNWaAqSQGVOoYkalzVCNkdJURp0WPebRaQcgyJFN2ITvdTKko70Grvq0hycqJZDCHGhy0s@vger.kernel.org
X-Gm-Message-State: AOJu0YxOKv3S3n0Bb+K/t2KDGKa9FmN60LC6mcKdJq6O7VIXUvKpAJdS
	MqEJeryqbIeAwuzuBAiezxXx/dpaQxzCuPu2KCHNSwv0JIj5V1cKHPL1kXOE3TaqonHZA+A0ccK
	rklXL46TBU+TwMhTiGaH6DLxrMMPL3NnsmCXhKPlz9HwmVYXPWgyp8fLGHeTv8Ycn
X-Gm-Gg: AR+sD11OIz3v1V9ZE68IjIoqi4WNt3m1erkFlBtU9A+UHBUGx44vhS0zODrXsDcFga0
	I+F50SlE7OUhNoi6Z87V0+29axlyj6NCrJyMoGxDMWZoiroCkCOFb2pomJqxUYWWWGW6quexTdc
	JutgGhP77XcEwfe6Bfxlo685ywzsCsz54sHVssqBYtF7KXJ6oPHrDmjaUhQQW/BYqUNlqeSWFVM
	NegXYCEhOyNy2kFnRR1RJDBNhc2X489lzHluFtWQ8sdOfRziguRtFo71LT4k9NdREVTcQdba8kJ
	sN35h/wlSUZRkNt5wnmzYcE1Bpv05E/u3pAf/6uBhQzqGLPYBYR2vaUazOx6krk/ycYkosMqllW
	y5mNcHGPMncmCBWP7S72NszK0nyug
X-Received: by 2002:a05:6a21:a03:b0:3c3:8bab:80b with SMTP id adf61e73a8af0-3c92a8be67amr9529956637.61.1785752931534;
        Mon, 03 Aug 2026 03:28:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:a03:b0:3c3:8bab:80b with SMTP id adf61e73a8af0-3c92a8be67amr9529932637.61.1785752931082;
        Mon, 03 Aug 2026 03:28:51 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e29a126sm39291548eec.31.2026.08.03.03.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 03:28:50 -0700 (PDT)
Message-ID: <e8846903-1c1a-4e11-9a7c-9703536e50fd@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 15:58:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
To: Marc Zyngier <maz@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
 <87ik6i6i22.wl-maz@kernel.org>
 <CGME20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c@eucas1p2.samsung.com>
 <3dac25b9-a464-4350-aff5-0ada4dc1d65e@samsung.com>
 <86cxwoocol.wl-maz@kernel.org>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <86cxwoocol.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a706d64 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=Hgul2LAUnyHK3LffZBEA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 2H4GlgG3Au1m9_qgIaAoNP0pV_qb56Ku
X-Proofpoint-ORIG-GUID: 2H4GlgG3Au1m9_qgIaAoNP0pV_qb56Ku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5MyBTYWx0ZWRfX6+08OBrnnv/g
 cwYOYnbZj/dH5xLtTfCRVoJfc1X8ctsjz1BEgKkmu2V8bQTP8jNCENqAw9XH1WQnaWNNa9teDEo
 s/cF7rStwfEXJmx+YHhi8F9VJj/w5hvbiim/9/6o8n6ysNiSecNRE90jyGcu2BTsOc95AHpPYHT
 TgpDKjLW7jhsxx9i3lachRW6xE8NLxsUeDbmi5jlXqeUoK9X46ZeSkroubukzlIUDBiPonZwk+q
 mLlBKzd9LuQErn8HHGUdt0o9cZlOvzv9y6nLoHOpo6xQnzRiCKrYFD9WmCMWPQAgK25ThMuCj7w
 fUhk/bAEYhrTuhgHkzuWwvm7tIsFeRiO0GSIKr5wAQQ6/MZyiKMxyXubP8ttHr3S6krHL2LKGJG
 FbCss85lWjhJ8HUnmgfBPKAtjOfbQVyD1l9l+x2zUZEpb5DaWVcLrxOkGJm/hBioGnU7ykO6sot
 e+/T5f4sYcAwGvZI19A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5MyBTYWx0ZWRfX2KXkODJrYGsW
 a1zCnxoOdHnI5WBxvI7WaGbkbVgthWyH2AuvKiNsV1a0BM2Ae37ngNboQn4EhN5lIBS8fe3fEZE
 Wltmj9sUS0DdVFrSLRaHDJCei0qmE5I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030093



On 15-Jul-26 2:24 PM, Marc Zyngier wrote:
> On Wed, 15 Jul 2026 07:38:59 +0100,
> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>
>> On 13.07.2026 17:11, Marc Zyngier wrote:
>>> On Mon, 13 Jul 2026 11:25:41 +0100,
>>> Sneh Mankad <sneh.mankad@oss.qualcomm.com> wrote:
>>>> Remove #power-domain-cells property and add power-domains property for
>>>> MPM device.
>>>>
>>>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>>>> ---
>>>>  .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml          | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>>>> index ebb40c48950ab3a8fc86f5708acfc33c33d68993..3f9645fbc3c20633077aaa589e5d5a43928dab51 100644
>>>> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>>>> @@ -68,8 +68,8 @@ properties:
>>>>          - description: MPM pin number
>>>>          - description: GIC SPI number for the MPM pin
>>>>  
>>>> -  '#power-domain-cells':
>>>> -    const: 0
>>>> +  power-domains:
>>>> +    maxItems: 1
>>> What makes you think it is OK to change an existing binding in an
>>> incompatible way?
>>
>>
>> Ulf suggests that this has been modeled upside down in the initial
>> submission:
>>
>> https://lore.kernel.org/all/CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com/
> 
> Sure. We have collectively fucked up a lot of bindings over the years,
> mostly because of the lack of accurate documentation and people not
> giving a damn about the correctness of these descriptions. I'm glad
> that Ulf is now able to make it right.
> 
> But that is not a license to invalidate DTs retrospectively. We don't
> update DTs in lockstep with the kernel (I *never* do), and something
> that existed must be supported in the long run.
> 
> Properties can be deprecated, but:
> 
> - they must be kept in the binding
> 
> - drivers must still honor them if they are present in the DT

Currently only two chipsets have #power-domain-cells property mentioned in MPM DT node,
agatti and sm6375.

Agatti - does not execute CPU cluster LPMs as of now, so not handling the #power-domain-cells in
driver will have no effect in functionality.

sm6375 - Being an old chipset I am not aware of its status. 

If the driver honors the #power-domain-cells property, even the CPU level idle states will fail to
probe on these devices, due to the reasoning provided in cover letter.

With these patches, the CPU level idle states will function properly, so will cluster level
idle states if enabled.
In addition to that, the fallback mechanism of registering for CPU PM notification when power-domains
property is not mentioned in DT node will take care of the RPM notification when cluster idle state
is entered.

As suggested by Konrad, I will add a brief explanation on the need for this bindings change in this patch.

Thanks,
Sneh

