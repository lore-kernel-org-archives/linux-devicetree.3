Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019364;
	b=tHaAQ40PLS689TBkYFfr1LQyDsKRTJ55UEhYSwUp8VU4ec/qzGQtjzK/lvlN7rnaw2M1
	 68/t3hIzOQbpp8GSEy6a/F90lomcaNDNMjuM49pJ/AOmtNMvMDy1ToH5xbUVgEBYKyD4j
	 zI2QsI/2/XK5EkYo48zW6HpRrSYf0O0eCwKZthK3rKnOOV9NunMNIvu4i4dKyDP6MndSP
	 OtA6rxlrnBe9Obrhn4FMJTADQAebC/TZMH0IonO53h6mLKHCdE11S++uRPdv0tluKzp/T
	 Gvl1irP6DISk3aCJBbO6CcLuMGdrByD5e16OhVD3ct+vIVw1YjtZaPVS/7O9UU2FPbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hNO7pC1kz63YSDMIEHWfeIC3Vw71SJAFnz98jQKeibQ=;
	b=flmoBRDFUTEBRaIYRIfHKO5WK9/suv8xEuwYpxZcOsjqJlpcLWPRmkWGOLM1soavFskn
	 XaFg1ZCbEL11BbW+Cn2rFPBfC9ViCWhHq5ViZ431bl/65qthStNU3k1YUa5Rr7nrqG0OB
	 sI4gGUipbF9+D7f9JA/L5OxRvI/Fic4rJQqA+wMB9cErMcPoELrmBiB/KfwfS5sYpSSFL
	 8BHtDvxvT8kidHPzeh1faUdreMlybbSxVJg4l8PiSR1WJ+uTZJJOjsoJGHh6LHvzI/1Fb
	 5ZsLKzvPVip1aMkG4TfK5I9g2LGoE6ctP/CH3DH5esKcAJ7cbX/i93LEtthhKKTO0zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S7dphAUN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O5cztYV9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2DD606A327
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2DD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S7dphAUN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O5cztYV9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAswfj3033788
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNO7pC1kz63YSDMIEHWfeIC3Vw71SJAFnz98jQKeibQ=; b=S7dphAUNgcPfraAP
	C0b5lgfQz5b7erEFF2J9VlbAHAgRnqdbDzx019x+jZOMGjhmQBorH+m9nLX6oHMo
	/Kv7fcGKb9aEUzlfbRRcBYUDRlqPd4k06AQ3RpUhtIowFj9V6sodpWPF9cIvz52E
	IVNi/QSu7G347o48RP6pR6helreuSq5PXXpjmwM6+GTeVnlgzdCbD8duBvEJONjf
	EHFCF42+7tvzC2a6nzpCc4yR4DsIuE/5qCeqTD7W0/oqws5SfqiOOiVk9+M9MTD6
	6db5HZEEarz1QcTAKpM3KDN2uiM9dxFyAPo4N71HLjQKAOUh/HsfD1fcc3khbUHw
	ruTkgg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0gay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:56:02 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0cfe694c3so42248657b3.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793019362; x=1793624162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNO7pC1kz63YSDMIEHWfeIC3Vw71SJAFnz98jQKeibQ=;
        b=O5cztYV96Z6jFPh1WWeO9FGhFW2joS/CK3rmTdQOnvwgSsTKO4sMV6qKbh2MkDeZ++
         /KoVw4gXh9aPkRY/NZ6HKjuzFL80gtjkSwToDVP6/3QF18c8V0tVPRlzSO8JxKFfSztl
         x147YQb+kGz2If7001PndmXOuW8nG8QYByRpd3LRb/xIfYsfiEynKGGPGrFQ4Q01sot+
         XoXMshBFYXRoKaBYxWi5T0AXaNLLbzn80u1zBV0Q1QUBonbFNyD6BjYE9mIxzKj5TOtO
         STHSk6nyjvpCw62BkVyEeUm5oWaQL6GmIEABuC9qQk5VVUvAhL82egDWwx1LMUc8liLo
         ns+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019362; x=1793624162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNO7pC1kz63YSDMIEHWfeIC3Vw71SJAFnz98jQKeibQ=;
        b=W8wXCFJgJ3Mtut3W4s/AAiNyOgzzA5XClZkxBok9Sp8Y1Cm78n/uaB+7NublxDdmqI
         yMVrJVZo+cfHzKWLSScgqDmxlXPSFoF8Kfbwk1iaH/m3fDZxALHUFVHYcXPB8J7L75TF
         wBil3ZW+mhCGMSUV6hHo19JZiDpA4DnFgxFRMLAGsj3/ODMmWf2/oQQnMORsqb1eVhiI
         XEsNVBb++4cUW8rZKsEsN8r7C6DCrmXNH3tpbkmmYpHIjDDLaCAbnjryFvWl0rekZHdB
         HmlU8vS8yiQvLhsm3Vp2eU2OLGBJYjbB6G/Na9xXxSXSXZMnlr/dHqTKv8esn61UrZj1
         YjAw==
