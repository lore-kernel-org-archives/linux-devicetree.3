Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979470;
	b=gzm83Q5Sm2VrNYb9F1YROIi8hDzXjmejabxi+yo8seHKElPneBw3sB/Aeu7wE/0m5YTf
	 r2wenHNikAsNPgDi6iAIsSRmjGUtM+mFgHM87p0v6IlIFoib7dAGXPBAnqXRtH1EUvgCs
	 n15Aj6iEQMETl/IvQb/DMDVTq23QS45B3gOusIF2Jc8B4Nf0HmY/v/7ffQrDHOh0r0E+3
	 xbO38gBbc8k0xDyCSRhhnKncCvSZ9pcHJJY95sb+/lXPH5nZ8MJGf2uH3+xfZ3fN7CGn2
	 Q/9tPoLVV5oypk9MrLxT1uOuk0pDdvu47w4mc2MvMX0o8+tGY/REoo33viPRXd92uDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rDa1tTlXlIVUkY6LGmA3ONPL3YmHJB2Ffd6PDt7KNps=;
	b=S2hnyRWi2wadO3h82bR0A7cDCCiNDQMGjJUYtnJNeDWgeXQN5j139q9OVwRz8gPawJ+Y
	 tQxi0FCNpl+KNRUbwKibfzsuHNGQ5/BxUqwi5QPOYrNrI1quUe++f4jUNt0o5eLRGXO2t
	 UJffBzCYRvVyo8iyTsGFPkC2vRLOizUP5imb1m95oLvg17JIBv8opvKJFdgCNdcJEncYE
	 8azp+rEqB47RgzQIKHqft7ErTSbgqGHXWtpGB+RbiWKyo5bprQa18Br/mvlMSnLseg+lC
	 cTBXCREzdKtjWhApDJEwc500oUodQgO1kZXlegb1P0ySEKpZ51obpOo0eQeyzjaZYMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eDrIe/h1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcFvjiG+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B81606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B81606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eDrIe/h1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcFvjiG+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI5FjLX2349381
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDa1tTlXlIVUkY6LGmA3ONPL3YmHJB2Ffd6PDt7KNps=; b=eDrIe/h1HmIOKoVk
	+kM9SNQC111PrHqAVEZobsOf/0r25xUam3RDp0Jx8cHSPs33cHmGlTL5M3PPJgi6
	yWGgxiXhdiHcRuOLmge12ISL9iUBacGyeisMjleQ1kQgN/f6Zi6ZrJ6M7iCek/U+
	17cZB3GQIPtwtIatBJMotwXW5Aj/JLErvRTdSI5OShqSHM0FwtB3d0kSwe8+fjMD
	+vQ9B1qeix8jMuqoAiO7FasLc6YBBy2Gdj8TOXgKoE8sCZ6JPUiY/gUbHxQzirq2
	LOVJE4GbT4q3j3gniFtID9fPTv/hWEkkoz9um1d5IJV+LjeNdgoG4LhpI78hguvz
	8Um4mQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hbc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:24:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso451717a91.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979467; x=1795584267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDa1tTlXlIVUkY6LGmA3ONPL3YmHJB2Ffd6PDt7KNps=;
        b=PcFvjiG+t4rWu0i6m2HlPWslY519uaEs4ijq1ttR7EhkKTqNe6F+uLfyxdNNUcqmfz
         LoZQ7+g4Wm0rsflro5HebXxbFf7rJlsTSshy2/hON4oN7Gw3AqvbrIO/fvC4S7HKe+XS
         +TjhrdqvUnykfU8JWBiSQI/O1whFmaHKEoDezqzLqTvvuj2Tc2+ZBy1qV9KOFoHHRl+F
         raGdQGYYYhkQ8Z/mSzYCRG5HiuF94ObVKiYOHVSzFXn5TCojOVRR2Crnuo1ieSp8DZk+
         LqWkNnveuvKy/Gj8a0YgQDCOowrWsPq3frffkUnkGExLeX3QI4hOQGWuQkdUtmk17yEE
         qjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979467; x=1795584267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDa1tTlXlIVUkY6LGmA3ONPL3YmHJB2Ffd6PDt7KNps=;
        b=lDouALPMk3qP6A1GNvrNzlfYxTG9/zwM2hk6e6ePA1rcBg1y8UYcNNnkMwJzU24JGf
         C49xyElZPARNezbFqmjbgf+jo5telKXNUuB2vuhnLwqSQEZJMxrowPqFH+7FRQZpcV40
         Z+++YyZ4s9WWy1a3l9BHg6n8VKGG+RLp8EIOhLuGMO1H+x1T2vo9s9vsNEM8uk3gyE4j
         1hUGBBxqhZRVtuGwEgRNRwXzA9xa1aKfJHSESs1fMntnFbclSmx3NXFrjPGVzW1lByaj
         9NCsyT/EajWBLLA/J3AN0160E8/4tY65qtSaheCWfmNjsHTiShiZZBzZspQYDi516xUc
         5XyA==
X-Gm-Message-State: APuU4Z+H5PQMeC4OYuNBFeohmQJ/mh5PdF3e8ZgY3pH71xVAyhqMBx85
	Ll+flhcmEoooqSKAvGIo2Ybzkkd1t994bFJdRDInRgJHcYcd2AzOHZ12s/uoEbLAjNsdyDSmNrf
	7THni6jU7un9esWcgLYHqXIbVq9ffnKOuzSpyD36x4BXqT2FArM2N5+ndLZLoiQf/
