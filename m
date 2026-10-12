Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B842414409
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800668; cv=none; b=CISFvyu2ck3NeAI8IVPYTuvgQTXU6NqXdJC9w/tlUQ1J+09jgB5yVdAnkk79RW7C3F72Vaa5yHvWBALs1qXW6pprxINBDatbNJbOH3s2fC3crY24rMfaJophw2r5jzzlGlm4V70I0eTZrArcLMLRRtsrD85POApvVjnT4owHqy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800668; c=relaxed/simple;
	bh=yAcg4dx/zNqaXeHfWpCo3xrp+xBnubt9TSB+dfKvH/c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pVx5g958pGOWyknqavvWsjoDIUIKb63WtIjy/nwKKFhvGBW7Y9uwmUeUPnWOgBcfxkHBzFNSxQyOVYCFDD+I2yJ514bwvw/9ddvh9qNF15i07xKj8VY3TUTb9zzU0eO24/FKwFsdiR3WtmrQ9Bt52lE/JyYaYvAtZDUdnjYiatU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYOInHZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgfQx9uU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYOInHZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgfQx9uU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CA3jS12527381
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Qez6+RtqXrFwpKgN7ltkzNXGq/q6Mf8vdKXpshu2lQ=; b=DYOInHZqGOALow3x
	HxqJOwp6WnEWJhWxrOapXWlhKmYzOlvkjeeucnnazs9iQYf4+Uek6rIKpDDBtkha
	JNtlFwmMHTQaGAksm7hNvB1FFcLndvl/g0EZfGAG1uSJkKZxLk3E0MK8PNvTuLFm
	/GjZ9eeheA5JtclbudwE3H9JsAVNY4Z0kSQ+yW/iXvV55DcpwftEC2i2Syx6BrbP
	4XSgvOq7rWQixMKiSwED7JmzOd0MthBJ1ueqmm6FpFwvMz8mip2Ui1W0vGFbb1pk
	D0U71g0/hU2qLo+VOAltR7BDDJBXfqXDw8gA9iqWC0WsqWJ62R6NAjSm/pXf5mFh
	1usogQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffg30u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:24:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so3329507a91.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791800657; x=1792405457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Qez6+RtqXrFwpKgN7ltkzNXGq/q6Mf8vdKXpshu2lQ=;
        b=VgfQx9uUT5L0n7Qqdlsow3jl4PYruV9drFuLPNT/Sb+ThlgIwlr1OUUfMnHr0bUGM/
         1SR0mfLiIVx3bgiQ6/l/TkphgMvoPvQxO+MclvF9QR33Oc+eXpbHP0xsSDyR9yfymwZV
         D8FDF7I9+pLPfSoWKziOKrr1gK3YYoisuig6Old1y81/VZBlGDFUiPSgOd5D5/83uB77
         bFVZQ/defXw7KTJj0MDuqvdaNF0pqwoH29irHuGItyQQsAQb/v4KZXB39A9hLNtIOLfU
         MSlzxeMvq4cXIATWhO03J3+N3aK+JsDLzKK4Hvhz+kHol6UF4sknAhMN/lJNZfZ1a/DZ
         b4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800657; x=1792405457;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Qez6+RtqXrFwpKgN7ltkzNXGq/q6Mf8vdKXpshu2lQ=;
        b=UFwVdw0nKTz9DaKRSg1Sqr8Rh8yZNA/ODB6f6iDLKDSeaErGvJI36K2qrCDqLbI0Qw
         3gd/UzldG/uodSO0foQql0fkTImOVTZYOAgbqateYMVh8OBo5PGNiWY4etD5DvKaQAOe
         9hVx3k9TwRRs7babZaQk4j8XSO8QORQYwg2R5JAxYL/MMwSrgOdZb4Tq6hTQ5s/35NHY
         3mGkp6SJLdSJapfG1c/U9D35Jd42v4EpUt0kGsF30KESY5aRi4kOIAxm0KWwN0JiOI06
         DBAEUL5yhc2soIuCTttFIwtjoktG3gohGC/Fes7dZny+n7ypI2vzR/IKKnn2ZpbcqEww
         EziA==
