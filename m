Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771544;
	b=A+pWVpyyhVfHsztxBfm66l2ZDnAXDt2NN+/gHXrX/bONKp9RXkqd483r6tYhlrCoWyi+
	 AwGkyqxoZjKPlTOhaVSqSZrQ5xwTstxpkopBYQF8zZAfMFRYwQx/DH5BoXUGi/VkOAq0o
	 P6iso77FhQ8Fud2u6W0OCSc28KRTPHlXAJWGQ4EJxAYXECEmI/tN9EMSDdZqR/JYUp2HT
	 D9CWfU7aQGwidgLXZEKLOyMsd5LzMG40bIRNIuxi4YXdClRl8pECqsPE/rqWjl7d7oCSI
	 HQkYySqCtWZ8oCLf+lX+fI11hYr/VBykYBLfYg9VR/f83lkcGpaaZqizyF+8Lvm+xQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eb4ShHDEcPbwytF60hBjX+kNmkhn+q3+ARBxWD8KeAU=;
	b=FFaTnjVdYmnkbisVlkil51Zg2/sf7yvUCeiqhWkKWHacNKULKn7eU/Nwr1GQDFkr2QI5
	 lWdapCucU40v0hIGelyDRPedzUGD0F8nAcJL2uocPs4ObWLeoGnn8xLqokfTTMVlkV6FY
	 Hyt6jY8lNlMIse0zc642s8PmstArp93c3CW7xXVYH94M8Nne23mfjlIgt6CFYz3zN2tkm
	 1fQNsgYHPgamF93gMXnX67H9JcaeEZsH70yuvxduIlo0sd0QT5nDAPdBLkhkAsxzptu/Q
	 gXtaHXr0Xz4od+uKYFGSbyHPHGsaZ8KA4E0Jr0iM87rnxOagxgYAUdOIWcfYmE8Hp2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2but8Ei;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxsuwBRF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554D9606A335
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554D9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2but8Ei;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxsuwBRF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbpS3759035
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eb4ShHDEcPbwytF60hBjX+kNmkhn+q3+ARBxWD8KeAU=; b=M2but8EitmsaKmKM
	+Y6azno8QMbXmA6Y4o8zl2+htv6TKv052mk4OQCuoLNQF3f+wtrVjVq2asliwX+f
	3paB/VgAvJI0WpTCgciK5DY+g8pet67rsdIjI+VrnzSwhvs/rHWI2RRNmmpomG1p
	WKa0yKWekFKKGTPxwXwJKiXI9EVqMibpYv7oTRvxLaQS91heijKg4F4WZh63AeMG
	RtPSEtxqzdnR6xkmER68PA2H1YSHzK+erJiwU+df2k7YsetculdeWcubcI6EL9Ak
	LmzO68FQJiGufI4U7v+PgyQpZvoZ5L4fHjUItk3cg58HvtiCqFxJmQVVN24baHjh
	fcIydQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6rpfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:25:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949b0d322fbso1088017485a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795771542; x=1796376342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eb4ShHDEcPbwytF60hBjX+kNmkhn+q3+ARBxWD8KeAU=;
        b=DxsuwBRFgj4c8F5SkG62XhnLRUgrPGLTEB5pYVxU5rl8+Y5gS1YqkVyiDUMAbXB5VD
         VciAHMhMTAxAxql/JuMtQS3cQlHLiaUF7CpEnvVuesxPMdyhPpppXL3yMz1XcO1s6BxY
         qPyXfvjSTijDoXVsl7UJTJsUeRug8DzF5zgGHxBsdheBCXbyVEjy/ZpxP2HjlKOewkit
         +ZlFaDEaVIAtWN+t3Uls89FIsrocrnZW122DxiV5DJg/Cru+8SrdOBoIDma3GAfT+02Y
         oZdcZ1icXB1ve7XuFW6PyWGYnN5jv7AtpJTnoHPfy0XQ5Wg/Rj7WZNGQ4kCxte3G1pDF
         MWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771542; x=1796376342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eb4ShHDEcPbwytF60hBjX+kNmkhn+q3+ARBxWD8KeAU=;
        b=rEt4/hwo/EUMw2nTrG/e/idbzJzcrKCmfjwQ2wbd6VNgFdXx51TYdMTySvCivY+NZK
         WxK1in+sGN5+GZTGhO4gaNm/DKMdPM6nTSfv0HXWOZRC8tjxalCFgg70E0BItxiM0INx
         SDmhYf7ZUz6qy1yaL/L+QYFlClrsUmf1D6Rnb7mt359ptalOVscw2Ije/RlcMHwXlyur
         Qf2uszKw37ttU9s0weJKu2UJ9Vuw3TtNEHvgtQ5K8TYUqasdfmdjRA6D05Tit5dQ2zUp
         lIlPJEe/5PdVsvecUBRUjytrAfctGDmL2w6ekxVveQIaU7C9inFid67JJM3t3BDKSBPl
         RrHQ==
