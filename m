Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987218;
	b=sHvAyeKDFvsAK10jRKqPnQ40ma3U1FrYSSzcrNuHl77gT1WU7GwFDFK/p4H8tkHxBjc9
	 MCJSgxQozoJN0LCDF9SOdKCFcwqSUpALMNM2OnmvLeQm8HIAcs4Snunv2zdS532u1/SGp
	 BY/H6GZ8dXEYmnqHRV54IgLh84j+DHJ4RoeptttcHBOivEfSkWhB7hycsh3WFn+qPEF9z
	 UdvXDZxQLw4PUumH5fOy61mVQMxGMnLyQiTTug1RAd6rN7qUYS5LIowldGASnx7481MuG
	 u00y+185ea1tNQq+9CUciCOrsV6OtiTjIk1zn1n5D/FfsElktJAeukQIU3GYvmhtWWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fKiQf0NBcUBsU2pcKcQNNnQnxuzDCkqCYxmq+8T0PdI=;
	b=ZQnYrLEXcSeISDCL7dlOQfPmxyqXCb3CrDjskzqeEbPW2NtdF/jYNohihWJHk5BIgqCZ
	 ztCcsejU/8Fldd3+rST/eINmLAkzylREs9m+t4UpXY1iMTO4CYnUpVzQaOJV6veHVG+D3
	 24AhaKJTac/xIDdldoC5yr23c6QldBCGoglOH0CySC/l/BNhY4HhkrA0liD1YMYRbnnfm
	 YX+PIDxogcDsVXflYuLa1vToa/3KKiPGNfKm4NXW81L390F5Dq6NZcHy0ts/v5R5UhYC0
	 cajzsK8ykqxhAf9YXiBsMLDZC/rqZi3ioCNkpIKNuelXvbnjOIB2M8nzxijDwpXKMeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTrpUWTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuKxOopH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D366606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D366606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTrpUWTA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuKxOopH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1MN3121824
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKiQf0NBcUBsU2pcKcQNNnQnxuzDCkqCYxmq+8T0PdI=; b=dTrpUWTAkiaRQcEq
	QzzQnlzKTT48wbMM/ogzmRK2Rg1c75MStcXKS+eS4QoBa5WY/s86QC7C069MAiob
	K4Uq/TS40RNvfDKKmSHBftY121sqlfUHFViQxi8rVDPRwFmKqe1kZbHfapR3rQvM
	iipMjKi2lO+8cJYl4GdmClX2g+09Ml4lrIOdWbkc/10hTKF8dufXL2j9LSRYm6wN
	1S9sNhvPDAEhgSEXWvU8bFkKTQUp6VR9AxtFaz++BHRDAGnbICQdvTsO7L/k8BgZ
	Fdv7n1eWpdBjzb4gmOEYb3k66JN1NQmpP3kl+t/14ynb+Qu/WVYR1XwZRXtu4OZl
	rLNUQg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hsvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:33:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso424249a91.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987215; x=1795592015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKiQf0NBcUBsU2pcKcQNNnQnxuzDCkqCYxmq+8T0PdI=;
        b=cuKxOopHBmn4XPkeJeWs02POvNjhJoUVEiuBzWmrWUOB66h5qj1pWilC7xMARces9H
         DfB86yLxIKLEgGuucfhVUGomK72CwEWZO3V9X/fs50i1ziVgzYJGNFhq/jQV+Zg+Tv0N
         u0ebJclBSvsCXHcOD9kQNTqRbxGJC/UkFeLYZv3lULYQj7mA1Re+5cgGAFf4UB+aOSe7
         XfjgAJDXpP5w+2Nd0pSASZfvXvdsKBblmCGbwAvvE/PrBuPbIFYzT/FjonEUs7Pi+jL4
         q92LMNax7AZTfyWnYw3rDoxJdXHhXiolylSRQE3vJyg3Rc5i03gZPCX1DxkbZJyfN/Vb
         Ce1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987215; x=1795592015;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKiQf0NBcUBsU2pcKcQNNnQnxuzDCkqCYxmq+8T0PdI=;
        b=TPHp7Vk+96IZ7jQ2V672t0i65ICMQ5xwB0jzbRCGGpGMVfXGm+DUpokf9N/Wi+N+Gy
         GgyfG09AfcCbayqprXZ4p990YMCMCgNIb/oJVQ4vE3hJJQC2wxbqFpay+mIw3VYjVCrf
         NRpDcu4ixj4bkX7fSYB7XbYL9ukJkiJSpq2ORA4v+yO6px6x5JT8mnJ6IzCnJYvOHHfi
         34xBKLGRs30FwQf2an78crDiiAwkgpRSsUvXlYhA3q96KoDqJsIn9774NNaPHBpfasTE
         gdUY4UMxWC92D9K//kUp4dLODhxBLG9TPYE7ZZV/0j1QvwsQ/svNWQyz1QweCW2zlF5s
         D/rg==
X-Gm-Message-State: APuU4Z84X00BRwkoZijPNlOP00z6TsLHbU5AEl9nu4qOjevGmCk8TZJ4
	0Nny4ILP8IB6FONaaWYg/uiXyx9u7rAkQAc5BkfbFyHHJ6CzwPIr0wElPyGw7mLmoCLru+7yMZ7
	OE9sDX+3iyJEShRe5aCFCIS2cKPLazq0aAvtMMojYNKNggP5RkTk/wzxXKaleOSrHCgpXbP8L
