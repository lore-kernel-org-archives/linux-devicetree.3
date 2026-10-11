Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FFF2E7372
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 03:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791689446; cv=none; b=sui/1gM9/1Hrg0GlXjwfaY6ymLnw4tygXc+uaT4+mggBeMw78FcRzLSm4jyoT5r7JRhOLhAs94A/jBuI2V2mB/ZLQAvKbCnAsariZJd0EeZxqHwtUUM5ihKX/qqqa/HVfIV5RpvAzYW/w8ZGHzq9vk4o2OLiyCWVCnLBZsadzqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791689446; c=relaxed/simple;
	bh=xAKPEdaK/XN6wt17mXDJz6sqUCeQqYJ/HRPcWiqk7YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUiq99l8X3ZcO5+XDE3z4ssJlkwtE0+wPgo4o7U//rxmcjBL7ROMHaMP7SwDF1wFQ/iSW9ATrbhZa4fsI5ceqCQtmMhgaD3R648h0Wt1zVq9gM4gEN0VaEqxF3l1maeDfaq+ctAaMqsL1aoD+NheyVif271iZlqQqakBOUkVU+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KysF0DNb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDclhzx8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KysF0DNb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDclhzx8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1osAK1364593
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 03:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9svzMgESlMxQ2/eamTykJGeU+wpVc5L1Ni2Wur0Meg=; b=KysF0DNbKXWuLhgL
	vj3p1/+J0Ejl9Sm+6+jKRiOU/lqYZ+GNPhD5QoPfLqRgQgnHtXVcUwpjroowGWKm
	CGITP+wi3/G5VPy3z0LgbxE/kOz/2BZQM44IhQ+vF68JP/D6YqOfthu0hSctN3++
	Xy8ujyufEAmjJRUrbgag4kE+TEO8Xdh6TFuPptMO/CZX+7kvXip8CphBSWD8fbrw
	EKil1SVaasue3w5sDrM5zqOZXjPKBzjojtrOEJyjyuamoFhtbJ1kcjGAe6D6qXts
	wHzqsRnbxI4ppNnJumzR5Dp03RDBRTJLiVw2YWZ9sypOwGZDzxKM/tUhvvnr2gas
	7nuk0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9t3n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 03:30:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso1930378eec.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 20:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791689443; x=1792294243; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H9svzMgESlMxQ2/eamTykJGeU+wpVc5L1Ni2Wur0Meg=;
        b=IDclhzx8QMsP++7Kz96cyrzmMx6SIjRQfY8zigJmUtIkkuVzVUWu5ODkhqE8ttldPI
         0kmbpu9nbD8J4ozJ+/9hEs3QdALnJRItUvYUcfvIOIrnYuFKcl9YwyEGzhmXAsQaVaLp
         e8sX/B3iu7KyVxpczp/Z1z0zPwyRpRzbGJ68/BhZrmEh29aG/T9TbFa34PKMnukOLR2t
         Bdg124b6Jz8DNfybGZMcH4UIeqFXZUtcssB95dFSGfI06K+0S0lQv3lTK+1dHz/TQTTl
         WcTMYR/XZaUmRhUrTbgMQE5or3CdALun9QrX6k9PSrNGdTxSnH0Yf5zYR2P9wYPofX8K
         pmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791689443; x=1792294243;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H9svzMgESlMxQ2/eamTykJGeU+wpVc5L1Ni2Wur0Meg=;
        b=qXuNFr2nUupvs1wDZmwTeuflTXF+lD//Ul8Chizz/NqfnWABaeAEkjPXYv83FepIjX
         WRbwmik8LugzV4TcmZM8uTh2J/rEy+fmvSx5kKeF2KbIjr5YWes1Y620gT03YvvbFFpE
         SWJ+eeJ25qC7bUF1wV2OcN5DwMP3sLm9QTa/vI+hjYgPNoyMKQOYeQ4JSWg3Z2mXUArt
         GV9zWHGMca0KMucwaVilN+GgNhLpLmZLC/A0eCE4ezcwIiAXzXK+tSYp389QqZBYa0zC
         xHZfr++T0LAJ9zgP0ZLuNr4HBO1zLjER2PPtyUABO1A5cchOJvACGV4rxS2wkzWB6Gy/
         YyNw==
X-Forwarded-Encrypted: i=1; AKwUvBxVGpzsez+Wq1Sz+3wf5pWlAef1p9QFnDcKD6/b5W/R9pbGA2R2K4rzDHzvBLFvMZvkCVVVIcir/vr5@vger.kernel.org
X-Gm-Message-State: AFq9FYIgLdgyiMk0lc2JdMbzSYlleDDRi1qEyzqSnaIUfJO4cuAG7Imv
	la3T9ZnMq3Jr3m8UMMNolJwFMeBhI0GalIHzsxtrqCw0VfVsXNhESBi9KVFWoBZaaXBxyiCWuOD
	eZ2938LaZwkQ7ksjje3oGpwKhJk+N5PwPICBjXpe3OJtd16HMmcWq0qUgpRUgUkTrUqlUXQ0S
