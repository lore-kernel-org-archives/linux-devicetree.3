Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242D0336883
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589994; cv=none; b=L3/7d9oV/f/VJPg2br4f0TE2VWXW6e66+rBi0DypvvGByVVv7NiVacO3ekLoc5aMQuL9rjxde+AMUCEXDKPdRz9ZfCGkfjtjJGp5dJiXssnh2MmtUNg09lMu6QXtLklBX0xyj4EETH6AWFTsLJ/lAzpgxhRBxGvzxckxU+YlZoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589994; c=relaxed/simple;
	bh=jU3vGC239+Ohe83blVbPiVY8ipTNtnvpzIusobl4TBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFnRAZ+H5VdnmtQKX0BNRwpEzEyfsRaK5iPd0fBmjMiDyY1PGae5rF5tyATS4Yoa4K/NpXtoYs39yuYwOMrBorwt8SGChphvaQxiWN6tMoTPo/iJar6dvAFguYp66U/tIflIHzWPV0mByaOQ887ybStjjZXzTMJfCRiDxAXpj10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjaywABU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXCDmUyJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjaywABU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXCDmUyJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J6DLW2580035
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 19:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRe1tFw6XshCfPqTzjTwur7/G8T/aZXCtfVRsh0nIPM=; b=KjaywABU+41cTPa7
	X5HNq5QmgiW0tMqZpEXO2cUYhZtmgXtxdDUzizKUwWv5LTW5IWH0S+07V61cY1a7
	yC6uGZXAXsUQ6XH+5isKbN9BYYeVpklweLxIgTpnVo+le0TRDYO9HmEQ3ccsnRf0
	o6OT79kObbX+AwLWNF1hj6WV0uxrLTwvaLzb71PbNWEVIQqApBHmFd3Nhl3Xl5St
	fxTJ1FklMA70Vg7IOq4+aaSk2uoSuXPSc97dvsZz8lkAfZE6b3G4YFCEylRqgK5k
	PWeKftUe4fXTCjvIETK8qrBGJ2dijGPTvW2ONLbOy2QChK47K5cxWlkOAceXikoQ
	0ON0Wg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf4c67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 19:26:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23af7d7e8so151156205ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 12:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775589991; x=1776194791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRe1tFw6XshCfPqTzjTwur7/G8T/aZXCtfVRsh0nIPM=;
        b=NXCDmUyJEvsO289Sq78wT/fJJXtxQuft8rOzMDk6H/KxC4rUIvEfAOh/AI4g4AQKdi
         nyo4lX+ueoOyOjJWdQTWwB+SM7mhIXKaWM09S3bAR/YP1Mju8xEfKvj6mbX1jchb6Il8
         zcPM4cZXP2XehU2PUB/GnT0WCKayqBbYq1Dpn9wqWK3PViBVvHDdsUVQLn2++1SOMnRD
         hiiSHkiOZVPixEIii2PfVpkxUNFwgyPa8PxTuKtPqAFp4l6nULsuqPwwvc0ZRI+WTN3i
         Pr7/ORyggIOYGcI34vbY5o0h0kBDs964zB0xRxZb56MbgyQD60Be7L/8RHrfgb/mVebj
         afqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775589991; x=1776194791;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRe1tFw6XshCfPqTzjTwur7/G8T/aZXCtfVRsh0nIPM=;
        b=h8NItl2d7dJp71JNRYAy6t4kl9qDqGJ+0URDd+8GLVF/mK3Qf2bFf2kegJ4NAn9w50
         GnEmoedYZoa/SQ/b2B0jC0Blm0wSNBQOy6h+IJdTPyaJedeN7v72O2MLOjl85cDEinOS
         BT/IsmX5tSdV+LpS++3xd+tEy2+KcW4+dEK9YvPVFVQmmIhy0jLOSaLYJ2dhr/c4RhqX
         UXNKb9QaLnqm54LpMw3p2mO+aC6c5yiGhGQQM4CwUQUUXZNUiYDdfDU23IUO4lnf4nhC
         tsSfrQL7yceyjeaox8DRdMUjRhA2M6Z7vhg/e68s8j9SOEQKtlZWY+oC2DNiIzW8rJaS
         f+1g==
X-Forwarded-Encrypted: i=1; AJvYcCWb87f5IW9oBNKGDTexueQQ7VW1EventhEGa90Q8sHTEZku2l3tgWw8YYeq4Y8r66Pwa1VCgnBGKozc@vger.kernel.org
X-Gm-Message-State: AOJu0YwPq3nH/b2TrIymZplwtxJ+ndjpKMcHSaNyq35WbtAAGHu7IDh0
	W4VUdDvHgFfWlhBDzZRNzvE5B5+pvkn9omAb6hJYdZi2MI/4ap7sR0dfgLitdyUacvN+f1wcRd5
	ZD01yBJtSR5OlL/d4rQ07aTcs5uawkSiBvJmZtwYOQ5GN6hefGBLUfohIwEpQpDjE
