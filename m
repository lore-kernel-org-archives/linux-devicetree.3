Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1142E004
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328379; cv=none; b=Stz1Sdjg3kvE2w4sKN1opBQ34V/AIaxcn5TPDtHBNm1p7dxp0HJVehcs2FMZUUySGvXCv1WfdKpJNn1OQvZHZ/WmOKcZxptvXTPtpTRR+nJ8qZlwdGzlkFVX9ZjwTYZSSnyqfEzY6VtUjaNDTacDHJhupw1M2cq9YOw9XLbd+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328379; c=relaxed/simple;
	bh=VdMEYEfujKlTpTeNpLjtTw6Z44BxQKvYppPb1nAG52w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNX0O6FUZcwqrHMHn+u/EkKBJ/kupAA1QsJjaUcmgK4aeRrRRK5luJXI0L5nVQ3vzGWiCl0uU2vVlG13O3K0UFMz3IKF6pQePzEiQlGYUkKJIUYeSr2QZsmJmSUrhM9XLk5ef25Zw4qracuzB9maEaOWyIedj2pf8pslDv82Q68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Axhgdy3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMIaVdZh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Axhgdy3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMIaVdZh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641WsQ3614028
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERl4wTZyWv1vQsjv06YEWQxA6mOQp5u853Smknj5ows=; b=Axhgdy3TrH2DtrJ8
	weETRVwRSctUP3G+Iqa7U//pwX5JnIoG6vEPa5wrZuq0Wy3hmcKd6l8MXeOQj8bu
	WdMq9zkrIgNO66vIBa1vGQF1hlRBin/sFhk5w+wzn8LYN0PL0rD3yWNukq3C2IPI
	CG10qet/6xYlsfT0CyRbbPB5ZfRaXXfThWM7mQ7BnF31txQMtZ6dI/Chd51ZZIRM
	pILhbWV6PNLv3b9rQ8Fdm8Bia+o9612oGW/zVoCNVSAloq7tuMnCDl3YqDTjvPa0
	6vEmuQfc43TMpZTsNxr0OrpJdtW9A+Gv/k31WFpv8Dw/2MVHGEVdiWp3CziEmTEV
	twlSKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnfxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:59:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so20915011cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328364; x=1783933164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERl4wTZyWv1vQsjv06YEWQxA6mOQp5u853Smknj5ows=;
        b=dMIaVdZhpz2oEkR6h4mYayS3lld1DKZV9Iq+2eYvelxDwmkMWNQzET4d69Jw0s7tn0
         lcqZVMZVErVJWcDB328l8/YOh450TVg+hYHsCC9oEQQ/nJhMoq3K+AT5C8zHFa8JH7a5
         7mzz6UFGkbIuQKFUIZ69+vokHikMp1ZRMPKJyZeeijp6pP3yeadaATGCHFBAvzTbFz9/
         fdctKE7X8rv8hXacOaTXBDzbi0UaLu/qUq6c+WuafM5mrbwSG/NeWQ37DXQp+Trwbh9b
         xAQOZFEF/ZpOUniDAEwLoNShtxZ7tLxkASMacmoNA74kKN6WGx82uVOKh3xXIJnnrhLn
         Qwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328364; x=1783933164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERl4wTZyWv1vQsjv06YEWQxA6mOQp5u853Smknj5ows=;
        b=b9AIFy/+qRamlVCTCCsze53BRo9IBpLR2zcuMXjrGGHVnK443wWIu9qLsqEDy3YbMc
         pagtKaj98ouLmi0CAWLhpjtQQrub/Db/sQK9sR6BG31Oy2IP4qbXgmpefDqVVliA6WkB
         7JaQ87XWC08xVUuMdaO/7oHOozd7AGpad2Uqu0Bp0cO72RhzXMUbyechl9cbzg7jVOz4
         U91vy77HSJeHWPZ4/vlsUmkM2gUOVtWZVB2S8/0ncGEpPTQz7f8Zb7itZ9JFkLO3fnYa
         cTiwFYdMEt4AHTQxpIjak+l55QCE3biyWprBFOVAI28vfu+D+NteLj+/QbhGm7pnFyal
         trGA==
X-Forwarded-Encrypted: i=1; AHgh+RqvTdVNr2pxq+iQp4Z+fwUeT2XylgxbHXBhLwwW9j5JVrFOpGALKoaC12yrQzleQrFf92cjg5fbqH7h@vger.kernel.org
X-Gm-Message-State: AOJu0YyfD/X6vNptFhmNuBD4YBVrfd58KyWRTTsMxRAsbhV6Wx9qnx0q
	UnN/o+AbtmdnZnqbGZVpXbehr66p6mOlcOAmjM2XWyMlRHMuhwrspTYXCQKuL+RO2WbuBJd5/iw
	5z9tBV4JTHp+pND6vYR5yf05RZqZCYseVkb8rjLhj4WFOf8bTZM1BP9uFaVywWI3z
