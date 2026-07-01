Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421C748033C
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905872; cv=none; b=ZgJXe14MYkw06+E2GIXWb1ir9Dp2MVnpgM6DYTQVONdpjGIPQovIp7yuYqCccGvj3jJTKMjf/4yPdr2u1+KdSXrcGqmwW/6GqkFvDMe1bb78P+7QWgaXkOAvl7GXSz1woqNKyVrJkR6Jl0AXGqPRoZP4PR2T1FmV/Y/n04luOd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905872; c=relaxed/simple;
	bh=up0C0oytixjQf/FBVqm5fVh2BEmRSswqru8S9l7dq+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luQmeADmlbgAxgXJJ41/bpbSw6PqjWOUrr7cq2WIz13AohLXwlCU+auOpF5gQ10SiAGQOkYoK84myLIZV7EYYDpQkrGmbLRriTp67JabDFVN5VpaxICnwKu42bVWlJxDEqFPjLS7yLRkcP4MZjOHdIeqTtUtOPK7eEYbeeYjhPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Va9qc+vT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9kFawwN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Va9qc+vT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9kFawwN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8rGC763048
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 11:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnMDfMcHILR8MaujBWN2IXVrf1V2crbHAtbaDB4GjEw=; b=Va9qc+vTL5+0sB0p
	t1ZapklWzsGiK8oNzMWQqcWv7hWCP+WN8CGF/el3DHEFeEJqQ7hsFAaoIq22SsGs
	LZzX/OCvxOOryAWCd4yU+tjfYOYdbADF07xUYZOvddZnFhPpWp7fChAaq/YiOZ4Y
	91A3WVxWRsVSZsyRtdvvyQAHkwoQQE7ixSZfasDkBpuR9uNzuU3HXn7dIwX5vFzj
	KtjxayJ8Hocx2r6nPIqeBMw6EJ8uAa6Vje9VUyerF/u0E8V5rXHmr2jSRCSw4+Hi
	FdZNgTJIYjHUFJyZLmVGeRYfHTG8ERg3Nq3LLEwrqwX0udxeKTPy7Hj/paNbeJ+O
	vwedWA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbwwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 11:37:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso1236961cf.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905867; x=1783510667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KnMDfMcHILR8MaujBWN2IXVrf1V2crbHAtbaDB4GjEw=;
        b=f9kFawwNWWntTOUqGnRwoOFFp9Csj6BPTsBXnqVUueUQ9XEt6H/O6106Dxso7KzBdi
         CAyE7egDRzaFX77zA5zGNtl7v9uZDVVL+aJg0kB8wzM6/z6FUQqrAvUoJQJRY24OmMFQ
         r3sCreb+xEoUqMuIQTBcPubZMEks19TynpFi1yrfxihJmMM+ZwCUjbAQf2rFnq8LFZu2
         nGcHCFwG3Sd9dAvabGpNh3uzVKzYfmnSnO5yEk+QXjAKKi27mVrLU5O5vWonEbxYcRbT
         UnB6VJ+VbAjENbCkNnnT2E5p7HIZ5aRkQi+tGQNT9AgBT7LOTv/A7cJQ0ppTT+gAPbwu
         5u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905867; x=1783510667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnMDfMcHILR8MaujBWN2IXVrf1V2crbHAtbaDB4GjEw=;
        b=Uulk0ON03p6p7tmVE17CWVAgGuGR/xu+xNkhrJc8KQCiRxfCRzSVd/o+xrPd32Jcku
         ePveh8EqvRDRy0LPSxPnbmMaomZbL+C9Y0g9bneLyxQUpKvvUHfqvzsDfMj5cGZMp9Fp
         k94sZka4jK5iYqf+EHQMMNaL2C6Qs0UXpRn2cwT0+gmzD5lAD1yLESEr6yLJHymDEQ73
         +aaCewW7cA82vhAXYb6NIwvJpLyMl8TRjYqW4ia7MaoofAelpSQbSwrqPxIbUD79Igz2
         6qD3imQow5ImpofGhu7Xtv16wLstcTO0KyCpEq6pW2b5c9kb16GYvkTJeG4fK/8qFOJ5
         CLYg==
