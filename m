Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986353E5ED0
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919331; cv=none; b=firuCTqn3o8Z5WmHklVALpiRM3Iy0G2YWuvIBZI4U9lb/9m4Q2PLvSBr3VIoMYRQMvE8I3uzUyCDndoBQ5S+vb/hSAE8n5M10mNc0yQC9tzOqxp0EOiIT9aa45mpGDyl7SBcbZCUVGBB7wo9ZYM5QJidkVQ1r+Kw/o8Uld0SOxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919331; c=relaxed/simple;
	bh=ti5prjYp/HFYK3yYqNkUysgzZnIbDiQFG5MbvASSckU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0GIHll63kSTiDjZkb4N7D3cp9H+P0gTeLLhAPwFjinY1lCb1u3kDV+dDi3+g8X1q7NYIbT11q5qrS3aJctZvzexzQm5ZVel2dHuYZ/9blSuKZOATP3uXcVy1+Is5wzHXJRW6cOOalfJM18RAnJ8S1cBkLWJJAz3Jv+fk9nXKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDiEgmbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBx2miVR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDiEgmbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBx2miVR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DwgFw3467704
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 18:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99MBXW5JwIMxZwJVQqmfrVFJ2OTTR6MSlKAWKqmGmi4=; b=IDiEgmboU7OkKgw4
	SbteSLCTNsOmYCDr5jcQKPJcO8aULas5c54VLaKTis4OBHVt2r/H89qpds+tMtqg
	qqeUXEBvWruzxfncJ9aU0m+jYedQgGmMEQnEBaRDPAhVKndPoWudcLyCV8bLN6l1
	GvvEK+ljutjDSKB10ZhKk4ZIPKrzkIA3rrPC8/sO74z+mgZdC/KJq4qmnW0hyEI/
	rCaVrh9dEx4rz7HfbohX+TNuv+LUo9oEvv0MR8mhI2G3pnf3hu41c8Cjlw+6Hv7s
	VEL1DEvDCqLX0SZpSGmRKNl3UyG3vL/UQ6wKUvUn2QBZ6BctqmY+Sp1WCQfHgPPC
	CpssPg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjs3er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 18:28:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35679eb61b5so1601960a91.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 11:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777919329; x=1778524129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99MBXW5JwIMxZwJVQqmfrVFJ2OTTR6MSlKAWKqmGmi4=;
        b=aBx2miVRNQMom0pfvsgxsL9uRSKQWhGPGZ3WCL1KxN3fTh2sutquRllmlQIRE9dVGI
         JG9GxCZ0WpTBb1269v8l5AmXyW4WO0NZT6zK4QUZerczCTWNpHlwLEPLcnzYcJWXt23F
         iyqOfrlgOvY9fE4UspRgZ3phpDpVrhotd4HspiYThCxjoZQg0AOk/6cygLyn6+k6VjaY
         hrJZV4elFN7cZQDTSd9GJnu/656uAY9IjtOTty7IrZIFewmkQT5GoJ88dOUEszPvK32T
         AawSyecnLsz3K+N+b3vR0SwUdrSpKoTdcbncUPDnbAz/OHth9cX9BrjDbszxdH+uAU6M
         scfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919329; x=1778524129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99MBXW5JwIMxZwJVQqmfrVFJ2OTTR6MSlKAWKqmGmi4=;
        b=b9SgoF4om1XESsLFBya99zmDM4wZtQVi6Qpjw8bUhyW8xlwlJAgLvnnQYkbFZmtYdv
         BDphkF3SvXYFwsBZ524d9rNx8fUADBkX1Qo/d9dfxWHZKU2WG8WJSc9ato87z63zOPHi
         Rfhs/0b6Zzf3NLRm+N7owyqtUGsQaMj2OsASA1Q9pCOpl3bTSBCSYCu2aL0HCOUz3w8R
         44zkbW3bPserH6GVJdDaP4OXh3ayeos/bhUqmLK9SCryq3gwWT1wuUZJD0iov0jERHlH
         IO5JsGOZPclvDxVppmvvC19c3/zc+hUY9xXB8ztbFLNFovtfkVs4GK2m/EwQiK7CWZRU
         wbDw==
X-Forwarded-Encrypted: i=1; AFNElJ/DlcS2fBJwd8oDejXR/Pogfi82oEIOwOFZz0kaAKv3AZb4EznlVAJhvjc5s8qAxPuaEtPN6FeotYW6@vger.kernel.org
X-Gm-Message-State: AOJu0YxD/2hTcXbgfAonUjQGiQUbcy6orKiDtGyxs3lUHhajasNxaTiE
	R5iu5nmc7wgD+RmMcGrC5TpjdAf4kHkyylIcaNRNxLyXxMHXIKoqVqaT1UlKGUtD6tpJfnfr3lW
	o/KM2WZeAP6zhxnNUU/iKeA9JU3OWDAajfApQEOAbA1uqryF9YDUsYPog9DRpJ9iN
