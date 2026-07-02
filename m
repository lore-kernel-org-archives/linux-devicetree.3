Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083481A9FAF
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 00:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782953480; cv=none; b=sPAbGYvmFx9ovJ6oO20I1plMvFl4FjNniYbfZ2PTg6PdCqmPkYQUsWZhm8pkV64Z9CBZEpFy30spzYNK1J35ZsQEKI05O7lTf3g3Da+CVp56luceaDYhGgqdgkuy0MWVwwi4hrqgUJuTPMFJIeZfbT7si1y2ODWtmtEx9xXOFow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782953480; c=relaxed/simple;
	bh=Tu5S9jCJYgsObHMW5P/ZmnurjiMv0ZDJq2rX34bxwFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QG7vaKQM/rSQnmrIRYSCReIdAuoAtWVGF4yTZTE3thPHo/EkPf5Mw68ulBUn8MtWSRLqNkD108Oi+2LgQzIKLfdlUrDjVKXyQ7RXJ5KJMrAU9d+KPkGOCKgng3+FnlbRHM3CMWRzF5AnEBx7oOLUdaoefdgWSvyCgsIDklUS5uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yp+RXgMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQKrgbBf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yp+RXgMF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQKrgbBf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661LhMgs2358170
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 00:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNehC+LYZqsx3fEVijuvFUAX4NEjwm4VUVbbO3e9BFY=; b=Yp+RXgMF+TW3nZYF
	6aFZ9BdeYbGRhu2uF+Nwm8yZAkaQgi3eRxMwJ889F+WLgpbmwJ9L1GQ6d1yWAS9H
	FCTBcX4pksrFnfCIufdtPiMx+gjo+44ORXJRybGh9jiGH7VKCBSM1bcOTAGxT2lm
	RPgAbbOXH5nm/xhjkKzVgRFJ3E/vKBFGmoMuSq1+EtHdCojYO0kw9cR7tCGICaug
	VGssj8Z/nKf3qhyZEsndh/yORjD+Xa1KJQFoFNMpaUdOIreF1gg75/WYQYiKdUFS
	mHu9TlKtUrv4rrwBGvRLZSDrCByPWeeyj92ZLwYS8XzP3ZsycJzAFeOZnB2Pb7eJ
	29QgUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0afuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:51:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so2099387a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 17:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782953478; x=1783558278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNehC+LYZqsx3fEVijuvFUAX4NEjwm4VUVbbO3e9BFY=;
        b=ZQKrgbBf6QRQn02VZWrxemQQQZQJbcKArwq1LfHAGs96XGlqMbWVRny1IDnmzJ+rgP
         cxFOw/KmDnirFd4jRNl3wvymFuMh2ZSeIUvBfJ0BZS5VoCirX7NdxhnMwKdQy7kC2/xv
         2IZeDrysRvPwPDfTuso8matCfOUOu/rEkZs9ctNXTL5ATNf2EP0bD8HTH+m+/5VZcJyT
         eCwTGkyOsJaU1h9DgYSv2U8Pc5kIbAWfpJzHRTUrTYfxBlaPb83nUlrxRgWO+0RzUTaC
         u5fmaXXTPP6sG2SdBuoyHNz8a4pu4EObugApZhBGpWLkBowgwaIkpQcY+VzIX6NacBb9
         Zn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782953478; x=1783558278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNehC+LYZqsx3fEVijuvFUAX4NEjwm4VUVbbO3e9BFY=;
        b=Fclw60f0+q0D3duSz6gZBzGWYNB4DSravFEJG49z3B16dm28VQ3aHGVQtNfEkemhvo
         i7gAJg2RwIR0xFtCrUaSmKfn5NmVzRWWuWPbSDrCdXq9Sj+IzT5gjURBdKBq5oZKELSJ
         jzxIThYQXvUOXhTH0YewT1laDVTzYaD4Y4h5v553v1l32cFmD0X0jJRY1sNVegV4PXzD
         UYJ10GOYpszQUopiRyoBm4QPJb3D1+duRDp7A0qBjcua+vhNKYdyfq9Ez7dEq6SSgGtr
         tH8ieCVO7q/sMexy/r9UhD5f+6Ul4UXgdAhoXhVfoJTALeDLhZLVeSwdW2iL7JOclUEK
         SNGA==
X-Forwarded-Encrypted: i=1; AHgh+RpEr3Z774tzMcazVmjgVgqq4GeSJ+K3frbVQPV4QuZW5NRFsAGnpCV1rJMdVP/xMFfdYLqDXdsaEy2e@vger.kernel.org
X-Gm-Message-State: AOJu0YxCehDuB/Hu+xOfA3+XR05SynOJYImXFnovKBhLqc2j84uMu1UB
	ylZY5ksGzB96rZlz98YZqgN5I9imBOfc7YjI9fc1O6gVlWB/d8YNRWIYHNQHVdgKxdasPAK12wc
	4b1sdBSFdayOuiytCo0+aJpqXblYLVGBTIIpwPFjPz1Rjou6IaL90w1hSwkwevfIq
