Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAB148F003
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257304; cv=none; b=hNe1HbbvEj+Fot/bRJdMED/ODCISfjYTN/1cJwlndq04LEHRMt4ZomU3uTaj+ikj349S3mN4ghXXtNlZH0h4UUUXZH1/Qz3XROzaafipQxD0MWtUIwh/CnqRMtUdA+mcbxkT+UgEhoWMgz6+L+IxO+jWhmmZriThw/AzqxRpZzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257304; c=relaxed/simple;
	bh=aWAGrhyCX9motQNWAluLG+QkdSPnPvrsexRft0qrURk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eULBZP8rjRfHaA7qRUBc9d1YgzKof09uZ9NTy8DwmMGRkLa/CG3aOgdnzmDl22AqgjzMDItcVpOWc6cTtL+IUk8zLPcfurNs+nJPTe8tD4QEezs5MoCpe8D9sfYI6OJcs+s0uW5O7ynOQSjr+ZFCwFzJY7aNEpWFFb6Yc1VUzLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ne/GjaE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzDJGnyU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ne/GjaE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzDJGnyU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4gif1437139
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QEYYv0cWpRHAP3FDxsLq4vXa1ZOHiCaWsZmD4zy72Q4=; b=Ne/GjaE9uyckCFt/
	p0/89XjL/xwCoQ9isszFuJo3idOD9dW3SJL106ZqA7rlEJN8mQBzfqf5g3YnxK+f
	3LdSU5UUqA6A18+p0+di+kxKzsyLSEpKB8aSC+f6Ow8hu11cF+CClfrRzdTqrlCs
	bZRzOqKHMcz7MYiT8WcbPbxjbmJz1oIppdMAc+phXvStU57lR5qunx2oN4aNEN2P
	3ltuD+j35Yh4UkEhlrB0c5srLVuXhox71gI/ID8m3HOx+lE+8g3xc2RubfiRay3b
	aAPLXWRFmSK/zu832WvyafWqr5f7+LyvVhoJNF3vjqiJYyTPI+lBU/lyBw8icUP+
	+crHUw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7rtsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:41:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so22442675ad.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790257294; x=1790862094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEYYv0cWpRHAP3FDxsLq4vXa1ZOHiCaWsZmD4zy72Q4=;
        b=BzDJGnyUjpOGFvIaMoE2VZB7gae+LDW0fVBJyxrXFvmu9STOxRr5Ozl/VRl4wr0JHD
         6QoykgN//hnLKiYAz0BvMqFBDzSqwfrIU2sxf7DVU9u6C8q5s2Lys2lUcLOSanzceY/L
         ZCQ/AMKLkCmXKJyoIBQI71ORpxHeCs8/UAq6yyrwguq3G2EhfVKdYrkKMiA7LgLDIyPD
         l5WsvRkz5gtpWqb4eIzVxWYWVpuCgK6OOvUWqT2cROC0dns8A2kdl3DPklIr6ZijUO+2
         Qs7l0jtqEWScRoriPwGwM/fVyDDB/uLo/hFnHNARihIteGc4NFhsCPbLA3XBv6Di4fep
         9RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257294; x=1790862094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEYYv0cWpRHAP3FDxsLq4vXa1ZOHiCaWsZmD4zy72Q4=;
        b=dR9Hf0l9mynXeplVqjnCWhCo9h2kHyvD5w2YUsT0ERtMGPmumG5iT3LHH/Ss9jhtkW
         60G7MTf92EPmN2ZUlhvOtZDZfp7tI9y4qspFnXR67JshPLN4ILtcY/jwCpxx2VLtZxxT
         m9hV15JcvwIF7jLdMRYYcHuZxMzGKOmmEWTgLH8YAx8InHS/UWX3v+s6mlOAcVluGSZS
         vjAGIx00OGqzA0hwVGCmCBdrGe9NAZYf1pSEffjqiJmLlL20ZOnNSVlueUCxD+XsgNeG
         j2nH3SX6ged+EpbGxEIc1o4iCe8Mnh6JdGMIeEmDSTckyyI6iDBK+YAsnxTElvls7Pnd
         DmSw==
X-Forwarded-Encrypted: i=1; AKwUvBw9cE6IdoyNcAALyR9Elk1DuSkvC7rdiLemRO1DwyymyaRTZ5V6F1q47mtaJPU3J8COrrztdzk3plo2@vger.kernel.org
X-Gm-Message-State: AFuF++lPaAon4BUjAKumITCnGPfG+NrXxLDg2lm/ILK70XUAGvYjQRh/
	ZOwr3bdWMYQmnCPgpGAC90r7x9OGGhMIOj1fFAyoc0Kg21t+CrQogyiaVuQv5/0RmtuGnwWQF+C
	b759y9kR2gmoSI3R7oe4g6oksN6lkux9NJwXnL/OKX221358EtN1vAeYEAbzb6K5J