X-Gm-Gg: AeBDieuAkfwGp6wYFh1a89VifpuPuw6DFcPlgjFrAJ4dQu1W67wY4XWRkZLHa7u0ff6
	UxpuAWsaH9EV+SB2KEPv1RhuEObihGpk+DLFSgTtReRbCwN/dC4xia5t+dIGmk6BmWGqhL8maVm
	T8fHUXO37y4tzKLHJ8CkdTJ9jNZp4vOhaXvETSmIG+gJS0HuPgBpluMi/7gQJRIhUwKEbYyLMcW
	28xTAwaawCqB8y7SojPocbd57M+upr1llFCsxzGTJAjLxQW6VhCUiN7gt+KNcuFoK2nvJKtA0Ab
	D4rxT1Rc72xh2umHc19VeEuJKug6yAQsKC7QprTXX3OGb3+tVd+CNN4Y/iGOhAQAICCkcn77r5C
	u2Heyo6fR9IsdpBYtIBXv66bPhWoREVmNvxI/IUf4ZNZKJg==
X-Received: by 2002:a17:903:2c05:b0:2b2:5840:809c with SMTP id d9443c01a7336-2b281828136mr193199785ad.1.1775589991100;
        Tue, 07 Apr 2026 12:26:31 -0700 (PDT)
X-Received: by 2002:a17:903:2c05:b0:2b2:5840:809c with SMTP id d9443c01a7336-2b281828136mr193199525ad.1.1775589990639;
        Tue, 07 Apr 2026 12:26:30 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478b658sm194467505ad.31.2026.04.07.12.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:26:30 -0700 (PDT)
Message-ID: <6ca53b3e-bad7-44ea-8bbf-d35514262b7c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:56:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/6] Add support for Adreno 810 GPU
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3NiBTYWx0ZWRfXxk8jngL5IvYp
 vfrDYH9hFHxpNFgJoQgsrO4ELxoQPIk/l+GdXPuNd9mfKGk/EMGbH+oGEPJVPEbXibm7GNQYWpw
 KN9A5NU+Y5Cku/CRFMQ02LrzwC2JF1uJ34EgzG7HNA0bSPaaqMlFvaPDDkYn3w2E/6QPe+NdEG6
 ESJsR1OoPJKjxdtF62CCJP7kco2tuES8i753Jg0utKojPYj2Bak6JjItF2bGH0WBYYCNc4Qr3RI
 b3//ikXTalHp3yDmf0RDX3fC6GWhmrnBTF0kPoxmPCJISTWnC1/PZfSqB6fhuXzHnSFTIdIccRN
 Ig2N1PZWy2uhE4kertObInHWwg6Yjz0s4oapr7opRo7l9msyBQVDMw202tNx4pVTJbhsDLe8da2
 bbahtiafSewUJ9sEQDyY84YGmZy7/Khu6dlJJTxcnSdKAcQlNaVputVTQhIUvkmFMvTS/nQLwG8
 U0F2KNWvFjp1P2ePo0Q==
X-Proofpoint-ORIG-GUID: teDpnA6JAa-TCEKUUsL1Dwn78i7CnNoE
X-Proofpoint-GUID: teDpnA6JAa-TCEKUUsL1Dwn78i7CnNoE
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d55a68 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=6HAHnblGeAPFfXcocwYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070176

On 4/3/2026 4:38 AM, Alexander Koskovich wrote:
> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
> the A8x family.
> 
> Note that the OPP table is limited to 1050MHz to start with as the only Milos
> device I have is limited to that speed in GPU_CC_FREQ_LIMIT_VAL.
> 
> This series is marked as RFC because it depends on a couple other in review
> series, batch 2 for A8x [1] and the GXCLKCTL block for Milos [2].
> 
> There is also currently an issue on Milos with gx_clkctl_gx_gdsc being stuck on
> during runtime PM [3]. The proper fix is to only toggle the GX GDSC during GMU
> recovery, as the firmware manages it in all other cases. This is the same issue
> seen on SM8750 and is being worked on by Qualcomm. Right now I am just working
> around this locally by not collapsing the GX GDSC during runtime suspend.

This fix is posted here:
https://lore.kernel.org/lkml/20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com/

Please mark you series as dependent on this.

-Akhil

> 
> [1]: https://lore.kernel.org/linux-arm-msm/20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com
> [2]: https://lore.kernel.org/linux-arm-msm/20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com
> [3]: https://lore.kernel.org/linux-arm-msm/5409e13e-280c-47b6-a29f-351cb609bc6f@oss.qualcomm.com
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Changes in v2:
> - Mark as RFC due to dependency on in-review changes
> - Explain in DTS commit why qcom,kaanapali-gxclkctl.h and not qcom,milos-gxclkctl.h
> - cx_mmio -> cx_misc_mmio
> - Sync a810_nonctxt_regs with GRAPHICS.LA.14.0.r5-03100-lanai.0
> - Link to v1: https://lore.kernel.org/r/20260331-adreno-810-v1-0-725801dbb12b@pm.me
> 
> ---
> Alexander Koskovich (6):
>       dt-bindings: display/msm/gmu: Document Adreno 810 GMU
>       drm/msm/adreno: rename llc_mmio to cx_misc_mmio
>       drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
>       drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
>       drm/msm/adreno: add Adreno 810 GPU support
>       arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU nodes
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  32 +++
>  arch/arm64/boot/dts/qcom/milos.dtsi                | 148 +++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 271 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   8 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  44 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  14 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  11 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
>  8 files changed, 493 insertions(+), 40 deletions(-)
> ---
> base-commit: 128d2eccd20bd74fd104b412d949d869aa48f108
> change-id: 20260330-adreno-810-5a47525522cd
> 
> Best regards,