X-Gm-Gg: AfdE7cnTJvIc/xCacCbPlwism0PmbcFTnytDD47O6HhBoVyqlk1MQ+VwSG9nVDvtwwt
	RYPweJi1gZ/v/xaHtLkfupAIcXh3haXicxFZaVMaGtspTv57VKMizNufPttSzUEEAl2PyZIkLYL
	+G8BWpDdG29Xn/7LRPgR5WbkYj+JWdCYdWZADOgQgze1XFz4xdXoHBPMlQsBEFRW3szy0jbO1yn
	dh1xNA+6R41bLS2OH8tahtcrodarzUn6ZtNzV/+Rluy4qUc6PvTiJRqu2Xvi4ftMCPNvuChSDb/
	ypji6US7eFv7QF0yOT8bZQJp3RFDQz3CpqHCKRLP9o7GhLp9XPSXlaUWOtaPnELHJWORrHAjTPO
	OdXT8errMddgmcHPb3HkZW53zQ2/7PdsEjCHSORFWJ2QN/x+0AnHLjzK0UM6HK8hILtVVPJUQ0V
	WK
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr3313988a91.31.1782953477408;
        Wed, 01 Jul 2026 17:51:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr3313940a91.31.1782953476867;
        Wed, 01 Jul 2026 17:51:16 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e146f003sm84699a91.0.2026.07.01.17.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 17:51:16 -0700 (PDT)
Message-ID: <6b789ea4-e06e-4f47-9a35-a2b58994f433@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 08:51:09 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
 <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
 <12709ff6-bb42-4d3b-9f9d-e327cd8d89cb@oss.qualcomm.com>
 <0f05e07a-57ab-4ae6-8274-c9c496ca60c2@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <0f05e07a-57ab-4ae6-8274-c9c496ca60c2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a45b606 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=hEVlawO-5ZV4_H5CQOwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: s2S_S8HMrldEiw0VvgO_X7_EMV4-uG7q
X-Proofpoint-GUID: s2S_S8HMrldEiw0VvgO_X7_EMV4-uG7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAwNSBTYWx0ZWRfX2OmoSYxuYs91
 mUxMa3ZotHDi7BU21AhBjfWMPDhRexUvGqWi71pYy+pLOdV/IIlnCIX6DrrzJPd4URzz3L3BaqK
 3J9J82/3bUJHJaLPOdoVQVBJz+XNmb/B3j6aNEuaI1s92MHRwwBLllVE/dyzN0FXVZ6Ooc8BUQb
 AA6cyNcunBEUV7iJJs82ryqiWCoauOAVgDOmNgz+AUxU/+vUENUYNWKYv6PjxwyoQS7uo3RT9/M
 sko8LF8aga3yli/5WajrSlbrdReow96JwIptt1JsPiqxjs3u36oTv7FzVPg2TFk88LsY85VgyI+
 13t3xaURQBB8l3ypwas31OIW75TeXaH54zgWp7DY8MRg3B5+psD76EK5usJTjE1AXOmg96eEPDF
 VFuPqn8aYB6IC45kEYCZqx2csXIKQbDRkRNrFbTTZ3/ns6ea/m0tDOrHVAmdRMs68dj2cV4Dcom
 X9uUmEvnR8fIf/anvtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAwNSBTYWx0ZWRfX/8pc0pwgFTwL
 5gvwuxMmR7aZ2j6+oLo5OlY6pMoT6Z+2OL1uEAXkSVwGtE9gE5BPC2OOnRLX37YD9RJXsmD2wqB
 xi2b0R8bgA/oX4VBW4DLfZea9T+Jles=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020005



On 7/1/2026 9:30 PM, Krzysztof Kozlowski wrote:
> On 01/07/2026 15:09, Konrad Dybcio wrote:
>> On 7/1/26 2:54 PM, Jie Gan wrote:
>>>
>>>
>>> On 7/1/2026 7:02 PM, Konrad Dybcio wrote:
>>>> On 7/1/26 9:31 AM, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>>>>>> On 01/07/2026 09:16, Jie Gan wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>>>>>> AMBA bus.
>>>>>>>>>
>>>>>>>>> Convert the compatible to a oneOf and add a standalone
>>>>>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>>>>>> created on the platform bus instead of the AMBA bus.
>>>>
>>>> [...]
>>>>
>>>>>>> AMBA primecell identification. The purpose of the new compatible is to
>>>>>>> clearly distinguish this platform-specific case from the standard
>>>>>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>>>>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>>>>>
>>>>>>> We already have a similar pattern for the interconnect TraceNoC device,
>>>>>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>>>>>> I do not see there a fake, duplicated compatible for the same device.
>>>>>> Can you elaborate how is that relevant?
>>>>>
>>>>> Will fix it by removing AMBA related description.
>>>>>
>>>>> Shall I update the clock name from apb_pclk to apb as a platform device?
>>>>
>>>> Why?
>>>
>>> For the previous platform devices, we got comments to add the clock-name with "apb" instead of "apb_pclk".
>>>
>>> Please check the qcom,coresight-ctcu.yaml and qcom,coresight-itnoc.yaml
>>
>> Well, if you need to break the bindings already, might as well on
>> the grounds of choosing a saner ("clock names shouldn't include _clk")
>> name.. Not sure if Krzysztof will like it
> 
> I miss the rationale for doing the change, why exactly this binding
> should have clocks corrected.

Thanks for confirming.

Jie

> 
> Best regards,
> Krzysztof

