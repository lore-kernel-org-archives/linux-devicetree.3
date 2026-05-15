Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1114C1DF261
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883743; cv=none; b=iU5sYC+o13HWFltaEjNTCItUIxoH1Dm/F3+9ZWsr0nSS/OCcFDRcTbEe8NMK2DguGmTbFUdPjVZC+cWJQxXq58kTbfwMxGJYkKZVFIasC8+kdxQvcQLBobMB9TmlEWS2w3KfcR5BX6cnz3xtVe1tY+KHnUk7KB5Xr6l5BCZTS+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883743; c=relaxed/simple;
	bh=jqjHSIVdE+LZwoqpbEEw2QRNWITR+YGCFr0AN2nMTWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gdc4iI6Aq1mKV6KNZTjjUHbPCBuhSOMeBTWfEoezrQQDWtlnF9/Aw/vquD6hYyKrQ/r+T+vIq8gSitBa7+caL4CHlc+13/8fAI1i3LkeyoL/ltM7+A1uqSUIo9A0RPHNVxnKjtG+0/AmMn9Q+6FRjqJeFzfWjrr4ooy7l8OHVng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcbOdW4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwaguOc3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcbOdW4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwaguOc3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJf1682255325
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUhQPzpeTqHUfVcim/+MklcBBi2uunm5wIH6HIt0Drg=; b=XcbOdW4IdXKTwfdf
	UCWRWzVz6g1qaoyITQQlJWNBy7JxyIuOcCyzTIivs04p1MedtYdzH5r6ywMPp669
	3hpR4IugI+hLnRgUO6cVCGHPr+OhCTPASDcZr23X7UM3L4AgZruaQfq4f94JMetg
	BqrlT1ZIeKT4oZcjsrK0FaM3oRMF29Tlyf0VfeefmLZb+bjVWJaONKLB5sk5JQBr
	aojENqCau8cKNlOCS5kVX9/2ChWmzKppz+bBq/h1SZ5RwCBfQ/hVe/tkXBhlF60T
	vLd8nqyRg3m+t7DOIxuL5UBtssn06XyBM+40ZIFjDDxi3QVZXBjIOUesKZt/dkq0
	jT2F8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e671511tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:22:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba3245a43dso3440515ad.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778883739; x=1779488539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FUhQPzpeTqHUfVcim/+MklcBBi2uunm5wIH6HIt0Drg=;
        b=bwaguOc3Z9+0KeB4lAo8a8Cmx9q5s+afOT/BcaGe0fdEt56toOihdjNAO62j2V0/Ce
         cIqkSAgmHH0nmqAk1pCYPU0GJpp7gr50lnS05In/UcFCVniSiPz6lxFpamQskm1NAhRQ
         6xZym7bH415o0bkCDtvQdk8DqTjnDENjBQ3Ncl8V+Y5WtBXmy6cuesppX5c+LOs1gj6X
         6lLfcD3fY811Ggk39eseUC2cy58OU7sRRB9TsFecdsW/GKK+y/LXLA5LnSplVzYcmfm5
         EhPJnJbE85Km67rV5krw2E75voQmDnfziZuWUCakAWItVjH3XaBbhDOb3rQ3IFPqldQ+
         TcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883739; x=1779488539;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUhQPzpeTqHUfVcim/+MklcBBi2uunm5wIH6HIt0Drg=;
        b=BlFhueoGkwZFvgLxHB6ZisrqAIeQ6Xa/OkfbtTgUEDMGO0+//ILHkesdM2bOGQ84Nz
         uiszLfpLpXc8eMP39yu53JsCTbb5JaoCIN/LY+GUPtTUUVWmStX3PTytOSqZT7Gq/ECb
         7hlPmzR2lXPRqIYeldOWms1fgxQh30JUVdmWrdKyPiUXGPGUcSaPupjim2njZLupJern
         ClDDyov78uAJzcdpkldH8QmhZ7qEfZS795jc9ACJE01Uc5U6lhOhLY3crwpBxHiEZOLX
         I0JlwsV/Yxx4dbzCXeaxn+TiOX6tF0lpOvMH8sSWd9k3EW69wT+uTmOtW+Y2+4o+L8L9
         dAOg==
X-Forwarded-Encrypted: i=1; AFNElJ9D2YU7wjVhyY9Ktb3eT4FjtZRw8rN2pwekp82B7PHTJH0K0ypnuCxnLsU3mnzyuKQBmBGpxvk4Hyiz@vger.kernel.org
X-Gm-Message-State: AOJu0YxcepmOgcOcBwNhQuo/HK7SHGu2ZHnrS3OnLN5z8tv2XQA+SBNC
	648sYdZQQdcihPC8UhcjIBaE7XdOUVtpqRWy7NzalfZWYNVaT6cC1KPdPKUH7wubuYrfnTzUrYH
	awsSoMOJV/pD51LiADabniBOygyOKHX0hKISZarQxTaJ7MJcMhLpPB9fnmEH3bK2G
X-Gm-Gg: Acq92OE039gklZCC+EfPitD2cDCRFNGRnwrHvQoYsQaH5wTqWkRuakA3AF0oKj18ebp
	Cx7rCeX/wks4V+AvMWmjF7vZ8UmlV+mfJJ2MqvuKoJTsaZ+yqlTpzwxlHPtjry3YgMFtyRtXM7F
	4SP7+8YzMwILjmFRt88UPA/Gr+QYEPDpSfkKmTwj+wQVHdi5zEglzuyxhd2LrRz+9zvml4AUVrr
	5BHv31KpuWLFwpDGYnqsk2jJuucvK4qkJsrpvyETig3pVWQjCzuwy24nBxZkdIfh6DoqGXSU/MB
	2ENUqo0Yac/ZY+SS/BbnjESnL5nTobc9dgdNZO/55ZklOeGJ4twI/CzTY6iBX3Q1/OWfc+vILXe
	Aqt5PzTcbyu9RdYuLfhG+/+qyKQo/2IPRFVeD497R6lA=