X-Gm-Gg: AfdE7cmqLTlNCEUqjW6yA9NbpNFZ2T3WypdP7V5LkMkPgUwewJij8L9Jao5eabOy2MJ
	C3aUaY8gUlfoZr0sjZisobQGDqzJPRq2QR/gogWHsUnxsncR0rcw9ivfweENSUDm4D+WwAhFzaK
	QoLz0EPf2GGsA5QMKTZg89Yj9L5umVhKeDuWmXvybL6sjEvCrLxEKFO0CY/WECjplp1MCObrFIL
	qQNyIL1jLGOnXFClTolsdyzY5GLubpbjQyslKDMclkE7mNfieysnjXQJvQHK3cTSYeF8HR8p/v4
	TI0iheTNYMNJ9lHyc8C4xPDbsfYgx0Kl4wP0KzurLnRTaQKdI1eip4TzT6vGvuit8zCaQbvJeoJ
	ZaLO07q7A9pt5iqmDZ6Poc4eBQZ2tih0pdNU=
X-Received: by 2002:a05:620a:4405:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e99e0f65bmr827911385a.0.1783328363617;
        Mon, 06 Jul 2026 01:59:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4405:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e99e0f65bmr827904985a.0.1783328361880;
        Mon, 06 Jul 2026 01:59:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60550desm702417466b.7.2026.07.06.01.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:59:21 -0700 (PDT)
Message-ID: <f1d1db6e-068d-4b31-b53a-02bdac9d945e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:59:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/msm/a6xx: Add Adreno 722 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-3-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-3-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b6e6c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ErYzCqf3RjAp607u9I4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: B_jBEBJJ4v714fKZVSoWht2ZduQRUU4t
X-Proofpoint-GUID: B_jBEBJJ4v714fKZVSoWht2ZduQRUU4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX5+6gNW8pnpjd
 S+RVzLuGEUPWWId5O5T8XPfqoTtR3BcQC2ave4O3MupIcrtZQhizeBvCxBaC7VN2RCzeC+gx+xB
 acTogeD0CMn00SP+J7n5tTOqql58jZ0XjMtbmg8NEsJoHjE8DcS24hGDbd6uoXMQAG5QowvEBIA
 6nVZ/SAJZ9JKwLxmvyiievsy4JoA0OlAUz62/AEoPIcvOwUhX85jNh44s2yM7mu3FO6WLNHmXNj
 ko8QsDCcdMtyUIKC03vkaXW3KzUef263ZmLbdQnvVZNUa+FJ109FD9GtcbwCELyT760bliC3gJN
 /HdtevNKro2zWFoNnMSEYZKDPeW+O8GjbCaHIAidF/i1jPnK7iuSMBvNDQyhxVCw6xtUSOeld8u
 RvkUQPIe7fYkw+2vnMn7YX4IPqaU4ixtm7iBWbCyf/79kIPYeM6rLVNODCB5jWlWMV3t5XEO8zn
 DYAqXFtSyOyDwJJoorQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX2o/Rjs0EjjEX
 6u5p8shy8gCiGspriSMVFe93uxwzt6+6bxf/KIrIn++6p/ZnylBtullWsgZpiO5W8Oxrd2yC3Wo
 dGfs4eJbcLKg47XqjsVZ0j8WhsHfLCk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060090

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Add support for Adreno A722, a member of the GEN1 A7xx family. It is
> derived from A730 and shares the same IP-level configurations: HWCG
> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
> Major differences include lower cache/core counts, 1MB GMEM, no
> Concurrent Binning & LPAC support. Some of the peripheral blocks like
> RSCC are from A740 that resulted in updates to RSC layout.
> 
> Add a new entry to the catalog to describe the usual configuration and
> few additional fixup mainly due to missing CB/LPAC features and updated
> RSC layout.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -710,7 +710,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4,
> -		       adreno_is_a740_family(adreno_gpu) ? 0x80000021 : 0x80000000);
> +		       (adreno_is_a740_family(adreno_gpu) ||
> +			adreno_is_a722(adreno_gpu)) ? 0x80000021 : 0x80000000);

This is a discrepancy vs kgsl (did you look at gen7_14 instead of
gen7_17? did you test this on device?)

[...]

>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
> -	if (adreno_is_a740_family(adreno_gpu))
> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu))
>  		seqmem0_drv0_reg = REG_A7XX_RSCC_SEQ_MEM_0_DRV0_A740;

Likewise

[...]

>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
> -	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu) ||
> +	    adreno_is_a8xx(adreno_gpu))
>  		seqmem_off = 4;

Likewise

>  
>  	/* Make sure there are no outstanding RPMh votes */
> @@ -1100,7 +1104,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
>  
> -	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a722(adreno_gpu) &&
> +	    !adreno_is_a8xx(adreno_gpu))
>  		return;

Likewise

You also need to if-out concurrent binning for this SKU

Konrad
