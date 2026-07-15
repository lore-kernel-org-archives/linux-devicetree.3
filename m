Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAF442BC58
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109764; cv=none; b=mBnvv2ogpk6vLlgcuFERsFKkEEAxaVKGzzVCkQIjgOJnfSi6CHQV6gdRWUutLL/rc/TlTp6LlLxwvRQwREEs81a0iy5DEwiK0KotRhJjDPMuoE4eu9ehNArGYHDqT6KD8nv5AaZF0SiAK19LDGHGqkTUO8ITp4+vuHxTp83wweg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109764; c=relaxed/simple;
	bh=X4NF+McAcxUqThnGUD6A1f5AYPYw39dM7Dvs7CZJmuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hz6MskTuJlLFmkgymkAmqYyYUyHVDt5b9ks5H/IatJKW/rxkzCYrXqmg77HMpTzGYuz1gKdBB/AWu46Pq4e3MeTnKhVJUsdhWZ4aD3tCe84uLKTb0rQz7egTFIgSOPi+v+mPjlFrWPL5TF9zNxfxEPDo5cxsGuNNCu6r9duin1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa436c9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GC0ZfKuZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pa436c9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GC0ZfKuZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9iixV2622101
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3dtyslUMAksOtZ1g2z3oPzlCvcvMPUpkJW/ah0ZywCs=; b=pa436c9HeUbzvSq6
	ycByz+xM8mJEOmTnzqQk+lcDHaPOpP0Baw+G4pLBoNZTFz965OusknI1lS/b+lXT
	OqZkwYN3ud3XzPbjcwpUmPehCElY+olDg603RI3LiCxp37XDBZO3s8/Sk+yrd1Sa
	/O9dMChjNuCICGLZkESRfTFxum7l8Gg7xGzjzVfF8tc+zV2/ijRzUm6P20zSW8Qu
	pUg1ixF2bCKHFqvHe+MeJ1/KPYbT9+kbxeYvmWfAzBbknmjNx/UvK0ReooLtBO71
	1hPg4IHxYHE5D5M3e6PCSd5rhRjX6uFLGpqsWqATTA8om6rWO5R1LSYxqB5nsdZy
	Y34Lvw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vhqb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:02:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a1cf1638fso91306137.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784109761; x=1784714561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dtyslUMAksOtZ1g2z3oPzlCvcvMPUpkJW/ah0ZywCs=;
        b=GC0ZfKuZoRnN79BkLf84Omgh5p75CaKziaXbbNZ4kgaeEGxgaeno+PFbueBd6KGDr6
         aMv5RuHfa9PBIkqhXvyEgi3UjU1zLRSyHG9mfHnEMhd6JN/VslUuqYg7mYKMAGMCk6fD
         uYRfxcUCLLLnCPtLBbvoMSwOzCb7ErsVVH4Q7ohF1heOs82CkHSJtRfznKUeRLM16OZE
         ZGTPa9RVLr74h3zEs/M/CAWQxSNEothFtJaFhO24Nmb4VVtU44roHyr7UZ5CBnIbItol
         yVuwe5iWHVVeMu0tmlvbDCgSRWMSwsKGFp8HujDNaedHSg+Wvejdu3XIY5vddlC4tiAO
         Je/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109761; x=1784714561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dtyslUMAksOtZ1g2z3oPzlCvcvMPUpkJW/ah0ZywCs=;
        b=Vs+43zzU+LXoHNe5ZjHrphiPyQmqApjdrMuPvwsfiWjfnt+wfxd+xC8gy4lVr4jchT
         Le2hfqDskhjuF2LMZrHEkOgZlnYtxw7ag3Tsz1zLSkHVqK/KuxLKgPB4Ytpq0QqfEbls
         pRo/1sPAcRl1Sx+S2ygifrWw/WMbB6fSY9NGWzvJHjnzp0w/R80O8Iv6+OtX+b1JLzzt
         OLCuhxS/g1V1XVT+zhX0Orrz9Q7pqGV6eL5FxXNZzfOPacwKBrnVe24966l2LZVo5+LO
         xHY3Rfg1uUwxrBCuspOoGIPe/z0BfP478SqsVafKYW1uHeLvYjTKYdsw9Ue7CH4VuR7o
         yO/A==
