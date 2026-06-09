Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7237E2F2
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016863; cv=none; b=SVm8KqiceaB2eIW7nccgzOe0MbRz322H5gQhGyC9LnyEDYeq/p5ObuwQ3S/9nCSFpBkubI5oJXxGXPaK+jtXzl6BQRiKv5XQ5XmwUBYjPlUeQAhH0Q/XX9+5vnTodKCOPoX+Y0E0TSgOCefNA+fO3B1Ly4T5toNDjgxPFHTf62c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016863; c=relaxed/simple;
	bh=IFxoY1lnpcuapTUxgGM77p4M9Fy3Hl9fYDv715UCM8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TiuRpdmLV/o7g5nHlzZAQ7vEF2tBUxZsj81H6fTOQCEjQhrn1XK+fqektwAewO3PZinXRqx7GjDtnE2ZjIIsD9489GFx7H+MofD9Nguu9ae4mbp1WvzikCiw2pM/eZqrJIlYRb32VdYYtIEXGNytuKHKPG07HURFW/3f+7kH8f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhkhebgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhN52cZA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhkhebgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhN52cZA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClIY12251583
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 14:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aI77O8CJQYdLvJeOk6wk0XdV8aL27Vmep/f1OBCKYOw=; b=ZhkhebgR2zoqYeo/
	2xws2T09pgVBRSGN6bcoL8wMfMzP0WwjZfjzzjkSaAh/Go0QcwZJYrSn8tpBs1co
	NU70HdWw67A6X7XdoE/5DPUzbs2lEO/5k3Wy3tdvdZIY8RBSHxDd3uFAkBd1eCzV
	tL4E03OFGYuYgR4RBWv9aAGN0OPWZ6tQKKyXcUudwySqx2LuKyR0suWkw6RKRFlc
	xgzkwNBz3+JS3okCWhxNVkXB1PexbSCnycKu0WvHKkPcKpi1hyxt1IxA84dsYxJa
	4CzQ3HAqXsewSED+7RjoaqM3czPIC6TvUNn0ej5wXdT7ZriCSOQtQFSK3fYuG6lA
	KymTlA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqghysa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 14:54:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517741bcc53so15430501cf.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016859; x=1781621659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aI77O8CJQYdLvJeOk6wk0XdV8aL27Vmep/f1OBCKYOw=;
        b=BhN52cZAYcrs0ozJE7s4ln0E/cffkP5TAbHDZ86+G1UNNeBfy0IrT4fhmKU7+kraE3
         6Pk9tn0P693AYBvi6J4FfsObAeZzya28sbauD+Td/IYKCU3pC3ODv3xmEZfTtkNYASeV
         VmVap2t6QL8pbxQZsh0y9pp5GjCx9g2XWDGespDdBWaMSoEtXSO7VE9WeUGWGMK5OKRH
         JOx+8YX8kQv4q+OXetER+/e/LFTcJiLz8RwoxcJ6RIByn4yBvo4uAYyzbrqvzikVf2/v
         ZrJ+Npv27I3n8fedRhAUVB9qKEUK44YD6OafqneDjjkxElhHwm6FbLJydC2OLxvYMfL3
         5q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016859; x=1781621659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aI77O8CJQYdLvJeOk6wk0XdV8aL27Vmep/f1OBCKYOw=;
        b=O5SASO8YNoTbu4pDfHlrNUEj1WSubYlTBIlnMEZUlRwMIswCUzx9PUO4S7kGW4hFFv
         Eop8+tFcu3L9HE1/yLZDg7ps2GzvMQwVxSyF1mziTQz8UeNACmaxOsXc0NyAzxz5sOtD
         sW/JSoU4cPyTmg+bGEAj2iKoko8yHjSTha4qnHA9SlwP4hHiy25QTGkwtAa6CAZdlUcA
         vIZk6681BOUs8u7vwuVsl17cFOYmOFShw0ZxdleUc7fhGLaX4IlcxhvqMnNOjWTjiPSt
         WDpqezKBSOZjyTS5R26xNHm1p3PR63wWTZnCLCpH2nY1ow3+mEVtAdhVyEPsyw4vrTdG
         p8Sw==
