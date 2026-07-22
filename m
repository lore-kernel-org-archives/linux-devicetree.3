Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789B5434408
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708510; cv=none; b=a+uQbXEAGuPPBYmoZJiCw6lKTJmGX9kYiuetGORlbhEKzQV4yP6ijxcChF6x6h0zH1tAuBqkitzYqsAgtP9umu6kxSBL5sKTINYleUzBjw+cRkA9K39dHNwnAa0eqaRsIabTWGWXpR61E/oZs0SDibpS9/pm7AEn6+X4AJk06Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708510; c=relaxed/simple;
	bh=/IVqxM0aX7zPyUcIZbTda2GMsn8LN+JpCLz75h95efU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seoTdhiW61qP18SqS3/07hby1L2xAZ8j+3ipVxGKDjWGS2+nYoG7IHYFgy/KKf2PHVjMEn0C1Qu3ioAlRK5AglkV6wsB9p0QIXiXSYp4cuxM2A3kPZsXm9kKbpWbzRKhzbbtJ5+GIOcDC3b4TULVGz26VyYnQf/ZGFZpFOAx6n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjpK3QtR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvW7aq5g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjpK3QtR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvW7aq5g"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53lPQ3473764
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=; b=bjpK3QtRveDeMCC2
	K/RlkmR6v7hFM4AQ4nfyr5xKqFXdjAqgAQ4PpbQXMDBqjqGDS6LR/4s7nVJn5VXt
	IeGtUyLCV0Ht/eAgcnkSCpeWFkeEFXxS1KFTbDtmI3ahSEGXPI000LLSh2kXpbwE
	Pf+h2TGWfwXP4YJT5JWwjuJuxsEvinU05sqBfiU7ohAGo220zrImzGxyTO7WZMPP
	yZ5jDkqz0Tj9g74QLlidBioGgJ1yaiXUrq07o2WKoC2aGR4St7MpVuqn/GJOihyS
	akS+zBYi38aF4sP5vCdGEQpcYxx35z1aJUNws17dFDPOpu1HEoLpdGIY+NHJO2A+
	pLZpFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fu2ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:21:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso25407701cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784708504; x=1785313304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=;
        b=fvW7aq5gP0NVAzxqRjWPRkgB1TdEpfy5wJsYeS+t/UbpEbAhgJSSTO2UN6tN39wCAd
         j7DGIOx/L/jENLOgr4UOZ104teIRimpzewB7ROa9LxRpMYRAFUCu1mXsl6yKAhDuqbfS
         THLQTq1tQjxteD+xJQEqLisxDPMMg74T502XnUAdAQ4C3IRoy/APl5/iPbD8xvV0mCOd
         Gdj0z/u8+Id3SU0z9vzv2hzNzLe08RykPoYHku+g1zPcPx1k1+F4QWmHAbz0vRztTyy9
         YcRrD+CzIlVBUroHA6G0twVjFFOBIt6jCbGJu79NZpBn0Hw/jggEzzqXiEn3ZvmvafCH
         3gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708504; x=1785313304;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=;
        b=clKIdC37CBzXVMfIisTVnNe5KzPL5AJBxax4FYsParACdXrznhWqSMqvtjggsdXoex
         rQ0XNWtrVz04sn+tlb8maJy64PhEO3TfsrCciFBAmvUEx61j3g+w1M7HKeDf+nZkv1uE
         QfNvx7Kx0jxce535EuGWgxIdIHziJa4Y32/IBdVh1JbATYwFsn7R3YpN3q2RUxTmexlh
         xiThXq125K2MsS/HRpFH63EI5MApFcMjOmhVPW8MExhU/YrtnAxN2XSfziCAX7xMUquu
         sP6TzpXVFTocPrilfTHNv2uou1SgBwYAwwbAsdiBJxDFirpauAM89YGsLiFBKoXu6el0
         wLXQ==
X-Gm-Message-State: AOJu0YxwGoZeqvyLKhEAIGmmMYzB56p9x6ogrvSOjj8AL6vhf1oO4vM+
	BmEKNvxlDhTa3MnACgoHfQ51OLwIP7WJZdCm/8KzLca68tDgWIf3TZcLvT29yn0BJ38FU4ocg8b
	7OakqA8kODpXt9v5/GRE7Qz+UWu//GUjD6dChWpwYNASk2oxMOtTGoaJYCQ1qHHvgTEps5UlN