X-Gm-Gg: AeBDietdVo+UJEoScHHCCrouBy6ZN6xr75/XoCiHaow9lumTQapXgA3YXDdhipE3ghX
	6KIIFqyFVlSM0iqCORDjCgpneDL3U7sn8eHo2PUNvKr0xgSZ5OqwiOPSY9hga+8LyoC+3VWus43
	SpdwzxGOOJrpKhjW9UWnDF4BoMC7O5SUxdUWdzegngNa/95BytmzFqLON/H7flFquWLUpNhjsT8
	fdN6+a0Q+ruuNzeyO4RsdMkAhZ1i8i6CzlMUKjj0WzxWtTwd1Uzwrh7GZdd/WsjiB6WBp6ybaeD
	3Q/8tlj5By9XsQdPa7/dyGu7qhs82NR59sMjyTstcCbgJr9XR0drKxyetxOk+7KjTA8hUQ4gVLJ
	ILXOn5cuJrdfu0j00zmXKgzRncHI63EArbdENe7pDbxV7v04UirSoqa8jmTpF
X-Received: by 2002:a17:90b:3f8d:b0:35d:9d38:5363 with SMTP id 98e67ed59e1d1-3650ce7e59bmr5406234a91.5.1777919329070;
        Mon, 04 May 2026 11:28:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8d:b0:35d:9d38:5363 with SMTP id 98e67ed59e1d1-3650ce7e59bmr5406220a91.5.1777919328626;
        Mon, 04 May 2026 11:28:48 -0700 (PDT)
Received: from [192.168.0.8] ([49.204.27.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebf2affdsm15253718a91.8.2026.05.04.11.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 11:28:48 -0700 (PDT)
Message-ID: <aa0a4949-103f-469f-9086-782700be2a87@oss.qualcomm.com>
Date: Mon, 4 May 2026 23:58:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WU36IGz8Ff5CJoFHNkLdywgstdqnToOj
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f8e561 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=U0tfe/lGaXrCh4Nw9m/t+A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nlVMCo2lvqEUaAJ3400A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE2OCBTYWx0ZWRfXznsgtYBzdx9Q
 7FXtcFy4VAxYUKRTT1HWTL6+N+NNOBe8mGXRCq6Ayqq23t+ByZy7yfcKDQqgaTUifKumtYVTRNX
 rm3Oyjp3eHmsmfs8TFyq5xw/CXJ0pvNGSMCVDnCuwJ5Du5I2a0l+143cQ+PabpfRkCw07TEbqyT
 DfDAjw3egdvt+6dW7sGdA5JtMwf8DxaqcN/39m1jOyLHul7aKInVYAqhLitR6ikfNJ8zUcenM6S
 1WxUVC5UNI4YYcO5Hn6eKxLbLUdd2hU7Oen3Uj/+xNbLFuHfo4io6a5Jp/lJmFQb8nE3Ek7UrB2
 y8iA3GN7oftSn3h2tnql1KIz83S9WI/K+jNqYmtU6gCFnU7EstAqGC79HKO0672YWiBLX6lwkqP
 jruHRKqXheQDsB/tSLhkd/lfk5ANrrLTdFnX6kfbbE4KCHQu6iaGpGCzHD2GaxyQi+8GIgYWmgS
 IDhRqnUZ52ZjO8c9ElQ==
X-Proofpoint-ORIG-GUID: WU36IGz8Ff5CJoFHNkLdywgstdqnToOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040168

Hello Konrad,

Thanks for reviewing the patch

On 5/4/2026 6:27 PM, Konrad Dybcio wrote:
> On 4/27/26 7:05 PM, Umang Chheda wrote:
>> The monaco-ac EVK is a new board variant which shares the majority of
>> its hardware description with the existing monaco-evk board.
>>
>> In preparation for adding this variant, extract the common hardware
>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>> include file, and update monaco-evk.dts to include it and keep only
>> board-specific overrides.
>>
>> No functional change intended.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
> 
> The patch is a bit difficult to view as-is, but the gist of it is that
> the resulting monaco-evk.dts is:
> 
> // SPDX-License-Identifier: BSD-3-Clause
> /*
>  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>  */
> 
> /dts-v1/;
> 
> #include "monaco-evk-common.dtsi"
> 
> / {
> 	model = "Qualcomm Technologies, Inc. Monaco EVK";
> 	compatible = "qcom,monaco-evk", "qcom,qcs8300";
> 
> 	/* This comes from a PMIC handled within the SAIL domain */
> 	vreg_s2s: vreg-s2s {
> 		compatible = "regulator-fixed";
> 		regulator-name = "vreg_s2s";
> 
> 		regulator-min-microvolt = <1800000>;
> 		regulator-max-microvolt = <1800000>;
> 	};
> };
> 
> &sdhc_1 {
> 	vmmc-supply = <&vreg_l8a>;
> 	vqmmc-supply = <&vreg_s2s>;
> 
> 	no-sd;
> 	no-sdio;
> 	non-removable;
> 
> 	status = "okay";
> };
> 
> 
> which begs the question - is the eMMC only there on the non-AC SKU?

AC SKU as well has eMMC - though it uses another power rail. Currently
changes are not yet ready for the AC SKU hence haven't added the support
yet. will raise another patch - once it's ready.

> 
> Konrad

Thanks,
Umang


