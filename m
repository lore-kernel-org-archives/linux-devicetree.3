Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6364483A6
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834315; cv=none; b=eeRgl/5d2UP3rXrsjrlgq8WK9ollP6H2Zo5ZRyYsIKCWquB4Ve0DX/ZVCvMFsTEdZD0hG9HmROcDmfPF0iqFnXXZx3zrJwO13yjPwJZOexrD/I0fHgVyq+oz8SSuTMWtaQdleV7aS57AGqFGUpXyHskD+un5Nta5Hp43F4NbKu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834315; c=relaxed/simple;
	bh=66Bl1L3TtAr1fmZ9488gKSZUz1fFy9fRzV/yEhWpd8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N23Z+cXvHqWfm4lngDfNwwGkvF1FPMENjmWPRB0Mx7yCX4yO1RkbskRzpYGNsIKcgoSpZ2scjQTkc7BoMYb2i4EtOzhNabJA0AdmtSWB7VM5h9ZHKPkDcqgezcjPpK+Lhc58wvBwUdfebI6/O7rZr+sDl9l69rtz3CoswHp91Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kz7s0237; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkfFeOAA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kz7s0237";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkfFeOAA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gik01915382
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 05:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dB3Dn1+CS6BSNSHicf0cnCjOToj6kJLYbJyjq6jWbmc=; b=Kz7s02372d/bdN17
	fSX8MgvYVd9QssLzHMIzH1Ek/mHkBcUKKZE+B925r1SW5c9+FxIR5HvWnSsFoZcf
	sT+0BPBMhruXN+S56F/GBGRgq+rN73Fr/KyYQhaeA/UTjbEdrBha3MGIvhYiMA3G
	MlLiUMbOj2fYOJJKeDOMHQUsmc0PrZu2sf+IT9q3RvjQc4ZrXIQNHWFRsc+Ysgea
	TaLLZWTvthSR+EQDqhUhGmgy06YftH/Iit1F0ohAJJMWhcl/SyQ4EHqALsjeae9F
	Uwpy2DsjFJoufK6t+n/TVKSVEP9KTsLXaxcWaMj47IIS7rCHZ1leP7VWuthhrL6Z
	3yXJ4g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n237f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:58:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so10037138a91.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 22:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790834311; x=1791439111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dB3Dn1+CS6BSNSHicf0cnCjOToj6kJLYbJyjq6jWbmc=;
        b=KkfFeOAA72X6HG08zYzoN5ERXOoUBirvJ3Zj3DJLU7kOjrKOq4S9wRtX6DK1uZNXwy
         /u1t4oyfpKsAp34DYlQQGJ7kxmWGQZAUJHMfps0Y7LXJDrBFWr6LvFTKE9ZUhP/HhtJe
         k5ymC3jFhwm1CMuLw1fSEWeikb1dGf5HSuLi257qV7tapoX/j19UQViW2UcNhP7XVSMr
         wgD37XrPUczzb3l292b4WM3Hp0U6mDsgIONjQjWRtlI4Skmz3ZkkHX2X/FiI0hQbldCd
         xKcMPjOwu/ijZl5gqJ3ZMEhYd1p7CO37ZpEzTRAl6HzeHZqXFmidDzDm5oAYuOwmLxRa
         8RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834311; x=1791439111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dB3Dn1+CS6BSNSHicf0cnCjOToj6kJLYbJyjq6jWbmc=;
        b=PAHlfGFB7nAtvLsxyLAjSdvl0UOeo8VViXF8pmLOAxhC2spF+aR5c6LtVseZsQpGsP
         PPxGuqVACnGCO0Bv//J1q4tkVCj386QQTsAMkPsOSBvh29u7HQUdr+QKh2D4GU5iKbi8
         rhiwti1yyPqdO+PV7JJAk1TLZ5cGo9JaMeeMaD5jAIq/c5Kkn+/+1VzUgG35RwHsRpZO
         wzye/PAA4Eh2WuchRSp2MN+sC0tZeEhQc4B/vWbpoUrlgpufd1ABOAgorJfBr4+6pyjq
         SgzKNCvmHz3GOCnfarPzkrTgRMFrIW582sWG2jH+TB4MnsNICSKXajcKTJM37y+VzKdc
         R8Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwGXB5GxKQ++yaa3SSXjUuMRyIrac6htMkQczCUhdhv03NJIhNw5c+O6I9k5HJ//TVHnP2XRZRUjnDO@vger.kernel.org
