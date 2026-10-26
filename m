Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015501;
	b=HHzz7PSIzvBa9XsC8Y6riiK50h/4M7TdHWNlormu261v3QpPciWrghS/zY64S/rRRBzB
	 iVjC6UfWkDBCwZ01CZVJr/w9nUKi1yki5HBIO5Td8AUrT/N0chRCFgg+tkM7SLrEzm9H5
	 fM7yvZljCt1ASqII1ztyPAnd/EPVXAi7B22hH1qm7i8S45b65+hIB1XU9ESVBA/RcVKdN
	 FzPBrpW8Y+3afFKXx//9IIWxcQsqLt2zwoBbv0gq2Tn4Uf5WxHithiyYMPYNQyhvrWssb
	 c4UrCQlKc/pOfAQJYl+NZoQ/MtwLvGrV9TUXP/EFS/5IX2dsLs+yW4tUdIZeM4NBL7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015501;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/DFWAQQY1zY++oRBXWRTyotn7tN5airZcvKlxRljH5Y=;
	b=X4icYDCzd3mZ/FPbShibXeG285Prlv6Gz39BJZXx3PB/vGrmRq5hQgD3fkTJzpU1bmk9
	 u+s/ofnvPhGxfxPpXmyBrV56veaZ8lkDHIFZaQ9OmsbEx+wQvCPvIQ1AQv1fbV1rxt113
	 YGxVOIGOFmQ9uPY+lyFslS9fMrx3CwqAsP8vpqhaxD9yOUAdWqBruHnNocDfvupJszVrf
	 MQA2JC+NJwwQd3mKHDqT4CPlePP7r55TPwUu51pyJMN67bGBAcKZi9kKZPrNDjx+q/ma7
	 Q+zO8UNvfCRIt5L7Q/GseocYSlMfNE20yigbRU7K1jHyLwTn6YaFvpUnOlCoz2avj+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UnU7jHou;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhTIZCh6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E73F606A324
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E73F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UnU7jHou;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhTIZCh6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtDhs3633582
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/DFWAQQY1zY++oRBXWRTyotn7tN5airZcvKlxRljH5Y=; b=UnU7jHouAnx1JUOw
	nwRKhafg8Pu+P8w0LFnzR4p4hgbje6zCIbrgvVtY6WllaFAHE6pz31CmL7qzb/Hr
	xYigkiYqBGUbqpH1iAKg0vZBR9MBwKLvvzIpvyOFESR+kpMxRlh30ZD788O6LrKa
	cOBaiFhwJFp6bq2BGL86XqY2qOIW0c0Dpp/ILHp3mC6BpmRg/Gja0PsFUcXZoh4C
	AHDpct4hvtMZYVIzX2HHcrYrXXdWQ7n9A/ZMgOVOqqbINWSqeNUw60t/tAMFl92h
	OSXcQq40gXSPGZv2Hke/dMmFmAs5eNymYfF7gRFZkNgOzbR1hEBRDFIEId8LXPlN
	RLVpkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0c25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:51:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so38626385a.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015499; x=1793620299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DFWAQQY1zY++oRBXWRTyotn7tN5airZcvKlxRljH5Y=;
        b=hhTIZCh6hhFn0UOPOo/9DEmTBg5I4kjZq/ERm+Je3yju3i0l7WWPYieDRVKEmTzMjF
         MwWP27FLljyjcQF9cbNLsbM6A07lzcyntZIP1+WKp+7ck87fQeh9sVwTMLFiWWnzHO2Z
         huFUh5UAr8bi+vyKy1IPzSwQfATFLhHm25Wfi9AXvX8YRE7L3YdPgCPeTvL2bZoK1PcA
         0D/k/Gvl0gXKP9O2PBWm7P0jqRT01fnWH23hyE8ys7SiUYmQkZ1IihCm7nHVBF9qnOrL
         rioJR4wEPVXbkER1qXAkC9RJj01ZcbJRvLO+uGMGks6RdN75KmxjjddHt+btr6MXThoG
         /30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015499; x=1793620299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DFWAQQY1zY++oRBXWRTyotn7tN5airZcvKlxRljH5Y=;
        b=J60TNY0r6sLlWZOSTK21rRM21i4Gecvf1jY3QaT3FKPQGNGaA+wJPcSqaLW0dr54p7
         CzpBSw8ER/8Pqyrk1pRLywgYEue6b/q4FZuLSxjSP1+uOTFgNQyBPnhz+xqg7arNdgni
         t+SBv9a01YSWBQxh0IsnVgWtV/L4LSj1ZRAX3/xoZS9b03uj6YRctPB+kuGfDxAWuq7e
         X2QhcyUioSfOYjANqKQfrlELJQBQjc3yXvnnykF2ukGvqvz1Ia6pvRYw9rPKdXg3dK2U
         ufJVYQ2LhA4eCA6oRcUFBwLIh6+5WV6KX4d5kXuKV96PY4ydO0/KV26dcZAMFOTWYvqj
         9l2w==
X-Forwarded-Encrypted: i=1; AKwUvBw4bp23zajTALrQ9gzk8ASHihcWwpt5E5oyKIgy3AsnK9e+IAmv3jDmaM0FRckeZSHd4k4s7iX6JbCd@vger.kernel.org
X-Gm-Message-State: AFq9FYLEaDTIaquZajjiGwwiQIC2E24gvHxgrSwWW/orkDdrvHGnYP3b
	rTYAcAKUIlpkuBJv4H9fmPcaMZdD5o0rrOILWMN5+xh+3Zn8POOKkUcHvHX3ltuHIZ0GEXAs31w
	f2pdoEpulFbvLlziIlBrgY4HbrZyxqCLkKDUPuHnj0IJokxiaxUf/NExH1w4WK+Lz
