Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91672364058
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939461; cv=none; b=IGwBsmqUj3pCfzs3c9tHMHBXp4OjAxogXMscwaEx2goUTcPgemmys0LXShAXjrruVY3giCJNXVi91l9AsZifH9S3v5pr80uuQPsLOapkPW/ltUZWi0cB1eZO8B81FuuiB8N5UCB0A+qCsKmzIEvoGAciwxxSdGXQiDCaQ1glqwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939461; c=relaxed/simple;
	bh=rIQghz1DdBqWmQCzB2UZAKvYVAzvTlzPkeyezBhS2hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hO+jI+/V/i0bet6bB01ab504boCbAEfjQK2VON9ni5BI/2l5XlNF6FSLehJofftxsrn/fMKCmwfj9DQE4l5OHUnKYZQJ7CfCJvMEOcZ+4und60yZ9KOmGpjJ7AQ3e6b7Nu+eJxUqPv+WzbXEs4PtI3TKhOgcV059Joyt1rcbakY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIjSZK74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIp5mvcR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIjSZK74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIp5mvcR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SGK4R23568599
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 17:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/OxxXV9WtxfoOsHrFSeDk4/H9j66TfeNbkxSbwQuzw=; b=KIjSZK74jDbrkl6X
	sFtBt8IqND77X7UIXtKK33M5WQbN56AdcNzvWsp/uYLfKD8H1EL52xzqL1UFZMjn
	uMsKw+fEce6lilkYuuR74yxa0ERjCQMb5L21QsypQuo2So591WTUT6vLQ7g6CNX3
	ITjWhIIa3vENHANfOX0B6po5j7pJKo39u0l4aNHbuABV2TkfNICvzHytf7iB/lEk
	ecDd20JUWTgtgRnaSJCPs+33ymh61bC8vls794CA+40FN4Wf+dvAP3hLzahsv5CX
	ik5rjBDRPXzs4j/3qfphrvc30SzOj2Og/5hL6ZJZ3mUFWrF7c3VdpPABW2ZlZ9l7
	0fqtQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxtywc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 17:50:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so2050650a91.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787939457; x=1788544257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/OxxXV9WtxfoOsHrFSeDk4/H9j66TfeNbkxSbwQuzw=;
        b=NIp5mvcREgpYBbkTbG9qe2Vl8GUdeUhB9AzQlYXSr5UlWslaWqo0FoZvXda9Dr5mC2
         ety4Bs+8CtwWNMlyr+QQSZXiICUwJ5jviibQ3VFJVnId2Qk+sHR81u4F+g4KAgFKgXmb
         Ozw2zUFt9/pOX/2ZDRjdlEDabUtfrqrftr0eTKuruoqMRnDWrC4Wj5bh6x0k8mvEFh3g
         dXzsEFDo0MqBEVwdlapRLinBMrTh2phivh0QCdAZuD9NIKjAG7OFVd2hpW68mjW+UTeC
         5ZjmPCgy65p+qUCKtTdgOd0US7GBoQoevtN/tFpo7ytTdMdFx48hcik3V8XbSw3yF1EQ
         VDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939457; x=1788544257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/OxxXV9WtxfoOsHrFSeDk4/H9j66TfeNbkxSbwQuzw=;
        b=hxNff8o+3PXokR9PPTHZoqbJb69JnLSMXRoWkx94bL961MPK6THya0vjmjloWeHeMU
         Lm5HGZI8CUJ1baBhvzlbGtAAg0t2vmHXsEAvQPIXmCcHUVT+dXQVjuFidCiNBMXq0JZj
         0sy2hESghPsgLX9EZX1ZkCyW/g3LxsKQu7Z4h3FzQrupVNLuLMliNazQVGSeLH+lOvhX
         tLzqk7MKef13p9WHwajLDOWlr9XlBmnBhEIPmAs97dZO0WnSCFcqD3T3X3Zxqv2VmvUy
         +D+pYdb6ZPFj95Q2gynPhbISFZzLCVLkkl+J5BdT7/sEDekLgrohuklgr7iv0DNp/5+S
         n6SQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7ugusJCV+lnP5KFJwt8Ep/MVwVmMnBtCL7xsnC9yhrfOFzuwx19VR+dJ9QjHmesnQEgRu2KR9cWjZ@vger.kernel.org
X-Gm-Message-State: AFuF++nKpIjD2c1+UAVPVfQpFAHI6bNO3JkWzt64JrSAJ1PtlN2B5D3r
	vpaz8Xv+CmAEPntBDPRtl7Sea9NbkArxMv2lY7h6Rx7d88rKClDHbodLW8Q4EYE1Qpzp3AxXm7T
	S3qu89dHqY/4goIAsGfEsC7R090CRQLFIYTd74f5Z5GQLN7qfKdXEl56q1i8f2+mr
X-Gm-Gg: AYBFou2kja7rqsMhblwllg+oraUaf/tjZGGSyQBrfqgeginGuf+0VQglJB95EJnZe3G
	9Dvs2morE3IgAr+jaHxgHV/hMAJGsC7+Fjf+N17hC5WkPDLlnhvF5LaIjJ+JcQQpcZqUXv2ZkNl
	x9erjKgRpC+WzGs4FCbqN4RZ2hIElw2WXP1uS/euysAcOTpUkcqO9GpvvLcJ5CJmpGBhEh9NIFB
	Qo+JJ9cb2cQebTwZEd16OhS8s5831XwNBaWY0fE4Wzg0RKEgU7Rwb/XLEvx4hYL076UN7r2/jmP
	JXC1EwZGHOPX1gxLB4e4T6vtLZmU3co2W8PItaarRPmJJWkTe2JOJ00RNQ6SeBrX1e6rwOzjEUP
	pZhLBPHzh1SCqFbLLGxz7lERqWjmUbvIa/rNnEwBV87zxuE0KyrpGFzf0dNEJ+0Eo/ew=