X-Gm-Message-State: AFq9FYIMKXgN+Eg0ZSIo2YjOJGg9EUxk1089e0D0PpFPi17NMbhG0NOv
	FyIgtJA0OamkLYe3/ies15+d+hlHrCowiD+IZ23QV/MsmoPj3tSjC9N61S5oNaw2KaAuvpKVTCT
	26xwhPe8HTXGLdz8+vtGUNCRaUmy1Ye39ksHhEPuN0evVcpN6Q+3ltLML8QtOVVum
X-Gm-Gg: AYBFou2v7zQsW7CVRyE0OF4rly6JQ3pY1SUW2xVIDa2s4EAqID8GOy3k8vwpS4cyAwD
	MIwQheI58vsbXnGtP0pMAoluHrXP+21qP9KIItrbUK6JL2jGHOkJBsq4FlicdNzq0EXVkA1tk5p
	UWES2K2IUxGrTP3Q2mIAqzYgCT2lz29ja+JOX3dEG0VS1kp/bwLzU8Sz3kDFU3zjl5ZtlDoYyuT
	1y5EUIsutWFSOgT7YcS63jDflaTIx1T3gaqaVlQJdC3/DwgXoWwoIdmM5i1F1Q2nK6mbzBN+kA0
	uj+m3FQuS8ia5sEnx2yczmzWRIii738N5CNTegXQeNsUjPOcbr99SDjgBqTKV897rkDkmd8QANb
	dyY9rwr4L8ZGlL9ytlCDTg2ZlU1OHtfyj
X-Received: by 2002:a17:90b:1a86:b0:3a0:5413:49b4 with SMTP id 98e67ed59e1d1-3a4d179f011mr3229319a91.39.1790834310609;
        Wed, 30 Sep 2026 22:58:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1a86:b0:3a0:5413:49b4 with SMTP id 98e67ed59e1d1-3a4d179f011mr3229295a91.39.1790834310049;
        Wed, 30 Sep 2026 22:58:30 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43720f6sm2583288a91.3.2026.09.30.22.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 22:58:29 -0700 (PDT)
Message-ID: <f4a2c926-8cf9-4d76-ac42-98d9f225be93@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 11:28:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
 <20260920-qcom-bam-dmux-vmid-ext-v2-1-ef5ca2178378@oss.qualcomm.com>
 <20260920-humongous-raven-of-charisma-bb99ed@quoll>
 <CAFEp6-0juFLDxo6kCTf_RrHv0EAevVqB3DP47=fg6PBNSCDcbA@mail.gmail.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0juFLDxo6kCTf_RrHv0EAevVqB3DP47=fg6PBNSCDcbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abdf687 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qvNVy7eBxAcGVOgx2IMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMyBTYWx0ZWRfX8ukXLtfgEdjo
 RrJLfQp6oqLSMp4VlHvIHJoVQdkw6sZG4KKO20MMMBS5R8Rx/HsfjGK0eWB+fGnap8Zb3ye+Vyu
 zS+yGadESIbPXAuTZsutJEvSxHC8ETc=
X-Proofpoint-GUID: rum_MZFYIU4Ny028DhrPYwwfSGsy1Xqz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMyBTYWx0ZWRfX/SnrEj5ma+PT
 3dpr3T3WQpSdZyVBdoH97scC22jm9eiTNzBRH7ROn70yWEai1dinxKOEEXn+bZB0wWqtMA6Ji5Z
 JMPqNLciDvPUO7yq3sQm3XDrWaKqsVbPflTaNsT9lOdp6bUpe1/LN3SLKZxkqfYu0nzDzQz/SR6
 XQzyyuQL6kfng5D9T7u35t3ZwfLZG6nlr4xKu1C5ifNuM3bw7XP7+mtBgqhCWPh1Hr2rsCUfBBC
 lCk/lKUXFFiP1CTIUQ6rUCDqi9SvHC3HABRcIXiOYJmal5VfCWPrF06SUVDnteahnJYRqTa+Cc3
 9OpSe7gq4C8n//Mw7N+4ChIf0FUgIzQnF5VeiYLk0bemQuZfzvIBmZB3bHOH+e1tIOC5QbulVVv
 2fUpJ6kjr8Nbp6qpmnwmyWGQcGBnh65jbZBgd69Uzh4oWeq7/GmML4Rj0OUjeIiwB3906a27+OT
 MKgymDKX/RcZSePpmyg==
