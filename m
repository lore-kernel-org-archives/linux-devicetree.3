Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478633;
	b=Ogsp5gPDFh9nkVoTz9uigke62YV5soSA0JvHQMOxdi/D9EdLM85x+tbfrYATRelNfevr
	 eBZK87HOeC1RNABeBlsJxJaNWanRN3vs4Db9JevT8vDZE3MgLll9AHT/U/cOBjptHkS4Z
	 5NHz9CQ9O+2iEgPAi9rGLEHiRpScngqlngKqjOic/IHvNVWKK2I85QFCrp4RIeR+TwJMW
	 dM8F0NPS3GTuSyCIR/uwGZN7njS0IEpZrHjtrQDqj+XEVxap6R9KmdKK63UzhfSMKXaLN
	 V2BkxcXnbD2A7EfqfnZ7I8+3g6rX+FBAK21A+PdemdMZGqZwPTxMNfI/0EbF2GZynng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478633;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
	b=NCAKiitOt7uyGQwHz3XsyYC1gv6gyNBTUxGolNWQC5CWNI/fADQavG4X/rWV29otUNht
	 ozaOs2appKVv+jn3cclDHBoOJkQNvJkRKShRDPFB1/4pIKDJ9n2MuUQeUk3vGSlRImQfH
	 d/qsibCcBzohSyUtjSvCAsz8iWMQq8ZaQtbFsUtPVHC+L6S3Ry8O3nCVvUotUgx0NZH5W
	 ymqtywlL18U3e/zqy+/n5/5ozGGeFMYRfgr/L54g9rw/vYNZomJmZKbaoOkUvKgjefj85
	 lnRvezhzCVE4E9Rho4/bg5+uk0iXQog66oYbtN1ZxMtXv4m1t0i5hBQGCX9/xBrmEGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuoMsK2Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIrkshPR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14D9606A335
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14D9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuoMsK2Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIrkshPR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53pLu3477109
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=; b=cuoMsK2QqykoR7R8
	6L6tovW/5kKcFiHKGoeF/zGkyc8yiHjBN4zxhG4lpfwmKTADmeBJvLjlqn1wFgby
	ZW16DLzStFBzK2hKfmp2wSNLRqP7NaJsBqfAyuvGrHAUxETa40i9k14uqW5CjYI9
	olfKmp2PI/uFMst+d60L3WFsLg1jd6TEDRDp5/mRLVEHLUjsN699RDodqIdL5t2x
	ZFIQG2mpSfxZBWgy3ztyKZx59frt8xLY33sxbYoQpWHMCmukv6774EI5UcDW15Qi
	teAz9b67TsiEG/x3SFzN4IsvGQwf6ihLdMdPhN584sV+A77TUr0x9DOsyM4Ja8D0
	IjrM6Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuh2u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaae8d29e0so53813465ad.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 02:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478631; x=1795083431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
        b=EIrkshPRJ0LvFGP09mc0HHQhVrKtCz7tk5/lmiOVPLNmAiQbX253VFKcqPQ8NxAB2W
         viMnfF7O15QmTrU10z7cPhfXLJ1+ao23R/o3mLYFaCc5Qwy7jCOFoyOYndFjUcKPbcjE
         2SeueLm1OAbiytwuDHgwKCKN4z748CF4mjR3PSzeOQoDDZv27GG4Lzzpr2c4IpqoWpZ5
         9aLriK1IWkk45S9tlm9uZ9f15mUCcLN5Rc7025KGNb16A1QDYjB7mbGAaVHbNqWcmsvQ
         F65R5Q85+aFUW+9AsTCV0u+heMyO48BRWQ+z2RIDxGXUOid5RWPKAT6Gf4XILiUljqpn
         Gdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478631; x=1795083431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
        b=n00rN/RV6ALKyBaI623ztZVdkRKpY7EExHrCItx7KtYMN+Zi6AT9NznqPTq6jb4LOI
         +v7pdOqnwqnVKLVFG2CNo7PoUsIiADHaVVVxkn/AXHAPrIzkxm0CBD359kJhRCewqWmH
         VfN2E0V9A5oiODNjp2loEV6rE/kRpKgFGjLYAniVqm5lOezH+pL/VmPCXvTqFn91jnci
         gzBe8AbcQ9DplvL827HJ0ZMCnySr1EvXSfEi2TeNZR+atMhCQuiQ4Do4/rySYP+v5y0Y
         KmyMC9uJh9VO8XibcodBEyhzwsH3LpSM4y6hYjHxVZkmBE/rUkokCJkeTQXTew8nlbdl
         8URw==
