Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1D637F339
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753190; cv=none; b=mCSk46HpJN24QVPGFXaExXwpMVChrrsMg0/HZMh+KYrOBDMSVTBPhK3pWKXKdiO/R9dHxcb1ncOg/Pf0iu/qkiQZ7HyE2HRTEPUd3yprndkPpMEfX9fQuEoSx9kMzbwmLs1EAlovcRqE0cPfcY2w6C8RNuvTEySB2G1Dh2VsOMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753190; c=relaxed/simple;
	bh=XBNsRZbfUu6fSuYCGSsDNVTBu2aJ569/FPmiJkl0pJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsBaEl8eqKD101wrVXs7v0vO4SKRCHvnIaeL2ZggTYWNtulGFDiP5tZwpedUS2G8RgG0c1XWd4a+LRBvry4+4yZ3JlDk8i+OkgIDZvQ+E6aMR1qrU/VJ+vIm+E3igAfHnSFfMe4e8/xpJM1IplVUGJIXlawnA15TfQcUVfUijgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCoOpEQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXUkuO6L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCoOpEQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXUkuO6L"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736Dm983883017
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 10:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUVEG4Tg21b0/bBSzmUSCw72uxG++6DCgOpS4YwAsSw=; b=ZCoOpEQXZBKeUANP
	N5DArR8JHarQhGdsvvfy1Wm+ccPqzuXIpEVMgsDtFgPkKV4LM6dPPESHkz2YYx62
	KpUsZXmvaInaluqx9vctdoxCzesBl1apjQeQwfy5dKN6Z465r0soXr9D+uKUbEEV
	EXsjEaiY/N9oZXvmiSBta26iFXqgM3hMyeCKGOYVX2w29qrofNrWef2jca640+vc
	a8G6UaUIZIfgi/yV5msgkQb2m1mUbFS3kwCZQfaw0NgjwUJHUJFXOdsGK5S13qU5
	C+V+Tlt/DsEYYHsi3mQSou1OYHCl1+rd0E24/M8IaRvQVhfOW07fbX861LaTVMvU
	DIm6UQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkh36k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:33:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so4257001a12.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753187; x=1786357987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUVEG4Tg21b0/bBSzmUSCw72uxG++6DCgOpS4YwAsSw=;
        b=TXUkuO6LGTQYfRpopHsShtenTn3RE17on4P4Eyn04AM6PXU1y8zhyyFTe7QW1B4u87
         p8F/mcAYvuVP45cYXQ+nXLMaZqRdvyftqesPasRemCCbPnD8q54HS0ZDbC4N3lQloGzi
         MhGyUAEUBxq3B0IuBw7wYlwMX8845lWuBu2XgoydIrli3M+sPGULrfR11WQ6T3yN30ar
         MGeNhYZ2XGgZikIluRvk5iRKfp6hhUwD8uV6teFE6UiXDpaqXNGj4U35oTotrMSXVvxb
         k77vP29nGwru3Duzj/Vp73gbjLx69xacYsoRGoQK/jjKqybg9wWPQ+4itUHJwl70zAMM
         G1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753187; x=1786357987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUVEG4Tg21b0/bBSzmUSCw72uxG++6DCgOpS4YwAsSw=;
        b=RIJ+O2GY74ByY+4inOMs75/sMnRrhd5HXFbWtVrY1R0wuR8gyaootUugicu4zJ6YoR
         PwNcNay/Cm1btAFk26KoMvtf4hAVw1aOfeayHAqaBvj8bV7GrTRmitero2pGDGUbwYg0
         7jibUYNBuqyai5D79FdWH8DeiPXlVHpIdo51U9KsbIjB/7XYm9ewdXN7sW5yz3fP0PaC
         UttadEWhdbylCkE7rFzPLrdHkEpB6jGQSIkMJtgZXcyDDuHTDfX2mrwz2AHfNB2XbmuO
         nnQHlS6pqQIdvVGIiJvcaZnQuXCr3Oobw+0iYUDUgvUOg8Qhrp72hnd6iPT7yWeVbx2/
         g/EA==
X-Forwarded-Encrypted: i=1; AHgh+RrOxXHxENuEfEEAroep9DTNZXt0cqjz8jEQEHdtR0/ScEsru+pJFobMzXUfKuxkrLwo5dyM4RGGa5BM@vger.kernel.org
X-Gm-Message-State: AOJu0YxesVzuAKiW9ClgAmDVNzrm4wnTYttHTWe167iMSqtMR//VLJpc
	IRhfMXV+SojERN4ICotzdEl65FaVLzTq6SBtLIIm9fzQTJQnSIbPuKljjxqnqvsqd485yuEs+Ed
	mgJUXOUwfWnf/E7S6PgRI2On3UUsKaisp1FyZcdH/R9IrYJWsPqZ46/69bBqaJXGM