X-Gm-Gg: AZFdTZfvisrIhd6JOT9L5lPBAigC8WH8ChUN93Z5fvruxRuAt4NCjt8vRd3JiOUHfN0
	Wki+odcGJtAfeBJEE5zpKsp3xn3C/8KICaaJBBKePNJ76Wjud+jZ6blMz1GFAo/nX4mLhxlQJPS
	wV0cNeoFjk21mPHn/hZu2cawO/HwIPqrkD554Oew4wad0Yqu8B6BxnwjQcDIa9B7MKliyyRX6DO
	IaZnzY9tczBQky5v6/JAKREvMmsgwjH3RMBCvKIPFrLgdtH5mzUJS0btWdeVTG5oeZPP2+ONpH8
	PSdQBXl5At5qVivIHw/DJjMUxqT3XhDCYf+SYE/zn2KuRA0atWf4A5L5EP5dBt/NS07zmgFLP+w
	fOeMDuMnIlsuRnAbaMr5YSEVelPg79kMkd1O/Teh8FJxluClJjNSUmI220h58NB43hAFQuP8TNs
	qP6sDEg+lttw==
X-Received: by 2002:a17:90b:2243:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b3d07a44a5mr1948877a91.41.1794987214681;
        Tue, 17 Nov 2026 23:33:34 -0800 (PST)
X-Received: by 2002:a17:90b:2243:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b3d07a44a5mr1948847a91.41.1794987214019;
        Tue, 17 Nov 2026 23:33:34 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3056463a91.14.2026.11.17.23.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:33:33 -0800 (PST)
Message-ID: <e085eb40-64fc-44a7-a2e1-45209c73752e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:03:30 +0530
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
Subject: Re: [PATCH ath-next v2 02/15] wifi: ath12k: refactor PCI window
 selection to per-device layout
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v2-2-d81a3046290e@oss.qualcomm.com>
 <sashiko-outbox-220253@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-220253@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yGAooP1sBtzKcmSpAD5m4jERTtha9h1b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyOSBTYWx0ZWRfX++gvnTzBjBe8
 PlmjiACI2TxdN69pBzYKWlmbnMxsVnus7KAAuq/wIl+v7tL0ajtSyIXEANg5tZ2ShyA+gGHfbVl
 uHh30SUf6DvLvfwfctR7E2ylTJoxWG4=
X-Proofpoint-ORIG-GUID: yGAooP1sBtzKcmSpAD5m4jERTtha9h1b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyOSBTYWx0ZWRfXyhcXM4gMPR3q
 4yodry5IdeA06HyY07+zVj4lRd7/ENeuoPJVYSvcCnUUDBPQmabkXmPhaOXOQ9jjNzie6N8U9/j
 hMxxLZk1fsDpPTK9bmC38k1fp1/3JOywu9MJT3G7b7Zye/DQlSNzxiOfr49/tZKruwyad/n0i5M
 YDHdCkK8hTm3xKWRNLQCk37Lo7CcPY/cYthrt/NTtELefHnX5d35I+fdt8kWPWIDba2WonRz8pp
 HnmBmE05sZCj5iDMsWCJT9ZaDk2lEgBZ87wPwcvCdvkO2HhPTv9RO/rK1vsomW/+Pu3+fSjZgvM
 vJANwdTMCVWEZ5ml2vJITvtontvIZlHrQlwr1ARC5DbgoqCbxO/yZ0W8c7ioifTratRpy8XJL0i
 5WlM62Qc97hbK6zImIOXgjBg30nzdHWkOhLq7/cSp5Em49dBIw8lqPXkAWovbMLcfnmIWP5fHsr
 1QluPaebbKh9yVfQw/g==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd54d0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WK7bwhHvCB5DiU98bBAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180029



On 11/18/2026 12:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] wifi: ath12k: runtime mask passed to u32_replace_bits() in
>    pcic.c
> --
> 
> commit fea0a3bf22c9a4872fcffbf9f6c11d790f370851
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: refactor PCI window selection to per-device layout
> 
> This commit moves PCI and AHB register window masks and addresses into
> per-device structures so device families with different window layouts can
> configure their own mappings.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
>> index b6d306fd3b99f..c10e21d688303 100644
>> --- a/drivers/net/wireless/ath/ath12k/pcic.c
>> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
> 
> [ ... ]
> 
>> @@ -32,20 +38,21 @@ static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
>>   	const int max_retries = 10;
>>   	int i;
>>   
>> -	window_bits = u32_get_bits(addr, WINDOW_VALUE_MASK);
>> +	window_bits = field_get(ab_ahb->reg_base->window_value_mask, addr);
>>   
>> -	/* Update window bits [5:0], preserving other bits */
>> -	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits, 0x3f);
>> +	/* Update the dynamic window bits, preserving the static window configuration */
>> +	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits,
>> +				      ~ab_ahb->reg_base->window_static_mask);
> 
> [Severity: High]
> Does passing ~ab_ahb->reg_base->window_static_mask to u32_replace_bits()
> break the build when CONFIG_ATH12K_AHB is enabled?
> 
> u32_replace_bits() calls u32_encode_bits() -> field_multiplier(), which
> requires a compile-time constant mask to eliminate the __compiletime_error
> call to __bad_mask().  Because ab_ahb->reg_base is a runtime pointer, the
> mask check cannot be folded at compile time.
> 
> Updating new_window with field_prep(~ab_ahb->reg_base->window_static_mask,
> window_bits) | (ab_ahb->static_window_reg &
> ab_ahb->reg_base->window_static_mask), or masking static_window_reg
> directly as in ath12k_pci_select_window(), would avoid u32_replace_bits()
> on a runtime mask.
> 

u32_replace_bits() requires a compile-time-constant mask. but 
window_static_mask is a runtime per-device value, so this fails to 
build. I will fix it in next version.
