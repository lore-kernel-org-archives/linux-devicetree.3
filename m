Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B0B375AA8
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 19:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613713; cv=none; b=V4s5ceZUX8ssZGEFpVwBDpAHiQWCDkS4zp23nRaxJJcvT57TG9stt3RRTO7VDIrgmpodyaOrJF9TGjnAxPiiWY9Mm0Vw9dBKuVyCofjG5WTo1VWvRPLO4rYjXysyvSjjfNxTBUzF7GR5Wq8PTphugUxRX7XnWhHZn8pRuRgiZsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613713; c=relaxed/simple;
	bh=wYO6+mkSHyBImgkmn59rKun7eq0HzQ+6WVDffYq0oGI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VCGg/7Di77UKb5tbGhA5iVRC8+r1mKnOf/Y7RUQzk6s0pwveIIiG9tcGfDO2T0sqFXdqXJRN08mtJDzXl+xMcvhAjxVHZrN/SXRR26d+nc1Wo9DZLBtVLL1racCXjb1SgjpAwaDADFjdA+ErSvypYvQuHcrBhfxbANfnj933/3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z558tiJh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VRDlGQrc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z558tiJh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VRDlGQrc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CIs12Y1058398
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 19:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZxTVwMydLH4t3EYrix2WM9
	RnBiXRbR3ac7t4t7+IWoM=; b=Z558tiJh8DHjrBro2KabN6a8GEGel+CCcFdSWE
	8sAz+VkKeE0f3lSW48wJ5s/oYj4cFSVoX2oc1MvyOv9l0UphYMIqRqy79GgsHwTk
	VdfT7bPV1v/7PP4ZXZF0Od+DUnUS3ec8V3TrpEakSpZsXsOWCs2nIcEXpRY+vTIy
	tl1mpCIq9JwHYdFQ5rqJGcKYfj6rKxgvwEPomry5uMlI2RuWIo8SCXakh0rKQqEZ
	qTMWabHPUQ+2dZpA6DLjbT8zsOCjXXd2oud7fgIUhCx7Tm8lMQ0kl2qbnNDHilA4
	KbFR30KTPUBTINKcDFCm9uk+uo4+6qdUxvfr5Hf0FwYPknAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vx82ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 19:21:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc763c7256so77862765ad.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613709; x=1779218509; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxTVwMydLH4t3EYrix2WM9RnBiXRbR3ac7t4t7+IWoM=;
        b=VRDlGQrcdg4YNll/ferxrIE7oJ1wyDwvavhyZh+9l86Qo1Jg1/qoYS7ua5QQSK5XL1
         6utbSSnGJyb6yg9k95ax6NeQGUdW9aVHvTRimNV18BaQoCIfRsYfBhBmFs+agLe4CFay
         xeFoxPYxtq3iNiLp6BtqrT/veJe/ug0WJubw7oKACGA31x55CkUu3/qVUGzS/pYOet1b
         jyUa0O9Fi6Gk8zpNjmd6fH+2jneh1HSm7TrI5FrfohA+JMIa3iTHkPwSPG+BfdZsWJp5
         wxWcFOMdniQIYLbc6i6d3XflJI8ZFJ3Kvib2RWSaG7jiqHCkQ30G9lrqSWdm9WzZKlp8
         YjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613709; x=1779218509;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxTVwMydLH4t3EYrix2WM9RnBiXRbR3ac7t4t7+IWoM=;
        b=e323FwNfRtcRr2Dz4hiU7qKnkHgI0+MuMz6o3VoaKMEDihQKYoShT1K9a4Y8+vuuk2
         17LzkQk8Losrhcn7ihwQ8cRXo85FyJSYKPjWAVBKi79+FSEiJE2ZTlVJQRUGE2GQuMGo
         HMWBceXZlfjSqHU4a+0eVjmvhrvy8OlmjmZEvz6W/93CJSlExBv/kEowy3Z+loLaICsK
         matXyjlZ8PSlpSfMwx4SCE1Po49JAB2uaftNWY+sWzGaE2FWxgLUz+NpMKLFnBiqIkDK
         UVEnehoUKINPKPnLF/AunOXeGj9lT7Hy0k0K97gNszbAq8QrzzJK0BQ6ye4cJRQa0DPA
         eboQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nSuHPEPg6kM9YHdisau7jbUS//s+BS5u9u7ZGj5JU0IvhoTMcYQVU1oKjymf8aab1W8FJDTYcN7Pt@vger.kernel.org