X-Forwarded-Encrypted: i=1; AKwUvBxF/p3eyaZuIE7Cp3nB/wqqDkhqwXKEbdjPgxf29lEYUm/iBWbQDcUtoOw1RUxLl77NWx+kEseKQcZx@vger.kernel.org
X-Gm-Message-State: AFq9FYLKRXlcJZE5oaDAhZM4oq4vkMfM+4bS1QPRQAEVvuDS3SC6QiYd
	/qPU2UH6wGvzM4ILO6MVJ+FBVoFF8GrzqUxxYV7rs+zCIkgZaB9br/LCDJ1CLRztCnm4hDv6Rct
	rVEEbtzY47eX/L2XBOIQav09edofN7KiWitULxbKTIMFY5kfKMcZthVgy7TCw/Ln4
X-Gm-Gg: AYBFou2EqlQqEtWJBD/eciotCPA4CJApCZr4Xo5PWJ9uk4dehNRyeO13gOid14kAqoh
	Wh7et1XKRDeYsmXMFTkzI8uV9gAbci16JHdgmdUB6vPiVwCaMVBKm03OPavzdp+n56/ll9yd0XN
	2HV1s8O6O1jDOkgGp5iXlDjQVMTEjdm2zeG0Qc5LAUn7tepjSLMqAuv9cJwTwxbevdwCVv9jzXf
	4QDGBs2KwkLiPA1gIDUDfOBfsVnaAZB2e1ZbYoUe1jgExAupMHxUplxhOHGtkZcmQ8CRvwHrA7d
	rWaHG0kGXnz98XUvnyQyhCYC/LjGN6JFsElZVeNCfMNIOfJixuyjGqMI5yWQ6LCdWGncJRegxqk
	jy/NgsBOLQRAxLXq6lR05ceqNNps=
X-Received: by 2002:a05:690c:d8a:b0:8b0:ad62:198f with SMTP id 00721157ae682-8b166bea5f5mr53580397b3.20.1793019361838;
        Mon, 26 Oct 2026 05:56:01 -0700 (PDT)
X-Received: by 2002:a05:690c:d8a:b0:8b0:ad62:198f with SMTP id 00721157ae682-8b166bea5f5mr53579767b3.20.1793019359974;
        Mon, 26 Oct 2026 05:55:59 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166e28704sm31507357b3.23.2026.10.26.05.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:55:59 -0700 (PDT)
Message-ID: <237b2f74-4a9b-4df2-a0fe-a7b783ed5267@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:25:37 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: ptp: Document the TSCSS on Qualcomm
 Lemans and Monaco SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-1-beed14e72510@oss.qualcomm.com>
 <02792987-7ad8-4a6b-81ad-559c63174bb0@kernel.org>
 <640acacb-1704-4ee6-aa34-d6be3b30b44b@oss.qualcomm.com>
 <f5aa313d-0e23-41fa-b59b-9388839b2525@kernel.org>
 <7f6839fb-59b0-4f6d-a3f8-7579f6d40857@oss.qualcomm.com>
 <aa76425c-0579-42c2-832d-cc767703f3f5@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <aa76425c-0579-42c2-832d-cc767703f3f5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfXxiSZjfCNjec6
 nj4Vg5ZmOSY91zuOabjL+98ZWywZFS/TqT8UpWV/pZDUI+VSYCHqLvPegdLQQOGcJVLwWy0kHTw
 tfovUCsSURkMWwbVw8JADpBn0f1bNwA=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf4de2 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ebbTEIlB-icwTnaok3IA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX5vXIZSj9kI4l
 gePgc8xjksgAr1mr/BbHQ5ylcFbT5BFJ6bdCXgn8mh0HUZcYhK4oMryFKS8CDopUAQXkypvnA2V
 WTxWRMHUFUW5/NfDyKFPHlLkT6AUt76SfQpwO5GlVpl56djLH5kzHa4YmgmC3pYuKJc/UVZ5Zw0
 yMjaW3iBGD2cr9QV4ZgKjMZ94ANy3I7OThxV5S8svfshc2HpgXALfCAop4whQg+PRXgPfT0gw7L
 WiAcwUaThhFdMr6IOMFRDBEWeqb9xPkqlAZKXXvy2GFX9mKD/9oMNIH4pooA1sVQFHnZoFRNc+z
 X5Z5GjPtXQb8Cnr7qO1ntu9PzFRYi1AHWqWXAco69bop9sXfBANZBEzNVzkgYA+L9XY+vhpeN8Q
 Z3XvbhmvATT9+tgR+hrXV3s/HmyOjNwoHWdD/cF4fHViWG60DwiqLKfNMDefoxHZh34UTlERAQG
 ZRioJnOwpPUksivh+Ng==
