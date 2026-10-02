Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23363E5EFB
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954503; cv=none; b=D0RrWhAV7FmuKeD6QyG5rhbAD/4hD/K3QB2QOf6buntxWt7+oiGBqBZgjViTWzhblxozl2TP9FgdK2Rzuphi3j5UEk3fb1XBUS0Jhu4AN+UBqSd7TiRJrduFUJXz0rEAeIpSYqcuerWvaYu4Cfi3MQyM6zF+JejY8kaeJXUCruk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954503; c=relaxed/simple;
	bh=HqwXAusdM+gYXbua0HGVEf1r9M6VSJKUoWLDYnGhIGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0sMJLG5xP8Ou3eoRuqc7/ERinGGe1mgMmDrd3tzaU/Du3lV8T/WMzcC6AkFcYvfbvUqjPyhR1uHoNorv8Ry3bSoIzWacAOw+ngX+CMvJupjeGVYrASNeCuYVll4q/I6KPq9VmM6FxYb/4XxMu2BvBd+aAL+fBU6S5dT0/CFOh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fohTN48M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmZu0vW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fohTN48M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MmZu0vW5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGhIs1042865
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 15:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3zYMfD7SYACODh40S/6KTO+U
	vPK8PifRil7ROAHH8Rg=; b=fohTN48MtqndvLOqeSHIBh3wkHdoeZKqt7FSJqi0
	fFFXMbDBfmTL+qCdLpMNaqofijXG4qoLilelLg1k903QmD8uxoeoxT3ig/ZXvs7D
	+YokVGBiAucHKfC4FtWZk6G86GrJ9jlqJ7eBiV1fDcJLBuqP2ygKCLdO8Z2M9Z1W
	38tiGYK5J0EtVfZ2oqfvN2ec8JoZz0bzVqket/oLz+RK3rsjWbL2m7HcWE9fTInN
	i1SHdPDKJwgaHneZ2CI1hnp0FJCEps8QUDBuIN9aexaoSLMv/kL2NQGHKhqCmP5C
	IjvDBCVHhdQMvSmP+dD7GYVlP4eXOVNs/jpXa8CcCEERrA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdgb5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 15:21:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c103b27ff6so721185137.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954500; x=1791559300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zYMfD7SYACODh40S/6KTO+UvPK8PifRil7ROAHH8Rg=;
        b=MmZu0vW58dRqf5fToYlarvpzmYAvG1YHvihv4TT9pE7GzyRtFhJ+MTsFsWa49E4dmu
         J6le6E/7uhLjwBRqHAO8t15dAH+3nAlszeVUntzsQnDANPZzw0NglqUK0l2i7mEMc0s8
         2nWLFqOj+Z3FNOvL3JQRcrIHYMLXBi8ouAERGdD35KU5OQwavX8MnKi8YMej9e4Ar8K3
         8ZsrwTmugnxSYNoza63pu0zdxJcxsvbi35+AmMTWLT5LGLdA+9Ejodcky4ggK3r+sgYk
         RH/KEfRtalgxJ+/BiBPhiPiMkLK1x55EI+zs+Qh9kdYzIxd1V8Y2QRzMTKs5vo8xJWDE
         hKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954500; x=1791559300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zYMfD7SYACODh40S/6KTO+UvPK8PifRil7ROAHH8Rg=;
        b=PyRXpp5qfyExrnQnySoYO6aUV846CyPbmAQj8LFoTG9+SmzD3j4ozh07Vdx6IkILqe
         d7CsiAj3RhikFy+dML/bDKFyJjM+V3bHHGnPjdvO2uDWwggup6JKs15YT8dvfzUX4G3L
         9k7aOgPKdsI4F7lGC5y6e7AalBzJGgMym5VZXLuqp29DPgfLjNTF90DbPrqCmtzn6BAi
         L6Vv5qJCZqAqyCer2YQM34flB3EN4tj4UN54iZ4wmKMSxmYrmRlj+yDvjfRWb7M8WTPx
         fZMFK29cczoW1ZZ7/YAzDbZMFVyTR7+Ml516sG2jwtqJCBwbrf2qv1AK/sd84rt/WdhR
         z5mA==
X-Forwarded-Encrypted: i=1; AKwUvBx2JP8fil/HbC8z8qjJnX7Zl1tNc7iuKq0WRi42+AIIBVIx798WiDyA/7/cui4ZeiJnPl9l9aFNBLXT@vger.kernel.org
X-Gm-Message-State: AFq9FYLCK0RJjhC3t9AkabBqLbCP/2eSqpivkmJmQrqLvJM9kpNfPXV/
	VbRYg/mmIJA1R5Ih7bs4Z8h/ELuBwSLQbIWl1pinDFqxFxfOVdEpV6oz6ZM3NO6fIQV8hPS0kJE
	/7V3jrQ6DSYrSj1M5OyBCndVDhtT5rrkk0O1v2CMsUJlA5/mb0gvHgvSt9h/uKhKO