X-Gm-Gg: AZFdTZdcc1U3HJe083yaCd8s6Up/5MRc+zU99SMAy07Q3LHg9byPmkTw6LZs7KeYGP0
	YvglRMNarltLz7BEn/hfNj1D8k+6gvW2Mlmkp79yGUbOfHzINOXma1TqU97Ju0HhFE8Upnz56Uj
	iWbe20MEwu1bWfwsNpzMoO8pXaLlFpCDk/ssFxw5Js9WcGW7+5466jTQjRs33bPJjmZFrRTgpGt
	JAwQm+yVhapYI/MZ6wSk7BpQ6g6npj+rp2s7EhWHSd7n+wuZOc/TgUp+7i1kLBpbVXsXYwKcOUL
	k5oaETJG+h3wZyt2p2b1RicAjr/jEJ2OweEdGtNypLyYkC0cyzTHPs765Uem90M7qAsMo2OFDVt
	CZwG+EEhOr9PbqXD+SycUSdSgW4Sp6+vkdLF5xApxhn5MXnkEKiMK19ftRjULWvjQ0mG5L2KVm/
	+y/yn4S+5dAw==
X-Received: by 2002:a17:90b:2d86:b0:3ae:2969:903f with SMTP id 98e67ed59e1d1-3b3d07cb3b0mr1645561a91.45.1794979467297;
        Tue, 17 Nov 2026 21:24:27 -0800 (PST)
X-Received: by 2002:a17:90b:2d86:b0:3ae:2969:903f with SMTP id 98e67ed59e1d1-3b3d07cb3b0mr1645545a91.45.1794979466761;
        Tue, 17 Nov 2026 21:24:26 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm2203083a91.15.2026.11.17.21.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:24:26 -0800 (PST)
Message-ID: <94b45a52-7742-424d-9d4f-ac2df24097d6@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:54:23 +0530
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
Subject: Re: [PATCH ath-next 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-15-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210942@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210942@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y-hj4079wyav8YmaIp6x6u0ousNZ0XsX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX0CBxUfOn8XR/
 f4W766TZM/0MqSUlQzm3U4RWr7DW0uUz3BfItssGt3il1yGr5tYRObck5DGca+h+vwrtrvo9Y6S
 VPem7g+4ISVFpKC7O4jte4g6OWHVL48=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd368c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ghQirqQZvRoX2FQxpe0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfXySAUfM53U2QR
 NLs1l4Y797h7+ceYRc6TwwTdl6gL9f0o7x0EbTelhEnuSMbhjEEiVDUwE+KH3kfTGu4sjSZ5gQ0
 t0+QZkREbd2pMz/2PmCHVOy8Lfo3MEc8KBIzOZmzOlu5EEto7m5I6w7uU2M8YgR3FQGxrDfICkI
 2bhWPJXt819UEdXGkuURWfzFk0KxqFq7+oQt0wklSJ1cZH7DjnEKPICsM9vdocbBBbUgR3Sn1Wr
 WHc0nVj+Brts2YKy9FraA9x/h5NjANeWiVeicXMRM9O7ffCW9u5ciOouq8mY65PXM48+Iu/xnTy
 1sNA5FNKs0ZR+KUFZQAy5KKg+ffT0PdzMze5AAQ0e7dwptSzVUdsCAsGcwAUaoQplLMnheDSg2z
 vHPtrKO/GF1iJ0utMOzrVhHBfnC7t15dB92kfNUpSMna/Q2BWQVqrG6eTE4tgxxiFBU+BG0AxmC
 X2nRhRvnBMWWylCgMFg==
X-Proofpoint-ORIG-GUID: y-hj4079wyav8YmaIp6x6u0ousNZ0XsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 3:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] wifi: ath12k: missing arch_init and arch_deinit in
>    ath12k_wifi8_pci_driver
> --
> 
> commit ad19b62d9fe2e5840dd771d3681d43b9adc7965d
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575
> 
> This commit adds QCN9575 PCI window register constants, implements
> ath12k_wifi8_pci_probe(), and registers ath12k_wifi8_pci_driver in
> ath12k_wifi8_pci_init().
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
>> index 3975081d167b8..fd0489f8333f4 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> [ ... ]
>> +static struct ath12k_pci_driver ath12k_wifi8_pci_driver = {
>> +	.name = "ath12k_wifi8_pci",
>> +	.id_table = ath12k_wifi8_pci_id_table,
>> +	.ops.probe = ath12k_wifi8_pci_probe,
>> +	.reg_base = &ath12k_wifi8_reg_base,
>> +};
>> +
>>   int ath12k_wifi8_pci_init(void)
>>   {
>> -	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
>> +	int ret;
>> +
>> +	ret = ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
>> +					 &ath12k_wifi8_pci_driver);
>> +	if (ret) {
>> +		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	return 0;
>>   }
> 
> [Severity: High]
> Does ath12k_pci_register_driver() always fail here with -EINVAL because
> ath12k_wifi8_pci_driver omits .ops.arch_init and .ops.arch_deinit?
> 
> drivers/net/wireless/ath/ath12k/pci.c:ath12k_pci_register_driver() {
> 	...
> 	if (!driver || !driver->ops.probe ||
> 	    !driver->ops.arch_init || !driver->ops.arch_deinit)
> 		return -EINVAL;
> 	...
> }
> 
> With both callbacks left NULL, ath12k_wifi8_pci_init() fails and
> prevents the ath12k_wifi8 module from loading.
> 

This is a false positive, since the DP changes will add these ops.