X-Forwarded-Encrypted: i=1; AFNElJ+NAMIPI95gqVdkH/Kthr0J3zyIuM1m+dA9gdMQk1OQI8UJD8n040wBrmLG7ObzlAZZ33TkhuUxjEoz@vger.kernel.org
X-Gm-Message-State: AOJu0YxwarOqZhMfkmzqADrjklfaJ6Xq3k+60Sq5859F7tygHk8GDJCJ
	DC1npnxiE3qLLX+wtqsqkdAe49YBf2PqakV4rdWa1me3hFVapoBcoyoKF/SQKr/9nZlaOED3Rwd
	0Qc/roH67DM3e6lN/IXi/oc85eYSiGCnFs5AhTdBJw0fvACpFaXvxb3Qfxqp601y+
X-Gm-Gg: Acq92OGZdMxQ/WtZDPsbbmroIZEy+qTvpqfplIe1yWUnj/XE18pdQuZrrPkhhy/6w/j
	oNLlWLN1uL/QOFrva0nQb6y2JNTkttclmvO7jO8sWuf+KsrhlhYnesCP7tIrRdRJo2dODXRYCFh
	hQULvrNQiqOe82F2lATYms+p0BlkX+ALyBpTOmtnh/ut5QYhq7Lb3Iug/TLz73+7YqFsW4u9/9+
	yFcddAhrPzmahPox/TW+xpeyJwK8Y1Wdjan4sMLWglDtM0ozC/shSwjO+0BWZv6EtjboHmRmq4y
	+AK20+71nurKcUhs6hJFr2zJqHhpQ4UYada3wE42QBdpbq4xvILtH36i+oQej+dipW07aBsqHcr
	6RO4kO8iljWkqc4BPBar3NnjA/3tm/32XyswDto4PPs51TnmDkK7KL3uy
X-Received: by 2002:ac8:59cf:0:b0:50d:9138:3322 with SMTP id d75a77b69052e-517ca478a9cmr25292021cf.7.1781016859313;
        Tue, 09 Jun 2026 07:54:19 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:50d:9138:3322 with SMTP id d75a77b69052e-517ca478a9cmr25291561cf.7.1781016858752;
        Tue, 09 Jun 2026 07:54:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm1053926366b.52.2026.06.09.07.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:54:17 -0700 (PDT)
Message-ID: <604e0428-61b5-42a2-b6ce-a2b071378cbb@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:54:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: glymur: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
 <20260522-glymur-gpu-dt-v5-5-562c406b210c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-5-562c406b210c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MiBTYWx0ZWRfX9Qw1SBfjl0Q9
 Imeuh+cZqd7XzZvoQgjHDLrQxC80+24IliHk54ddyKMmpfGCoBXmbY/TDxWrBiuqqi5YLPwCIep
 pJ0pyzJALQ05c0ITruuTdD4Lk3v0NyDZKS0cnVUFJyLj2IdFeSIKNaMaDKPtkLapMUZKjkA8xcw
 4VjIyGGrJQhnvhU/ekeN9drfXjcIbzbjdaA7ByKVHtqc6jVE0Vo8iBoKmB4JzX1aDn7C10z2Fr2
 AoW79lW9XdIXjqABrAM77L32heEBc/Vf3X/hyyIe6kS65DQ/1AKZi31SkM9quTgjpXbCQs5yCBu
 swQCwnjncWCor91QTkPewQSdNsqaNAEUHxMInYfrs60XogHoqGAu9dEqSPietvtxJ6tjx+ksXP+
 AM3x9lfGNzQFVML5AHeuQMijN+xlopdBJEO0IXvNgMxM2kpQ24OXAW+wXf0fMN7UeakPMhcQ1Mk
 mAXygYr7sqrODsqGuXw==
X-Proofpoint-ORIG-GUID: KPzcJfT_pQhLFq-K1d853G6aKYxkdBEM
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a28291c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GwzMoqaa5OBlIbEppCgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: KPzcJfT_pQhLFq-K1d853G6aKYxkdBEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090142

On 5/22/26 12:12 PM, Akhil P Oommen wrote:
> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> 
> The GPU does not throttle its speed automatically when it
> reaches high temperatures. Set up GPU cooling by throttling
> the GPU speed when it reaches 95°C.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
