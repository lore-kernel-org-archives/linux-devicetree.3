Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF1F472789
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946756; cv=none; b=t+K1U+PiqkCksuVinwkxLWlfQaECNzHZxm+qUFtHIKsOzMPvRMTIt/cmVtX9pMLcyCrK0NpPWz5Vn/JPlDkx8z/r++gd7S2KyhG7h4GQvL0dMMhLTHPvYAgsv3i8pEFKfQXapJevxg0ReX6YUPNl0/aoEQMGyRnmqb48WdgQcaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946756; c=relaxed/simple;
	bh=6ayzOsAvdG+G/rn6syoukfBuBdqHDmFchWC+bLjgl+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t9dD+/Gmf/oXaLVoTXDW0e3+5Y8+DKLsdzlvLW9nzjQpNMOqaZbfQ+lVVMrIz3teHP5v22BIPb40IidCFx+iLbch5YY4B7jpZMweF0gYuuQVUg5HkuL+LUBjKUY8+zds3BptL459aVoKMudeRIRvaiqnz2/VTWhamRE9Tmih+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIppjMw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScDYow5B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIppjMw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ScDYow5B"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896kmgx045553
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 09:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/EmgsJxrD1L3erLFRo5v6HtacTKMKtvJ59uEs9Mbc8=; b=KIppjMw7N9Ur2RFK
	BMM0ohKgDYdQe30tJP6APMrKtLe84yNNb5Bqvptw8i+8Sc6KdBYEuH4FrE3uVj1S
	gj6I4iuyF50o6xjdKETlxIR7NvzeAIsP7Gpd+Y2zZlZ/1MkOIyZT1q1fbUb2hUK2
	bngPXSBpf2paVJCHityyKjqfaad9wASo8HBC6kis5FQ/xduQCSYn07pnX/WHqCxJ
	lEWXfUHolAqAncRJfedEXnMV4IIcpJSklR0MMMGHti58UKe7rzl4XuuwE2+zWk9G
	ca+EQQamKsWpO4jKjHpNViAbSd1uDeD6G027jtuUkotyDdrg4R7YglNamc1nwmRD
	ihRrhg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewk9fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 09:39:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90520763ceaso12656466d6.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 02:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788946747; x=1789551547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/EmgsJxrD1L3erLFRo5v6HtacTKMKtvJ59uEs9Mbc8=;
        b=ScDYow5BjXLSlb8GUxXBbGB3jQSLWVnuUmEKYA4FAJg/iMMsPAp0GAM1aFYnjq1hht
         RJbe91/W4Qnpuq5E7Ncy+xt89IeOOb0q+E88ydAmNUEVKw2ngVO9It/6E91btXH0nFre
         kzdHkc2ZCbag9uwwV0B+fkAO+Vbe5lIZGiFhQMrLNlMLH4g7rFxM9EMjvgfbsikQ5aec
         ruikJuvtAFYYN1cy2AfCZxeS4qhcL4fDppAuPH2swqdwBFLFUpeRM/V/Ez2oYidXwQqW
         aT62qKmL9rsUyxxeUVtfjSrGt2mM9u/nei1tUYKP9ghCx5P1HSCmk7Unq9vpNBzr0n2w
         CV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946747; x=1789551547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/EmgsJxrD1L3erLFRo5v6HtacTKMKtvJ59uEs9Mbc8=;
        b=If8ocgkzBiKWvUz/zNyxbACyZjXFtGAm1WXrQcYnU5XqUwYlmKQjvW2ET+Rvple8tc
         p8hhDPNB8lI6xPnHkDpF9zkSCgSftA5b3SrbIwxom9cPZfS7irF5NjBlDwcCqZlj5864
         7MOmhkGWqnfDWOyBYBqhLMhqsfQxeMbhuo4rkyzRkq03Z2d85j7n3b7aF+cDtu1vSm7a
         NLBJzKRIfyWMEi+ebXkFe1AWE/jl5o+jmeUAKlKy5Z6n0LXTipsyPltLnBqWigKSzVKK
         GzN00uqTMc5FEmYwKb5CtJamMfTrz+nlB6SKLyXFeZAFXoPoSzzIKiqp8/DlAYA+UOTk
         2LIA==
X-Gm-Message-State: AFuF++n4MZ3oqUpb9JM9MMALM72K3o389qzv68vrlFYRvxbaM7pjvq6r
	MFrHMaIYUQaeMUCj7MqVCXRkA3dwSVhAekAOCtfNy3KZDUmC5PX160jAXb7s51rQxkm7XaqRIcF
	AFjj5S7S2cFtVJWaO0Z0JhbShh/X4JGUNsyvdOGQy2+X31h720hrbojY+uO19DBs4
