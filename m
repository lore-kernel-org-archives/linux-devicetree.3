Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892779;
	b=zPT6pVXRPGRBKZGJKecwhDH9io1g8pKks+OFpcT9OtyFCLhxQfUzsfz9f9Tjxm0arQ1y
	 3G276FZCM5Gh7ktVsUxzRqCNlRss5mN2AOWtlcvyewAKy9wPrArs94aOuN0aHq/RUiU7P
	 IxPTHGiUDfTiGuvN8x+g1SatmIMSPrp1Ph7nzMlciGTFmLgimqkyi0FMQarzmAoVkCbXc
	 nISShbbmO9ybOgb+HZ9k7OYycQIXIc0Y2Sm+yVLAW+qTIUBhGVL+XkECvmwJH44+B7p0E
	 nzfwwr0R6CIBsDlAi8Qb0H5PHrvKPLIbWvgCbuhNpj5k9s131CTDea1kc3YY0rrxrBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e3T5k0SQ3pw9Nex+iwov0/iwckU6tdcd+5LX6TaExWs=;
	b=2eBJ15wPUq4bKvVckYFIbZtOBKamzkiOgdcAf9hk7pbn6C+Sgx/wDoK16/OwpwT+YVzD
	 fIdIS9R9yABW5Ac60VmS73IuIIgX+L6g83eqVVFg01m99pbPrDEZqqvh82C8MuKVG0G3z
	 /nfbYYP9VW/ecqi0Ej5gebcMHWk140qnrr/lhs3VABMucXpK4jIJWWyX4Zkh86V6L+R7Y
	 waJ3yHmpNNKybfHzRYQWJiHX/jCJxfUfapuaklX36kubqGh0o+Oq/O0u6SnxUzPUmK3Yt
	 gON8gxKo7mttS7VCHaJ3dsJ7BwvRk9Ncp842TbdxACE+6zKvnx+2OnzJVu4cqAHby1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PuL8Pg/J";
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cItFvPM6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7B606A33E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C7B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PuL8Pg/J;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cItFvPM6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQAaA686795
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 15:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3T5k0SQ3pw9Nex+iwov0/iwckU6tdcd+5LX6TaExWs=; b=PuL8Pg/Jtw9+GRpt
	TCefO5vm1ZbG9PwmjWTfHYJH+mZbkZsHTZ8QB5AakK/7hmJOZAVF5hpxKswTOFP8
	2grUk8+dn9DJK48kfOXFXgFnsfeWLFWDBhqNMtZJ5liuGb+tzLlKRnJvmoQZZue3
	+ACIZRTIgBN8vJ/W1AlwtTOEc5exHtyDOubofYGQDTZfXQcQfp2fkLlHi9apKjoC
	b5aZu1scRuHPwStGmoi/ZHmJsWYu61Fu+4Qf4ot60pktfolStT7XRnnPmpVeKoqq
	MMIAD1vRhxDCwBGRiAeWMpK5scOPgwQH2VbOjY/+rhEbXiZOuQwPcImy7++j5uRR
	57EhqQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p1k9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 15:32:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf586522d4so1485129137.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793892772; x=1794497572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3T5k0SQ3pw9Nex+iwov0/iwckU6tdcd+5LX6TaExWs=;
        b=cItFvPM6LpfQg3OeFMqZEDAlxsI+fYymc3zR4xY9jJWE9lz9LIOtT2Acu5C7qpJ2p+
         0zz3o/Ut5bpErKb+q8p2v6Sxg5Q5ZJjqYoxa1gZb5cm3vvCANRZrpfJGBBp4cC2S53de
         LTSLs8u4BNSzbdAD++2pWMlua9PNE1uDWGxVye4XVxmTmtQCjASFiiXBuATaBX6uIcaQ
         0vNHjy5/A5aEwKUiCcg4mqTFdnOxcEY379VEE7EaNuS6e1cFEjZv19w7ZcPqEYYTxxO9
         mB3f+Z9ED46JEIjS+GyccBvRBQ2qK/kG8OOpM5JiTZkCM/wWiAdtEP9qbVqQP9x1zjI1
         VKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892772; x=1794497572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3T5k0SQ3pw9Nex+iwov0/iwckU6tdcd+5LX6TaExWs=;
        b=U7ierVCN7m3l8nV0WEFObI24QEiFuXVZnGO4vO0794HpwesLFhUTKMJq4aPTQYhwjU
         3dPnUuDjDFMWDDLgYf7OS1nrEQFSiWCPEd4jc/AIsRAJw6cv0Ez5KkyIiVlx4v/9v1+l
         ZxIaDhs82LUN995/Ah0CgDN/I48Gkb9bCyfIfzYCHpy+uOJpHhNO8IWP8fGjR0CQ5G7R
         mklDOQnlz1uPRDS4yiL5WpxhgoAeleShvBPs9LUEShri+sfrrXlrZcipZ46IwZDDw1QY
         +F3/z9xS1CFC9ML6sVtj/yY2afFkScVxB8WnBhdMwzThtolfQfliYT4/AtlxmiTpXnPG
         zi3w==
X-Forwarded-Encrypted: i=1; AKwUvBxwsv7ft/gYY4e+b1pKcDAIVYqyEYrfmOpDzDcykvd8/1i0xIKvS90MDUtOSTgnlF0u4xVhYa7fai6/@vger.kernel.org
X-Gm-Message-State: APuU4Z9MxH7e0mXoUgAxr49QRyVRB84Vg6JE07BPnNYiVRooy27hZ0Bk
	jlNjZk9yk91bDVtltXfRgXfRqwgStK5KXIG4Ll+YWIo6hVgfPbu5LtlXsyQrEdiWs3pW1IwYZLn
	jeBS88Yv8VNYmXyLiRj4KR9jvLQE3s6Xs3rPJvwXXkHqxb6qdyUOBDTf2zm9zbqY4
