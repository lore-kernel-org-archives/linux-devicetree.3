Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946D3B635A
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141167; cv=none; b=TflMjiORvIjy3f297XuaVQKRJgLb8SfnjJcis8DZRdzDbeOqy1zENIsQkMvgQEgHgl1YiQmk5yvrsv3vZVVJnpeksiZNFLACTEEdC9cQdDVo0Di2wfEYG+AMi+0f8F8SwG6/GUdHnqGwP1KON5i6d6ee4ELylp0BxFFyQabEdjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141167; c=relaxed/simple;
	bh=jr+4mwpmTUEPrXMq8BAJi0IQ93OMRQw9ilNf0eyfAIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3iUDydgHYGdn7J4cCgm6lGeCHvzIE3dLxdSlDISpGktvhyUHco5VgYKD/gvDZWVfpqsxr4UnSqznzEBg6eyc485P3lRRm6QPoIG23SOh0i2AGH0hff6MfthCip1xL4wAKLC2X9PhxCIQ2fxj0kHEWa4Koyd2okEG+kY/MCczmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EH9wAA72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeGvC2bS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EH9wAA72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeGvC2bS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lu5M1611447
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GfxK16iLo4LVyZ9Np1Mx+6tJVblLssEwBImgmVjgZdo=; b=EH9wAA727OmBcE/0
	44Y2+tDApWJo894zVCRaNvuXhWIPyrxfYp57dwvnfL5DWU7SqLCecHF/NtPpCHQJ
	MNoaGV9SCdH6PM3tuZB4Pe1DfOuh9MhhyWoTVACmWJVHuivIkDny6x8mn/KQWkn1
	LTMmnCBWXMHYuhaSwC+DB5KyvMNyJqVdXWJVITv6iC2l+Ws6woYDm5JIzj97kDcu
	imNwd1w77lC/p4rDtBta7UKTgeQ4QIE6mWdqEV5akmWqWAfJ1oq1gXXPPtCIZqcL
	fbR4zL9d3QlcJ84nFBNW7QcLuzQtQRUkCWb5yKokZfUu+Br2q3JRTvAvKf46tPsd
	iw4MTg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3setxex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:59:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60a365440so3580892a12.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141160; x=1792745960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfxK16iLo4LVyZ9Np1Mx+6tJVblLssEwBImgmVjgZdo=;
        b=TeGvC2bSDSjX3vw15+9tCFMWqtL6VDgrEATsZtlEPccuay8YzLHjrD/VoV756dS5yK
         wIsOO8HKNUymQat27PTpYyCdKJMBqNSOuCvZbq4/XWQAMR13YfR6VResggF4PmA8Y7bv
         4tbsLbocChLQAOCUKiFh+9DH48XdnjVpROOHiWznp3R8nRB0fWP6odr633/ZFFjAyDHt
         IOMeTplAQLUn/JsVtMhkZA3O0YfsMtUzjyaEFvE+wpOBcxBzRa8RbdyJd9I78NnHQSI8
         L2oK2uFRzPj8iryjAitCGoW1OumciZnfGQCABSIm18gR7GSTqxHpzF4VEBhe33DmVUbv
         0gnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141160; x=1792745960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfxK16iLo4LVyZ9Np1Mx+6tJVblLssEwBImgmVjgZdo=;
        b=1Y+WUni4nZml4VDUNHnBhuew//JwryhwgNF0/sJBGouBrHmCgCQXAMeIOy+y10AT3Q
         BvnAZX312FfrnWRz/ADfZ0L1d952zu3d/BhkzHP4euchWUiN9o0TZav9IqVVU4aPzUqA
         g4/aII0KWionkxJa4q4jzNvZ/K3GAWWKvOP/1fwlhpI+BUpDcj4306GgwPio8DoQ9GeX
         dBCkTKuldkbxhA7u7NcplcNO5Bs2BOztcD1NpskJwTY66AL7ZOBrKkwDE9HKAThPyxeo
         DGSyC0POoPuqP/0yCQknpqkAAaJwEx3KRSrBHqGCcSGRcIeiUKjdKAgo5SKPFUJu45El
         /bbw==
