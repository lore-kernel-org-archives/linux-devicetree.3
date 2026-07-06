Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB373C6A43
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367778; cv=none; b=rimCTJGq7PmkHxrX0GgdrlMFYYIDZEw3aSer0IpeQT+BxXVJYB7hrcMCZQWOhMWusyqFDthtE7/6b8XbRx1Q7ehpYfFJA+NS0wmK8y9jU/W5GrpnPa0IFArU2OPRyqVtcZ0lNdZUFywJBIraE09cy+cgcypVHaRmY5g+ZOD5At8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367778; c=relaxed/simple;
	bh=CoAvdh4BP4nQuUv2gkyk5lYqdm+uef55MCTt8grpLeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RliGUd2smwVRi0O+TiWpX3gLceBf8x6UM/BuFGeiHJ5KktVpl5ejdycckezgzPQoqcw7Tlph+6urOt+NRTtBCSSW8IEky7rK4IXt883ehkunFCvEaV++xLZEuNepNtiwvhg44f94y4HzgA1OpuhMEpSWtT0cmvk76uczbCUWgpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ST78Cn0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAzgNdlg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ST78Cn0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAzgNdlg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7aH833058
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 19:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVprqCFVdEAD2aWCw5Q12fLKvWtWmKiMoP9O+awDYus=; b=ST78Cn0CaHEAkBgQ
	hRRjEv4Z/xXKv2pMOPJkqYAqsxxiYT8or41dWgrQWnOH9cJiSAgKRORgiMr+lok9
	5tyUYKpaSbfYS4wJTiwDGn9JsKqgBBt8PD6L37SJO1XXQ6gva5mwocEWJqFYDvc0
	ujpTfltzo75l9CEPP7rBpbZQAj/QCeetpwFJ8pdaN1+N3cKJfH8YVq+W8vKza5WL
	Bha+6cda/Q0xM9PkaiwdIU6hXe+Afqo151kx0J3vFMLm9fp+o2IlYBtKOAzYFcG7
	0cWdN2uBMOoZUjYHvGBZtdePiaG3jV1Y7aC1gOPh+jPcdnnYhpcyK3T8k4iNmKGq
	IYfdeQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98jjy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 19:56:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88da04b719so2684917a12.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783367775; x=1783972575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVprqCFVdEAD2aWCw5Q12fLKvWtWmKiMoP9O+awDYus=;
        b=RAzgNdlgm26nO1z/jG+rGS6mDfl6bavav3pwuZAMQu24JNrSkmbqQPeuuBtty5inl/
         Z+lvBIVgKEdwWB7CyAqViPaaRoEB4BszjPIAU/nJTHARg57EgyXkb0KQSPcuIGXWy0NU
         xtxEWiJfmZ0zFE/dP6IKr7iajEdzEmkj1troSW8A46flL6WOKZQYey2raft7GtLumOEv
         3iVfiBY1Uq9tgw9GIIT0SkbWqDaB79dBG7ghKrDX2FFx6dtDsYrzbv/HyJQMEutgzEkr
         2AYfABensQF25PhKp0S3/xUcrrVvdYKAMMtOQEz8jxy7t4YWOWTeRIJ/TkOEQvVfOd9m
         zNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367775; x=1783972575;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVprqCFVdEAD2aWCw5Q12fLKvWtWmKiMoP9O+awDYus=;
        b=LeKvP7Xh05NZk5BLJrhI0roeGM1mBPXlFv4N221aSTKzEIIO08FdaDI8qM2vQ1Nx/4
         Foub9cMDuXVunWf6QNqbiMjXc1MkIEOECyrJzkd5YT54qF9pj9PwIybl3NXKe6wGasav
         /MLpKm82l7ceTPbckWbCtvr0AIH61cLD/RvhegjgSIZND+8YZ9nvcz60D9MOtO8dG+AU
         aCxPuRgJ1q+y2ohKP1Er718Fs1XdM0ShRboU6BOBMcPojOlk8rex84LoWQjvU3GuiahX
         +F3Fp14CMPgXBOmR9h8vXwUbL/ln/JQdparEEKlIbexyuDTT9Yot9aKogIy1t4lZtEqM
         BkQw==
X-Forwarded-Encrypted: i=1; AHgh+RppMnqNGXr22/8DwAoShNhMZ24qdJtTOcZgR5cMY5NbMUKxQlnXB+keJgwSLPF3FDohaM+e91SIH6jn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8jJs/kwNRxYkncRupxxHigAX2+V4BAOAxPGw0UoXau7ukUROL
	3ZxjSGGap8F4ljlL75HKp9kEkBfrzx62WpXhIvJI86jJTBBxdDUtXSnFqaYrE3cGfiEg0XAeci3
	q8B/yDT5+jqNZd8fCYMcBXiqMUyUCDIZmqWH+9GYdkHltrRtfYdPTNz2POYfHd3jx
