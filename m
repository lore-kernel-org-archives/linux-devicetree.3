Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAAE3EDAB3
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336043; cv=none; b=JY1tCWT2K7NdQ+OZwbw6swEzBdH2tIQ4m8cPhWdiKTSGsCzRyY86Mp9DmalInjST38zoyFKkQIPjhWMyvWFy1hKqBSe9yPHqv287n409PeXM+ytHfga/fZIPxjGrg5b41XeQcSozQvRh7U4E+DLrzSya8FglJUIvbUg38ucK9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336043; c=relaxed/simple;
	bh=GSC20CtzxbmxBVORCMfWhPZFgodoTm+IPeQhXWhdJ8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDO67w8dr8pu6GTaqBtl1xhzi5WUJXmgPu0wbRgx/kyxovxBq+ndbn+iTg8PQh/7oQ766paNymdFHZa+E+0y7Jn5GJNAs1UFfVpWdafpo5whQaiiyPtZnfcXjByzRGZgqb0u6EnoWg1S0JRd12bZxyBMQdZGP8UeADGlqu1XB7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psP9WYXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFRMkmC2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psP9WYXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFRMkmC2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOKN238924
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 11:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBztFgeivDEDVCYAqSb+ojmxplpWHAAOO/i8mhVfjVs=; b=psP9WYXzjA6tVY4c
	e7rvWCUSBKLLxlaKYYldlfSj8q4wfEcWRj8z0GEpzslEP5lCPfkuOd0puPbQnESx
	dpHExnPs3jZUFkF3Qtj6ig3uQDhfh0W5LGqf+KBRZb95RDDco0i3w67KSO+AaKVA
	n1cgehAjkLnlQ//KiQS7HScVSQnbA76/tV75eE5Z7o0INDuV2vgr7DyOqtXFS7qn
	E5O7ExMLndq6u/rPHHfCpi8YSgNdg//4RILbabVAENfoj/nOPHSpNCc/o26wbx24
	s5P8arb22Ut9h7Xjcaw9TwZ3SEgi/xD2yyezhU4wYLHhkhdyHFS+rvennSmICyqv
	8A/g4Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88mv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:07:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c2d2dd52eso1628201cf.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336041; x=1783940841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBztFgeivDEDVCYAqSb+ojmxplpWHAAOO/i8mhVfjVs=;
        b=dFRMkmC2pgvECDAQKDDmjSgrBqK3+nlQX7NllSZCxOHKDURJmJvWZwbMr+qDdELjkS
         /eVBHLT6DsYAHRnEMl6yjw2eKq4HLHstBIvnSJXiSU8d1BkDHfZifWa4+hekInckmuSR
         orYRdKKjd6+l2B5S1Q24n54P5pOt7oeUgoJzEqNg3NgfKd0Pq51RsajvZGOC6EJYxaOt
         5WQ6wq3mRIF4tfaoMrfnhq3S6fNFJbJPN2PxQaXCuOcr7L+U4ssJScJWqS7yUSuwXdqn
         aYYRf00DJfvActQqLOQiNPjukHXHQ2wlhPu80JB5ld7Q8dSjdOYY0YiUra4ufltmLF2B
         QS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336041; x=1783940841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBztFgeivDEDVCYAqSb+ojmxplpWHAAOO/i8mhVfjVs=;
        b=SNJ5cytHXymUksP9NkiAgUBBG/6Z3g3uIGgB79aStn81SY3NPMrRn+lUx4xYmq+Yf7
         zmYJPDFymhHSEbFuNurKSCKJWfBLisMkoS7dz9kdWfNm/9RqOLRbsCoqwFBMidIPV3Ei
         auEvEHZqqkYJzxrIJBSuggXtWaRbxadSLdYSSpDnX6m/q0PjQh6xouHjNDKZ7yd0P+ps
         rYI2KPu5RH8nNru8NS5ipUSMLJn6/PcYN8aLAAE5Tcc21nzalNf+/26mH+J/DQtaOUis
         JwdR4kMQpmLcr3GsEqf17WSMKwTQnB6y7pCSsh88gnJzJICqP+xtbwC7x0R/SF+dIGCS
         hV1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqsbthSa6/wHPuyP6I2AltI9PFxwWWsDFKaTcSe0MyFyXo5a2VQ1GKwXZQdvAnn7xuSn3+aliGPgSHe@vger.kernel.org
