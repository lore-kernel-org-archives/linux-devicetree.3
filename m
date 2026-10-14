Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAADE2E762C
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982368; cv=none; b=uAe3xqo8HxXW2td55hxvCHi7dyRWQRaI/lCeKbeQApa6pqJC+9BHIdLIIqrLacHlhaWPjpLjiaW1IFVU6Nxi6dhXkAsoJNPGpOPn5b5XWcMGMpbz5vCehE7kKqaSjDGNtVqjjsOPJiAi+Rq8Qg4yEVv+QLBeUrymqkKRBcW1VcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982368; c=relaxed/simple;
	bh=RXnPjfLjnkyDib2zh+QxtH+ITST6yFAswTx63bIOYjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1rC9QTyDqnTzRWC59fmwr4HsE1d/MODCCVxdDl72rOEqBOsDievEzhIkMPVWcVdSpEovzAhGLhi2NxzELzL7BOxXEn8qXlKZ2fxDMigaWC5/PlU0/A8MjaBBIqLF/w9Hp1+DDx2+KJNaaQpbTqQOsupJmagV9WWEGOl7CXEjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nz88sVXJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7H19xHz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nz88sVXJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7H19xHz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBQgxf2685347
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UG91mkFrWeipTAxiKmKXbvbb7ALNPef3qQlwt7YlI0Q=; b=Nz88sVXJ2bPEvAK3
	eK1NTshXn7WhBlAkX8deGshZUUbz7BMq8gncqP2OTcBhahtO6RvcQ3WntFHdzawn
	T6Al96zbV2hbQ7l5QS2boMq3KOV6mv3NecksooATPmEcxyEU7F/jdit4awnTJFq7
	cpor3U4u2B3wcnbq95SDYM0O0CCradgEyjdcr3BhM+iSFi/CMI3em1In5Zc/sFSQ
	ij9roCVM36wMG8XemTHKMjrJXqu/0Lhz+MvX1lFpSs6/OfsbtRMfO7J/+cfufe54
	eaWEl380Fw3b44efhK/Jw04O5U9+9fYfK8Hy4K/1UFR03181EUFow5hCOaRoPGX6
	V2pQWQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1m9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:52:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd1e45a268cso837624a12.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982323; x=1792587123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UG91mkFrWeipTAxiKmKXbvbb7ALNPef3qQlwt7YlI0Q=;
        b=E7H19xHzQbnMS5Geylxsdy+65KnYhHDYBm2svAO54KKthUKGjusiJjYiZPiD15NDTF
         d2zrCTM3QpqERenCVkHi/LXBtI/U7YdesHsNHeoQxCjnLo6ID33xa0vouG+D1N2uzhg/
         EmM5w1fDPpYAbsFyyFWRDPKDwrDOb/TtXYmuhK3cx+Wa54hS7MoYFXmnJcHOVvo6z5bH
         4Qk+Y/5Ow4d5a67lQj23XacJd9jiGQFamCETJkCVmSutT3PZcKajU0HCJoxxtA3fohYO
         RLN3UKXO3zSniJBuH1jpKC3EkTwQKDDKEKHXLGRKcDsaXsVj8jJ9tJq9jv3v/sZKCaXm
         AsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982323; x=1792587123;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UG91mkFrWeipTAxiKmKXbvbb7ALNPef3qQlwt7YlI0Q=;
        b=nwyFueT6y/zLPw7wllTyPtQDsYwEr0ZJx59XwK89SlSiAF5zNECCarywNg0DQpOJP+
         hcgnf+M+raPNBi4t+zI/AEtBYPIneboH8ojUclOdPvyMl7Dxjj2aqMOnjP42jdO79ZcH
         YHjzkayxn+F1+GhjLvwotQBvWW1lAmaLfbXmjv4Fj28t8Z5DTDp6HMctdtGdfX//Hj1q
         wH434sxrienuj5Fn14/QAtJUma951KSCYn2L3Ar2frbOI28PeNPI+nItqROoeSRtk6xB
         Uazj8Pop4L3xsp6Nnr9drP3/35rBSAVZDCzqO8yMvu/765RuHMtbSJssSaeW47+9aNhv
         2Gkg==
X-Forwarded-Encrypted: i=1; AKwUvBxm7o2L5E+RDpUqXtBaZR9tIKoX2GDf7HpA92lyH1SR7Y8WPR42tMTLmc2roD7oQspluSvAHt6LK79Q@vger.kernel.org
X-Gm-Message-State: AFq9FYL2/DOBj3z6t9hZ2XmJDkMrZJ2s48MyLMRdcytmqllh9/3zzitT
	ntVO6Biq9tw/+dHqqze/H3Cq0Jm9VExvfulNqulfi3ncVHJeT5n7DjB6oTPgVYiM5TRTc1iBcAQ
	JVSUS3MG7NjOZKvtC4GXDDbMAf4KdSMP0i8sNCdhhvMg5PFUig0emLQoxsoMTbL6Z
X-Gm-Gg: AYBFou2Ep/2BvmvLDzlFL0LFHAy3HSJyqkJxCiMUhQ1vT+2+/Szg8+rBZer09aMXVEp
	dxb1LFak/KHMtvzdMPfcTI53rmZmt7uhh7xgs4fYbjW5iSqhBJ0Oq61G5a4auByxUf5PwLaQ5po
	ImQqn4kFcLC9m0zsgSrS43O3r7g1q+xchjtvrzuStjTMKLPVeb5cyfMyfmap9+zvob8hoBmt9BJ
	vwzB9T9YI6hoVMpXIb8vwp8/lKLyZmHUXr0oYs2qJHRGpuGI4CEBhyMNWFj3POjsSezD7FAXImM
	73mOawl67dxEOv2IDgoXtYnGg/UwsX42Rg8vjdefeps5jJBJurm1OharhTk7wdR0Fw9mJKIKNXj
	yPhXYwvVUDsbjKLfFUBL3qlSsbWNyCuUhZuWlry0EsWr9ZwYKrLZ6T5O2Y8DJCooLmn4Fy+vEeG
	B7TEl0l4veOav6H8iPRI4uWfRYok8=
