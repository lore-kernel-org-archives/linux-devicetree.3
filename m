Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781997;
	b=u1rLqVWjqihsJRELdjYKcNfw9kx5D05XtXA7VlXuQDg02eLk7kCt2S2RpxgTRGrdpmFc
	 RZLed/3bMfJAxQTmYHN50fb5ILCxn+Ubv1PlMbZcRgD3cCXXt3//xrjz2rl9gmxkd7sYW
	 7IIGtLhZW3HNA12sAzlz6eBIGFC02WRwBa377o+BlBU7AeFnoiDuIRAYDHDf5N2KaUgD1
	 oTQq4GrWONOPF2hU4LiBl7lXMhSxS9E3RaYdQ8udetkhge9hrPjSpSE84QM6FYs2TRrP5
	 SyaBtNGSRJQqxpOnGHxTJWhLFk9/y4pFLAeVwQiEtbrbj0Or7S+I992x2QQPsPqQe0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781997;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=;
	b=aNxLNXqHzWXCvEqBFsobdRz7eRrMcfQ+z+xE2culCcaAHMMrF6FueKl1CyZoi1H0D2kN
	 eM5vqdSzvdZhj9ChjR5bkJ9j6EByABnw6lT4dV+lgZnicKrhwX2BIKiFdaANTzmaWvKk+
	 gpq20aiBn8Nbvnp/BM1VN4yyEB9GWPS4masGtpZF3eRdTcoxCBoEWTk5QPvKBp3fMnuTF
	 ENCeVaKOsrie3dzNYg18EvQ4Gte64wb6yARecla740XveJBjbogL2RyrVzc+u/HkHz8uE
	 tCKJ0X4rkz6WHkAXBFsmfNh9f8kSUvXC8Sf0xm/wywNR5ZdHsUUyDk7RdLOY4gaza9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmLQF2gm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SHy8gpuu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D369606A330
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D369606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmLQF2gm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SHy8gpuu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KfNg1263940
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 08:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=; b=KmLQF2gmCqRZyP7D
	W0wtAFgQPucX2w7K+DpNWG7JGPJQYWUZamfyMHf7Zg/9TjmJAJBKvMopsfxD52BF
	KigubdaMNXRZFPI7L3Dg0Sm8J/+BuOQnNv4K9RxXnzESo2+dV637qCTd2DVOm8Mg
	RMIjgcxkSe+g3m6bsAX1IvtYUnO6cMNKviOhtkIQqlynaf2AGRg/TLDvVnYPfB6p
	pAZ3cqZB24qgbUXpSbXDxCNlbrqYLlIoFbICpdS+9nZTU/xh3z2N786YuCVHwqoc
	dgPR+p31yjjUqW/hdZQQBGNSIU/yiIslquwUDFC+p7/tBUWssBpVZ+ivPxzNJJXn
	ycozjw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubkq2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:46:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so974029a91.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781990; x=1794386790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=;
        b=SHy8gpuut0sZahnvSdzw1SMYXQJ1fA2dVO75eN+eEoUjNlE7GCeAkA+gKGe4u4rtc1
         MZtuQofM3pkyFGD+YFtiY0488Sd8RV60NoMUeyt7m3WMyBZRu4CxSXOq5oVWOIzAP3pc
         hZhZLS01AeeBqR0Qd6PBzsw1EKW5xln2QrnlVY1OHr4nOK/xQNOcGPDkkj7mQ+xbWgYl
         wbh9ev7R/QU1Rm0pYb+a4qDXXjG05BIZa7LSx/FJqk7eWLfKDt0dmrjsD2Zl7gQB5Uyn
         ejgh1WLuYaQn6hyGFNwZtxuOT7ngmV9qiIlrELmrwSPiVyZXMy3I9YEgosZwhoy6T4A1
         D8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781990; x=1794386790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=;
        b=w4xCJDD6hxwRo5cBEk+Dx7I0el4K5WZiZP/Sy+U6TqKmmy5r2SA1wuiBDN+TR4SDCM
         58uKPqYB+Whml0C2Q3g/N85kqXbPJPzr3Q5o5ybXUBJYyis/zGeRzd1CHUoYdZnysURB
         EV86+KIFAQm9820ohVzZz2KCPzbTh3GRQw5Qkw1WKGbV+5ZFqcR1PjO7V6EHlYXSxrab
         Io4nIDFgmKaCxwjCXCwCiLoVYoF+JxeVg2FuYj7uJCC8uZeb2z+u6zs2SmC2UCRBwtMZ
         LQkDb1A5Vjh34WWOjLAPQygffFVVdVNXewv+eS/W86RKHevGyhj7ejydu4Yuw+yQotF5
         4iTA==
X-Forwarded-Encrypted: i=1; AKwUvBwqqt3gHM1VFjP5LLXCfPJDf+y2bYPRrUSsQH23FvgLQT84pgPFzNQ1lKq9loQSVHoOI9RzY5pmUVNo@vger.kernel.org
X-Gm-Message-State: APuU4Z/mOuZm3uqSTphol0BTaO9npCDDaWE5DINMFiaUD1FO+8AoKdDr
	oNDekr6RtmjYMH/60HFKPlIZM8DVG66fvyzmI7U/uC6lXjbDsu+h3ffypEaTTx/7lIcQOUoeEyF
	ZbJMSPxHRsNhfyWntGHSyTM/rhauw7lmfA5zAqiYmxcR1IVBTIs3tgMqpkh83Wpv9