X-Forwarded-Encrypted: i=1; AL+hErHhHJh0/fEh48dQXGg7Hny/Nb6+KeAo4rYbgrUwQIVvKoZOJkY7y53EiOtXTywwyHbYtrGsjDqSIKIH@vger.kernel.org
X-Gm-Message-State: APuU4Z8y59pTqU/jm39dAiIbuWFX/UDmC50EDlHKVQbu+0RgzyqfRzh9
	9Y9MufylPY194TSC1L6yRLjphlgwmyEaQYsbZVl8cxipXI1GpgooNyPHD1kt7OWWLl6vd20aJdl
	oAw4zAEfq/Sn9UCbtujE7hfGYtjpk+okt9RBpRgrcgU3ZWjqcsnIzkEgHdcRcwScK
X-Gm-Gg: AZFdTZeworKAkUecpZS+GHI/JaUydyCaGZiOxSGZTAeVSsISTR+FvcpvjIU/CKPOZj0
	FvxKUXwdhK6BJhkzkie2rceEFS6xhkyw0RkdGOpkMDrjOOAF+FOFgZ8B07zjFCJwIBZl/W6SMdE
	FbsPDlAQ7qcBd/wBwM2yrV4QUwBTxTOLPC93dYOnbbaqvouKdUuTr0i86PFtMBaSFeD+8k5DQnD
	yAFl/VonbXiXDj6hV2uAGpmcLWnGJf78wOYH94ixHOfou6A1zA6M3hWi+SNmg1kVm/I69WE3qrR
	s0HqVSLt7kWvBt534/hzLWAqk8tI4/wDqUw4jyNiXSql1pBHW7h9soZ7YGRZCTuHl5qIiYigWI9
	KnZCtBQAsUgn6sB8UPvDOurrmBV0FmpSNrHpagLET0n9ha1K3Doq5Rw5H4JokB8ujgyScV2JUhs
	BP16FKC+Q/S/BDGvMSQAmXNlUJKhLHWt61UkM=
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr4061296085a.2.1795771542187;
        Fri, 27 Nov 2026 01:25:42 -0800 (PST)
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr4061290885a.2.1795771541667;
        Fri, 27 Nov 2026 01:25:41 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:32e6:6e2f:3645:b017? ([2a05:6e02:1041:c10:32e6:6e2f:3645:b017])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm896902375e9.0.2026.11.27.01.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:25:40 -0800 (PST)
