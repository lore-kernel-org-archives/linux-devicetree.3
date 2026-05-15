Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C31A2C04
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833955; cv=none; b=ZmzWOxRnV0gGeFeYPWJ0bY/uN5KjUXcekX0KWMD6spdFdZFFQ/yRHlos3rZsB4Y8dJ+Qo2mKnMwQB5XdNiSFZfLamQrlUsVluDGtH7od+TrxtngquUbP3r0U66Fhs7KybwnjtjE7zRPygpxHfPxwVrrEipfZ8BR/VoiaVxasSmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833955; c=relaxed/simple;
	bh=2KlkGNOF7+OvLv0cTbiSK1wSmJp3z+rBZspm5oF/ITE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqUPSTIQGnmD7o28UXPLXOZhm22fN9lqIHHKQz9FC/1DoLjqdTz11ZynZXffHwosYSRplOH81Oux8qBr/ITLlH2rylohz/xvIdBv3x5Mlpu33IFzPtu1LmwWiVAA2Rgpqgyka2/TvJJn+HCln/97i7LX0JuP0ncOaZ0dkQplCqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIdPpKcY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhP7bcW+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIdPpKcY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhP7bcW+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5OPev654862
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ypc5cw+aeh2+Tg52m6j1/NuUMBslXu/qMIh12tt5Eiw=; b=DIdPpKcYHKUcSHCH
	HDORyNMxjlg9kkFh3FyJ42jpvMjAXeN57c2rE6lk6xD2GwgsgFK75UwbLARwJ7F2
	lPw6D88hRbpn0ChQNQXYr9aTTEC5+w1Lw30V8fw5vIXlbGeW3YnulCisIEO/b7Wn
	LxxhIbbQ6aKdgUFL83Ef7PTdTQXp6FzS9rlm4k4yykEIfPX/kbWqBVY20EqtNk7X
	b1xDOTTdKo4qRdHTmdGJL7A7MzyTTwfR1tM4YUbfwL0CfOrBCS+I7cTNZjx/JDIp
	wgL2IhfXAEzpH1oVMWVtgQu0iU9VPVZZvLdVJ2Ty4I0kr5ChzUYEzH4Zfyl0jRWA
	CQRm8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ptf4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:32:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so3600174a91.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778833952; x=1779438752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ypc5cw+aeh2+Tg52m6j1/NuUMBslXu/qMIh12tt5Eiw=;
        b=QhP7bcW+zwwLND5tsK0SjtwQtSnGHx41Fp+45MFJCuzKY0ax0YBEacDZ8vZTqSH8xi
         8kGE8+LKYLhvC0GrmcThjaXYeQl+AmuwalOYUhcG/E9q4qco+HGtvh1hR2be4gDQLnW4
         /xt6J31YV/26A1nSSlPtXL7M+QxCTL9NdyR8Cmg63GG/bt3CgCMMPI8zV6BectUeLdxD
         E5sTtgm4nulfENb1a7C40+3RRlobH3antoP58oT7gRs83BsNOIQorb+97ADopXiuFEiK
         +fvk6Vj2VTz09jYdAbdoKJ42+ZtO39RjJyhfs1wJXgLRDwAe9h7cak9fSxrQF8Mh2j7h
         P14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778833952; x=1779438752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ypc5cw+aeh2+Tg52m6j1/NuUMBslXu/qMIh12tt5Eiw=;
        b=SoxVToHmnl3QnH4T1nsj0WzoCxGmb4FhHo0m+Rc5opPFc212+/yzQkqjjQAxPsJ+Pu
         i3wCsPPrBG79yl7s8aAA+cNKdsZclKOjwRH3l2OvTYxWgsIDlpJE0KCNA9LlVJIkK+A7
         pJ5qQ5jpoWOz2pfUzOnVA5ulM640JwI6pAe21Y4FBWFGuZcLo7xoYHcTeoci0r455NDs
         LBBq3f34DCP/KuHjiJYFL93FvYCjRDquWGOvBNGr7w3BYblEhzVDWjM2v0nC1Q3aFjZh
         VxNfqlZagsDvJRMD6qvv1Cf1V+twtHKXNmOnKXbZvW3Ya/FjYR5zg2NVffTYmkBzEvGg
         57/w==