X-Proofpoint-GUID: mTOAVze8bkWbxuDJCd2SNaKdMatMWSOJ
X-Proofpoint-ORIG-GUID: mTOAVze8bkWbxuDJCd2SNaKdMatMWSOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260051



On 23-10-2026 03:09 pm, Krzysztof Kozlowski wrote:
> On 13/10/2026 13:49, Imran Shaik wrote:
>>>>>> +
>>>>>> +patternProperties:
>>>>>> +  "^etu-slice@[0-9a-f]+$":
>>>>>> +    type: object
>>>>>> +    description: ETU slice configuration
>>>>>> +    properties:
>>>>>> +      reg:
>>>>>> +        maxItems: 1
>>>>>> +
>>>>>> +      pinctrl-0: true
>>>>>> +
>>>>>> +      pinctrl-names:
>>>>>> +        items:
>>>>>> +          - const: default
>>>>>
>>>>> Heh? Which code do you copy?
>>>>>
>>>>
>>>> Each ETU slice has its own external event pin config, so kept pinctrl-0
>>>> and pinctrl-names on the slice subnode. Please suggest if you prefer
>>>> otherwise.
> 
> Just drop both pinctrl properties, because you should not need them. You
> define them only if they are different than default.
> 

Thanks for the feedback, will drop this in next series.

>>>
>>> No, from where did you get this code? Why are you sending bindings which
>>> are different then all other bindings?
>>>
>>
>> I was referring to the example in [1] when adding the pinctrl properties
>> under the etu-slice sub node.
>>
>> [1] -
>> Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
> 
> That's like 13 years old device binding, so unfortunately likely
> antipattern.
> 
> 
> 
>>
>> On checking further, I found that our etu-slice sub node deviates from
>> that example, since we don't have a compatible string for the sub node.
>>
>> Please let me know if we should move the pinctrl properties under the
>> tscss node with per-slice names, or instead keep them under the
>> etu-slice sub node and add a compatible there.
> 
> etu-slice does not feel like device at all unfortunately. I see only
> address space, so one resource, which might be enough but lack of
> description for the subnode is not helping. I have doubts that separate
> subnodes should be there in the first place, but if they stay, describe
> the child node fully - what sort of device it is. Just because there is
> independent timestamping counter does not make it separate device, just
> like independent interrupt in GIC is not itself an independent device.
> 

The ETU is an independent hardware block within TSCSS that captures/
snapshots the TSC timestamp in response to an external hardware
event trigger, for each slice individually. Hence the subnodes approach
was followed and will capture these details in the description as well.

If we drop the subnodes and add everything into the parent TSCSS node
instead, then all the arrays here must stay index aligned as per slice
mapping. Example DTS node looks like this (QDU1000, 3 slices):

ptp@1da0000 {
	compatible = "qcom,qdu1000-tscss";
	reg = <0x0 0x01da0000 0x0 0x2000>,
	      <0x0 0x01db0000 0x0 0x10000>;
	reg-names = "tsc", "etu";
	
	...

	interrupts = <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>,
		     <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>,
		     <GIC_SPI 334 IRQ_TYPE_EDGE_RISING>;
	interrupt-names = "slice1", "slice5", "slice6";
	
	pinctrl-0 = <&tod_pps>;
	pinctrl-1 = <&gps_pps>;
	pinctrl-2 = <&hardsync_pps>;
	pinctrl-names = "slice1", "slice5", "slice6";
	
	qcom,etu-slice = <1 5 6>;
	qcom,etu-event-sel = <1 3 2>;
};

Please help suggest which approach to follow here. Accordingly, I will
update the bindings in next series.

Thanks,
Imran
