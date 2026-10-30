Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365810;
	b=bRxEcdFyu9tx9Q0q8J6ruwUHcpRWNK/tdAO1PGJOiw304Eh0zvYJZJkuUr94LEf1PCfU
	 thCJn5/mM4m8HjNII9oSF+iURDZq9xyvgGXEjmQ/zRgN4wdJ068TQocxAHhWBYuxMFvNa
	 gUaPZ8bIXM/8MkcUgevpeBgAO6rKzBh5CBoX0MLXbDn3RwEOaUvz9PIFdDn7ZLg4OK5Gk
	 aj223hI7FOFaw/CCnRres6jBNlwGUeQgnStp4wyEtboo0wIdRc5v37a771+IHB5hDFoN6
	 2CM/VXKSsCKl+NKpkPjvCSx3EhwBoNdUUNXWd9W4aiO7Fp2y1qUqFfZZjdOzHZSv1nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=;
	b=yuKF2Yh8JB6NC6i8auRFQ2Ge/+qfmlOTJEBC9yuefr+KQT7/vWbt8uUHtyiDdVq5M53Y
	 KTzA6JI//yNzSOFGPqErxUFOpU/ClseLCaEZU5uOZz/fdqQmEvznumKjoCjk42lajhuQt
	 F56NgNyM9WzogA/mo80AQS51U5qsu7qXNqb6wzlYezuG8jAtHPdjGYbHkmHiD1rwpuqSy
	 xvkZqzQtKbwdySRKxlAqq7e5m0aVDuc3Ug4UCiG5gTyB7AnkSBoPE23/zo3kUg7h3crqq
	 +T2vKl2Ja72DJ8KaRwKEje2znbrmKg6r3qnGIz+3vInqoQqIaeBpARWhAuQ508PLqAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tjw7LyIU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fjfUVw4M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC40606A325
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC40606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tjw7LyIU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fjfUVw4M
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGEip3142248
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=; b=Tjw7LyIUXUz7kTQZ
	nHbzHNDytvKwXF7h6fO5R0T7IGPnebTHUPziPf71DnEPsGCP2xg9JiDcZ1BPoF90
	ZFknm9PD/jcRLyWOM9Bn7r2tH5j/hZ7yciCwnxuOnWzEWRVCQiWBIuqkuDN6liSm
	XcRVQZHfLXOydwZa0+rGTK4AalyAr4Ru73e7YYqk4ui4CsnextGljDS09InSXzEF
	frM17HOq+y6Fnki1ziT8eLNBb3LcOZaEafigxUN9sUEI7OZYOqkgwm4XsGDdspzz
	2Qh7ecy6OODRietSmf6tl9TMvx8gHcAinVyJJJox+NZEiitxIZTC7HWS9oQ9qPOE
	msN7aA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk4j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:10:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so3718985a.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793365808; x=1793970608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=;
        b=fjfUVw4Mdy6t1vyLm4FZKxe+OU1g3qpnQdZyygd21v081yUe03tHm48khBoF9PhOS5
         PF+CIZBUl78BO6phxz2t3N+0xVVnnOrVX2W2armNeGXsCqktbhPqPX++GnpugjDBLfS2
         UJjRpxSe5G6mjz7X/X3xOMAMtswE4FjSdUEyqDgMBRVXxBCpPi+OBRzS4m6sOheYwWg0
         UAvtv+tWhBvO8MVQxUYfpfP6FsZII867i94/bT5W1Q/e/gE53fv87EO9AS9ep2YYqLUu
         KUR/HRGmwqM/T9jDoW9ePwV/QICLI8hEbJUv2fNtLYSR9/FlPR1gL1rI+4obaOeG+VwL
         FYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365808; x=1793970608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=;
        b=ZQ5ng5bVujQwxx6aWEf6jZjL8IKbagUQJHVcBzA2yk/E53gbqo0yw6fgltLIWKXrBQ
         kSkmPLjGMsGxYwAA8LwRN+t+jUbyQHGL1ftw4mJDnao0c0DMkuWuubGiqGROcnXg4hiY
         K8tN0nyrh3+WpO7M+xCfFHhaOXf2Y8rU8DUeks1VG/Ic8rqr3IfRp4RTPixhAKeuSrFZ
         dukTm5W9q8FqEBMOJ+Zp5/KSgzIHaPdApL9xl7nCxuc/7H1Q8JJJFrjzodJeB7ndYYmc
         p/zMNYee/EMp+LXaMOaQsK0oram379fqRWC1CSSFoQTcES3PGgnRfB7BrNkHWW2EZlpV
         Sx4A==
X-Forwarded-Encrypted: i=1; AKwUvBxVcwjFxYVSc8EyapcKfcvKyV4jqgELIPEYAgItmobKpGSXbztYfTCBb8cx3dRXSkGEva/xYSvaKFOZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJqRivQc6WQ0hrerlffvFlL7Gzfuys0Bd3S9qVj/VqKwFoJN39G
	prk1xgRmcv5Up8lK8gBaqKp3vw3Seg/ywFAoCcFAOuZ30Mh6yljEImwG0kq7K5kX2oKKy20SlHh
	SryU52p+5c+UBTzb1kmAcvD1pSkfkhTupzWBbADqjPB/ilMkUxQk1qbEGnyDWXrzI