X-Forwarded-Encrypted: i=1; AKwUvBzg7pvGJ+LHwUd4BF4u9vca5Pg6pjgyeI47Crat0oSC0nT4DOzTjVNv/DO746M+drenD+XFruKB5yZ/@vger.kernel.org
X-Gm-Message-State: AFq9FYLj/ULInNLZpJtsbxLp2mAtz1JaerFbWbjqpHfETmAtEM9Pfz02
	xbcrWsgkkKzu8lQX4kw/SEOhMJ52rXwOD/zZbztpZGKbm0PyR9cYS/olvfbWKWjP2/FWdnxuEpl
	0tir27t0YKBCd7eQhDVWEAgdq4WC9V4nPLDtpQ4jrURzEIy3SkcjdhqQV2KSFDfhr
X-Gm-Gg: AYBFou1EKDqm7m4ULcePbfgLVWDvWOu5R0vbmkI0b2HENksqIZmzI5AJLe7Cfs+EetG
	JeMobjkDWLuISwIee05bXt2BvwmRLto2DTKffapmRX41VXCdNGaC7FbnYj/v/QLer4GVUgGFuIU
	QsU7LjRhdtkbg61ZbUoK8Dv6QuhkNzS3sv82ELh1lQ7fV+GNJRgy3zn6UuiY2ZriGndKDP0vkk8
	3cXHK5sRLCYNLYFx/GWjLg9wdcnBq3Uo4s5VkTifWdWXhLhVZbWS3HyC4gFuOakic4gsPJj9b40
	AKBal77VGbQiMsS9UFmh69UwVCKDG0Qihd0/VB7f06mJnsmyA0VjH6rh61+IrdweUYHHlqYcJ9/
	px1BM47elnXN91P8s7w==
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr8404183a91.44.1791800656834;
        Mon, 12 Oct 2026 03:24:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr8404138a91.44.1791800656287;
        Mon, 12 Oct 2026 03:24:16 -0700 (PDT)
Received: from [10.64.69.36] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ca1e04sm16636916a91.1.2026.10.12.03.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:24:15 -0700 (PDT)
Message-ID: <51bc6576-7e52-4685-b7b2-a355c2b7e1ae@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:24:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
From: Yin Li <yin.li@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
 <20261008212736.GB1318789-robh@kernel.org>
 <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MSBTYWx0ZWRfX2Lh13xM4t/FA
 OMyLDZBL6A/EiX1uc/1ugyHjcwPV0iti1u6MTJf2liGze76M+0U16zIz9AHTASgV5loXAvWdYyt
 7kNiP+45nt+i9uBYRSLVqYZTKY0YkEcDYPplwEB/niZ+bh7zPWPbZq029DOQ8XYJQQFbrJ7ubN/
 ZxZ70eJq6XytIkn6Zct66J4VnIP14KJsfUbtOctQvV8sSRzo0BVtOsHL5XnmmDDyW9Le1HpY1ZC
 m9NFTlER4P/uL+lzmvygmO6efEUJRKOsYMj9MZD79Z8oi36IwkFEh7r7/pywlre39rvKyQQhVKd
 z4MhqgUU87mctZ9AB+m/bFADKpon8XMjIlWlUJhXxSkSeLezjy4WDRxekIwTBHHdtPr37UAIY6c
 RWY488hJC5+VssX8mFCjbWjhv3RyhJX0iXDQSiWKGA11MvJttyGFA0qut4DDiK+0mZpM5dM0BkT
 J0EeM6SYMi3swYnNHSQ==
X-Proofpoint-GUID: yo_3AqCYKvBnDYVlCk_uB8umWxqMePVx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MSBTYWx0ZWRfX2sO6k8QxWkr6
 CdItBJGSlAbMiyAUKdLVZ7WqtyEz9NW9xgS4JIzFK7zRNWNHAcQrWOhRop6Z78mJk66zLkEMb2g
 eLN6onqAhtWwN/Qwd+wlzyUxrkrZVJY=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accb552 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=U2AAjZBgJX8MQhfA68EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: yo_3AqCYKvBnDYVlCk_uB8umWxqMePVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120041