X-Proofpoint-ORIG-GUID: rum_MZFYIU4Ny028DhrPYwwfSGsy1Xqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010023

Hi Loic, Krzysztof,

On 21-09-2026 01:46 pm, Loic Poulain wrote:
> Hi Krzysztof,
>
> On Sun, Sep 20, 2026 at 12:36 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Sun, Sep 20, 2026 at 08:32:29AM +0530, Vishnu Santhosh wrote:
>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>>> domain with restricted access to system memory. BAM-DMUX DMA mappings
>> Then this is specific to Shikra and should come with its compatible plus
>> constraints per variant.
>>
>>> must therefore be constrained to a designated region that can be shared
>>> with the modem.
>>>
>>> Add an optional memory-region property to reference a restricted DMA
>>> pool used for BAM-DMUX mappings, and a qcom,vmid property to identify the
>>> remote execution environment that is granted access to the pool through
>>> SCM.
>>>
>>> Require memory-region whenever qcom,vmid is specified.
>>>
>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 38 ++++++++++++++++++++++
>>>   1 file changed, 38 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>>> index 33746c238513d72366bc52359fb10f275475b331..5351269b0ab72ede808ae47b55d57580af209038 100644
>>> --- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>>> +++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>>> @@ -72,6 +72,24 @@ properties:
>>>         - const: tx
>>>         - const: rx
>>>
>>> +  memory-region:
>>> +    maxItems: 1
>>> +    description:
>>> +      Phandle to a reserved-memory node compatible with restricted-dma-pool.
>>> +      The BAM-DMUX device uses the pool for DMA mappings.
>>> +
>>> +  qcom,vmid:
> I can see several existing drivers, along with a few ongoing series,
> using this same property. Instead of redefining it in every binding,
> should we consider defining the prop/type once in a common soc/qcom
> schema and reusing it across bindings?

The existing users currently differ (rmtfs: qcom,vmid, 1-2 items;
fastrpc: qcom,vmids, unconstrained), so consolidating them needs a
separate discussion with involved module owners.

Krzysztof, do you want this consolidated into a common schema? If yes,
can this series keep the local definition, with the consolidation
handled as a separate change?


Thanks,
Vishnu

>
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    minItems: 1
>> Drop
>>
>>> +    maxItems: 1
>>> +    items:
>>> +      minimum: 1
>>> +      maximum: 63
>>> +    description:
>>> +      VMID of the remote execution environment that is granted access to the
>>> +      restricted DMA pool through SCM. The local execution environment is
>>> +      retained automatically and must not be specified.
>>> +
>>>   required:
>>>     - compatible
>>>     - interrupts
>>> @@ -81,12 +99,29 @@ required:
>>>     - dmas
>>>     - dma-names
>>>
>>> +dependencies:
>>> +  qcom,vmid: [ memory-region ]
>>> +
>>>   additionalProperties: false
>>>
>>>   examples:
>>>     - |
>>> +    #include <dt-bindings/firmware/qcom,scm.h>
>>>       #include <dt-bindings/interrupt-controller/irq.h>
>>>
>>> +    reserved-memory {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges;
>>> +
>>> +        bam_dmux_pool: restricted-dma-pool {
>>> +            compatible = "restricted-dma-pool";
>>> +            size = <0x40000>;
>>> +            alignment = <0x40000>;
>>> +            alloc-ranges = <0x80000000 0x80000000>;
>>> +        };
>>> +    };
>> This wasn't here before. Drop.
>>
>> Best regards,
>> Krzysztof
>>