X-Received: by 2002:a05:6a21:2d8b:b0:3e1:5481:545a with SMTP id adf61e73a8af0-3e16bef496bmr12720401637.58.1791982323165;
        Wed, 14 Oct 2026 05:52:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d8b:b0:3e1:5481:545a with SMTP id adf61e73a8af0-3e16bef496bmr12720354637.58.1791982322030;
        Wed, 14 Oct 2026 05:52:02 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm7131033a12.31.2026.10.14.05.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:52:01 -0700 (PDT)
Message-ID: <1f629377-c1a8-4c75-8fd6-743e1371d4cd@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:21:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] arm64: dts: qcom: Add Kalambo SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
 <20260909-b4-kalambo-crd-v7-2-f5685804478a@oss.qualcomm.com>
 <20260909073152.C08531F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260909073152.C08531F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX04mvogSM7K0G
 S6cB82PKsQesbs7MCZoy1bezyH/BjdsNHo3jcGNTifwz4TkGX0zcYZXxbT5XCcR+UzZBmC48++e
 qaiycu95HtMsEe+Ro8SbFada/MH2we0=
X-Proofpoint-GUID: aPjbOvg3fdyAUAHWyKzPSSjlKQDJZVKd
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf7af3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=enX_rUQm5nSqV3y0VPwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX666yxURqQMQC
 /Y+t8uj+rxFKKJ6Y3/XQmYBqRTCAUIilxhjlxd4u9TiTSeZSPOlM1wMPwDJyesk5zDZE7KeFyY8
 8pLcsnkMXfpDIzyUDEVKuhQ417WLD+fo0NSFE3HFJiP0fVTE9nsc5Jy5YZ4GWdHAeWg8Miwt/Ua
 5gBz1R/XBTdwuhUb8wDf9lFv9yU01Y8TQ++koQ6HCwPeV6q3MmwAE84rX2rOHfbMyzOBG5eYOwc
 c0mf3jYL8jNCA4eBFY4/Ve2vQuISL0xOCltjRxpiAj4pAvK9eg1VKNEVuC0yARZUeEAzpWzIWfm
 Uwvg/nrZ1vlMand7yBDX843XGBVS9uHDM35Hsdd0MERh0p+0ixlBqXC8B6HxASAy847kwDmLAhI
 QY651SppWltVMxKHls5VUQK0bXZDAGkMnKDiXe6tU56lBCW1vjfDm+R2GfgLqvcA5Ohle3BHo8w
 6kYPsygzuEKORjVNnBQ==
X-Proofpoint-ORIG-GUID: aPjbOvg3fdyAUAHWyKzPSSjlKQDJZVKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140051



On 9/9/2026 1:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing disablement of bwmon_cluster0 after CPU cluster 0 removal, leading to a synchronous external abort upon driver probe.
> --
> 
> commit 917eea48188cf7e004e9ea44ee5963d8c898f1e5
> Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Kalambo SoC
> 
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 (cpu0-cpu5) removed, leaving only cluster 1 (cpu6-cpu11).
> The surviving cluster is re-added in the cpu-map as cluster0.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
>> new file mode 100644
>> index 0000000000000..8e2077d9d0a8a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
>> @@ -0,0 +1,119 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include "mahua.dtsi"
>> +
>> +/delete-node/ &cluster0_pd;
>> +/delete-node/ &cpu_map;
>> +/delete-node/ &cpu0;
>> +/delete-node/ &cpu1;
>> +/delete-node/ &cpu2;
>> +/delete-node/ &cpu3;
>> +/delete-node/ &cpu4;
>> +/delete-node/ &cpu5;
>> +/delete-node/ &cpu_pd0;
>> +/delete-node/ &cpu_pd1;
>> +/delete-node/ &cpu_pd2;
>> +/delete-node/ &cpu_pd3;
>> +/delete-node/ &cpu_pd4;
>> +/delete-node/ &cpu_pd5;
>> +/delete-node/ &cpu_scp_lpri1;
> 
> [Severity: High]
> Since cluster 0 components are explicitly deleted here, does bwmon_cluster0
> also need to be disabled?
> 
> The bwmon_cluster0 hardware is enabled by default in glymur.dtsi. If it
> remains enabled here, the qcom,sdm845-bwmon driver will attempt to probe it
> during boot. Would this result in a Synchronous External Abort (bus error)
> and a kernel panic when the driver attempts memory-mapped I/O on the missing
> hardware?
> 
> If bwmon_cluster0 is physically absent on Kalambo but cannot be deleted
> entirely because it contains the shared cpu_bwmon_opp_table used by
> bwmon_cluster1, should its status be overridden to disabled instead?
> 
> &bwmon_cluster0 {
> 	status = "disabled";
> };
> 

bwmon_cluster0 is physically present and supported on Kalambo CRD, even
though CPU cluster0 and its related power-domain nodes are removed.
Therefore, it should remain enabled and does not need to be disabled or
deleted. The driver can safely probe its registers.

Thanks,
Gopikrishna