On 10/12/2026 3:05 PM, Yin Li wrote:
> 
> 
> On 10/9/2026 5:27 AM, Rob Herring wrote:
>> On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
>>> From: Rob Herring <robh@kernel.org>
>>>
>>> The binding is designed around the assumption that an MSC will be a
>>> sub-block of something else such as a memory controller, cache 
>>> controller,
>>> or IOMMU. However, it's certainly possible a design does not have that
>>> association or has a mixture of both, so the binding illustrates how 
>>> we can
>>> support that with RIS child nodes.
>>>
>>> A key part of MPAM is we need to know about all of the MSCs in the 
>>> system
>>> before it can be enabled. This drives the need for the genericish
>>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>>> until a h/w specific driver potentially enables the h/w.
>>>
>>> Cc: James Morse <james.morse@arm.com>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
>>>    standalone arm,mpam-msc and the two-item combination; fix schema 
>>> field
>>>    order, type constraints and yamllint spacing; fix example reg 
>>> addresses,
>>>    add arm,mpam-device phandle and remove TODO comment ]
>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 ++++++++++ 
>>> +++++++++++
>>>   1 file changed, 202 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml 
>>> b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>> new file mode 100644
>>> index 000000000000..3c7b13a23ff2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>> @@ -0,0 +1,202 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>>> +
>>> +maintainers:
>>> +  - Rob Herring <robh@kernel.org>
>>> +
>>> +description: |
>>> +  The Arm MPAM specification can be found here:
>>> +
>>> +  https://developer.arm.com/documentation/ddi0598/latest
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: arm,mpam-msc                   # Further details are 
>>> discoverable
>>> +      - items:
>>> +          - const: arm,mpam-memory-controller-msc
>>
>> Why do we need this?
>>
> 
> Hi Rob,
> 
> Thanks for the review.
> 
> The 'arm,mpam-memory-controller-msc' compatible is needed because,
> unlike cache MSCs, memory controller MSCs cannot rely on the parent node
> to identify the resource type.
> 
> Cache controllers universally carry a 'cache' compatible, so the driver
> can recognise any cache parent and derive the cache ID from standard
> properties. No equivalent convention exists for memory controllers, and
> the component ID comes from the MSC's own 'numa-node-id' rather than the
> parent, so there is no parent attribute to rely on.
> 

Hi Rob,

As a follow-up to my previous reply:
Whatever the outcome of the discussion on "arm_mpam: Add support for
memory controller MSC on DT platforms", we will keep the binding and
driver support consistent. If it's dropped, the 
'arm,mpam-memory-controller-msc' compatible, 'numa-node-id' property, 
and the memory controller example will be removed together.

Thanks,
Yin