X-Gm-Gg: AYBFou2QFjJtmzfu+1bA7oeJvBe0RnYAFHoiQJJBylNfLP9g9CZFAIUrY0/EibkZ62j
	qQJJre9+FryJ1A67+6S8QzIgOXeZ778C2kdGTrnCsoTsvGKpZnlxlKqbYUyNwzz5VUCFKth45SC
	WL+1ulfbocM2J8641wa+MSX/z2gaFemofA/n5zTyU2rmiZat2a5321cVQO2ogxp+Fvu4fBLt4pH
	N+PKlWQ+YpFl1/qCtEr93cN61inIDOYktqQIlby43yuVaGTBrpIY+T4RlDQw11RTNDjhOAEUrEx
	ovSTwYdeoRxEl+Xj36Wt12k/xhmnd5uyEkfg6xNzSE6PTXUykuJi9y0nq3DMVsv+o13LWQ1lU5s
	ZbWzhGJQXYk2yKHM6lIyvzxgo+urLfkkpO14uKbXhJ3j48Wrr49Jx9hfqCw8TRJZfSko6sgU=
X-Received: by 2002:a05:620a:870e:10b0:940:f21a:eb64 with SMTP id af79cd13be357-944216f3e4amr392370985a.5.1793365808132;
        Fri, 30 Oct 2026 06:10:08 -0700 (PDT)
X-Received: by 2002:a05:620a:870e:10b0:940:f21a:eb64 with SMTP id af79cd13be357-944216f3e4amr392359485a.5.1793365807359;
        Fri, 30 Oct 2026 06:10:07 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm65887066b.4.2026.10.30.06.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:10:05 -0700 (PDT)
Message-ID: <4f6e1534-5105-4a4a-83e6-4b2b846b67f9@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:10:01 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 04/14] arm64: dts: qcom: sm8650: move smmu sid 1 to
 new lpac device
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NMpCdZV8vHaeWKdYZGRIJ_AqW8-QYLXz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX0YACyOyGNLQ0
 St3tV3T65xkzpRnqkmjV7F58xCFinu01KopBq5z6ziC/GbiH9K0rtuxE7EWDn0IEbJqjFmlZmQD
 rcST+AtQbo0LzDHDynSTbigem6x8XtQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX+L2iXXCaDsrN
 8neHzHMBUObULfhUgNmjgkYo/msCJ2CWSWLWW5+9UB+z6eEGmznGzRoNENQvvJbYREZX3wJj5lO
 7S7jQ2ZUgeIZcmEVoWqk/LiIzI5EgkruR/njcZvfa3Taax3FhGDr+yrG0v19wYhzlMg+eAXofKS
 RtMtPkLvPBPfwkEEN0ALBqWNH5AlBWQtG4ssPLfb+fSeh2P/fwPJlYrHz55AfX1U9w2rSZnaB0g
 ZtSBw7azfYR3dpIruVu43B3sU4iO0b25VDITHR8BY4AKuq4RjAF0zYhqLcq2W2K0Hg2QI446rJj
 Qh9ti8Im+kWx5H+axUmaWNjn9jI/bZqxtUv+CMq39Uerx3m+IkXQ2Q6bapdz7t35kVHyZ7jYTgF
 U18QhgIV3fYo/tqLdeN7/3hAdGvMC0TeTIGXjvwaeWk4bcurju1dxXCL5SqJI7RK0qeUYM9po/i
 GKJ1dygfeKTo4225FhA==
X-Proofpoint-ORIG-GUID: NMpCdZV8vHaeWKdYZGRIJ_AqW8-QYLXz
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae49730 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=7uVtGDAPqmP0Npu4MUQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300052

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> Previously both SID 0 and 1 where associated with the same domain.
> 
> When LPAC is not used this is needed so firmware can acces memory when
> initializing using the same page table as GFX.
> 
> To use LPAC however we need to move SID 1 to a different device.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 1604bc8cff37..f47d1dbd06da 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4144,8 +4144,7 @@ gpu: gpu@3d00000 {
>  
>  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
>  
> -			iommus = <&adreno_smmu 0 0x0>,
> -				 <&adreno_smmu 1 0x0>;
> +			iommus = <&adreno_smmu 0 0x0>;
>  
>  			operating-points-v2 = <&gpu_opp_table>;
>  
> @@ -4158,6 +4157,12 @@ gpu: gpu@3d00000 {
>  
>  			status = "disabled";
>  
> +			lpac: lpac {
> +				compatible = "qcom,lpac";

I'm debating what to do with the compatible here.. On one hand they
shouldn't be generic (should be soc hw specific instead, but that
feels a little overkill here) and it may be that we even don't need
one, but the iommu driver needs to know what we need a 1:1 mapping
hmm..

Konrad

> +
> +				iommus = <&adreno_smmu 1 0x0>;
> +			};
> +
>  			gpu_zap_shader: zap-shader {
>  				memory-region = <&gpu_micro_code_mem>;
>  			};
> 
