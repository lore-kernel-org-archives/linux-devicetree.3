Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55773A1695
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320913; cv=none; b=gKVDT254zZexr8Xusb1NMkSRRbGAwddeHas/nvrNNoK6DFKryh0cWSjLieb660xOeXfeobhaBgW+10Bl1aDe63Ac9OP2SE0dsSrhNFEdeGk/hOoCtjzx5C8DOiaZ7VBNEzVtJz7nP2ykG6KUsMP4cV62xyhhJwBp1mmJbcdKhCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320913; c=relaxed/simple;
	bh=6VEjrqVhr7MezwfVHfIVDsIN0YyS4xKPQEXFGvXAkd4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gDPwgmbFyZHHXt5PwFMX1UGNYN3bagcqoC1YtXwAZ7yUSg3l5fRwILbOLOIM3LGpQbLvyppGXNOdbIwaXCsK4+BkUS8MiVGW9Oi1lXOqjfWEgrusSGi+WUcIwWvPl0Uxmdfn9OxSgKjAJ+Wq/Znn0d+8rU2XNJzcDaH/S2H1kSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HW0ZOYY2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b30XoyN8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HW0ZOYY2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b30XoyN8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtTDs2886999
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sVH+YK2y1vG4lsBrivCXnD
	TuyI7sx5ytr7WDEkhCxnA=; b=HW0ZOYY2FpGcSHpEnfmuVuVyl9JGzmftZEOCaD
	DsPsngIbXbdhA2BGmz7sYPEGS85X8TT+PrP63hasVtmNBcfIrxQPKe1OweE6cB0y
	UZBkk5VqbXoAgBUN8f3zGdBpQbzwVtlQjeys1cqOQKK6iK82SMb2vtBoSUARukYE
	VZ6uWk/mf6YOPdDbB0Jv4SMQbE19eWNZFdLlGrlSGH/Nkd+eqw5FqyjJOgPo5DIG
	tza7D2JwV9v9GT/hcX2om3TNECdCCoBXVMFRKPOcvMhja9Mzo+blHVySnLrNJX0/
	VUM9EzkUB6lDaCNV7mzpqoLH+CGgXAbepodZX/stvLNr//OA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfjm5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:41:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811279d51aso8805164a91.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320909; x=1784925709; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sVH+YK2y1vG4lsBrivCXnDTuyI7sx5ytr7WDEkhCxnA=;
        b=b30XoyN8+hIu2YKEV9k9NhuzEyK8uFmiBzBgq+x7gkNXkDD5fL5utJ2bVI6vd48qNk
         gWmlzLnBCN1VrfUqtPqkbVvRcoHwMu6P6POi2BdbH10l19jtim2C5w0TR2mCctKNzeVv
         GmpytDVi6go4/74ZhiX672YpHqdVCvuUfeDt71W6SvK+9421b0FssKjq5zJWLdu13D7m
         bHDzj7kCkSYrYWapHcCQpKjS+Q1KUpFjN+smWZUy5+VW+8S4nQVAo+RvAVN8RDlsJGSu
         eZV6L7yYpqtUradLMDDlrtKNetNb3R/ECW1n2BK4IDVTzDSjEETY6VEWrguCddjzfLzg
         oGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320909; x=1784925709;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sVH+YK2y1vG4lsBrivCXnDTuyI7sx5ytr7WDEkhCxnA=;
        b=joyh2sr9HzguSp2LkDKgwfGpFQu4cYS2ONuMxqn/jrTkfQrG295cnyWU6lzg5+ekH8
         pgu3bcxsbFkvzgrwSbF/r6cxuYIWJs8UaI9pcGur4sci14v931EvbX6l/PImiulVT+qm
         3U9e6RaL45QoZGhIqcPjC7TxEqov+4gaLn2NCrCEQfND8Ygk7ote+hnGK9s3dcoBS1Ny
         SvGTQzIf3oIQkUTIJmLfkGoZE9O+9VVMVrNTA9jdldoH00NjQac3LkBY/gCfmvcVfxlE
         +p5SHnKjfhpldjYfJ66F8HGhHgpfxd5YZSWnX3r6DReXRPUJTHXkNLyi2zO4+G2A/rB4
         x/Lg==
X-Forwarded-Encrypted: i=1; AHgh+RrIKCpL8TXrFcPylKOe85+VoqC7sxVWYpBvNWajg0K40cSML84zL0BD6NtuVHCmhUMCEXgufpSE961I@vger.kernel.org
X-Gm-Message-State: AOJu0YzbTRbTZvZa4s0SsS3C48YEocCLw3tG/M5D3Ze84wimBDI67wVa
	mQzH3flG5K9D3wVRcotsi6pMlPJVRv+/F5ZqOo6+PpGrAcRQOs4DMRu3Tsf8LmSgfFdHFfMVbX9
	/44UQALHINex2HP06OE+GKupNwM+mtOAqSUu8Qqd4j0b2556944soRRKPUYbVpI6u
X-Gm-Gg: AfdE7cl5m/OOj8wIFELXnHJxIt9l24nanFs8VojLCYiF+k6gn9amZco0BcpGI8xZwtG
	ONotoUluF0r+Fdm4iYfvEr1dg8VKCXRF/Nx/ojeN8jvTKo66O0dH1iN1Sd5gMo+5ZHOQbTILnqX
	lCwZh55ns1C4AzguFQVTW+//OHEFBrJ5tv9yRl0iutgZ0m2GlntohlsAatFBRDHp5L8X828DO2a
	dJrXYUX9yk30bjfzgIhwqzgo4kYC/B6fCjgwAGjm3yzWw2p6cExEyJoS6tXulLNuLuhDRHmJme5
	Jvqen68KMlC9X8RqWi7UQRxxhkqPekDR67j1qo14B4pq9n/ZOxeRYWARde9PPe4SeikFv+3ty1k
	Bk7wgJHOUQ3K7kIo6Dj9Fyk8m