X-Gm-Message-State: AOJu0YxuhlJZGqBqRHugGT4bdfRHuZRtkuXVuc20TWcht/u0vhZs1aDT
	oZYrkGCXdNeOVzrLw6Mfv4ntG+5nx0Q2yid87gWccy7IEqwrFHHks6BYzVvkrF9PlphJpARKprW
	heolbaCNepHeRAVgqenVq6aPwR69F3VR4+QDTUvLLm5dZKmkxnKyxIObNQHlfu/6E
X-Gm-Gg: AfdE7ckZVLyurcIhpmm6Z/5sfq+Pe/ghjWISVf8U4tdPKTk7UoZKaTg/PWXzF+nby1T
	Gv7wSuOWbNLraBrlV+pCLV1QBdTIH2MvBGcgO6PhkW2PMzgekyd5i9EwRbHicE/lvEVjr79Cp+z
	VbLycEDwO6jcUYGW0ae1W9zE1D/UhfLDQYTOb1sXNF8yUjgtAUhnvuR/XxY1WnP79A225J9v2OR
	N77qZIa1bVYU9Hwlg15OEEReu1VfK2MbUCvphopx2hbIM7oBI2o1Xv1X+hD34s5s/gLz4C5nM2y
	s32rIfGScvXoj7J43ZaHQ/UQeiZdUc0QbFbFOg+FD/DY698dc3fJSzxjinjGwcbRe3ayS3J2jVQ
	ga5j2ahX+xWM7f2lH1NNcICd00C0JjIoHE6M=
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr97022631cf.2.1783336040113;
        Mon, 06 Jul 2026 04:07:20 -0700 (PDT)
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr97022121cf.2.1783336039446;
        Mon, 06 Jul 2026 04:07:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6055039sm720881966b.4.2026.07.06.04.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:07:18 -0700 (PDT)
Message-ID: <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:07:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
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
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMiBTYWx0ZWRfXzuebvlBqpyLy
 t1t48trbKGHx7hkHP9nDfKweM+FsY8If3gQPcBIOLTlE8S79Z5GiDZOGetNaAG4z94eJFo4vmYZ
 ZtDaw9lid2hYdJZMzMZRf5c8/nXxcJA=
X-Proofpoint-GUID: O-79oB4zcnCYwfZgCzPqd_nYNG3rimtw
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b8c69 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UMfccTTTTeY9HYHi3ccA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: O-79oB4zcnCYwfZgCzPqd_nYNG3rimtw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMiBTYWx0ZWRfXwznd2Czqr8xX
 YJSHvxCjYxIlIWX+doD0Erb6+CNecEVjoGrmSbFxYs0M+eSXnLqwhlzjjVgo4W4V81emIHAoWyb
 N5sJEk6qU0tUTpa5ltI7AtL0cGPe3zwolhXviZ7PI2liaE+xo6lvAkDS130TGAmWyg9TLrIZ5Ra
 0IIj4LSjHGDFUILL9BAqdsnc7oUybAjJ2FmU6d1CzDGpcBPuinxukd5vdT8Zu8VjyhJ1LqTgQVa
 26muCqgbHx5XGiZYAz6F0ocgln2l8SZxNUuBYhjlzUZRyXhLidGqnOnsRnPyKpHlNx/JUg1ZS1K
 oxcwLIfIMJbMCucgVSYvZF8jWHFR5nv07dtCE666h/vx3LDUM/lpaNumFZ8JNHLCBhQLfRoFcMT
 P02kjZRfk9aEN4dSxauR6HePjfp6Jbz/cIKT18/jYfyCPKrRZKdlmQ0vvk8MFsQBbLxcw9Gr2IZ
 MgcioG82gk4t30BXQeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060112

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Add the nodes to describe the GPU SMMU.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index c5635f22e2a7..e5b8377e6c3a 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>  			};
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x03da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,

674 is the correct globla > +				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;

This list is not quite correct. It must be sorted by the context index,
to which a given interrupt corresponds to - the driver relies on that
to give you information about where a context fault happens

Moreover, I see that the interrupt sheet has the bug where some
interrupts are offset by 32 from the base vector, and others are offset
by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
out which mapping is correct with the right folks

Konrad