X-Gm-Message-State: AOJu0YywKwCzAVdRDw0ZKHHDmBNKC3G1LU2KhO+SuF2SS9XaWuUyTJxK
	CSPjXu0/zhVZi1wY3fKNQ5vH/Gx4xTS6teoE2Hf3tpZS5f1bOMOct0K3c5Ufxmz82E8lA6czOCN
	/943HkJKdPmUIqPoF/D6iMgIRlVLlM+E/bXA73GAGcLlj2jwtv2Q81Q9mmUWIBJCA
X-Gm-Gg: Acq92OF8iAXT9N6zwuaZyzxz9hzDK+m4wHOEh6Eznp4F4wgaDSa3LGIORRy12VwT233
	G+agfrI7e0Ps3P61oxLrz+FoHlvkhE4Id5gn29sTKQOQ8DfohcWLeuI3zwSnQOa5wNLQrNuaMtX
	HwiildK4GjEujWW54x7zEKOqupj93bH8vgAM0vRI/AK8vmXurvKqkF8f+aLMBh3WpNfQog/fmGI
	riBIYqhbDoHyCU4OR6fg4FmABhY8tI5AUHDanPDNf+PlutD0YFa9W4LiGcHl94cQXjGgTsVFx2Y
	KXAlu0J1lTOQ6UcRGSg4l6hmNBKsY9O5zbaM1Ki0MZ0Tn/zdLRb9xX5tAc9mvUulG5vYnL4nXZh
	K1hVOrnUSs74QtjIlXUeJkkrfPc9VSLM7HMuFzXl58mY99A==
X-Received: by 2002:a17:903:1aa4:b0:2b0:4f9a:b794 with SMTP id d9443c01a7336-2bd2773017fmr3307775ad.37.1778613709132;
        Tue, 12 May 2026 12:21:49 -0700 (PDT)
X-Received: by 2002:a17:903:1aa4:b0:2b0:4f9a:b794 with SMTP id d9443c01a7336-2bd2773017fmr3307455ad.37.1778613708637;
        Tue, 12 May 2026 12:21:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:21:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Devicetree support for Glymur GPU
Date: Wed, 13 May 2026 00:51:17 +0530
Message-Id: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK59A2oC/3XP4WqDMBAH8FeRfF5KcjFZlTH2HmOIxtMGqrZJD
 C3Fd1+Mgw23fQn8c9zv7h7EoTXoSJk9iMVgnJnGGPKnjOhTPfZITRszAQaKASjan+/DbGl/mWn
 rqRAFSlbEmmpI7LlY7Mwtee8fW7Z4nSPrt0/S1A6pnobB+DIb8eZponPB1v4BnavT0DJ72Qqcf
 c2shkHrqvWVnsbO9FUAGgRltNYai5Yzhc/wNjl3uM71eZ1wiM8rWdc4Gecne09XBp722HAmdwc
 FHkXgQmLDuZbqt5jAAN+IZHyPwIp0HI6NlIVqmn8Q8QPhsEfW2445CGg1cM3EH8iyLJ9lWUVEw
 gEAAA==