X-Forwarded-Encrypted: i=1; AKwUvBzg840D4JJpyg4cQLDq8w51sV6AFKamhNcaZ4S6PRETBrMxwg+7k821Bgmxkz3bS6MauH7wVY13x4DL@vger.kernel.org
X-Gm-Message-State: AFq9FYKniciMWUySCZqnxQxIxeO3ZoGM2qksoniXhe7BNsXc3F8ffiUr
	PW2Xs04koQrX8oWAR0upVcDzgdeT939f8H/52snFFcgZ3pZtUMExhmqB4RsqCTnguA3ViH5kVWM
	zYuVcgLtWBLRb9bquqC/+B3J/vVGQ1vsi2C8s5lZJU1yJZpOVSlvloRu3C5mCjmD50PjzUvFI
X-Gm-Gg: AYBFou3nKEmVCeOFeb8psyjeI0uJQ/49c+JoJDSW6psTcGoWK514BkQckZvHnAB0phZ
	DqRf3Xamg/MfA94P8je+9fDd4kjMW72eBW4AdZsEVVu8Du0bBW1sDGQ/zkyL4F6KZHbbFIWNVpi
	j3l3+aZGaqj7X87x/aaWlsLqwxmHG/R1ImeHqIjmVbwOpzvEvBI4TWtgBDSKrP/rcgaRIsjXeAW
	EEYmBvQVdAyizMCeEK0kSY7VmJlmSZi2RDRXM5KKEt0Lo3CaFTxJwAGT17EEqVX/DRENm1Qmdr3
	08RUQuUR2jiOhDVv3e+kUt2LzNvEgQLjsDPMWX1+bDRkoEIbtLK2wDUl3GT8ihY678txtSobx0q
	ct2Rpt4utayH9LhyOLtHQ14OulHfj9Q==
X-Received: by 2002:a05:6a20:3d1a:b0:3df:c9eb:127d with SMTP id adf61e73a8af0-3e16bb0b01emr19869595637.11.1792141160059;
        Fri, 16 Oct 2026 01:59:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1a:b0:3df:c9eb:127d with SMTP id adf61e73a8af0-3e16bb0b01emr19869587637.11.1792141159564;
        Fri, 16 Oct 2026 01:59:19 -0700 (PDT)