X-Gm-Gg: AR+sD124AdeicrYDVlVUV1pvoph5m4dudCjRwh03P9GvgAHE1+thGAHKPkaQk0tqBwC
	jPNv0Dt3C7nQxjxefi2fuPlQeLBVEVS1kljsEn9HnS7/8VRB0xBPTtnxtRFfQPhGTs3MuGKCjAh
	CVpy90UpA3ytmQ6rCSiwc9dkQNRrBJ4dcp4It0mu7FaffdnpUncFEgH+gzox5GSOu7nBRXCG5F9
	+r2SOMj8U3j8zl5rmY+8+EBaxmEZJkcProxpvX0Jo0TyZjoRYPahb1OJqYzcnZJVEj+4c+jU40Q
	wkiHApyO+mvxURcysQAVRkzHkes+qCONN/BjcNbpO3eQUN3kVwWR9+qKx7sPYyQ7LxuBKaLj3NA
	ekNqpGLRjLcvuWK7NBVt/jN092EavNw==
X-Received: by 2002:a05:622a:1a94:b0:51c:1bb9:137f with SMTP id d75a77b69052e-5213c20160cmr208790771cf.24.1784708503648;
        Wed, 22 Jul 2026 01:21:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:51c:1bb9:137f with SMTP id d75a77b69052e-5213c20160cmr208790591cf.24.1784708503220;
        Wed, 22 Jul 2026 01:21:43 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm3735346f8f.11.2026.07.22.01.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:21:42 -0700 (PDT)
Message-ID: <3523fefc-8ba8-4512-b088-7a94a2df73f8@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:21:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Jacky Huang <jackyhuang@nvidia.com>, joel@jms.id.au, robh@kernel.org,
        conor+dt@kernel.org, andrew@lunn.ch
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20260710054849.3178747-1-jackyhuang@nvidia.com>
 <20260710054849.3178747-3-jackyhuang@nvidia.com>
 <b707f061cbdfe52f8d72ccd33ec177113e20a5e5.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b707f061cbdfe52f8d72ccd33ec177113e20a5e5.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hi9Fy7i_So-JKSrN6nQ7HrmzTPqdpFUM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3NyBTYWx0ZWRfXyD0X5MnciMog
 uNds1sgWXO9kz6vebWRQEtdlw3ruOr0n9vTiXBPfySj4jb4pWgRDPrkIr04Noa5QYnsRKiaMkNh
 hKs40qVpqP9HYb4n/wNBGGeAUXZvZYQ3mJk1koEGNJDWiZIKiYTBG0gxh0gx7nKnYF5GRO4rOLc
 su6cIkQV4rBO03cNzO9n2fmySxh4mJApsvU8/7jtMzRSUlzT/wgGixzRPx4yHrDXMMj5kcv2PBJ
 i+dDWWAOkRvxSuCLUXOnKK++pEHxPz+y00J6+Udz59Fkg0RdZw0touVXYX/txhZXXVSiez+1Rf7
 hakZrvEMQifmHKjRGZNrFFoCFpVJPLI3bvLEF/PX/hiujh4s4ylUcH1DuVQUti1zfJqz42aldWI
 +WruozdWkdhyWGkaznDBSTyz3yYF//jVlodsVbUfDcLP4UQY1BftETmQRmgalCy0igE6pof13DO
 uJlzs9m4f1Q+88L420A==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a607d98 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=aghwDrSpn70jpU0UxqMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hi9Fy7i_So-JKSrN6nQ7HrmzTPqdpFUM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3NyBTYWx0ZWRfXwFyjKrdAf8we
 oSPu1Y6Q1p/FzLMe4NIQ3H6w/+Bb4f3NQccpGfqEj5D4GUeveVQbnJbLhzb78Qdp46yGeGrzIaU
 zCDbnzGAQHSmkyHWpkRvTbE6Wc3/gD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220077

On 22/07/2026 09:45, Andrew Jeffery wrote:
> Hi Jacky,
> 
> On Fri, 2026-07-10 at 14:46 +0900, Jacky Huang wrote:
>> Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
>> Rubin NVL compute platform.
>>
>> MAC0 uses phy-mode = "rgmii-id" because the on-board PHY supplies
>> both RGMII internal delays.  The matching U-Boot device tree does not
>> enable SoC-side MAC clock delays, leaving the MAC internal delay at
>> zero so the PHY-provided delay is not doubled by the MAC controller.
>>
>> The corresponding U-Boot change has been submitted to openbmc/u-boot:
>> Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang@nvidia.com/
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
>> ---
>> v3: reword the &mac0 comment per Andrew Lunn's feedback.
>>
>>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>  .../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts   | 901 ++++++++++++++++++
>>  2 files changed, 902 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> 
> We now have scripts/dtc/dt-check-style, and going forward I'm asking
> that all new devicetree submissions pass in strict mode.

Thanks!

> 
> Currently:
> 
>    $ ../scripts/dtc/dt-check-style --mode strict ../arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts 2>&1 | wc -l
>    152
> 
> Can you please address those?

Just a note: --strict might not be ready yet. It reports some false
positives which need addressing (I have plans for this, but busy with
other things...), so expectation currently is:
1. No warnings from standard mode
2. Review and investigate warnings from 'strict' mode, but do not fix
them automatically without thinking

Best regards,
Krzysztof