X-Gm-Gg: AR+sD10cexwpMXUleI8BKW3+Cvf6vlUAsUUce8GrmLmh9y1jY0J8rUZhqjKEtjW/E5A
	FEokFW8baCJgbmlEcioCXdkzsmff8ysksuVGrezVp0BVrSyCAvb8A1aO7bt0a1nnxn+CsrgN3C0
	gcMCqWlQqAXC+Z+QDtUojFyChzwk4wisGIQTyILkIL9cVLdIizqdhJzVsFGQ15TuD8ALzXlBbuu
	kngyi/QFelHwMRpIXGnT/klo5o6Wv7ewwwc1VUC97aJrU0Hlq1aQcTxdkFOPBRM5vdIz4q/eQZp
	69LPfxw1l/1h1X/f9ibD2+k76FahAkY6SgqD5c8+FvJo0UvFI1N1B6NpI/isSly2UB+zLGWndCE
	1yG+3pLM3KkIuIe4qraMPryvs9x1W
X-Received: by 2002:a05:6a21:648b:b0:3c3:9595:57ef with SMTP id adf61e73a8af0-3c92a5bc4f9mr9402297637.31.1785753186653;
        Mon, 03 Aug 2026 03:33:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:648b:b0:3c3:9595:57ef with SMTP id adf61e73a8af0-3c92a5bc4f9mr9402262637.31.1785753186241;
        Mon, 03 Aug 2026 03:33:06 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm43148007c88.12.2026.08.03.03.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 03:33:05 -0700 (PDT)
Message-ID: <fc24d80d-c970-458d-a912-1d5f18a3a4b6@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:03:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: shikra: Add CPU idle states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <5756164d-2e42-4eb1-ab18-69c6f784b789@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <5756164d-2e42-4eb1-ab18-69c6f784b789@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tnl4V0O-Wzr4LUaqR7Sv9JRTabjVDnL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXyXcfsfaOjavx
 fYuiZSwrwpsA8ljdbDV4eOW7IZ9U+rFFlaZIQ8b3vXtERifJ0bw1dRmnEBINxY3v8AzFzz+ru7q
 nIMgduyIBZfGDHdQTBfqpN7rn3nz0UotpQAgr2fInyJTpU8R+bDhigjN/18EjAVmdK9cFYz9e7c
 tAJoAavCKeP5Wg4bQVLthdaSmayOJ7BMGu/60LKZrXbDUE+0gSkiPKjmVo6ruM4bPNaW95HBZTA
 XYFZRmSyM32OEpxufej9hNep1Lsk1MoMMJj6cs0aDRPyNLDGhVgBJi5F1GjNKr5pZQZ03dxQj2s
 CfnZKhmljJqLG5BJjrW5EwYFmPVjorbpGvz6Aao5O2KmSMc7Glxmyae+cB1x0cNpCbjgkwnHckx
 QupvmMYeO2nj9vizpZxDgopAZL18QCe+39j0hN7I2RJfPXPxsLohM4oKXSNTMogYW2wlk3pZDus
 gdReGAxFWOGKugibrRg==
X-Proofpoint-ORIG-GUID: Tnl4V0O-Wzr4LUaqR7Sv9JRTabjVDnL4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX41DBa9MGJn6Q
 d3y7K0HqYfJ8qKzCAI5x1tUh7X+6jN+s6treoOe0DYXJTzmM4g6AutaHwunQwc8bLasSLiOfDYG
 UhavumTck37aZgwgvC2udA1uNhEx14Q=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a706e63 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eFh9wa1xyOHWc3L4cLUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030094



On 15-Jul-26 3:32 PM, Konrad Dybcio wrote:
> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>> Add idle states for the  CPUs as well as the whole cluster. This enables
>> deeper-than-WFI cpuidle.
>>
>> Add MPM under cluster_pd power domain.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		domain_idle_states: domain-idle-states {
>> +			cluster_sleep_apss_off: cluster-sleep-0 {
>> +				compatible = "domain-idle-state";
>> +				idle-state-name = "cluster-power-down";
>> +				arm,psci-suspend-param = <0x41000044>;
>> +				entry-latency-us = <2752>;
>> +				exit-latency-us = <3038>;
>> +				min-residency-us = <6118>;
>> +			};
>> +		};
> 
> Is this really the deepest state available on Shikra?

Yes, this is the deepest idle state for Shikra. It does involve
handshaking with RPM to allow SoC level idle states to enter.

Thanks,
Sneh`
