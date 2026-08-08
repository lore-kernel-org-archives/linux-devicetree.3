Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F263246ED
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 20:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220606; cv=none; b=iPZ5Cmz83UbLFbXBYUe9dp8iGkPXR7MiARvoi6zq5cyrf9GRkNVYE8R6VQwtLFNbmFDkZ0vbO0NS769kemTDMWPPDfMfETbg8f9uT+pI6+9OXC4/5vEOXSGqYivWDV25B9ZSE5Wkh23dZDgc+qbm2OUctKxJqYIODRU+WD1Kass=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220606; c=relaxed/simple;
	bh=oLLjuOgK040qtaqEeDmQSIpMa5K6dCEHSb8JedTqI74=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JIijNOyV1sInnyptOG9iwav7WZNNRlMK5Bd2DXHjsXxL4l3sX2Zh1wAsyb8g6rnsw6egJA7E0ht99qbqZJf/+U9ID2ajx1i29HoFT7VHQ5pQlT13Aw8mf5lXdv1pTzX70GGk90FVXx5M64b2DMgoRal3gUJy/PNpZsWvoP1iMTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kt+u8FVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6ZO/a7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kt+u8FVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6ZO/a7c"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678JwaOA1055418
	for <devicetree@vger.kernel.org>; Sat, 8 Aug 2026 20:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LdzD5p1HJXZooPEGcGX0tp
	QPvvizEG9tLbaiZX0cVG8=; b=kt+u8FVEh/bU2DfPfFoMg2I3guthlAy9iOyC+V
	NdAfLJtskO4y0En7SYPgtF7/bCQPhbXQVXB/Bul2PZe8kObpTNV45sXQ1G4+CrwG
	x7BCKcDSAEHj+Z2niKb66eB7ZXB4D3o+ZX453KJZY1Di9bkUu2B51fj1IbY0MxLu
	J7LlnUPqWsIixMn3k5opQU+ODasu2MXu/M3A1BQCrCBtzwVg8zRQ2ld0QnmM2BCd
	275qEjDp2vhaV4wr15rL64c14avRsM1sMuLfEauGUIjFF015KbfPBBFEeyTIvmcv
	EXNW/FsTgJJ3hVsZcWwsZ3xelvfn7+lFvnycf/q5tJ2bvncQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf79rvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 20:23:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so17167735ad.2
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 13:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786220603; x=1786825403; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LdzD5p1HJXZooPEGcGX0tpQPvvizEG9tLbaiZX0cVG8=;
        b=D6ZO/a7cev9hTwuMGq6m3c4Qd2gyo9KT8dtBYYBWW/XAqTjieV7uXDcVcTnnvJReGW
         r3SCU4SF/xHTjJwK9T3POc29bvp/3k3gKdpBtUmBnBBG2p/whQbs1ylwwrFASoOS5/lX
         tPVmUHaULMCVzr3R+XcYUsB9n+rN3kp2DuAn2Bu5XWQZLFIw9u5XoKNKgrMyC2fmnz6z
         1BtQcqVj3IXHtQZ4oDJJe5C8cPTKOUv793TgD2cG/otxCjgSmHySALrmqpN0QTGHQfeB
         Dk2KfREFmvZD5gqz9bpM0lrZwmacA53fPKrVo9ajxGBZL5PWvAdRqeUczGKfajKNOn97
         99jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786220603; x=1786825403;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LdzD5p1HJXZooPEGcGX0tpQPvvizEG9tLbaiZX0cVG8=;
        b=pVERaeC3Ipj/OxtcdD9Wt48IY10oFCfyPYWiX4O9gkGDXGo/cQJUYNOjwD7tRd3P+n
         AwB7TeztTRom/OE2nJKdpEyCPQKfBGgItpAxJqUbose4kMlpOIA7hv32N1qcwyhwki0v
         9NTvBrwbG1IRWoR6CSErwnJkUDEN8z8jmw8of7roh+OTYLdMk1e8pb3uEQ8kFnlI/xtM
         Qqnwsj/w+KQRsltXJ8Gd9AKlYKyq7XvRuI4fkFhGIiDiGMgHwIc3sayE5tTYi46nxay1
         TzpLykDQ9zyY5CbhjLNBfwxCGXPjJgx97VDcQoI0McVoJrw3+42wkdP23p9KsuUYnPOE
         VRqg==
X-Forwarded-Encrypted: i=1; AHgh+Rpg/Vioi81dnslrSDg2h3H2SeTDWCsC6XbabEZ57vk0WOU1J6sVwiaCoKNOwiGLOQqoYNPgTfo6mdbm@vger.kernel.org
X-Gm-Message-State: AOJu0YwcY6e6YqLrMk8XqT7rH6EcsFr3hGUjxlcP/TOSSp89aMVjBL8P
	rw05ms9h3qwr7EGzIViKTC17y8lOdIQlYlmSiuYAL1Fl8zEbcTAh7fVwaYVqRTL/NA8EegWlRid
	zxEVZZOa3jX9T3swONuUF5e5vNYweSpxXHv76LQAXqSsQKvn2I6+NJIVE6fe6Kh8nTGP6jrTe