X-Gm-Gg: AYBFou2I/VuEhe0ufC5XWAtaiHUIA8ZD0VVGNTwbEc6c32oY+w++eYfH+hyzBOUNozg
	pPLtQMtLeMrAi3PeesuvGfHowFS1MImUvpej51xVkrYiRfMbJZ0X9apaWGwWjWImIQZy1kd6E+C
	rE5EaoHOAfGFEOLGHzcSeut3tBNIAbrU8u2FLuzEKaZmJxLRJMhKc0MOM7EmaIF/23sBpglnpEX
	qa01peUFOoCoeydkbEb07pAxGnUa6lV1a3/gM8mF2NokUzGj23b5+icCTdwA85MWNT20NFGoJiM
	yy4LvLg5SvLm4OtCJZGEwOlAvKnpqvlW+wFxPcnbDn4oss8z+tV/08QY/dKxLWXAYJPwvy5RVTO
	xiBeHDJPOZqoCWlkX/ikAFQ==
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr1000467685a.3.1793015499109;
        Mon, 26 Oct 2026 04:51:39 -0700 (PDT)
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr1000463885a.3.1793015498587;
        Mon, 26 Oct 2026 04:51:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9968sm310083866b.17.2026.10.26.04.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:51:37 -0700 (PDT)
Message-ID: <e7788a12-3cad-4bd4-9f79-82cd118e0049@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:51:33 +0100
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
Subject: Re: [PATCH 4/6] thermal: qcom: tsens: add hardware-bin trip-point
 filtering
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
 <7cd708de-a58e-47fd-acd4-0e37be77de92@oss.qualcomm.com>
 <e832301a-6129-4697-a5e4-94671072622b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e832301a-6129-4697-a5e4-94671072622b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX0PnHFgTTAqk9
 512B4D6PkI2+cr1xLAjuQHr5fV1cMcHpEW1DhyzMPZEMz0eJKlZVxhKtjV0ruyFOvwIzo92c+/E
 0KnUfw2P4eBH+bvjbNmv/y/mwBFOPks=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf3ecb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_EuTZlPCPfvd7hdiCfkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: aXme9ILh10LMBZnk2dnwFyV5ss2WV0Em
X-Proofpoint-ORIG-GUID: aXme9ILh10LMBZnk2dnwFyV5ss2WV0Em
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX3+L9SwgvdXdO
 cTCW91rXjzUfxA8GDQwuVIr6K+eyF+p8IMpZnNq8vM/KTd3919ngh0+j3jwDtIXxfbiojnT1C/s
 ShtSrpLvtLLGBaxjLQz18nB3YlBIGiqgTMzNFg92kGipy3rcGbCbsMKXihRUbQ4QHzLtxbQgI0Q
 6Gf9A4NgMUsFD+zWsgn0iBetoefLo9q9hMXYR5vRSHAieyasYKREeCAtayAF6Y+4fhLyjvs5g5h
 VOsHqeco0hKUEVhozSc4/vvcj7YmY233XzmhgIZX/uLiqep1NO67n1CC0SmxE/SpB/dO6BqFPvm
 jitNSTmOELgwug6Fg1A6UB7tIAYeIpdKX8vNG+8htzf1PmsuQ4YtNRXIDAIBJnJ/yzEUrguZKPE
 jQJExOazXR8mEY0206i2kzQkHJuF9rl6ufkh5sC6omdTnFwnIcmneS/SZQQLiEnAa/J1yz6ExTD
 lFP61xF4uDy21al5Pjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260047

On 10/23/26 12:01 PM, Gaurav Kohli wrote:
> 
> 
> On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
>> On 10/2/26 12:46 PM, Gaurav Kohli wrote:
>>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>>
>>> Some Qualcomm SoCs are binned at manufacturing time and expose the bin
>>> in qfprom fuses.  The thermal core's supported_hw_bin mechanism filters
>>> trip points by hardware version; wire tsens up to feed it.
>>
>> [...]
>>
>>> +    /* Hardware-bin values for thermal-hw-bin matching in DT. */
>>> +    const u32 hw_bin_std = 0x1;
>>> +    const u32 hw_bin_elevated = 0x2;
>>> +
>>> +    /* Higher thermal profile identification for qcm6490/sc7280 bins. */
>>> +    const u32 tsens_chip_id0 = 0x197;
>>> +    const u32 tsens_chip_id1 = 0x198;
>>> +    const u32 tsens_chip_id2 = 0x20e;
>>> +    const u32 tsens_chip_id3 = 0x20f;
>>> +    const u8 tsens_feat_id2 = 0x2;
>>> +    const u8 tsens_feat_id3 = 0x3;
>>> +    const u8 tsens_feat_id4 = 0x4;
>>
>> Isn't that (also) exposed over SMEM?
> 
> Thanks Konrad, for review.
> 
> SMEM has related socinfo data, but there is no exported helper for the
> exact fields needed here, such as feat-id, which is also used as the bin
> value.

Is that different to qcom_smem_get_feature_code()?

> This jtag-id/feat-id decoding is Kodiak/QCM6490-specific, and the
> thermal-bin mapping needs both values. Other/future targets are expected
> to use only the generic i-temp fuse bit, like Hamoa.

So there are variants of kodiak that ""incorrectly"" set the feat_id?

Konrad