X-Forwarded-Encrypted: i=1; AFNElJ9qZKSxz60lNby0PTkWUIROTb6X2guja4d6nUhi2/DpEjtVbthaVbpp1C1MrW7PJd4jTNVNWPzK+8yN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9MI/CgLgjeiGKOrzLOYaBNivUlQG+v5XyFIxyVbq4TyjOUFYb
	WwufKcR2JdBdNGGUOc4FbOcvmkoBPNrQbOdDVCj/Sj4a+//YErMprx+rp1ZkDe6/7SWfKFGrmnW
	uEXEANFH3D/YhNpBZ8jnfrmhGgit5PeftSlVHOSQF8sq7wEJa/iC6BhX0E2YvMCBV
X-Gm-Gg: AfdE7cnWsmVgvuwxaQ8JPtL8urcZq5vZ3hBRN8aFkAvlItbXPFGsecc5Lrk6mcOb7QI
	FLXBL/z57vEszkpN59mwHQgDid2/Z0iDoizdsNkLko3xoQWdSC46WQkv0c1SbRXP7WqymgF0yKb
	6dRCCo+++xZ15AUv/cwJKohYSQ2Wn5+gT1U7d9glkVwLG9qBimlfVHdppYWwEQGnqofcG+dpJx5
	PsKm90XE5BVdTyUuQocbhJiuMI6rjfzvHSpEjfbR/KaqqC5d2abs12CcKnQOfLygRG016Yutg43
	R9Mu56JzeioFKV0onqKobZidoHg2YdpgQsMkZfVRnELSCAPqD8al2Im5/4yYvuwOX3lnPIcG8LV
	x+3bgMYUv7SRw46HQ1a5SRtUfqgW/V6JHEm8=
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr11241781cf.5.1782905867279;
        Wed, 01 Jul 2026 04:37:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr11241521cf.5.1782905866877;
        Wed, 01 Jul 2026 04:37:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc4csm268596466b.34.2026.07.01.04.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:37:46 -0700 (PDT)
Message-ID: <b43691aa-6d1e-4df0-9d1a-cd5c4b3e3dff@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:37:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] arm64: dts: qcom: Add SD Card support for Shikra
 SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
 <20260630165700.1886608-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630165700.1886608-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMiBTYWx0ZWRfX4/pUhFVbDZWI
 kno8sCj9XR75bZi/b9cORkwWl+F5/VWaxz9/7LtJ2uuapfQitaDplPnafRxOGF7gJDYmi1p4dYT
 yla8P46We2HC3sXFQ06e9aM8L3Z2QiI=
X-Proofpoint-GUID: rpOdudMcHsZNJSEne_MY8sSZ-Oi-PwP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMiBTYWx0ZWRfX2ecn0p4lKywS
 PzF80jpJWsJ5uZqRh+wdry2fDNZaGKSqzJMmNnYUHtA1Jmrg3GqZ7mg0HGBLBjlh44AR3JGKY5/
 XmNhO+wzL7RAI660wiMzuoXrASQPLHJXAcjIlMvc9tZqyIlJ59HSoc0S0AuAd3G1J8JyJDwzyK+
 n0rADgkJaLQAfee93h16ZwPVfSjDj+hEoPRLUaD5iVJAVDUHFxvFzTsXApxOk6E4U84Mx7AJ1c6
 AHiSIdnY/8q+d2BKwKkjr1o9ckQ0p8UDcQr9J8Sl/O3gWfSxU/8VREIbW0AFTbGq9IIrNHoSjbc
 I8dBy4H2NFfBpEI5oQcMZiMNQS23FjGGxH4WOrrTDQ8hgfHtZmV/690x/rJsfMDr/xwgBh4/8ka
 Yn4xYyVoo37HgIjX6IPLOc3QOxc0UVAVPJnCJ6Wbh5dYOUvdyGzE8uQkINuzZuEYuJlzZP6I9S4
 pWmF2BzQiC1gHybxe4w==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44fc0b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BpmcFw1FbD8WNArM64UA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: rpOdudMcHsZNJSEne_MY8sSZ-Oi-PwP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010122

On 6/30/26 6:56 PM, Monish Chunara wrote:
> Add support for SD card on Shikra SoC and enable the required pinctrl
> configurations.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

[...]

> +		sdhc_2: mmc@4784000 {
> +			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x0 0x4784000 0x0 0x1000>;

Please pad the address part of reg to 8 hex digits with leading
zeroes, like all the other nodes

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