Received: from [192.168.29.42] ([49.37.217.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549c5621sm783679a12.17.2026.10.16.01.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:59:19 -0700 (PDT)
Message-ID: <10fe47fe-e238-4d35-b61c-e163a6e06dd0@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:29:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
 <20260909-b4-kalambo-crd-v7-2-f5685804478a@oss.qualcomm.com>
 <20260909073152.C08531F00A3A@smtp.kernel.org>
 <1f629377-c1a8-4c75-8fd6-743e1371d4cd@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <1f629377-c1a8-4c75-8fd6-743e1371d4cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o_oijvnHf_qwa_n-avlF5KQ6LcNnjYmp
X-Proofpoint-GUID: o_oijvnHf_qwa_n-avlF5KQ6LcNnjYmp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX3jRBnT7Dfzl0
 psVj17l9JIhbt+q7OC3Q1zJgQPFUndbrDwF4L5rZ00dVm2DpDnNwi6lCLQCAZypO1sksI8ykGOA
 InOeVz0/nq0ZCW/V0s+flNFdpGdv6k8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX+sEyJSgeuANG
 do2UY7A5BLhZpCjQzf53meHmcg0RRTk4roCkp7PmaOwzXUeJjnGAOYX9WuSZLd9Oj7tze85aPBG
 LU5Xzteu3TH5JZzJHF51agrxB++3uRkQ7/9V2P63/jXDNM1o5D+jYaI3+XnMmBzDh4lbi1m0PKt
 GxXSicvN5O6YREZn7SAKKuazdJRaLmyY6HqQDUClLpQ12oxeFJP8FtUbIRr/GUbBQsllhYvs/3f
 T5esiRUAJn91wfwiZgGT47X1GqvxsuCLtFbvVJfz6kCznZWLYAZCKMgWRm8ZtbjQSczv7U+8qwy
 ruoAj+l7tiQTsh9SneRwNIekNgrml8vFPJig+xY19vpU4P5aHqFD1AloGonjeFxw+AI65mYhnSQ
 mX0yUwOVUM9yZmA0ta4BrUH951hDHh88tFJ4XdNzl1FSoHHEbgs7jyHfcImpT8zzhARrP9EF/hc
 4z24HXuQSBRtMOYwxsg==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1e76d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=rThwyMTpgoa+SOOJ7TDuHg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kA6Chgf_RWFvDljAiLMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035



On 14/10/2026 18:21, Gopikrishna Garmidi wrote:
> 
> 
> On 9/9/2026 1:01 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [High] Missing disablement of bwmon_cluster0 after CPU cluster 0 
>> removal, leading to a synchronous external abort upon driver probe.
>> -- 
>>
>> commit 917eea48188cf7e004e9ea44ee5963d8c898f1e5
>> Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>
>> arm64: dts: qcom: Add Kalambo SoC
>>
>> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
>> with CPU cluster 0 (cpu0-cpu5) removed, leaving only cluster 1 (cpu6- 
>> cpu11).
>> The surviving cluster is re-added in the cpu-map as cluster0.
>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/ 
>>> dts/qcom/kalambo.dtsi
>>> new file mode 100644
>>> index 0000000000000..8e2077d9d0a8a
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
>>> @@ -0,0 +1,119 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include "mahua.dtsi"
>>> +
>>> +/delete-node/ &cluster0_pd;
>>> +/delete-node/ &cpu_map;
>>> +/delete-node/ &cpu0;
>>> +/delete-node/ &cpu1;
>>> +/delete-node/ &cpu2;
>>> +/delete-node/ &cpu3;
>>> +/delete-node/ &cpu4;
>>> +/delete-node/ &cpu5;
>>> +/delete-node/ &cpu_pd0;
>>> +/delete-node/ &cpu_pd1;
>>> +/delete-node/ &cpu_pd2;
>>> +/delete-node/ &cpu_pd3;
>>> +/delete-node/ &cpu_pd4;
>>> +/delete-node/ &cpu_pd5;
>>> +/delete-node/ &cpu_scp_lpri1;
>>
>> [Severity: High]
>> Since cluster 0 components are explicitly deleted here, does 
>> bwmon_cluster0
>> also need to be disabled?
>>
>> The bwmon_cluster0 hardware is enabled by default in glymur.dtsi. If it
>> remains enabled here, the qcom,sdm845-bwmon driver will attempt to 
>> probe it
>> during boot. Would this result in a Synchronous External Abort (bus 
>> error)
>> and a kernel panic when the driver attempts memory-mapped I/O on the 
>> missing
>> hardware?
>>
>> If bwmon_cluster0 is physically absent on Kalambo but cannot be deleted
>> entirely because it contains the shared cpu_bwmon_opp_table used by
>> bwmon_cluster1, should its status be overridden to disabled instead?
>>
>> &bwmon_cluster0 {
>>     status = "disabled";
>> };
>>
> 
> bwmon_cluster0 is physically present and supported on Kalambo CRD, even
> though CPU cluster0 and its related power-domain nodes are removed.
> Therefore, it should remain enabled and does not need to be disabled or
> deleted. The driver can safely probe its registers.


It is still recommended that we disable it, since we ideally
shouldn't see any traffic from that particular bwmon instance.

-Sibi

> 
> Thanks,
> Gopikrishna

