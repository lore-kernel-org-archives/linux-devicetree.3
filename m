Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6063C4F68B5
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739408; cv=none; b=BapBUuJZfrnj8mqtrOtWfdewKXuDUebEAxF59KQq29ZGmlX/w/emh6/Re/c31gtg6HEMd6nivX9Sdjz1jp5lfFwiH1Tsw4gGw0bySXJkUu8EaRrHEXubqyl99YU7asGaWoeWXIEZeRnpWq6o6+HAdH10lvI/4ctpEo9wR9ilpVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739408; c=relaxed/simple;
	bh=o8HVAWxRNlo/fFnBaZq7WHwUd6qM2TGc58TcV28OucA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mvfwhr6dyAi11xeZALA22L1a8bNLrCwdVcLQ4YEjhuksX8aNry8GIbP8uNEFvv36C2QBvZK1gOeGMN3GNZPsIcWuATe9/p0nwY5PAj7AsXwfoZPUpuAPRVAOym5et5yJmqXaZ5A8EkK7JO+5TnwghTY+1w5cy2PkRszrwIJLZpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bv3bjFts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNO7tU/K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bv3bjFts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNO7tU/K"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOigi745944
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bDbvJAgP6Wge8ZgOdhJOYM
	3uUCE+5C75nJIzz9BGTTA=; b=Bv3bjFtsYzgywiPInaAkTCHD3gtjkpyIPYa46B
	lt0ymEl8t3RX7HkyNv5VcSGc48/nQ77vbXX0OJ8WMeJK0fT8DrvCjVIyxmKdhCw4
	1sUvF7ZSsvBlLVfm7b2evrcwTdUD7nGNyy6mcOcG6vpPqxBPEfIeIi3yI1W/P4TT
	oh+4yeLQAjiXXXwTg2UIMzMELCi9AM4786/06G2fS1CBBVrY0o1Lb2aP69kn3BgN
	5HGRP+O43dvnjF9RVHKgDPSHcTFxvbj2nXtVg15DR2sStyhRZtxsZMjmRF/VP8ms
	hGagnuAfPL4SDXwhc54uhCjP1nTehCjEsoyzFsv0n/BWyKDw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23915hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:50:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso1004280a12.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739403; x=1790344203; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bDbvJAgP6Wge8ZgOdhJOYM3uUCE+5C75nJIzz9BGTTA=;
        b=TNO7tU/KbcCBX986DjNXVLEV5kp9udC/whGyrVhPWU4nk+bqGtRYBLSkTzDgTPY81+
         fhaUvYANgN6CkJs207SB4Wm+B3v7C3WY2FcHwVHLjOVH9RLjEuVLRlD/DuskBpwmRB0H
         oiV2b/87H5Or36JSeUJ4aH/gPjV3Wryx8PxfRpAZrwtLcbClYTpI6AuNIC++J7WuQfCs
         MBTQvVnN8U1hjqSuMmgjx4pQ/uwn0ZMdontTighERjYfIOTo1eA8nl2i2QutAuqb35th
         znzbJ40pMhZteND77G6mwon4Sh+4Jq8H99cOxvjIT+/S+g7JNa8gT3kjkqzm32c9tW9+
         vAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739403; x=1790344203;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bDbvJAgP6Wge8ZgOdhJOYM3uUCE+5C75nJIzz9BGTTA=;
        b=WJno2YT3ZqMo7XR1Yl+fhy0TaayzO4ZUoVoPW+0z5I0X710G0if5cmhPqx5Nl5uKEt
         Dtl03dTodgSFeGuETO075+wIFzVyQHDk1hh0QJlUGY27KKMH+hahBMK+8snwmhd3gIC0
         fj8xRvx78mYYoq2qM7uQdx0vDIrTGo2te35p3cRhPbBvKCJ5ppRlu3Kl6OfT4z49u7Sn
         lyzw6YHJtYPm0Ns7seC6ChI5cSFwtAX7mJZHlo72J4FMX8lNnBy5H4NksqTqH1bMjMXQ
         hl6czKftJyqDW5jpE/I/+yOAi3Z+SBJ2eH16QD79WmfiVmWPWeH6FoCkLBgI4DHJ98Gj
         dMYg==