X-Gm-Gg: AYBFou3NCBvITLpeMkUrKOYU7bIr+tQe/Z2eKoAeJ0DCDVjFCNDdHt4VlcoeRElhZ6U
	T6pZs6iQ6khJ7Kd7H8HrS+bw+ZlFuCPnUK7JstirWxuwRCVHTst+EIRhROX/oRHpYD84tlQ2pOG
	L0i6YGbKxh628AEImY0et8OxnemhMez+YTKjamkqqn8Csk5ltzJRt0T49rVV56OKeg0uOLUSusn
	qbzskzuoMFEQ1YRhSm9Jq2jzr7qitBSvNh8tblV0ryGBnBnn9BgI78ln9HbZ61jmdW1bqtfRRv9
	uLaJpcLJ+j2WHFDFSBg8xdppVqNrvEZF/4MiBey47PANG7U+aWElQCFQVzrzEzzrh6ijJGuO9dl
	7x0PQ9rx4KG6SKjtaWTRuzg==
X-Received: by 2002:a17:902:e54a:b0:2dd:c100:424d with SMTP id d9443c01a7336-2df7e246248mr24330615ad.49.1790257293606;
        Thu, 24 Sep 2026 06:41:33 -0700 (PDT)
X-Received: by 2002:a17:902:e54a:b0:2dd:c100:424d with SMTP id d9443c01a7336-2df7e246248mr24330195ad.49.1790257293024;
        Thu, 24 Sep 2026 06:41:33 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f52dcsm27897905ad.69.2026.09.24.06.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:41:32 -0700 (PDT)
Message-ID: <692ff69a-330e-40db-bffc-a53987fa4bce@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 19:11:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] drm/msm: Support for Hawi & Maili GPU
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <CACu1E7GndBnSj75ZVqic9NxdSakZJL3ZJOuz7D+RbVWA4DUqTQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACu1E7GndBnSj75ZVqic9NxdSakZJL3ZJOuz7D+RbVWA4DUqTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Oesd0N9mNiK8u1OZrObEF87r4bLLe2GW
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab5288e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=36LQ094ZKnh52kRnC0Brrg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=MmXTpdYTAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=Kr7SBsR4NPCIxS1kjiwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=7hoCnnChfAR1N-e-f1W3:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NiBTYWx0ZWRfXwWAu05cq+pV2
 1RlRK1E9bENT/4hiqVJErfyrsNY4lgPciOJkzrhKp7ik7K+VvGwwDRopeou2FLyFLWMGWojixbE
 TKHhbm+aRwLSIyHUQamFSCk4WXcjyD2IINXPKW80dIS6ovpscsFrQNHCmC0BmvdReFr0udAfFQ9
 zh/Nd8cqLhd9ouM9Z5JR9cH9rh/fJOOWfqqIIkxWf438irEEXfP4Jw40BDMskL0f/tBXBlpa1rD
 iyy8/H3btaPN38POzUD7U7H3DZRH0G5I+jjyCXGspAr2OYrpotKUQFP0hh/o7C+j8CxGvT6varG
 j8Z4SMz9EpNYnRvdCFCnk9ontJV53eD/Ul+k3aNPGbjmRtJ4IcHc8RlDqY9wpJp+kVteen6YNik
 IY7SX0sATmli+MBg3NBbMpqyK/2EqIm5r9KqOdipGP1pg0K6rrcFVEmk6Ju2EgRHK/Div2uuMyG
 NqHppRdfv5k85b3lP2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NiBTYWx0ZWRfX+MECnbAbkZtb
 WFHUzvGxpf6b4GuQ7EJd0kAvKZBCqeD3ZkS2MWJ1JGSfuleRX2kqVfPJpAeCizBMjgbV8qro3/5
 kH442aIlMHtpNfiuKSyMM6EY1fcORt0=
X-Proofpoint-ORIG-GUID: Oesd0N9mNiK8u1OZrObEF87r4bLLe2GW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240056



On 9/24/2026 12:54 AM, Connor Abbott wrote:
> On Wed, Sep 23, 2026 at 6:26 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> Adreno 850 is the next generation of A8x GPU present in Hawi SoC. It shares
>> the ADRENO_8XX_GEN2 family and slice architecture with A840, but has many
>> architectural improvements. There is a new block Matrix core (MALU) which
>> helps to accelerate certain compute workloads. Also, there is a new Bx rail
>> that powes a part of the GPU IP. GMU is now powered by a dedicated GDSC
>> powered by MxG rail.
> 
> If there is a dedicated rail for GMU, then
> VK_KHR_calibrated_timestamps is likely broken, assuming that the GMU
> AO counter is on this rail. The AO offset logic in kgsl probably needs
> to be ported here. Has this been tested?