X-Gm-Gg: AfdE7cnDavLYBye46BZTYrB13klxquzDlSpszxWrKDwcDi2SslC1jmLe5RJB+gdYtrS
	HjWDh1u8DyblMRvfW8zQl8P5aFdNYnAWF54oQLWxR9wlVXAmyufLLyaaSQIqaGnIrTS1Ezw8goG
	Cm9aH5puP3rz3pKXzWL4wH7VezoiDbF9IJox2EwBI/LThnVUMGdQKPDj1DkRm5BcuBFJgjzt2Vj
	byZWiomK/2mztUu5/8kucoE7B7JXnMQy0qFIcGshES2TtKo3j0SgFmiQyjHn1hg9VlgvVtNnrNy
	aF74ZifSC+r+omejjKBEvmWPkaE/TBGrFbZEkD6WXl5wOusCOMODM2SR1U9qWcG8zDb657uAiNR
	MK+zysT1qLTkr2b9G7t+TuE2YJ2GPKpBk1kE=
X-Received: by 2002:a05:6a20:5499:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c08ef55ba0mr2517870637.52.1783367774855;
        Mon, 06 Jul 2026 12:56:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:5499:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c08ef55ba0mr2517836637.52.1783367774370;
        Mon, 06 Jul 2026 12:56:14 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.230.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm90197173eec.9.2026.07.06.12.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 12:56:13 -0700 (PDT)
Message-ID: <3dea2be9-7c72-4c5a-865c-139837d294c1@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 01:26:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/msm/a6xx: Add Adreno 722 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-3-c9f1354dbd29@oss.qualcomm.com>
 <f1d1db6e-068d-4b31-b53a-02bdac9d945e@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f1d1db6e-068d-4b31-b53a-02bdac9d945e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c085f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fsdq8dFr2Uux402FS9br8A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Gg-SMJLLMV3ST4U2SEgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIwMSBTYWx0ZWRfXzi8HR8stFzzZ
 A7aKzYlgdqbmjJBbG8682dUHBzCV0PPlSi1s4TVkpVquhGsVv/ZLluZ/SLXulOtknW8Z7aiuirv
 Qee5B5jdZD+A8SvKfGCuS+rOKMBELdX42pBKDD+O0XEEmPlVHVrmD51ThzjrTV/62kg+/OnTP7J
 z7FVDsTxuwIULAVrpeb5y7FqI/5kHDmBkn2xuG2azV4LEkl6I7n67UdMHsIa+xHEHFhLApS644C
 6G0+w77Jwg/AWAg2rKI+Fdjv89UG4o1LAXexVqSZZ05k6GUMsRs3Hh4p1wtEYXPFEQJhp5CVW9u
 gmJ5jw0ClfxFlGFuQqwXIhbSEJ2fFi8AUXfGI57MOhonggi/Vm2EYO4/+qMNqhHyZwaWUYbMAX9
 MRb2Uc3OMB5GUUb+8WJ444cG28ZB3w68awqwCxSy7EbE2wloIsEjBZ6O2OPmwyYGXOFTJn79JbP
 MHlli29kAIJYdzcRczA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIwMSBTYWx0ZWRfXxEG7vibgwQ2v
 bFYlkgBlmKf+ItOQFOslrip2YaOn9ty+edfBy+VXE8Tegitsi+wC/ypciGDQjnPEfnGWfrrtYdt
 QoFS5ixTmhs9MKQdoOJlHSZy3bFU9VI=
X-Proofpoint-GUID: xW9D3MoG0O8OW_Bq-HODAJkfXkKjQ_lH
X-Proofpoint-ORIG-GUID: xW9D3MoG0O8OW_Bq-HODAJkfXkKjQ_lH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060201

On 7/6/2026 2:29 PM, Konrad Dybcio wrote:
> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>>
>> Add support for Adreno A722, a member of the GEN1 A7xx family. It is
>> derived from A730 and shares the same IP-level configurations: HWCG
>> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
>> Major differences include lower cache/core counts, 1MB GMEM, no
>> Concurrent Binning & LPAC support. Some of the peripheral blocks like
>> RSCC are from A740 that resulted in updates to RSC layout.
>>
>> Add a new entry to the catalog to describe the usual configuration and
>> few additional fixup mainly due to missing CB/LPAC features and updated
>> RSC layout.
>>
>> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -710,7 +710,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
>>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
>>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4,
>> -		       adreno_is_a740_family(adreno_gpu) ? 0x80000021 : 0x80000000);
>> +		       (adreno_is_a740_family(adreno_gpu) ||
>> +			adreno_is_a722(adreno_gpu)) ? 0x80000021 : 0x80000000);
> 
> This is a discrepancy vs kgsl (did you look at gen7_14 instead of
> gen7_17? did you test this on device?)

Both 7_17 and 7_14 are same GPU IP. Yes, this was tested on Eliza MTP.	

> 
> [...]
> 
>>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
>> -	if (adreno_is_a740_family(adreno_gpu))
>> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu))
>>  		seqmem0_drv0_reg = REG_A7XX_RSCC_SEQ_MEM_0_DRV0_A740;
> 
> Likewise
> 
> [...]
> 
>>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
>> -	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
>> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu) ||
>> +	    adreno_is_a8xx(adreno_gpu))
>>  		seqmem_off = 4;
> 
> Likewise
> 
>>  
>>  	/* Make sure there are no outstanding RPMh votes */
>> @@ -1100,7 +1104,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>>  
>> -	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
>> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a722(adreno_gpu) &&
>> +	    !adreno_is_a8xx(adreno_gpu))
>>  		return;
> 
> Likewise
> 
> You also need to if-out concurrent binning for this SKU

You mean the PM4 pkts? If yes, fw will skip them as NOP.

-Akhil.
> 
> Konrad