X-Received: by 2002:a17:90b:1d04:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-3989bd40d7fmr2370348a91.18.1787939457154;
        Fri, 28 Aug 2026 10:50:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1d04:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-3989bd40d7fmr2370286a91.18.1787939456661;
        Fri, 28 Aug 2026 10:50:56 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.243.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm8082192a91.6.2026.08.28.10.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 10:50:56 -0700 (PDT)
Message-ID: <26da98ca-8074-4116-a1cb-291f306f55bf@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 23:20:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
To: Matt Eaton <linux@divinehawk.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
 <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com>
 <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org>
 <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
 <14fd70cb-d07a-456f-9800-d3ece4039529@kernel.org>
 <CABUBpLfH+bi3Q5hD+WWG0QnyCfmQMRt9TkUN+zC1pvH44ez90w@mail.gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <CABUBpLfH+bi3Q5hD+WWG0QnyCfmQMRt9TkUN+zC1pvH44ez90w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1NSBTYWx0ZWRfX19BfS9KMLN47
 ZIu4fdjz46gL0lEQl0yIKpCE5aOcPO/c6O5Lt09ZWwECAPRpxOh0Z72vNo6jUcrNVX6rjHvaTIt
 4/7ztKMvsweSnOF9jHEt60uXq7qfT0dVJ16yoC70Yyp5ieWXnYnSb+Lwarh6A2vvE8KdvFDvbBw
 MsAYhgkZTKcvzpQcdYucxC1JJc1bh9ES6Rt1eNE3/eumo3JVuyKQ9pga8kB40lS6Kh4VFEmsWTN
 dn3U/q8Xvuyl1CGtVa5XqtoUIwDtsLbeNOHgejgYjWOErnyioR31kLOk14bO20enCh3YnPR3tmX
 mnYICF2ja6PeQ6Lxk4N4oEu6bqtbRrWg/k3Ua0Gh0Mg0FL+Hsk0kMpRWOCb4eqBqtbupY8H/vMm
 HpOHHd1lXR1xRzi7+answzn6qj4R4H1+U2ocCjU1LNZWlu3IgLKIWe6cRg6V1YvalLpGgpUBTGn
 uF0lIUCigYP8w0tM7Lw==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a91ca82 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ypuo+zZCpu048z3kylcvuA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Chss0xDGAAAA:8 a=_7onyXRF9wsX3SFU1x0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=VZ1z_dUGxXw8Qzmhq9nZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1NSBTYWx0ZWRfX9t/QkNHJXkmS
 JLgHQpO4ogPBBs+BtrsY73OG05RQEel/mkTUUtW6xNXMmAFBRxUuPKI1XtsrQFNLsUiEZrmsiaG
 gXz3LVoM1v88N1dexWATjm+icHR8Dgo=
X-Proofpoint-ORIG-GUID: 1WphN1DkBHsMrOkS5TAAqbLLzpb6pn7e
X-Proofpoint-GUID: 1WphN1DkBHsMrOkS5TAAqbLLzpb6pn7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280155



On 8/28/2026 9:37 PM, Matt Eaton wrote:
> On Fri, Aug 28, 2026 at 3:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 28/08/2026 15:18, Matt Eaton wrote:
>>> On Fri, Aug 28, 2026 at 2:39 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 28/08/2026 14:37, Matt Eaton via B4 Relay wrote:
>>>>> From: Matt Eaton <linux@divinehawk.com>
>>>>>
>>>>> Document the xhci-no-soft-retry-quirk property, added in the
>>>>> following patch.
>>>>>
>>>>> snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
>>>>> peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
>>>>> accepts it there.
>>>>
>>>> I do not understand how this sentence is relevant. Please describe the
>>>> hardware needing this.
>>>
>>> I came across this while porting the UniFi Travel Router (IPQ4018),
>>> the stock Qualcomm kernel is 4.4.60 which predates the soft retry
>>> code. The command ring hangs if you disconnect the device while it's
>>> transmitting. Reproducible consistently when using USB to tether to a
>>> phone.
>>>
>>>>>
>>>>> Signed-off-by: Matt Eaton <linux@divinehawk.com>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>>>> index 4238ae896ef6..5d67a41658f7 100644
>>>>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>>>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>>>> @@ -25,6 +25,10 @@ properties:
>>>>>       description: Set if the controller has broken port disable mechanism
>>>>>       type: boolean
>>>>>
>>>>> +  xhci-no-soft-retry-quirk:
>>>>> +    description: Set if the controller cannot perform xHCI Soft Retry correctly
>>>>
>>>> Why isn't this implied by compatible? Looks like controller's property.
>>>
>>> The xhci device is created by dwc3 core as a child device, and so
>>> xhci_plat_probe() is used. I think a DT property is the right
>>> approach, similar to quirk-broken-port-ped, but to set
>>> XHCI_NO_SOFT_RETRY.
>>
>> Linux driver behavior should not matter here. DT property for telling
>> Linux what to do is not the right approach. As I said, it's implied by
>> compatible unless you bring hardware reasons why it is not. Driver
>> reasons don't matter.
> 
> Will rework without DT property. Appreciate the feedback!
> 
If you have any upstream QC target that needs this, you can use the 
following patch as reference:

https://lore.kernel.org/all/20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com/

Regards,
Krishna,