X-Received: by 2002:a17:90b:1dca:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38e4b454d1cmr4623506a91.10.1784320909230;
        Fri, 17 Jul 2026 13:41:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1dca:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38e4b454d1cmr4623483a91.10.1784320908803;
        Fri, 17 Jul 2026 13:41:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:41:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/9] drm/msm: Support for Eliza GPU
Date: Sat, 18 Jul 2026 02:11:25 +0530
Message-Id: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHWTWmoC/2WP22rDMAyGXyXoei62m6Q4jLH3GCU4itIa6qS1k
 tADefc5bi4GAyH4dfh+6QVMwRFDlb0g0OzYDX0U+iMDPNv+RMK1UYOWupQHmQu6uKcVp+skCLF
 TJi+x2SPE+Wugzt0T6+f41oFuU0SO7yI0lkng4L0bq6yn+yg2rF73PTHbZFhln6lRSiOazbL2v
 kas51LEkEId2k4aKkwu8Xtg3t0me1nRu5i+YPU/Ox6H8EivzSodsNkVf76YVaSh6dS+yNum1eY
 fDY7LsvwCx3XanCkBAAA=
X-Change-ID: 20260704-eliza-gpu-eccf1946cb3c
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=3090;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6VEjrqVhr7MezwfVHfIVDsIN0YyS4xKPQEXFGvXAkd4=;
 b=SNwxy/SDmWuwEjIaqCpTdLVsE7jZE/sH0Uta1x17D2avioGP0wvW5JmMtKbo/r0IwoMsTchaW
 sdJOBpo6jhuBxTd0mN2Iwym1w7M71JU8qdNIuLFrokRXTF7MmACLhLE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX+n+VuPPT9/20
 wVVgZJbnqp6cWM2OgiHXIHCjxbVKx2fdZIhee1Fs6t+Y1ro+o/VBxg1tKxKaciGShlp3OXnwOq0
 NBFnP4aqH6bQpJhKJczEIwNzlk3+ZNxjFXiFx/yYH1hGx5DN0ZdQIdS+oFA0MU1Z9uG4zSVg6x7
 RduQVS2BQySXxhxgHurZ9GPnHHv5k/GWdjQn+OYmIb1QC+rFUDETFaXmzDZ1nm1UGfZxcqCP/gh
 +WBLd7FFeeYcyY7C76NSZjD3jX8c0n1syPcEe+YKT2tXSTRXLqoWvOBjDXFcmw7U7eSzXWUr3ln
 jv1jmzuuLBveAJkwnIprC5tm9DSWkeQ/+4+CiSI0Z2UtJG8W4jhcsia61GPUVJwgmobxmW6Ud0u
 MKQUw+kRJsLv06xFrfn3BW6NlWUha/I4GIO4LfQUbG/pDnB641c8jB35GVZ6It9Az5R0gXPuDm2
 iFuGCnUekIyhn7icYMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX7c/s8JVPiY4h
 QYYfI54KeyekTLUCGtBMVfouPYWORoQJRt+xRtJygofg8n/Nvb6t5RdATjDz2XjXXZSLSeY6rMK
 0ymsHqMelzlFVMD6At44SQtkE3yoaDg=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a938e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VR85YU2tW1KY0NdMjCQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: yphL9UpquMISm1LzCAXtau54akB9N6Bo
X-Proofpoint-ORIG-GUID: yphL9UpquMISm1LzCAXtau54akB9N6Bo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170212

Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include smaller cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

The first few patches that updates driver and dt binding docs are for
Rob Clark and the remaining devicetree bits are for Bjorn to pick up.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Add a new patch for GPU passive cooling
- Rename firmwares to gen717*
- Capture trailers
- Link to v1: https://lore.kernel.org/r/20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com

---
Abel Vesa (1):
      arm64: dts: qcom: eliza: Add GPU SMMU node

Akhil P Oommen (2):
      drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX- variant register
      dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC

Gaurav Kohli (1):
      arm64: dts: qcom: eliza: Add GPU cooling

Puranam V G Tejaswi (5):
      drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in a730_hwcg
      drm/msm/a6xx: Add Adreno 722 support
      dt-bindings: display/msm: Document Adreno 722 GPU and GMU
      arm64: dts: qcom: eliza: Add GPU nodes
      arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   2 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |   8 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 209 +++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  38 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  81 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   5 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   2 +-
 .../gpu/drm/msm/adreno/adreno_gen7_17_0_snapshot.h | 428 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   2 +-
 14 files changed, 773 insertions(+), 30 deletions(-)
---
base-commit: a9498e40e3e314ade387d3ab0d5cb14f0f3aa1ad
change-id: 20260704-eliza-gpu-eccf1946cb3c
prerequisite-message-id: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
prerequisite-patch-id: ecae5e45a33a79ec3f500e3f318e3a0129fddfb7
prerequisite-patch-id: 19fe32e5af810250eef42dab488c982ef70c055c
prerequisite-patch-id: 60dde5421adbc86f355b4899bedd0d7a1a0c4e5e
prerequisite-patch-id: 58c9dbb18795c662ea22c3a82b07d6465f604e08
prerequisite-patch-id: 0c6e220ecf2b42776f990ea5b98ba4ee97d229ee
prerequisite-patch-id: 0e0bed1091d12c102e2542b1c2931f61a543f2b0
prerequisite-patch-id: c0f22b4ff0bb79935848dde50c524f6063011ebb

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