X-Gm-Gg: AYBFou3BBB4YL1bbGpQxyUPIdvT2PFpPrRhT8faGOjZyXfiivn4K2oMRKzjhd3AdKmd
	DLXzXVcDJ5gtiyc4Dcp5lse0CLSNRzYQHMKp1kBNv8TK/Hs/NsPy78IRvjw/UeHZ5+uIYy9nEWF
	HI2K9/a47C+VX+GFkeY1ROxPPx/fl7xLe0hgVMNhyM0PbFmw4b3Z0ZykA4rVNtD9yx8piVqBsqv
	4A7Q7GVvedKISRCs/6tPdc4lfzLercQxnyQpVlu2edOn/wZr/Qal01gLhHojFMQS2La6kXsHUPb
	nDHeAqBoK1AW8iSUsTaThOXv/gI2rDLe87qhMjsSg/hcCXAKD9cH1ie9xEhZt38WB6NwGITC5nz
	kmwPQm0MhGs1mrVw73jwniDeX1aHetNDSBfKg9ng+MD80kFM4yt/2KgQcLNajwg7AO2zSqNPiJM
	OVFdC6gessC4rToug1QqgC+Rg21Pc63LTWuA==
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr13607859a91.37.1793781989802;
        Wed, 04 Nov 2026 00:46:29 -0800 (PST)
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr13607836a91.37.1793781989166;
        Wed, 04 Nov 2026 00:46:29 -0800 (PST)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0951af0bdsm3130106a91.1.2026.11.04.00.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:46:28 -0800 (PST)
Message-ID: <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 16:46:24 +0800
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
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for
 resctrl
To: Ping Li <leeonion.muyu@gmail.com>, robh@kernel.org, james.morse@arm.com,
        ben.horgan@arm.com, sdonthineni@nvidia.com
Cc: andre.przywara@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261104081302.304667-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261104081302.304667-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX3cfAT8q4CGUX
 Z3GAtvtL001lGkHjWIzlTb8/57SX1+B1DlFe2zUeXgLCFyCSZ3CeZrOTTXv96lMY/d8XnN5OSK6
 q2YF7vq6Kzx+OjX9WDf+TwCfAh7SFUU=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeaf0e6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Nb9Ewb-VQf6xNOhztzAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: v6HA5En1ODO8nfP6flTwPC7400Di1Uc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfXyT7/Z4fFuacY
 +NjPPbMS6OwpSZpVXylCkSv8aPDtBE9v9tpzh+2rjcVeXPBSZlcY4uJm5mneKyeUFDZWhgIkgT9
 RVdP9OZ0tEThriobfugN70Przkiw0uvkny3vapRHuqUZbAqrQWiHfaG6IKY3TRIDLQbExtQg4d+
 S/oJptthj2mCWIn3IYGg0cJ2yoHu57r6Fs8Ur/3ka2AVn50bmDcOxiA77TKDRgX8ykOd1iHqFQZ
 YB8kX+biQvcLaersNYyBvPfcZUjakaTL1uua0QLPLXsp3AJNmzcHLkGWxfjDAsV3czYYV/DqUIz
 lmVNJLIH5nHt6hWh/+RFGM6TLLGKjwXvx3ledQTnCiwb4GbkHT4TMskqsQzEiXUPVOESi6fx/g9
 eBCBhbhFOt+0r2ldp2xwX59zGOHZHt2IRuy+/0QmjvxrsAvVNZ3fc5oq3S9mfsYk9erj5+Nicdk
 HoKO0LUHSmY6VS/XrTg==
X-Proofpoint-ORIG-GUID: v6HA5En1ODO8nfP6flTwPC7400Di1Uc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040034



On 11/4/2026 4:13 PM, Ping Li wrote:
> Hi Yin, Rob,
> 
>> Changes in v4:
>>    - Drop memory controller MSC patch (no concrete platform user).
> 
> We do have a concrete platform user for that patch.
> 
> On our SoC we have implemented an MPAM 1.1 compliant MSC on the DDR
> egress path, which provides system-wide bandwidth QoS. The MSC is
> described in the device tree with the "arm,mpam-memory-controller-msc"
> and "arm,mpam-msc" compatibles, and this patch is what classifies it
> as MPAM_CLASS_MEMORY so that it can be used through resctrl.
> 
> We have verified this on hardware with v3 of this series (patches
> 1-6) on top of a v7.4-rc1 based tree: the memory controller MSC
> probes correctly from DT, resctrl exposes the MB resource backed by
> it, and both bandwidth allocation (MPAMCFG_MBW_MAX) and the MBWU-based
> mbm_total_bytes monitoring work for it.
> 
> So this patch is genuinely useful for us, and we would like to ask
> you to reconsider dropping it. We are happy to help with testing, or
> to provide more details of our DT description if that is useful.
> 

Hi Ping,

Thank you for the feedback — it is great to hear that the memory
controller MSC support has a concrete user and has been verified on
hardware.

Could you share your DT description? That would help us understand
your use case and ensure the binding covers it correctly before we
decide on the next steps.

Thanks,
Yin

> Thanks,
> Ping Li

-- 
Thx and BRs,
Yin