X-Gm-Gg: AYBFou0IwkPlsUr85vl0z/B0SuWrIWdPHJzN4Ujr6a0m2GcKOzhrfIgeBzoDvnGQMA0
	3Vk7BdE0HldHHMtqXIluB49y+tLhOEmmXgPcsmcmXup8Smf+anrrfeqDfFyhs15mJm3V0Qz3ldT
	+5v9T2AlzCzy3X6WOsh0RSeKvgVj49hbEYNEG/HNnn47eXIyYA+gZAhtgZDElWQ9O4iaDhs8Uvz
	evBMc9VwnZL62BM7IWXGODPgxTOSKBedOmsQOKFYANVeutvgiiU5rOCXajCvXPLTIVdmRH+y6oh
	cnuufxGhTv5fb1Djo5s6fAEdCc65IZF9MOmFsiwCDHrCl2ISFJs+R8hEbw/X30J574L8nx7tMMv
	+XPUPm2iyvzijxKk0NEmd6g==
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2182395285a.2.1788946747316;
        Wed, 09 Sep 2026 02:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2182393585a.2.1788946746884;
        Wed, 09 Sep 2026 02:39:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6beesm6664052a12.8.2026.09.09.02.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:39:05 -0700 (PDT)
Message-ID: <77f0e1f7-ed6e-430c-812e-4eb316373937@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:39:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
To: Shujath Mohd <shujath@outlook.in>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa1293c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OxYfkThgsBOJW6NJDhYA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: QdehWQ9W-hZR4azJux2Ct9DSkc5lv3oA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX1YXSFqZlvmC6
 6avVMZcIKGFfamIBVq09Tp/ZXLRbrJW7LmuUbzwcOPOtvJKXYl0CiTidrnXeeyJwAi5gQ3uwMxi
 LLGxwtT/m5wlry+ZXyvxIIuB7OMtgLzhr+YNwEN/kufI5ZkGsGzKOsIOmWy+bZVWISKpdju8jyS
 c5T2mGaE68ZFz1M4LVhaGwnhd9aH2gzA/j35HYJY5a3GODaqQu+MCx+7r07FiAbOKMH0dHjRhCO
 vdTx1xAPNhn8e7nD/+FQT/ZqoVz2RZF9n4DADvrvgBSFvTbKbxUwXMAyniQKung0CbC1k4pqJqp
 ary0KiavNZxHmDLsqQGYsIQAdlhsDGUxppm7DK493uwS75GRryJWvJ5KYhlOEUy/DDWTeV0klPR
 NLWYaEqIYL9PodOy/66mpAt+Vt1FhALo/j0jUKStgEVwj3t4VQ5yeD2gqxC/CvK9s55LkRzlHY6
 UUZQCtL9j4wB3f9jlDw==
X-Proofpoint-ORIG-GUID: QdehWQ9W-hZR4azJux2Ct9DSkc5lv3oA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX5DejXAYjVbZn
 DZk2sdBUfYGxrbPzffNtu6hEjaPIGqPERt5IH4WUyt09C9eAA+oAweJHtMvWRXPPZ3GwMC89rF4
 aiYsdsGf6Z648ONubIMGiYckI/8EPQg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090107

On 9/7/26 6:03 PM, Shujath Mohd wrote:
> Add simple-battery nodes describing the design capacity and voltage
> limits of the Xperia TAMA batteries.
> 
> The Xperia XZ2, XZ2 Compact, and XZ3 use 3.4 V as the drained
> battery voltage and 4.245 V as the fully charged voltage.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---

In the downstream kernel, I see:

fg-gen3-batterydata-akari-byd-4250mv.dtsi
fg-gen3-batterydata-akari-byd-4300mv.dtsi
fg-gen3-batterydata-akari-byd-4340mv.dtsi
fg-gen3-batterydata-akari-byd-4380mv.dtsi

fg-gen3-batterydata-akari-tmm-4250mv.dtsi
fg-gen3-batterydata-akari-tmm-4300mv.dtsi
fg-gen3-batterydata-akari-tmm-4340mv.dtsi
fg-gen3-batterydata-akari-tmm-4380mv.dtsi

fg-gen3-batterydata-akatsuki-tmm-4250mv.dtsi
fg-gen3-batterydata-akatsuki-tmm-4300mv.dtsi
fg-gen3-batterydata-akatsuki-tmm-4340mv.dtsi
fg-gen3-batterydata-akatsuki-tmm-4380mv.dtsi

fg-gen3-batterydata-apollo-tmm-4250mv.dtsi
fg-gen3-batterydata-apollo-tmm-4300mv.dtsi
fg-gen3-batterydata-apollo-tmm-4340mv.dtsi
fg-gen3-batterydata-apollo-tmm-4380mv.dtsi

fg-gen3-batterydata-aurora-tmm-4250mv.dtsi
fg-gen3-batterydata-aurora-tmm-4300mv.dtsi
fg-gen3-batterydata-aurora-tmm-4340mv.dtsi
fg-gen3-batterydata-aurora-tmm-4380mv.dtsi

so XZ2 has 2 battery suppliers, while Premium/Compact and
XZ3 only have one. The -mv suffixes I deciphered to be tuned
settings for various aging levels.

The BYD vs TMM batteries on Akari have a different capacity,
and public spec sheets match neither :)

BYD says initial capacity = 3056000 uAh
TMM says initial capacity = 3217000 uAh

the spec sheet says 3180 mAh, so presumably the TMM one was
used in all models

The constant current charge threshold is set to 4370 on the
-4380mv bin and the DTs don't clearly specify a lower bound
(maybe in the qcom,fg-data blob?), but 3.4 sounds appropriate

Konrad