X-Change-ID: 20260226-glymur-gpu-dt-339e5092606b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=3384;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wYO6+mkSHyBImgkmn59rKun7eq0HzQ+6WVDffYq0oGI=;
 b=0mHEywVyTDI6uhVjoy9a8e9lPrHbK3KNYy2NOM0D/zwcx2CpBzxNu5tkDdaJ76vnFRhQHqFdH
 fX7pME2bdIjDgPMt75UB2HagBHjYCZkqnp6VVAFn6Bl4jM7sINRqkd4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: kekoDsAzxYXw8UrRyaE-h61eJvhGkkAg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfX5xHc8iyC4FIS
 VS0hJUmxEezvpy7QjDs/xuabKr2LgRVikye74ZgFgLxPD5vrD8HioRU4HnWOwD+iKRCizyAJ7Iu
 vN6MX4J+fuxZ3DiNN++2VzeSSSCIUrC4v0r2TlsDMXjqoYAmA1VT91ERS/osrQYvz2OhVJiH3t5
 MBy+vbeA7eiz5XlmnV+kL0RCYWhO4svrNA05mZr5UI91CxKHaUNVyizZ3+oWCYYlzdSgLQh0chX
 hbr/yPdpY+rVAM3kd52kzdkoXCAOp1GIhooIINP2Ul2Rv9ZxxT50PTtuP1SKZBaxpRdGMZcKMPt
 TGDQNWbKjafSl4neywDbOWDsPXdYXPgWF7LWuOXZyjN7TSmGdFnaTfn+HJ0S1avD80BQLKj2hpF
 C6vzBp6JJbFulONmm4fbmsA7BrBBdNeXqHZ76X+pVi2WB8wbWf4klA8911MrGVqRVMg9BcyzU6R
 uhKMP9v9a+1uA76UuTQ==
X-Proofpoint-GUID: kekoDsAzxYXw8UrRyaE-h61eJvhGkkAg
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a037dcf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-08r9DDlpfC4vgu8VQ8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200

This series adds the necessary Device Tree bits to enable GPU support
on the Glymur-based CRD devices. The Adreno X2-85 GPU present in Glymur
chipsets is based on the new Adreno A8x family of GPUs. It features a new
slice architecture with 4 slices, significantly higher bandwidth
throughput compared to mobile counterparts, raytracing support, and the
highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among other
improvements.

This series includes patches that updates DT schema, add GPU SMMU &
GPU/GMU support. Keen-eyed readers may notice that the zap shader node
is missing. This is intentional: The Glymur-based laptop platforms
generally allow booting Linux at EL2 (yay!), which means the zap firmware
is not required here.

There is an update to the gxclkctl/drm drivers to properly support the IFPC
feature across all A8x GPUs. That series [1] is necessary to properly
support Glymur GPU:
[1] https://lore.kernel.org/lkml/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com/

Just FYI, on top of the linux-next, I had to pick below series [2] to boot
the device properly. But it is unrelated to GPU or this series:
[2] https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v4:
- Add a new patch for passive cooling support
- Link to v3: https://lore.kernel.org/r/20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com

Changes in v3:
- Add a new patch to fix RSCC base vaddr in drm-msm
- Remove interconnect property from adreno smmu dt and the binding doc
- Add a contrait in GPU binding doc to limit the reg entries for Glymur
  (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com

Changes in v2:
- Keep GPU/GMU enabled by default and drop the enablement patch (Konrad)
- Drop zap shader node from DT
- A new patch to update GPU SMMU dt schema.
- Adjust reg range in dt nodes to avoid overlap. 
- Removed cx_dbgc range as it is already stable across chipsets. This
  region is now part of kgsl_3d0_reg_memory range.
- Link to v1: https://lore.kernel.org/r/20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com

---
Akhil P Oommen (4):
      drm/msm/a8xx: Fix RSCC offset
      dt-bindings: display/msm: gpu: Document Adreno X2-185
      dt-bindings: arm-smmu: Update the description for Glymur GPU SMMU
      arm64: dts: qcom: Add GPU support for Glymur

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: glymur: Add GPU cooling

Rajendra Nayak (1):
      arm64: dts: qcom: glymur: Add GPU smmu node

 .../devicetree/bindings/display/msm/gpu.yaml       |  17 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   4 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 461 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   7 +-
 4 files changed, 431 insertions(+), 58 deletions(-)
---
base-commit: c9bd03db3e792a99e9789fde20e91898e3a29e8a
change-id: 20260226-glymur-gpu-dt-339e5092606b
prerequisite-message-id: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
prerequisite-patch-id: f7ab29f2f0241b6536d3b0c0593f0baa0e435221
prerequisite-patch-id: 56c830b7718129323b006e492aed9822d7c30079

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