X-Gm-Gg: AYBFou3oQMmR+dvMq3/tGTUPiNFfRj7f9bJ8FjWKnM1gqW3WSZzfXK5dLZnJbVVA7z2
	7kidOciTwl7RCIgoFKBRr8iEyo+FY6lj/0vGOBGoh5Y1k3mw8LfOLyOK7ZAtSXHuE5LDA3kKoVy
	x9H66Z3hc+/TmVS4J8tT7vQBUr4S7cCNHpnJPbZfBmsZhBdQ9HZQUMaVsUgS60/crxgIexLKBeB
	M5NNlnJP7RwhgLODQJwol6e+zAnA+oO2GE94N1oFrCo3FwsHjhhj+VdPfgA/3zFNLcDC6DnZx3C
	e9cmjCtC89tFW8zk9la2VqPS++NDRnX+sMWq0WBMitseV6sOJtRkLSoPGzdIAf6RZF6DjKZ3d6t
	mbWxFZlgE7uBZnDTnyjif5HN5HtT6I/URIVN8tU3pmg==
X-Received: by 2002:a05:7300:1343:b0:351:727d:b9c2 with SMTP id 5a478bee46e88-3537e05bd1bmr11778393eec.17.1791689443423;
        Sat, 10 Oct 2026 20:30:43 -0700 (PDT)
X-Received: by 2002:a05:7300:1343:b0:351:727d:b9c2 with SMTP id 5a478bee46e88-3537e05bd1bmr11778338eec.17.1791689442629;
        Sat, 10 Oct 2026 20:30:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d202sm19172887eec.13.2026.10.10.20.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 20:30:42 -0700 (PDT)
Date: Sun, 11 Oct 2026 11:30:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord: Add GPU cooling
Message-ID: <assC2v74wpr3AzI6@QCOM-aGQu4IUr3Y>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-4-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009-nord-gpu1-v1-4-a06a6c57bde7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acb02e4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eBu_aoQerpSAkrlkAZQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: WF8avfhatdSXgwCOy61tKV_u-lfXIY95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAxMyBTYWx0ZWRfX+V26YzzR+pFA
 HH6K3TEjuqaECapPfiJNHjgphCHBy8Mu0D5sQS39PkJo9ieQtrfc9/AjIQWC+BQzGw4y5dZicLQ
 XQyQjJocvYhIkL0T/6MNWsa69W5snL3BpUn5yWO6lGFzzp1fCVmm+nC2nIGbydsTGpA6C8CQthN
 LJrzWaXYMqtSYKRZeU7TijMYBUcuEvN0Q4CZPwOpX4Ko59bg3+k8GSE8IvP02PaTwq/hIf5gf3b
 lgD5fsDk1t7BnSpFRs5DqF4v19A0kYDopHbn+daa6aJq6oqA8HH3NrQys9MhtE49tUnR2fadY8c
 nRCApaMggoFcDhKnSgEHqpfNQtb6kDt4+PDJfKg9O6dxU5aO1Be5IJ9CEnhN2Wj6rqQEL7FBBA8
 NDAeKiAi282NjsUg+wwVUHAXv5UF1Wzea1ih3BZdqfcpAAOOC2SBgfE7m6TbTGnvtciGqNHRatj
 h/fw0yAXxzwzqItco9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAxMyBTYWx0ZWRfX/wudJWvYTPGK
 44ZZk1IUvFc0b+NFbo8WAchOWD9AmGb11drUhVQYSYcD6q4REPj1ix5CY4Ti0EsXLUlrtRXDEIZ
 /UDOlNLJpy7qNCP0q1ygea3nROanugg=
X-Proofpoint-ORIG-GUID: WF8avfhatdSXgwCOy61tKV_u-lfXIY95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110013

On Fri, Oct 09, 2026 at 02:36:38AM +0530, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when
> it reaches high temperatures.
> 
> Set up GPU cooling on Nord by throttling the Adreno 753 GPU when it
> reaches 105°C. Label the GPU thermal zones and their passive trip
> points, map them to the GPU as a cooling device, and add a passive
> polling delay so the thermal framework can monitor the zones while
> throttling.
> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 177 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/nord.dtsi          |  80 ++++++-------
>  2 files changed, 217 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 4379092b7bf8..23370007c974 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -17,6 +17,7 @@
>  #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  #include "nord.dtsi"
>  
> @@ -2042,3 +2043,179 @@ opp-403000000 {
>  		};
>  	};
>  };
> +
> +&gpu_0_0_0_thermal {
> +	polling-delay-passive = <10>;
> +
> +	cooling-maps {
> +		map0 {
> +			trip = <&gpu_0_0_0_alert0>;
> +			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};

I'm not sure why this is Embedded variant specific. Can we not just
update nord.dtsi as needed? Would that break GearVM variant in any way?

Shawn