Message-ID: <8d6f9b42-a7cb-4403-9718-e7752324b048@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:25:39 +0100
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
Subject: Re: [PATCH v3 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
 <20261113-thermal_bin-v3-1-878df6eef8bc@oss.qualcomm.com>
 <20261118205056.GA839455-robh@kernel.org>
 <eb44a4e1-fa9e-466d-9e97-f87f365ce44f@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <eb44a4e1-fa9e-466d-9e97-f87f365ce44f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wHddwhsslXecUOwhsX1PNrNw6A3XMP8M
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b094c96 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7tqQl3XV2vr3itYC2nIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX9NCAteRcpnuL
 u6YkYA2h02mufTIOpWkyRwtN/zrTBxBFsfKGZepEgBLZ1okaqv8+tOEj8kgu/KxP7d3xWwbQ/Hj
 t6PIZWL86xyI78VJ55Yjwg0VKb1Koso=
X-Proofpoint-GUID: wHddwhsslXecUOwhsX1PNrNw6A3XMP8M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX2dPuCVOBG3jR
 kWhdXhWsLrR8YEartjkroL+WhBobRuZVskxkEQxYsG7RvfMVIRHpZ3mvAqW+WGE91fSngnfO8A8
 FQS81TmFAwyyG+d2hILC81jh8Yju+RE968ct36AR9gTWtxLi5h1TSHAHMdxcz2daw8hh5dD8wBX
 OBL8oM+qr1RTUODG44rFGD4/CL6mJzAGTfZSYhIXyFyXUTrJsC+Mbgou6DAR7ChmoHR6LuIG45F
 oD/HZyEk0eAEs6I2o9Q4P4w/q4gQiw2lOuFrQ/TarypA5yFlbHG7qbQLJgv7M2j9+DOAHcZruZD
 hQvOfr8+Wed1xh6/ke0hpjuMFoOlg96M/sjGXQ7DARulETCxY4czrZaJM9B8FVyJBKlr5Qdxbug
 WvRmoQmkN8Xd39GZa4jZzhPxVa3NGJ5BX7BMiu3GsKLKU5i/rFMYy55WEyyVcjA48frdRLWWwQp
 DzvJQRCcaHSN3YQLtqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270037

On 11/20/26 07:47, Gaurav Kohli wrote:
> 
> 
> On 11/19/2026 2:20 AM, Rob Herring wrote:
>> On Fri, Nov 13, 2026 at 02:13:44PM +0530, Gaurav Kohli wrote:
>>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>>
>>> Differences in SoC packaging can be used to provide multiple SoC SKUs at
>>> different thermal and performance characteristics. The underlying SoC
>>> remains the same except for how much heat the packaging can dissipate,
>>> thereby influencing the critical trip point at which an SoC SKU needs to
>>> be throttled. This SKU-specific data is typically burned into fuses
>>> during manufacturing and can be read back at runtime.
>>>
>>> Add two optional trip-point properties to describe this:
>>>
>>>    - 'temperature-bin': an array of per-bin trip temperatures, used
>>>      instead of 'temperature' when the trip depends on the hardware
>>>      revision encoded in fuses.
>>>
>>>    - 'thermal-hw-bin': one or more bitmask groups describing the 
>>> hardware
>>>      revisions for which a trip point is valid, modeled on the
>>>      'opp-supported-hw' property of the OPP framework.
>>>
>>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/thermal/thermal-zones.yaml | 60 +++++++++++ 
>>> ++++++++++-
>>>   1 file changed, 59 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/thermal/thermal- 
>>> zones.yaml b/Documentation/devicetree/bindings/thermal/thermal- 
>>> zones.yaml
>>> index 999ad40a20d5..cb9a8c96d053 100644
>>> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>>> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>>> @@ -152,6 +152,58 @@ patternProperties:
>>>                   situation where the trip gets constantly triggered 
>>> soon after
>>>                   cooling action is removed.
>>> +            temperature-bin:
>>
>> Use the standard unit suffix.
> 
> Sorry, my previous reply was sent only to linux-arm-msm by mistake. 
> Resending to the full list.
> 
> Thanks Rob for the review.
> 
> Would temperature-bin-millicelsius work for the unit-suffixed name?

+1 that's the suffix used in the other documentations

> I’ll also add minItems: 2 and maxItems: 32 in the next revision.
> 
>>
>>> +              $ref: /schemas/types.yaml#/definitions/int32-array
>>> +              items:
>>> +                minimum: -273000
>>> +                maximum: 200000
>>
>> minItems: 2
>> maxItems: 32 ?
> 