X-Forwarded-Encrypted: i=1; AKwUvBz1bTnmhCEYWBkRAuIO+evrBwPtq8e6Pexjaxb8ATqTYu7rGt/DVlCK6kZ9Ingy8SSEraaW2i2Uk9Do@vger.kernel.org
X-Gm-Message-State: AFuF++mCYMSf55Ghu5J2A6g+uvc2Go1GCzrVcJA4la2JGpKSlhkpz0Kb
	45oLeifnz7TwQ8lQh9X1yy+49upqkJHYiRTACRtUhkPyKrBaBNFKFndWtMRwN9cPHRYXEAsVNCN
	XtMfL65TbAAV+/a2ayOKWI3KrFj+7DxzZsDBXZfWjmxAc2860j9GgYkWhZ1dsmdUh
X-Gm-Gg: AYBFou0u3AaEmfG5J1siteE/xKIw4ZyZ4L6BcDYc3mX+75u9eB0jUTmRWLPnLUksSuc
	Xmx+99Tppb9trB+mz6zJOZ9LDlRJr/Yj4KlKcXwW8rwLozLvIbOg2R8PkkYGSw+8K68KDZuf/s/
	VfjwqzwpTy2RLR0WXvGXQuIa7k+fRBaFv18UHYaN01nkv9eIGMyYVtqSCzky5hXO++bmzoPDjo9
	SwU8NIf1L1p3uTjniW1d8Pbc9uICHpsW+iKt8NB5vGMZ5BE1XzPHzQ/2OcvhiURmxWKTUuiRd60
	hImUezCSVRV2wRZbUJ65aV/Eg6z9l74zx1g9jmtHXJmkV1G0mMx3WdLgdfnQa4fBLq/UjmVpLE8
	G+iMEp6Uzg+cQzF2gegDIzF3Wr8Y=
X-Received: by 2002:a05:6a20:a126:b0:3d8:f78a:9349 with SMTP id adf61e73a8af0-3dd8c424ea6mr5054068637.13.1789739403249;
        Fri, 18 Sep 2026 06:50:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:a126:b0:3d8:f78a:9349 with SMTP id adf61e73a8af0-3dd8c424ea6mr5053952637.13.1789739401648;
        Fri, 18 Sep 2026 06:50:01 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e9fbesm1013934a12.32.2026.09.18.06.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:50:01 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v3 0/3] ASoC: qcom: enable audio on stage-2 protected DSPs
 (mDSP)
Date: Fri, 18 Sep 2026 19:19:34 +0530
Message-Id: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG9BrWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ML3bLczBTdMmPd5MQUS/NUg9Qk86QkJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tALemtdxrAAAA
X-Change-ID: 20260918-vmid-v3-cad97e0eb7bb
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohit Sharma <mohit.sharma@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX8uIYYFZiX/S/
 pvdS88skVAhI0H0n4iro/N4HrmQLPfqOE1Hc0qcEnE+Nesbv8hEIV/haHWMKNoogRfFG5IWa6HC
 POMrDA9ppIBKT/QjE4vx4MGztZNfSbk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX6yLMVCWXlIQE
 SaRvTdh7NuTijLAmgfxPLvklqTqZ7jOLg0xfA1h/vk1RhZRTWnFOz/UbmyWdmq+1TyEqi+K9xXg
 kkqxXJV2Kn5trzsG26ooEwOUJaWTZnkKHnTBRrwLEyC2konkJOe88xvBQiRQ0tBRz0dukXCKdOE
 SqBZKXggDIxjFgksjsHo07pXgHvKMOHU0gu2ody5JD47qBEoq97jolm3JrqEN9Dvv2pnWigbdov
 RSB4dYUJTrHG76e5ERQnK3Yl3G3KdK3ZR05HhoWkMXzCR5hshPYc80Kbt+aniiuHdLHO/FKN/Bo
 iO7IXx5fgfGDXuRhAFPDaSLJx/p3Jr315ErqUxmGACZOZ63+UGzMYkFOp0kpMDtrHpbV9d5yy9F
 OPBhiXIdaGzWDBOaiqlzdVacUYYMUnnGVF9bNlXCXmb9FVNPab0SjmSSjopaXCniwb6c08S02VD
 AcAZM7QiZanHYhL0aPA==