X-Forwarded-Encrypted: i=1; AHgh+RpWDLZ77TB7ti1G3HuYwqcT1rF4wsQX+T7zgTKO5OzPxE8pBEBsETZ0ASR1mHorgN8dV8bVTd7xmMFV@vger.kernel.org
X-Gm-Message-State: AOJu0YxwtMCHu0cVBKm9O0kmqZgAp9Fo5u8o9QkBAUqx2a3VQkESBzWV
	VxFiBsT/Up9xryZAh/hYpKNmuMwMRTWW2uYrfjfMB7XSJO5kHijFB0yPFixGOy4wNrMmOLCDyUK
	JSNyjjERU0Obey+bFuqrnkQnoqtlckwu+MTVPMOWKngDzsYgQrIZodsc4b2c7RCCr
X-Gm-Gg: AfdE7cmKwuOFD8eaaD8cHQ6aYt1TXH2KDK6YyfaGzfdlc/tldKB0U2GNOZxuvq5A5Mv
	l3iMDnaCrZ2ajisjsghndQdfKVJFvaEzA5QL3vdmAhqQVbNB8rSgnaVVAb0k+VDYpSU8lY2bC4q
	5OfFEFQn8GM7/wOtjNhWqPeXT+K9XXylHJxuKNglOuJq8TohkfJ2dOntEmmXbBUDlbeM+baLrM3
	1oU6psQG2owT+Itd9gLSGJ0hV7urECphpVtlzsiBxbd54ojOd3z3qsWJt4rS39FuZin3AKaLZQB
	Q7/fgf+vDFR5tYSNp/75OuWaDnJyFB0m0Eu3zkjdOB2E9pwEXX8H+VmkTdiM24vja2B8svfHPDN
	Kmk9ASbWLZYR7nWBY2jwROg4g6yrWmHjvXCc=
X-Received: by 2002:a05:6102:c11:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-74533da180emr3860078137.4.1784109761514;
        Wed, 15 Jul 2026 03:02:41 -0700 (PDT)
X-Received: by 2002:a05:6102:c11:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-74533da180emr3860068137.4.1784109761138;
        Wed, 15 Jul 2026 03:02:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2955dabsm2691322a12.28.2026.07.15.03.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:02:39 -0700 (PDT)
Message-ID: <5756164d-2e42-4eb1-ab18-69c6f784b789@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:02:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: shikra: Add CPU idle states
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-7-3d858df2cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-7-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a575ac2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AJ4WnVOIilw5oRoLkpoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: T_MtdB0b2SJTKxFWw0PIoe4grbzoZ247
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfX5LGD89Dld1fl
 PhPZC41COWU9cCi48FkMi9eNGblfhp1HuXKHoowOYQOHKXUhBbF3nvXCLgNNq/nnZ4pnpKej3FR
 uOPfyOtLqKqgm1QYHH42dc7V8GJ/kvMmUKvbgs7/iN6s8K6/9sgfvqT+vxVTPBVcVnMoltXe/tV
 qG6ePkMum3ywJs0CtrqzRl2nMfszIUwrpUcXJkShmpBYu5jL4xjw6SE9H2XJeudZRoyQH41dHAe
 lNYGAdS7m1OYoOaQlM24lJ2Mojlclr8/h4fGsAKYAVMFE5KVL1PXu2iiAczTSwqQYkGmCEPkvAH
 X3P+r4r3ogQmwgne1vVHPUgfIroqyWuCKjKJXZe+9LUymO8YYxDwTnUjdvOV+6vj4FZRd2OjPfs
 uftG5fI6rE137aHP3hDTRytH2vO79JXHVwRefwX9Xa+fqZ21qinnXyE1yy+EWN+YjF0wzPWkl5i
 U37oJBPnbdd+zW7UJUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfX/pGzVx632KFk
 uveXDMHFW1+i9EwFbKkWuQkCc76ZGwQ1zl1v1V0cERhGF2FXccjg94zlCwA7HbHGcIlH0UmJ0jw
 rWUXPzcYafpRzwtlJLNtus2bXTG0KZY=
X-Proofpoint-GUID: T_MtdB0b2SJTKxFWw0PIoe4grbzoZ247
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150097

On 7/13/26 12:25 PM, Sneh Mankad wrote:
> Add idle states for the  CPUs as well as the whole cluster. This enables
> deeper-than-WFI cpuidle.
> 
> Add MPM under cluster_pd power domain.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +		domain_idle_states: domain-idle-states {
> +			cluster_sleep_apss_off: cluster-sleep-0 {
> +				compatible = "domain-idle-state";
> +				idle-state-name = "cluster-power-down";
> +				arm,psci-suspend-param = <0x41000044>;
> +				entry-latency-us = <2752>;
> +				exit-latency-us = <3038>;
> +				min-residency-us = <6118>;
> +			};
> +		};

Is this really the deepest state available on Shikra?

Konrad