X-Gm-Gg: AYBFou1qgprpwnk1MeSMe2OdeWuGlHykN0+jYLYzyyjndHhuZDHadta4DZsYppC1ml6
	v84oW1hqPbtxAkWNr8wJ7gIxdISZKQmOf50MfpnpHPZja0NePU7TdCUJc0gWlcsmu2y94DRZobn
	jjvyXF+Z/m2y8bHFtvr1CHTO2QwmU80GLJgYqM/cpMz690rGNmso8x71lvkxfo0fZGV/3Z7T5DV
	GZlOkHCciUzKB0gUraKMA6LKhJzDamDuNmPkSIvOGta36o2w+q3SwTC1qiro6O6BVYMgErlKDht
	JpuA0VK+/piG9se+XN64dtBFLmF+8jIQLUcItNAJS6VwFz0yDTFAEL50Vjc1Naw0JQM0+2Fa9pr
	aSM+IdECgdDG6bN7KHj4GX/2psUE2WaX3e4YPc4uucGeh3MEfv2itnj5Op5u7dk9C2Avc5Fwv0X
	snxvzFzSZjLWONbUhE
X-Received: by 2002:a05:6102:3589:b0:7c3:f36:c7b with SMTP id ada2fe7eead31-7d072c2bafemr10657474137.14.1793892771800;
        Thu, 05 Nov 2026 07:32:51 -0800 (PST)
X-Received: by 2002:a05:6102:3589:b0:7c3:f36:c7b with SMTP id ada2fe7eead31-7d072c2bafemr10657452137.14.1793892771275;
        Thu, 05 Nov 2026 07:32:51 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm10594945f8f.48.2026.11.05.07.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:32:50 -0800 (PST)
Message-ID: <65c4b925-598d-43d8-a6af-ce197d9b5c27@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:32:46 +0100
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
Subject: Re: [PATCH] dt-bindings: thermal: Use signed integers for
 coefficients
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261103214357.2700244-1-daniel.lezcano@oss.qualcomm.com>
 <a53ebde3-ca2b-46dc-b4bc-93379b05a1a8@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <a53ebde3-ca2b-46dc-b4bc-93379b05a1a8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aeca1a4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=8VQtTDxmKkvejqrRUPYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfXw+G83ex8nY7a
 44qH5WdglkM/lqxlcCxkLO6WRbiB/cywlFulQEwR5qPhWFm1EygSRTDjZIYdBu5AU1yzY67e8Bx
 ar9rP2RL2PMVrulpiq87v67S997oec9rBX+e4FRJ6f8QOAUrpKwukjMWs71MRpaEOEUrn/ncYY9
 GbE+mbu+gUKZCtLAweEPZ9FouLlMEylN+emk6INv6+bGfGcC/dbyuT37Qrt5q0ZmNKo05PCsh2F
 zlRaQzBdE6CHEJOy1K18uUIWL71I5/fT1LzmYeuI37HQXbe6lnqYLtPwW1zqTJLaoHnr0EAg3+f
 oZAQmlosVz8pbp3QpiQKWIZtl5A7DNqudk8hFt2/nc2ldvW6YR5bGQjNzqfqNeFQAr2InCR6aRn
 ksNF7tBJa3A7GLPs2KdhqLL3PUpBIc/uqYZPXa6LRTWkgsWLRlh7LYEg1gEyDNLCH0kgFVdBZVr
 5IJzzmzUOkAglrJaFbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX9618tZWvhdft
 Sa/suVdQIbXbkBJqK7AHISDFprPOvjO/XaISwcfizWeAsl5tQKwzB38DzQdI49G2wjfft17AnoI
 xG+gHQCaDQm/Dlo8zXrx4eG8Vi0UWeo=
X-Proofpoint-ORIG-GUID: T9urc8oo-vBt0nSe3Rm-yBXIfkWT51DN
X-Proofpoint-GUID: T9urc8oo-vBt0nSe3Rm-yBXIfkWT51DN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050061


Hi Lukasz,

On 11/5/26 11:45, Lukasz Luba wrote:
> Hi Daniel,
> 
> On 11/3/26 21:43, Daniel Lezcano wrote:
>> The coefficients property describes the coefficients of a linear
>> equation used to derive a thermal zone temperature. Both the slope
>> and the constant offset can be negative, and the thermal core stores
>> them as signed integers.
>>
>> Existing Device Trees already rely on signed values. OMAP4460 uses
>> an offset of -9301, while OMAP5 uses offsets of -1791 and -2992.
>> Broadcom platforms also use negative slopes. Declaring the property
>> as uint32-array does not represent these values correctly.
> 
> This looks like a good argument which was missed back then (that
> the negative values are possible).
> 
>>
>> Change the property type to int32-array so schema validation decodes
>> the cells as signed 32-bit integers, matching their intended meaning
>> and the thermal implementation. The cell width and binary encoding
>> remain unchanged, preserving compatibility with existing Device
>> Trees.
>>
>> Fixes: 1202a442a31f ("dt-bindings: thermal: Add yaml bindings for 
>> thermal zones")
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/thermal/thermal-zones.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/thermal- 
>> zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> index 999ad40a20d5..72e419124f98 100644
>> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> @@ -101,7 +101,7 @@ patternProperties:
>>             thermal zone.
>>         coefficients:
>> -        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        $ref: /schemas/types.yaml#/definitions/int32-array
>>           description:
>>             An array of integers containing the coefficients of a 
>> linear equation
>>             that binds all the sensors listed in this thermal zone.
> 
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Thanks for the review