Not sure how GMU core's power domain affect the AO timer. Could you please point
me to the AO offset related change in KGSL? I will check.

-Akhil.
> 
> Connor
> 
>>
>> Maili GPU (Adreno 845) is very similar to A850, except that it doesn't
>> have the MALU block.
>>
>> We will post the Mesa support and linux-firmware support soon. MALU support
>> will be brought in separately along with its support in Mesa.
>>
>> As there is no display support available for Hawi/Maili, validated offscreen
>> testcases that render basic triangles, glmark2-offscreen etc.
>>
>> The driver/dt-binding patches are for Rob to pickup and the DT patches
>> are for Bjorn.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>> To: Rob Clark <robin.clark@oss.qualcomm.com>
>> To: Sean Paul <sean@poorly.run>
>> To: Konrad Dybcio <konradybcio@kernel.org>
>> To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> To: Dmitry Baryshkov <lumag@kernel.org>
>> To: Abhinav Kumar <abhinav.kumar@linux.dev>
>> To: Jessica Zhang <jesszhan0024@gmail.com>
>> To: Marijn Suijten <marijn.suijten@somainline.org>
>> To: David Airlie <airlied@gmail.com>
>> To: Simona Vetter <simona@ffwll.ch>
>> To: Jordan Crouse <jordan@cosmicpenguin.net>
>> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> To: Maxime Ripard <mripard@kernel.org>
>> To: Thomas Zimmermann <tzimmermann@suse.de>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> To: Bjorn Andersson <andersson@kernel.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>>
>> ---
>> Akhil P Oommen (11):
>>       drm/msm/a6xx: Honor perfmode_bw threshold on A8x
>>       drm/msm/a6xx: Fix secondary rail vote in ARC votes
>>       drm/msm/a6xx: Fix RPMH dependency votes
>>       drm/msm/a6xx: Factor out RPMh arc-vote helpers
>>       drm/msm/a6xx: Add BX rail support to GMU dependency votes
>>       drm/msm/a6xx: Clamp MX dependency vote
>>       drm/msm/a8xx: Add Adreno 850 support
>>       drm/msm/a6xx: Send THINMEM config to GMU for A850
>>       dt-bindings: display/msm: Document A850 GPU and GMU
>>       arm64: dts: qcom: hawi: Add GPU support
>>       arm64: dts: qcom: hawi-mtp: Enable GPU
>>
>> Bhaskar Reddy Valluru (4):
>>       drm/msm/a8xx: Add Adreno 845 support
>>       dt-bindings: display/msm: Document A845 GPU and GMU
>>       arm64: dts: qcom: maili: Add GPU support
>>       arm64: dts: qcom: maili-mtp: Enable GPU
>>
>>  .../devicetree/bindings/display/msm/gmu.yaml       |  90 ++++-
>>  .../devicetree/bindings/display/msm/gpu.yaml       |   4 +
>>  arch/arm64/boot/dts/qcom/hawi-mtp.dts              |   8 +
>>  arch/arm64/boot/dts/qcom/hawi.dtsi                 | 336 ++++++++++++++++
>>  arch/arm64/boot/dts/qcom/maili-mtp.dts             |   8 +
>>  arch/arm64/boot/dts/qcom/maili.dtsi                | 309 ++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 446 +++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 231 +++++++----
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  25 ++
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   1 +
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  16 +-
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  21 +
>>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   8 +
>>  15 files changed, 1407 insertions(+), 99 deletions(-)
>> ---
>> base-commit: 1e9b8055458b92f9ebab6f39d97ade5265a0b012
>> change-id: 20260811-hawi-gpu-05b4ecfc3c4c
>> prerequisite-message-id: 20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com
>> prerequisite-patch-id: 239c169e15da44519b2dad09ecd92f0052757929
>> prerequisite-patch-id: 6c586be864944bb1eed773e8c211b898bb1289fe
>> prerequisite-patch-id: f3d8748ccdb6760563f3e07f701a18388a9408ed
>> prerequisite-patch-id: b1639353868bed10fd3cbfcd01cfb88b7e737ead
>> prerequisite-message-id: 20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com
>> prerequisite-patch-id: 36f12c16bf9cb0411d8be2f396407c724162189d
>> prerequisite-patch-id: 28ede1ab83d4b5b56423ebb09bae74b6599b3bac
>> prerequisite-patch-id: 6b3e28c55c07bfcdca8bfa9219fa0c6c763c6f6e
>> prerequisite-patch-id: a2007fdaaeaf2981860c54ae5514f5a6f06c6bb3
>> prerequisite-patch-id: af8aa3c630647336bdaeffa9c88de3650f1e49e4
>>
>> Best regards,
>> --
>> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>