> 'arm,mpam-memory-controller-msc' provides the explicit declaration that
> this MSC controls memory. It is used in "arm_mpam: Add support for
> memory controller MSC on DT platforms".
> 
> On 'oneOf': the original 'items' form requires both strings to be
> present, which is not appropriate for cache MSCs. Andre also noted this 
> in RFC v2, so we changed it to 'oneOf'.
> 
>>> +          - const: arm,mpam-msc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +    description: A memory region containing registers as defined in 
>>> the MPAM
>>> +      specification.
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: error (optional)
>>> +      - description: overflow (optional, only for monitoring)
>>> +
>>> +  interrupt-names:
>>> +    oneOf:
>>> +      - items:
>>> +          - enum: [error, overflow]
>>> +      - items:
>>> +          - const: error
>>> +          - const: overflow
>>
>> This can be expressed as:
>>
>>        minItems: 1
>>        items:
>>          - enum: [error, overflow]
>>          - const: overflow
>>
> 
> Agreed, will update.
> 
>>> +
>>> +  arm,not-ready-us:
>>> +    description: The maximum time in microseconds for monitoring 
>>> data to be
>>> +      accurate after a settings change. For more information, see the
>>> +      Not-Ready (NRDY) bit description in the MPAM specification.
>>> +
>>> +  numa-node-id:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: NUMA node identifier for the memory resource this 
>>> MSC controls.
>>> +
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  '^ris@[0-9a-f]+$':
>>
>> Based on the 'reg' constraints, drop the '+'.
> 
> Agreed, will update.
> 
>>
>>> +    type: object
>>> +    additionalProperties: false
>>> +    description:
>>> +      RIS nodes for each resource instance in an MSC. These nodes 
>>> are required
>>> +      for each resource instance implementing known MPAM controls
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        enum:
>>> +          - arm,mpam-cache
>>> +          # Memory bandwidth
>>> +          - arm,mpam-memory
>>> +
>>> +      reg:
>>> +        minimum: 0
>>> +        maximum: 0xf
>>> +
>>> +      cpus:
>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> Drop. 'cpus' has a type already.
>>
> 
> Agreed, will update.
> 
>>> +        description:
>>> +          Phandle(s) to the CPU node(s) this RIS belongs to. By 
>>> default, the
>>> +          parent device's affinity is used.
>>> +
>>> +      arm,mpam-device:
>>> +        $ref: /schemas/types.yaml#/definitions/phandle
>>> +        description:
>>> +          By default, the MPAM enabled device associated with a RIS 
>>> is the MSC's
>>> +          parent node. It is possible for each RIS to be associated 
>>> with
>>> +          different devices in which case 'arm,mpam-device' should 
>>> be used.
>>
>> We should drop this until there's a use for it.
>>
> 
> On 'arm,mpam-device': we believe this property is structurally
> necessary. The MPAM specification (IHI0099B) states:
>      "Resource instance selection (RIS) allows an MPAM MSC to support
>      multiple resources, including multiple resources using the same
>      resource type or partitioning control. When RIS is implemented, an
>      MPAM MSC must implement independent resource controls and two or
>      more resources of the same type."
> 
> Once an MSC implements RIS, it must support ≥ 2 resources of the same
> type (a spec requirement). An MSC node has only one parent, so the
> association between each RIS and its corresponding device cannot be
> expressed through a shared parent alone. A per-RIS explicit association
> mechanism is therefore needed, and 'arm,mpam-device' is designed for
> exactly this purpose.
> 
> The property is used in the immediately following patch "arm_mpam: Add
> device tree support for MSC probing". If you have a different view on
> this design, we are happy to discuss further.
> 
> 
>>> +
>>> +    required:
>>> +      - compatible
>>> +      - reg
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +dependencies:
>>> +  interrupts: [interrupt-names]
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    L3: cache-controller@30000000 {
>>> +        compatible = "foo,a-l3-cache", "cache";
>>> +        cache-level = <3>;
>>> +        cache-unified;
>>> +
>>> +        ranges = <0x0 0x30000000 0x800000>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        msc@10000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x10000 0x2000>;
>>> +            interrupts = <1>, <2>;
>>> +            interrupt-names = "error", "overflow";
>>> +            arm,not-ready-us = <1>;
>>> +            /* CPU affinity implied by parent cache node  */
>>> +        };
>>> +    };
>>> +
>>> +    mem: memory-controller@20000 {
>>> +        compatible = "foo,a-memory-controller";
>>> +        reg = <0x20000 0x1000>;
>>> +
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges;
>>> +
>>> +        msc@21000 {
>>> +            compatible = "arm,mpam-memory-controller-msc", 
>>> "arm,mpam-msc";
>>> +            reg = <0x21000 0x1000>;
>>> +            interrupts = <3>;
>>> +            interrupt-names = "error";
>>> +            arm,not-ready-us = <1>;
>>> +            numa-node-id = <1>;
>>> +        };
>>> +    };
>>> +
>>> +    iommu@40000 {
>>> +        reg = <0x40000 0x1000>;
>>> +
>>> +        ranges;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        msc@41000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x41000 0x1000>;
>>> +            interrupts = <5>, <6>;
>>> +            interrupt-names = "error", "overflow";
>>> +            arm,not-ready-us = <1>;
>>> +
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            ris@2 {
>>> +                compatible = "arm,mpam-cache";
>>> +                reg = <2>;
>>> +                arm,mpam-device = <&L3>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    msc@80000 {
>>> +        compatible = "foo,a-standalone-msc";
>>> +        reg = <0x80000 0x1000>;
>>> +
>>> +        clocks = <&clks 123>;
>>> +
>>> +        ranges;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        msc@10000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x10000 0x2000>;
>>> +            interrupts = <7>;
>>> +            interrupt-names = "overflow";
>>> +            arm,not-ready-us = <1>;
>>> +
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            ris@0 {
>>> +                compatible = "arm,mpam-cache";
>>> +                reg = <0>;
>>> +                arm,mpam-device = <&L2_0>;
>>> +            };
>>> +
>>> +            ris@1 {
>>> +                compatible = "arm,mpam-memory";
>>> +                reg = <1>;
>>> +                arm,mpam-device = <&mem>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +...
>>>
>>> -- 
>>> 2.34.1
>>>
> 

-- 
Thx and BRs,
Yin