X-Forwarded-Encrypted: i=1; AFNElJ9KwVSHzP9FLM3LtYmPfLsPO6QgwumwK350wD10YWmnnIGfm9BsyHVR5dVU3iNcxoVZtNb/j+LfLzJp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3foOlfjWSPuM+IePtF3gdsL1UAMOHgoAsk2MQvm59DYd9mjcX
	c2yuYMH5LDwb5xIy3//o1qbhgVBuqGQCgsb5XryeOPlNoAtlWHnvBNqwV66JdUEMoGjuFVQfigv
	9zed35yOZTNFJ2cVWpCGfpWwItw501lh3546NVzmRWtvDEY73y5m6S5iF5Uye+w4L
X-Gm-Gg: Acq92OFm5KzBhpS2BNeNGIEkQpR54l9Zuu8wxk7fliYSChmI+T1Z87du0evHJYICOFL
	ZqtnLiK+k+5VvJYMRgalNTfytcQ7YJc8G2Z3ATpWWSCdZDrCZWydhBXM58BMMsjTU8lbfxAasKn
	2xAhfWVTIc8fPOXKRLpWWdz9gNoHqpMRksdJ0ijID3LxNUEMMAg+G2aRDNwkpdJOOp5BsBCpH8o
	VxvdT0/GpphiRht+D5Yuvjs5PXfqICMgxviwn0vWl4MhMnBptTrKu2lHuf12DvSRVbNJdmjYUaP
	lu263f2+pvvfOWVVYPl2OJR6cH9HnuDl1v6/vWHmGOudVim84+LM8MeuVQfIIfdw/d0x5RQFDQI
	3CrH+eFmXbhMuEfG7JzAPkxvquyDdu57FXZDqv757dRxLlT1Fd+2yay9GPxTe
X-Received: by 2002:a17:90b:3d0a:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-369518b25cemr3166926a91.2.1778833952380;
        Fri, 15 May 2026 01:32:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3d0a:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-369518b25cemr3166888a91.2.1778833951854;
        Fri, 15 May 2026 01:32:31 -0700 (PDT)
Received: from [10.92.212.183] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695155b2c4sm2001418a91.3.2026.05.15.01.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:32:31 -0700 (PDT)
Message-ID: <5ad97e7b-f39e-44cd-b4be-86711a090d01@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:02:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
 <20260501-shikra-cpufreq-scaling-v1-1-c78b95f53b91@oss.qualcomm.com>
 <20260504-fuzzy-wapiti-of-ampleness-d8bc13@quoll>
 <8101e2c8-0593-4325-a701-84f776dd4b0a@oss.qualcomm.com>
 <eebae734-3b03-4848-a728-a29d8a210e57@kernel.org>
 <dfc3039b-c45c-44d3-85c0-0d131bb5e55a@oss.qualcomm.com>
 <27cc44d7-b3d1-4610-8257-4aad4115cd36@kernel.org>
 <e5552777-a449-4640-993f-5cf9bacbda56@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <e5552777-a449-4640-993f-5cf9bacbda56@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: giq_zIxiVxul46aD7WZoFd5Jjggwpfjo
X-Proofpoint-ORIG-GUID: giq_zIxiVxul46aD7WZoFd5Jjggwpfjo
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06da21 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=nIfeAKEMkRZjI2vJ8KMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA4NCBTYWx0ZWRfX/rZA/bkZCAYv
 e0n8mPxG146A79qdn0kb8A+6VTyPFlKrVijiYm6WY97Y0EzS0cpLSViA6yhGWS2W7U+ErIXQrNp
 pKqHgGF2ZiF+h8anfFFZW9bzWPCp8BlLRU5auSODP2ygzObORxw86Yq0hykUPkx2xfoc7dNama1
 MgS8CJPQ+SKNuLtRaDFlfW/N70vtYPJ26PfbmgL0NlNpfW0MGogAgkO2pLtDdgPkJUZ7to6DC+E
 lmq92jR3xivwCVZKvY/T7Lvp9Tj5JD1xvXr/uGilht11M4tzlfgr42GJo5eRG3oeqAGZOYBuI9B
 Qg+Vbb+d67Zmtd6aY+rVSabvuQM+CQ50eIqC4Ap3ZgCHCILiNaUTywD/nYQ2Akth7yP3l4fqBt3
 npeHFSfV57K5199Lu03xYpfCJ/0ZAtGrbmPH82umatAqR8vLENG7TzOztmPUQW8XxedSbjtxcqm
 xKpN75GWFFUhd7vdYmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150084