X-Proofpoint-ORIG-GUID: 9_MN3bgCRnDGfHuZUsaS4GbLcB7ue1Ga
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad418c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=55ZlcImD-GYP5V34_OIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 9_MN3bgCRnDGfHuZUsaS4GbLcB7ue1Ga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180196

On platforms such as Qualcomm Shikra, audio is served by the modem DSP
(mDSP) rather than the ADSP. The mDSP runs in a stage-2 protected context
and cannot use the SMMU, so the PCM buffers it consumes must live in
reserved-memory carveouts that are handed to the consumer VMIDs via a
hypervisor (SCM) memory assignment. This series adds that access model to
the q6apm DAI driver and its binding, alongside the existing stage-1/SMMU
(iommus) path, which is left untouched.

The driver detects the mDSP target at runtime from the GPR domain_id
(GPR_DOMAIN_ID_MODEM) and enables the SCM assignment path automatically.
VMIDs are hardcoded in the driver (HLOS + MSS_MSA + LPASS) rather than
read from DT, following the consensus from v2 review discussion with
Krzysztof Kozlowski and Srinivas Kandagatla.

Tested on Qualcomm Shikra with mDSP audio playback and capture.

Prior versions:
v1 (VMID binding + driver + GPR domain):
  https://lore.kernel.org/all/20260609064038.492641-1-ajay.nandam@oss.qualcomm.com/
v1 (memory-region binding + DTS):
  https://lore.kernel.org/all/20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com/
v2:
  https://lore.kernel.org/all/20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com/

Changes since v2:
- Drop qcom,vmids DT property entirely; VMIDs are static per SoC and
  hardcoded in the driver (HLOS, MSS_MSA, LPASS). This addresses
  Krzysztof's concern that qcom,vmids is "not a hardware property at
  all" and does not belong in DT. (Krzysztof Kozlowski)
- Drop oneOf / dependentRequired constraints from the binding since
  qcom,vmids no longer exists. memory-region is simply optional.
- Detect mDSP from GPR domain_id (GPR_DOMAIN_ID_MODEM) instead of
  keying off a DT property. No new compatible needed.
- Add QCOM_SCM_VMID_LPASS to the SCM destination list alongside
  HLOS and MSS_MSA — required for the mDSP firmware to access
  buffers.
- Switch reserved-memory path from snd_pcm_set_managed_buffer_all()
  to snd_pcm_set_fixed_buffer_all() so the carveout is not subject
  to the preallocate_dma module param. (Mark Brown)
- Use per-item descriptions for memory-region in the DT binding
  instead of free-form text. (Krzysztof Kozlowski)
- Drop reserved-memory node from the binding example.
  (Krzysztof Kozlowski)
- Register devm cleanup action before SCM assigns so probe-error
  paths do not leak HLOS memory access.
- Reorder series: g_apm fix (1/3), GPR domain (2/3), SCM assign
  (3/3) for cleaner bisection.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Ajay Kumar Nandam (3):
      ASoC: qcom: q6apm: clear g_apm on driver removal
      ASoC: qcom: qdsp6: generalize GPR service domain
      ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms

 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |  12 +-
 sound/soc/qcom/Kconfig                             |   1 +
 sound/soc/qcom/qdsp6/audioreach.c                  |  12 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |  22 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   | 260 +++++++++++++++++++--
 sound/soc/qcom/qdsp6/q6apm.c                       |   9 +-
 sound/soc/qcom/qdsp6/q6apm.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6prm.c                       |   2 +
 8 files changed, 287 insertions(+), 33 deletions(-)
---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260918-vmid-v3-cad97e0eb7bb

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