X-Gm-Gg: AYBFou1PANc9Cw60EtvlTgCViJTAeIJN5i9b+IneRyequW9JLWedra93XpykvvBCE9R
	ajC/tE09vu+PUa5tc5uyZZ8pFOTaK+davC1vGCyWotQxPl6qgvMbWAbtMGwnurY6MmL+moryZuY
	FXkRM9V6cX0cPIIq1j058HZAa8j+CWDdyH+xuvtbaBr/hCqTP5PpoSR5P6GuVQCAF+bMjF8Gnin
	1dMRyldqrZVUrTXPicaPO0hIZT2qR7NjR0958IDpwRrDNZwPoyvq/+2PeKZf/ehQ8CfuRH3ga54
	APLxhWhwvgKen4KpTvLhcGhQ9xxOT3jLtX9okRTKtLSpSU1yvtS4ylHZ9URBFYFvf+LNpPAwitY
	sxtnZaTaOCz20Fm5tb/QN5ZH2tihlQEqSFq4PVBVCtio6P/1xMps6zz11oHBYXjUXIEYYkq2qBq
	/l9xgAX2FNi1Z1
X-Received: by 2002:a05:6102:3976:b0:7b5:b0fc:55c with SMTP id ada2fe7eead31-7bf80c9bc8bmr1205480137.6.1790954499963;
        Fri, 02 Oct 2026 08:21:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3976:b0:7b5:b0fc:55c with SMTP id ada2fe7eead31-7bf80c9bc8bmr1205468137.6.1790954499452;
        Fri, 02 Oct 2026 08:21:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bb71asm808570e87.78.2026.10.02.08.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:21:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 18:21:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Michal Simek <michal.simek@amd.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
Message-ID: <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX0DdAhq20+Nej
 QEEszpaRne/ZVVZWIiuG0J05ORLyqIfENs/PJgYgSus97AByt6HLPabu53K0xZOwV8nHdALJEzN
 cZ4B5eeNl+irmLJ9Eq6AH4FpGFDILOA=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6abfcc05 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=7CQSdrXTAAAA:8
 a=-Qp8ahHsIWLXR-OXa3kA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: jmNqTaJmOIicUDWsAtUai6uVN7Z9ZJnI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX8n4RdFQFZFrG
 YRyHKqoqBWxauZVMVDA1PEw3D6RsmiMiKQQiDwNmAmYzSQ3sfCfOx2PdJhedhDmtHferLKBsZ0V
 A47rmkhhDBTMod/OQ9VMHqxaInsUx2i+umQjI+MznbyqE0CEOvi7unYrcxE8Eyeh4xbSQpJ6ADI
 tVQOwwfTDjJF0aMyb2PNW2SdgmT+ANcD1FB+RhmCJitay03O5d6nEP4vODyh9A5ws3i/0HcqJXl
 qQWvtA+Knollj0yEC1F7ZI+GhQ/Uz/oGbyjrq64LeE9iXrCeUTLYdJalMEZBj5RaSuIW+JSAIh6
 Qmc4pDvPfPLbfWIOiR+OFRiT5IB1YNnd1nl4N0ld3djLrW409qYjlLIqRk5S5nD83lfooJgXE/I
 nuT1ZX/pC/+Y5cwuwfvFmnYaPcwhV8dnxqfyWuUeLbLDvUq57+It56gylDVLvtTaLyNwDNVw0JQ
 R/zQ/ePTsIA/Z1Fe0SQ==
X-Proofpoint-GUID: jmNqTaJmOIicUDWsAtUai6uVN7Z9ZJnI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

On Fri, Oct 02, 2026 at 04:07:24PM +0100, Leo Yan wrote:
> The APQ8064 static replicator has no registers to program, so it
> does not need an APB clock. Remove its RPM_QDSS_CLK reference.
> Other programmable CoreSight devices keep their clock references.

QDSS clock is not actually the APB one, it's required for the coresight
(or to access some of the regs) if I remember correctly.

> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 09062b2ad8ba550c3c2ee5849c96fb68fa2dff4b..d3ae9b835b9f45ce0bf66c850006a6ab149a183e 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -281,9 +281,6 @@ scm {
>  	replicator {
>  		compatible = "arm,coresight-static-replicator";
>  
> -		clocks = <&rpmcc RPM_QDSS_CLK>;
> -		clock-names = "apb_pclk";
> -
>  		in-ports {
>  			port {
>  				replicator_in: endpoint {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