On 14-05-2026 08:13 pm, Krzysztof Kozlowski wrote:
> On 14/05/2026 16:39, Krzysztof Kozlowski wrote:
>> On 08/05/2026 18:03, Imran Shaik wrote:
>>>
>>>
>>> On 05-05-2026 02:23 pm, Krzysztof Kozlowski wrote:
>>>> On 05/05/2026 10:50, Imran Shaik wrote:
>>>>>
>>>>>
>>>>> On 04-05-2026 03:53 pm, Krzysztof Kozlowski wrote:
>>>>>> On Fri, May 01, 2026 at 12:45:44PM +0530, Imran Shaik wrote:
>>>>>>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>>>>>>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>>>>>>> qcom,cpufreq-epss-lite to represent this constrained EPSS variant.
>>>>>>
>>>>>> The entire point of having a generic compatible is that it MUST match
>>>>>> all devices. If it does not, then it is pointless to push that generic
>>>>>> compatible.
>>>>>>
>>>>>> I am speaking about qcom,cpufreq-epss.
>>>>>>
>>>>>> That's nothing new, I was arguing about it already, but now you have
>>>>>> confirmation of the mess introduced by generic compatibles. Solution is
>>>>>> not to add more generic compatibles, because what will be next?
>>>>>> qcom,cpufreq-epss-lighter?
>>>>>> qcom,cpufreq-epss-more-lite?
>>>>>> qcom,cpufreq-epss-high?
>>>>>>
>>>>>> Same was here:
>>>>>> https://lore.kernel.org/all/20240828203721.2751904-17-quic_nkela@quicinc.com/
>>>>>>
>>>>>> So that's second time I object and do object for every new instance. No
>>>>>> to generic compatibles, they are proven to be wrong at least for
>>>>>> Qualcomm.
>>>>>>
>>>>>> Best regards,
>>>>>> Krzysztof
>>>>>>
>>>>>
>>>>> Hi Krzysztof,
>>>>>
>>>>> There is no functional change to the latest EPSS hardware
>>>>> (qcom,cpufreq-epss) in this case. The Shikra platform uses the CPU
>>>>> frequency scaling block, which is a predecessor of EPSS and is referred
>>>>> to as EPSS‑lite. The only difference between EPSS‑lite and EPSS is the
>>>>> maximum number of frequency look up table (LUT) entries.
>>>>>
>>>>> This constrained EPSS block is not specific to Shikra and can be reused
>>>>> by other SoCs that implement the same hardware. Hence, we have added a
>>>>> separate epss-lite compatible and reused the existing bindings, as all
>>>>> other aspects of the hardware behavior and interface remain identical.
>>>>
>>>> I don't understand how any of this is relevant to my comment. I know
>>>> what you did.
>>>>
>>>
>>> Hi Krzysztof,
>>>
>>> The intent behind proposing an epss-lite compatible was to describe a
>>> common hardware variant and avoid introducing SoC‑specific handling in
>>> the cpufreq driver.
>>
>> And I already objected. Look:
>>
>> "So that's second time I object and do object for every new instance. No
>> to generic compatibles"
>>
>> I provided arguments for that in the past.
>>
>> NAK
>>
>> Best regards,
> 
> I already provided the arguments here:
> 
> "The entire point of having a generic compatible is that it MUST match
> all devices. If it does not, then it is pointless to push that generic
> compatible."
> 
> so if you have generic compatible, IT MUST be used. You cannot keep
> adding more generic compatibles just because existing generic compatible
> is not generic enough!
> 

Hi Krzysztof,

Sure, I will drop the generic compatible approach and introduce a Shikra 
specific bindings file (shikra-cpufreq-qcom-hw.yaml), similar to the 
existing EPSS binding, using the compatible string qcom,shikra-cpufreq-epss.

Thanks,
Imran

> I gave you detailed reasoning and even example why this approach is
> getting ridiculous, but you just have to keep pushing your solution to
> maintainers and keep asking the same.
> 
> You were given the answer and the argument. Now you are just wasting
> maintainers time.
> 
> Best regards,
> Krzysztof

