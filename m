Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B713B0AC6
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417772; cv=none; b=F5vmfA5MQxZQ3ilnoiWoznmJnE+aVbcZyxbvPYNmmxhcTRZeTjoqsQefk/rTOEXHQIamj2lQc92GZZ6rq6PJxC/GOzPjNsiGYCVzdwRO7kNKX5QVf9tsY5GVmCxC3FymrgsdI+yV1PYm5/TEt1RkSldEK8JbE/uvDEoU0U/8nXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417772; c=relaxed/simple;
	bh=coE+A/T6OYtv7EloBtl7FHeKXqEGRgr30Nuq5NB6xjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRkHJk03G039ZyEXZ0JaZuFF9Xb88n8BmYy7+zBClf/Hb0Cbknm9Og7/0GJ5kcGzGcUiPcony3YOpXe8sarRtqmRz3QFjFoZJSzzLgz7TZRQq+9p2joHRovv0qUi6I31ry+YuWJz//FW7Yno4mEmgz469qN4NoQYhwf4+Q/m9zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lu94deNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNhubKrC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lu94deNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNhubKrC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lerr3176911
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 06:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nY9b52v+DMvSwQj8tMDjZurLWIWOyHhy9GI9sNJbL/w=; b=Lu94deNH2niA1kju
	pvKGlpE3wf3qlQGsDZDywUPlfX4g3iBhdCbiGpO14W2c/hX+GaE730KDq/V3cQ4a
	S+afsGgl4PcasT1iiwvv8fCEsgExGvyaotTUYLy9/ONQ0pJ3uMlSIQB0y7d5alom
	/ufL38pp7nGr5jXdPetCbypJR9WLqeNVDls0jLq7zeTOkfk6reOiP0mT3tdjOFD2
	m1Rj9tk8nPUyzABgwNU/bPyb4Ghge2Il3Duf1ekUq0KRitJRNkT5569II0afCJ8f
	07rENu8bMnH1QtoJ55GuCFltRythCNEvIrPU4i9RhowoenuKzJpxtRz+itG7g3jL
	K50c9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4uuwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:42:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390890ae83so43044885a.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 23:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417754; x=1789022554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY9b52v+DMvSwQj8tMDjZurLWIWOyHhy9GI9sNJbL/w=;
        b=DNhubKrCMl9JweXTot0xGOdGZKrNdMvxUAhpJOQrZoy3FVXqcef+I+IaragWnvgWN2
         2hOx/VkFX+NoQPZU6k6v+1BUbAhlIc5Fbgwq2udIJW8kZ8ve4WiRG4shY5r7Of7noskq
         kvmGAVtiZKrNdYPhIqDCbGqycszqlPfbEWfFtA4CVPqxl3ZCd5jXbO/ZHyNsjcPEvWum
         wouRfBt23+TREx9QYf6fSoL32LlmW6FY3WQDoF0QyIgMN3xWrVa7q9yDDDjaoDD76E8q
         1hVubkXpW+YzLauo2eaut38KIIdL1clTUIxJq3O4GWlPaIH2Cu14Xu9N8eSBNYAp5o4m
         LWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417754; x=1789022554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nY9b52v+DMvSwQj8tMDjZurLWIWOyHhy9GI9sNJbL/w=;
        b=gsOqJN0P5LMzwaKcJaBlHArDYd970JZ6H0d7XGfHHhiwO+k8gwAa0aRfF7DbnmzS5b
         voUdacSoBGI6hLpsitnS4VtCpDqNz1+hyKAbEv0UCvXhJ6yZ3+hjLOREfmMPftHUwvFo
         5/BrvtgpP42aGrNZ2sNFNB3nilKDbZj6JUU3aip2cQ7Arn3XB4Dvy00IFrxgrKnQEJju
         X8PhtJpwRkl3lUfE4c+WDCuFVesrFugb+zcQyrpNc8H5o2f8vt2rjlMV3knAC8RxNg3M
         osRMhojYHIhstrMrxs05U20nWtPSV6tXq2BndF5Naj/xCioa3Fj/v+MfBm0+FCWKI2ze
         EkVg==
X-Forwarded-Encrypted: i=1; AKwUvBwSGGiTzc5ivje4H3IvHUCirNcvGqPNS5v7YRVY7k6236fZmMpNNiT+8eUckhOvXWLYe3ZODMw77LZK@vger.kernel.org
X-Gm-Message-State: AFuF++n4uXRfx/eBbrmB9rWZWmh5IFWYzQ9LX4TdKewPArhdGJ8ySUFz
	Kg/4Pd4RIRKlb8Jbj2lb449TJz3r8xJ9Zxz+RJAuz2zKZ3zhnR/Ya5YzvJcDSllcxZwiGHb12ef
	4Ni+OWksmJPMz980oMHnm0Fxc6dtg03rkzM9Y8CK/zLkjg1d3D18lWQVXBCXbuEAf