X-Forwarded-Encrypted: i=1; AL+hErH8k7NwTBycmfI7NyeW+AqS98eHiyAAHD0EUNeUwAlYYQz/zXQ7utqCEYgvj+RDnkUAlASlF5uuOi9g@vger.kernel.org
X-Gm-Message-State: APuU4Z/HyYwyjNXpbO76ebDZR/WCXYVhtWl8x3RLTsTNUPco/4A+sW8x
	cq4KNpI68P6L4UXLdCqZsVXP7rZnY08EXSV+AJ1RyZnBfmvGc/ZwX93vDeI0jauc3cjzC2yCSFG
	HkSe8/xWlUVXg2gbSyQIpgfTlho3mPrRmL6fSpLQO2N9LFaD6GiLmGyxwkHl3hPpP
X-Gm-Gg: AYBFou1vuD84mksnnkX3suzTkEODApDBNJdhoxegcXLy4f2op+6ylUYupDKgnLds+lE
	KlTxAN9qgSIC9z1WZO/rK1HDIvdi4SKZigoDtndPg/iiJRqC3wj4ERQ5P/f+STb7tHNPr2D+Ry0
	/xjWYjO/O9eX4IdKDQwgg8mB7RhQ52mQtUxDS0OrIxLnXAfRvqhzY8DgdDCCzT/wQtTgJdZ6ht1
	V2XYnZaAl9H8hFSQ22D1e5+mCp7ITvSplaqArbYMx6MVtd65jKIAxvkGcDC1bFfdvb4o2djdNXp
	sHmFa9VPlFqxd0UTHxgMOGU3bKt+PuVunjdSCpu0Fl51xE+bU1cjww4jwpwICM4qCKLd880CFZA
	prDRish+XK1QpEg2QGsX3BV9JJz4dmSXXfWpV6Spl0fkPqscllu4OkPSExHcnJ3ZKcCBGuchGT0
	ZhuqfJ3z5lLqw=
X-Received: by 2002:a17:90b:4d05:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b182e0f24bmr4440800a91.6.1794478631453;
        Thu, 12 Nov 2026 02:17:11 -0800 (PST)
X-Received: by 2002:a17:90b:4d05:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b182e0f24bmr4440782a91.6.1794478630919;
        Thu, 12 Nov 2026 02:17:10 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm4026476a91.7.2026.11.12.02.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:17:10 -0800 (PST)
Message-ID: <25ecc2ac-434f-4eea-b144-51fbc683201f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:47:05 +0530
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
Subject: Re: [PATCH v6 v6 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
 <179436005594.790675.8837636459182556844.b4-review@b4>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <179436005594.790675.8837636459182556844.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AEzlAFD8tCZm23_HjOr9gkNt1x97_jLq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX08MR/JU83ZiT
 8cPXlDUDf41Gkj6ebRsLy9G2NTXwQU4ysx0axcy58imLSbyzZKOf5o/ITRWrta+Ug9efSwS/UP7
 kJfq9JrJhj6S8opiIuRH/+/4wudSxS4=
X-Proofpoint-ORIG-GUID: AEzlAFD8tCZm23_HjOr9gkNt1x97_jLq
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af59228 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ea197RGUULTvqYrq9asA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXz+OhYKderfv0
 2q5X7C3k5dV0X/y9rVOMuC/sRbFk4Kmjz48r+06IysnKeKMgjpJPoWNyH09deCpUlT5cfu73TvX
 U3zJpOP2uCZXSBVEbLiSsWFh9Qt/IWPGjJwVPg6Ws7qAJ5m/zv3v7/X8FRD2jIFAIaZ5dQpJv62
 tyvBP1K/z/NSABandwhxLomG/xpF+PufC75r8uYJz7UXrPaHZ7JwNMmV/P4/8PSOShyYfLvyrAj
 n3I6q6TlwMiZEjM2yx1xGkhYN9R9vtPjArDIWfgn9JIwCoLmahrZtbEHEWWbA6tq/kLd1tguGk8
 1hXIaYPKx5xmW2Kt5vMnZj09a4XOou60sSHfMQZlvo5Q+9sZZSnW0jQAlUsM+vFK5FjoMQWyPE1
 e6kjQ/zf2pDlQePVanfdatFehZjuxlXwcUJDxH1G9NQ8ORkl/ys7DB3rnuBUDBtyIb6Gc2gS9pz
 Ufp9hNnQbf9WhXlP0QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040



On 11/11/2026 6:50 AM, Mark Brown wrote:
>> Add shikra specific VA macro data and register programming needed by
>> the LPASS codec v4.1 implementation.
> 
>> +/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
>> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		0x0800
>> +#define CDC_VA_ADPT_CTRL_EN_MASK		GENMASK(7, 0)
> 
> Is the enable mask really 8 bits wide?
> 

Good catch Mark, it's actually 6 bits. will current in next version.


>> +static const struct reg_default va_4_1_defaults[] = {
>> +	/* VA macro */
>> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>> +	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
>> +	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
>> +	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
>> +	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
>> +	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
>> +	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
>> +	/* VA core */
>> +	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},
> 
> Are we missing defaults for the mux registers?

I missed in this version. will fix in next revision

Best Regards,
Rafi.

> 