X-Gm-Gg: AR+sD11bxg1iPOgdU5fmA2okUmyf06XFDNyh6ARy/Rc0bTXKfoW2DUWhOf+7GMF8v8K
	lasgPAU/TAi4CwgXIzXenlbumATL9ixyPIVfc000YHmIYMpT5x44VYcG0NfUrFPS0SXSXfn8+/I
	2gEv/wNtBasPmS3OLfGIl+i9GqCrnEHJH4VgCodiw0cPGDy5wg6MZAGJKx3dBJrPuhbcqodYbH4
	IVopwYW3IiU9QjwjQ3sswA7nvrR1rNY7vpfKzmTvXh8FefxxYLipKKnGxAeqzPe59T1t94HvIV0
	u9RAUvNzyrK2/MVcUpUg7gBts8gJQYxRKap0DQDTDp4sFv5tCeVcsIumNbdluR4N9OLjMpJvqL9
	cPCsw+TrYw8spHTfg5+uzsPrc
X-Received: by 2002:a17:903:1a83:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d0ca7fbca5mr425586245ad.11.1786220602815;
        Sat, 08 Aug 2026 13:23:22 -0700 (PDT)
X-Received: by 2002:a17:903:1a83:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d0ca7fbca5mr425585695ad.11.1786220602356;
        Sat, 08 Aug 2026 13:23:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm26357417eec.5.2026.08.08.13.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 13:23:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/6] drm/msm: Support for Adreno 830 GPU
Date: Sun, 09 Aug 2026 01:53:07 +0530
Message-Id: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuQd2oC/yWNWwqDMBBFtyL5bsQEjQ9K6T6KSIyjDfWZiSKIe
 2+MMAycGe65B0EwGpAUwUEMbBr1NDpgj4Corxw7oLpxTHjERRTzjM7yJ3tJu3mlDPJc5SJlIku
 JC8wGWr172ae82cCyOqe9j6SWCFRNw6BtEYywW+q9WSSu/ACI0jcWwdM/UhZfTUpVja02Qd0wy
 kTdJjzLk5Q37wkxXFbZX9LQrRcpz/MPiRq6RNYAAAA=
X-Change-ID: 20260428-pakala-gpu-1e99c9671687
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
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786220595; l=2014;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oLLjuOgK040qtaqEeDmQSIpMa5K6dCEHSb8JedTqI74=;
 b=srshORzAuxD4g4wGlcmuEJtAGJPscUkJp828BRyJ8VY8A4AOd3/8du7f4Nuh4lQ0FyKudpgBx
 PE24IaRCe10C+2L0hvUBBExVelnQaIofQRhJejQ0tASWmvLdyM8ToVi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfXwceHu2mJc3X5
 rgWyfhEuowX31fCFcql3JNk5KKj0BR/IBSE888uh8BuzBe8lHSLaFkwsCmC6ds3BARaWjy7b/gr
 6GB8yFoOGUS3KwsBjsR8CJbzMGL5C0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfXxvGU5MF4cTlP
 cIHvMcEEnQy0f0SCudQRZtWozOgeFDl/nLsJs3/hy94UOU6zmNggfPCsmkmcHx/C4KwWUWucObt
 Z8US4emzyUZlPbpQDpDhe3nX5DcWCNnrCtycTA8FfN07H78UvaHwOewKMaYw9+PGTVQhsZinu40
 DhCDtZZpcNb0N6PT/oTUTVjvCl23ESLQ19F/X4N8dinzndT6jzukDMTZ6XntruPV9hThV4XK2Li
 pK5CXSYT5rdPGTvOyqPBqukH0gptOhnkfZvV0ywYhRxJIqSGY2oMNZfp/m/9gOVlCnvaXecIYVd
 LeLzlBHzu2disJ1j5huvQ8ZyDgPIU8Z7pK3zJpK06iiVJYKYagDJYH5XfAigKlunBGDb5WFqmvc
 25LqHoGrHgMCLYu1ZkeVE7nEXRB8JAzkgI4qsBh3oO/EJQZN7wFgtpO710CkUO6TG2QPro7kZhi
 2zRXOkzZlxRUkApSOgg==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a77903b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pO2zmJmEa73fCFxjQ5kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: ZjD9FvCMK6s9KN1g1J3EZx-YN32VwEeN
X-Proofpoint-GUID: ZjD9FvCMK6s9KN1g1J3EZx-YN32VwEeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080176

This series add support for Adreno 830 GPU present in Snapdragon SM8750
chipset, which is almost 2 yr old now. Adreno 830 is the first GPU in
AdrenoeA8xx family [1]. So, architecturally A830 is very close to A840 GPU,
so we just need to add a catalog entry to describe the GPU along with the
necessary register lists. Both Mesa support and firmwares at
linux-firmware repo are already available. Mesa needs a correction to
the chipid value which will be fixed soon.

Patch [1] & [2] are for Rob Clark and the remaining devicetree patches
are for Bjorn to pick up.

[1] https://lore.kernel.org/lkml/20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Gaurav Kohli (1):
      arm64: dts: qcom: sm8750: Add GPU cooling

Jie Zhang (5):
      drm/msm/a8xx: Add support for Adreno 830 GPU
      dt-bindings: display/msm: Document Adreno 830 GPU/GMU
      arm64: dts: qcom: sm8750: Add GPU and GMU nodes
      arm64: dts: qcom: sm8750-mtp: Enable Adreno 830 GPU
      arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |   4 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   2 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   8 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |   8 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 335 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 334 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 8 files changed, 672 insertions(+), 26 deletions(-)
---
base-commit: d56fa0b2bd2d9b2fddc10e8f5bdd42d56676935c
change-id: 20260428-pakala-gpu-1e99c9671687
prerequisite-message-id: <20260714-gpucc_dt_v6-v6-1-16bf5289572d@oss.qualcomm.com>
prerequisite-patch-id: c050130345665caf00f2390fb3da0adc62667eb4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