X-Gm-Gg: AYBFou3rIP9lAIpO/6e5gmi5UoS5urK1d560MEA1yVp9Ko+v/4alCmZ7Mp7q4XWqlGp
	NXZSjctLmt6pKToCvKgNtEm9WqK34XNq15EiNSfmOIX70tCngS1F6q5ZdZTjYfxfgIMvSg9xCgC
	XNtZ0+HAoLNVYDSJN6eup8JjrTsQDz8KdGKAhdAYIe3C/v19rsvnmOM+D/e36KuQg3Sf9Yfou4x
	KM1J62G5on5ZRU6UIxrwKUGeLmlLRAUVgiJDfHadTHCSuMiKU8jDxZkmM7ZdtXRrkgJQCgQIG3w
	FTN9bYdXemgFuLQJAbpDjZfrGfgh5mhDi1tTJmdRqmzH+4bzyzC8gzhXP0JVeAp3aKkTCMsH3mu
	YJlPPIBE20ruOJZwWv335Ug==
X-Received: by 2002:a05:620a:470e:b0:939:5924:e319 with SMTP id af79cd13be357-93960898d62mr721068785a.0.1788417753982;
        Wed, 02 Sep 2026 23:42:33 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:939:5924:e319 with SMTP id af79cd13be357-93960898d62mr721067085a.0.1788417753456;
        Wed, 02 Sep 2026 23:42:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172516sm53588966b.21.2026.09.02.23.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:42:32 -0700 (PDT)
Message-ID: <9c63c0a5-0730-4730-b210-18a36ce57287@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:42:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
 <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
 <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
 <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
 <06bce1c2-8498-4988-b5c0-ab42bfba86cb@oss.qualcomm.com>
 <dd3c20f3-89dc-4b5a-935e-e0e142988e4d@oss.qualcomm.com>
 <b192753a-b7c1-4086-9c15-4af2008a5670@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b192753a-b7c1-4086-9c15-4af2008a5670@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1OCBTYWx0ZWRfX4NJz2DbNtpXV
 DertQxGQFO3npIuMokWexVbPypy4AK2616iST41kSRU5B/n1BfN9gCb+x+0GLUvkM7B3ESNVRdl
 cTf3BqPry6L8fhOIzCQwWOKCNl+6njK+LAVr/kxQaoqX8xvnqROfT6gBCbgxVlrU94kivQ/gtya
 royE+beFdbl+kaoHh2WY2iZbkr+0fqtH2Tz48TkVo1G8/dWh4or/EDehq8ZqFk2ARUen3Waeiw+
 DybZfsmmRl62kk/8Zk74/SgiHVtp1ofX4AdCad6/SDqzc3f2XieVGeBOQBR0Q+kC83AXXOuHjiv
 qR8YS8sIS9w2T+kC6xn5KV/g74oGrH9Vn51vSF3cdpeWxOBLg7MDHipnhZDYayspkTitLLragiS
 atvblxgtDpsGbU1XnTRY+vc4bVa9GCN/FPtvWe02vsN6i8SCbjJmaeaNaRT/KZUquJ8siAvEirp
 p3NuiYeUuHfopXl362w==
X-Proofpoint-ORIG-GUID: DBzIuf28VGP5-iHenPYPZ7-kNj6WY_rK
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a9916da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QueW_K6hlHS4BuxnnA0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: DBzIuf28VGP5-iHenPYPZ7-kNj6WY_rK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1OCBTYWx0ZWRfXz8S6zh5dWpk5
 yjGzQ1UXnnigJuG69/WaOPTN3eDufXDHb/QvT9k28oDOcIzsPCGrVL7dtU0gNcLdBDy+2eTdTre
 +5eHvzpLEizi9utXpdmbGyGj0jeAfyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030058

On 9/3/26 8:40 AM, Krzysztof Kozlowski wrote:
> On 03/09/2026 08:32, Konrad Dybcio wrote:
>> On 9/2/26 6:59 PM, Krishna Kurapati wrote:
>>>
>>>
>>> On 9/2/2026 7:40 PM, Konrad Dybcio wrote:
>>>> On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
>>>>> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>>>>>
>>>>>>
>>>>>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>>>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>>>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>>>>>> present.
>>>>
>>>> [...]
>>>>
>>>>>>>>                  - qcom,eliza-dwc3
>>>>>>>> +              - qcom,glymur-dwc3
>>>>>>>>                  - qcom,ipq4019-dwc3
>>>>>>>>                  - qcom,ipq8064-dwc3
>>>>>>>>                  - qcom,kaanapali-dwc3
>>>>>>>
>>>>>>> This changes the ABI without an explanation.
>>>>>>>
>>>>>> As per the harware specification, the controllers do have both
>>>>>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that
>>>>>> info. Will update the commit message accordingly.
>>>>>>
>>>>>
>>>>> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
>>>>> incomplete? Lack of context here is not helping.
>>>>>
>>>>> If they have these IRQs but it does not matter, then it is not a good
>>>>> reason to change ABI and you should just add the clock as optional to
>>>>> the end. Was this binding already released? I think yes.
>>>>
>>>> IIUC the intent of the patch is to allow specifying the currently
>>>> missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
>>>> Bundling the DT change would have made that easier.
>>> Yes, I wanted to add the missing hs_phy_irq. I didn't want to bundle in the DT along with the usb binding changes. DT change was posted separately:
>>>
>>> https://lore.kernel.org/all/20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com/
>>
>> Shipping bindings and DT changes in a _series_ is preferred, what one
>> must avoid is changing them within the same _patch_
> 
> No, DTS cannot be posted within USB patchset.

Aah, I missed that point..

Konrad