X-Received: by 2002:a17:903:2ecb:b0:2bd:936c:8155 with SMTP id d9443c01a7336-2bd936c85b3mr32869495ad.13.1778883739321;
        Fri, 15 May 2026 15:22:19 -0700 (PDT)
X-Received: by 2002:a17:903:2ecb:b0:2bd:936c:8155 with SMTP id d9443c01a7336-2bd936c85b3mr32869195ad.13.1778883738842;
        Fri, 15 May 2026 15:22:18 -0700 (PDT)
Received: from [192.168.1.3] ([182.60.13.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm72133065ad.65.2026.05.15.15.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 15:22:18 -0700 (PDT)
Message-ID: <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
Date: Sat, 16 May 2026 03:52:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIyMyBTYWx0ZWRfXwINUW+xiLg2S
 btRzK/PMno2y07v60Mwx7lpXgt30J66SDHcNjXc8GTVnaorb4wjziiS9dpn42GzgOHeAWM84Wke
 vtVEBXVjjRNbBE3IXT1zrkpml7JJ6Zgyrqv8Zln2dtIsUiqB/3dnjPZVCGSnzxB13yoJL1Ci9Mi
 FyLwIDn/IB1oVk6oVS20eMpWXD/xzwX1EHtg3Eld4b6Cj6adJMjCxchuxHdRhQCnbMTCKmQx/g3
 zoY0ayvraIssPhOgPrBYVUfsyTrBXCE0OQDMiiesoxj832ItVwFuf8inneePsSf3NdZvdL4OiPd
 7fFqtoantTJJ7rku/iW9z++J2Q6S4229QpCQPYdDge4/bjtuMF1odAzVK7rRYZxJv+llhM2Fci9
 OKTSkIiP092ZyH1NmxkGaToU1/1RDmyHKnvy1xxNmh6TjVjHa8ptngUVeR2STj+OXXJ9IfrhTGX
 CI+M957F6ODmA6uRkpg==
X-Proofpoint-GUID: UVAQoSFgahD2Vl_6MUqjEHhNYsWBXZ9v
X-Authority-Analysis: v=2.4 cv=I+ZVgtgg c=1 sm=1 tr=0 ts=6a079c9c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ba8plz+5YpscmDk5DVa2Cg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=i76A9G0zAiINRuBm_vQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: UVAQoSFgahD2Vl_6MUqjEHhNYsWBXZ9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150223

On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
> the A8x family.
> 
> This series is marked as RFC because it depends on a few other in review
> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
> 
> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
> review and has been applied.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

For the rest of the patches that doesn't have my R-b tag in this series.

-Akhil

> ---
> Changes in v6:
> - Re-jigged the register ranges for GPU/GMU to match Glymur
> - Depend on RSCC offset fix
> - Fix bindings to add constraints for reg list
> - Link to v5: https://lore.kernel.org/r/20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me
> 
> Changes in v5:
> - Sync with latest kgsl
> - Link to v4: https://lore.kernel.org/r/20260416-adreno-810-v4-0-61676e073f8a@pm.me
> 
> Changes in v4:
> - Add 1150MHz speedbin
> - Rebase on next-20260415
> - Add dep on efuse patchset
> - Link to v3: https://lore.kernel.org/r/20260407-adreno-810-v3-0-30cb7f196ed4@pm.me
> 
> Changes in v3:
> - Drop DEMET from GMU clocks (not required on A810)
> - Document qcom,adreno-44010000 compatible (regex is gone in 7.0+)
> - Drop zeroed out CP_PROTECT_REG[46, 62] range, not required
> - Add a810_protect to __build_asserts
> - Add UCHE_CCHE_TRAP_BASE_[LO|HI] and UCHE_CCHE_WRITE_THRU_BASE_[LO|HI] to a810_pwrup_reglist_regs
> - Move TPL1 registers to a810_pwrup_reglist_regs
> - Include all protect registers in a810_ifpc_reglist_regs
> - Revert pipe reg comment, just copied it from downstream but original also works
> - Link to v2: https://lore.kernel.org/r/20260402-adreno-810-v2-0-ce337ca87a9e@pm.me
> 
> Changes in v2:
> - Mark as RFC due to dependency on in-review changes
> - Explain in DTS commit why qcom,kaanapali-gxclkctl.h and not qcom,milos-gxclkctl.h
> - cx_mmio -> cx_misc_mmio
> - Sync a810_nonctxt_regs with GRAPHICS.LA.14.0.r5-03100-lanai.0
> - Link to v1: https://lore.kernel.org/r/20260331-adreno-810-v1-0-725801dbb12b@pm.me
> 
> ---
> Alexander Koskovich (7):
>       dt-bindings: display/msm/gmu: Document Adreno 810 GMU
>       dt-bindings: display/msm/gpu: Document Adreno 810 GPU
>       drm/msm/adreno: rename llc_mmio to cx_misc_mmio
>       drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
>       drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
>       drm/msm/adreno: add Adreno 810 GPU support
>       arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU nodes
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  30 +++
>  .../devicetree/bindings/display/msm/gpu.yaml       |   5 +-
>  arch/arm64/boot/dts/qcom/milos.dtsi                | 165 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 298 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   8 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  44 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  14 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   6 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
>  9 files changed, 536 insertions(+), 39 deletions(-)
> ---
> base-commit: 2ca0470eca8b4cee27aeeb39bd93c1f4c96b7e7b
> change-id: 20260330-adreno-810-5a47525522cd
> 
> Best regards,

