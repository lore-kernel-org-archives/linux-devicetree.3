Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9324435507
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 21:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493631; cv=none; b=XQHnMED+qLXAQifY00Z1sGKyd8Ri4eK3hCo6AvxtfqUfQpJOopMuY1ptjaRFMNukmlmaTZoGZ5AMO4PXT5KRMIf34khxdO2zn0KEa9Gg6y3AiSVfNeCa96octT0V5SgrI74iVufwZ+WhN5koLYzctTkt072kLFTwFvS2oe4qP1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493631; c=relaxed/simple;
	bh=OAsh6BHsJWICYaqgCYPxTfrGA9OgSXttDi2giyj8A0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ULbfkBCqa0fSNuC/d8T4hi2RLsHq0roEU+/Baq2PLcyQ1tQqvDCFovY2fzTHpfGE53pZLIuK7QrORy1IhPovBewPaMTkXJqK6FMY766nzMtaS+8ptzydPpYALY746AXq28dz4Oc4/OwrpYQ78OmPs2hviLEollYNuWybFZj2DSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMrc9B65; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chewIgmu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMrc9B65";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chewIgmu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L040P173293
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 21:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qkepF2/gI8XkHqq9Zdif/+
	4ePDfuAtYx0d2zgLKoctI=; b=TMrc9B65CA7fCBxrrDjjD4XLcAd1EQ+cmdd9TP
	JF9lTVG8cvg2UO3ub9I4RbY84NCyVwGeA0ZAEA88Izu0YVfq4OKaGZLkti0P2AVF
	iURaXxF4Az4DWxed/NiNq3xpA5JTBb8mTKMOBZV8a8j8NivyoDGd450tt3vxXIXz
	kF5axqGhGv1k5BRGSO3Jxr+I/VG8JUf0K+SrQl6pugLASuSzu+7Jwj5ozQ0KbQPz
	Ep0icAnZXj96A2K4MtWkk+lt1NcLVJ3rikRIBkY6nRJzXQlHgOKLmnQAmZDrF33u
	XOoRRfwCGUILDx+SVX/RhoVioMyumpUiKG3iW1RS7YzdBbAg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj0mfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 21:07:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso5939900eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 14:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493628; x=1792098428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qkepF2/gI8XkHqq9Zdif/+4ePDfuAtYx0d2zgLKoctI=;
        b=chewIgmumHg+skZdCA9qxexbcIx4rgs+uLEeT1B37NkOaSEvLLHRuOl+vyrRMzz61b
         TjZZ9Eht3ciYfHwT+Sm7RxCBAmX64y9eivTeagIsiKRg4eGUhNC/XpQRgq8psDQGNzU4
         OZtwlSsjvhonibLR7kPNr2jy1o+jVyIvMWAm+sordqaM8rvoUFeWqU9yNqNYYnnIMMO2
         GFNrq/fk/CS9EjjeVzzOJazEaEYP6K7H/Ysw5O+NUYmEVNYdmK0xjodTusdocT6/vJeF
         EsEUKZwdHgMWYg2P4WgmIWSFnHDTES16DHL1IBydmdEUnEq21bxbXCmrbGXOCJHE2tw7
         gorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493628; x=1792098428;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qkepF2/gI8XkHqq9Zdif/+4ePDfuAtYx0d2zgLKoctI=;
        b=Wnn35ZbCEys4i17ALPAs5ka7bAQ2lCitbYIionOn+7vDxK0LOGQAg9Td5tmHcXeHhM
         rihYZAPxfNNmsTkNlpHgtiuximf+hM9cfQXduIi6u5o5x670bXfdC0/P2sIBKV/Pahin
         26F90uUoUjzmE8yu6TcGvgUJuHmIa2leKfqTdWnaROLNEtbSp+YQFjnn3I/zFUnv0RRL
         q0giE33UxPYQTi1Jf6bQqAKS7c8+msPYZNcbZLECcafpiNS/NLU6phJhLFta/ayUL4qy
         v0ylDj0rzIHczWpimJsgrEM9F8+dkw1hUNjmmKnMkvwq9gZW/CrlZW9pK098Czt1rSVN
         Qffg==
X-Forwarded-Encrypted: i=1; AKwUvBxiQXzYi4xbFVTKNVUwLNimdlVNu3lHO0d7YK8McQAfWbd4FmzjMFxjL4Mwos/Td4t/M0RdFzOc0Hfy@vger.kernel.org
X-Gm-Message-State: AFq9FYLaU+OfVQaQmLo+eP1clXl8vq7Iqf4nbAK/1H5fYkAy0UDIP4Mz
	3fnu8rlKp+D9QhEX9zOIobgixVpYXJhqV40f4aYwhzQBPKZPimoI9fwwa2ktH+OKcuT7zMM5JsH
	j2rlXAwYQU53AxgXQ0tB2EH1UPZHtUe4+Ku6MSFouhu49t8muecMxSsEd/qXDDn0j
X-Gm-Gg: AYBFou2gsxbo2uzS/G9sdQqUZLbBuh26WjzKn5wWlikEF75lzgbDAlSxxqkQz8XsqbA
	PmaEb2wq/a+2ys0F9EZdeedpaOWSloQczLzvh5RqAT2Bfd7WA4p1YAw8e53zcHdT9i5Y7I/BcOC
	PS4RCsW/ddk62HP/5smYoh0HivnMR4V3x1DieG4Eq592tyEUxFlSKMuAxQmh0h2eAFFKMlp3IQ5
	RLM3/Jw4dvao6fjt5+1jHhiIEdcrx/qfEGhR4z1EqBha058qiF3V0AaXIaKaZwN7UlbDlB5qBIz
	b9pKxMGrkDIq/YOln4ZCBP9hjnp6HQopsW38jLzlgVnf75sJsmuQI6GuDZX2NSc7PKdlfQ73sxl
	V6z+/aermdcWpCIKXykjep/Q=
X-Received: by 2002:a05:7301:6487:b0:351:695d:c942 with SMTP id 5a478bee46e88-3537e01235fmr96088eec.11.1791493626961;
        Thu, 08 Oct 2026 14:07:06 -0700 (PDT)
X-Received: by 2002:a05:7301:6487:b0:351:695d:c942 with SMTP id 5a478bee46e88-3537e01235fmr96028eec.11.1791493626045;
        Thu, 08 Oct 2026 14:07:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm634773eec.17.2026.10.08.14.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:07:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm: Support for GPU in Nord
Date: Fri, 09 Oct 2026 02:36:34 +0530
Message-Id: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsFyGoC/y2OSw6DMAwFr4KybqKY8gmseo+KRQouRCoJxKRCQ
 ty9AbqxNE/PY2+M0BskVicb8/g1ZJyNALeEtYO2PXLTRWapTAuQUnHrfMf7KQAvsQRdgcYiv7P
 Ynzy+zXq6ns3FHucQlcsVspcm5K0bR7PUicV14X9teeyPSKTPg3Vy5LJKM6kyJXMBMoUyVxw4D
 Wj7+JkTfXAPRyTmoD+HU8TBmn3/ATHlVR7TAAAA
X-Change-ID: 20261008-nord-gpu1-7e71a91ae653
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
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791493617; l=1744;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OAsh6BHsJWICYaqgCYPxTfrGA9OgSXttDi2giyj8A0Y=;
 b=YgHWFIUSJr0YEcLnzDSY5byxjOWwNyX+PJZro+6umZXkfli7BA+dmcwc3RKILkKkwlwg3vjxi
 O/rDZCbeDreAvPHn4DN73Fqf2ryoiCHknbeQClyPMDFg9UMrvYfZctY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac805fc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eQK-ig326sWed8EMzPoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: xYUgQ0adecdZHUE9TNrT7DioCpVG7Wrs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX+vKo1Kwh95Bd
 /c9+plHFIyDHpfR9Fvcz567GKm0IGjEM5E5FsglWAfBSLlGaIYSw/l8F4iUnIE7u464dinQ0non
 vdteRQ88quDROtd2965pxBWs7ZxmUe1eCF6BcroCp61EYGlmXdwXRbyihmGCvg0Ke8BoDL+96a9
 zBqRFEMzai45oODX0h0befgP8PJLCVLHmlALeN+gMkVr2qtptSOxjTt5qXqSG90mXClRbMN3G4S
 3jTkDHzg+Iyv+8Yp+pzCyWfNL2WNKy0A4QgeOUrMyT+4A/CN7+yiqY+i0J2WmRYoTnRmePYtNv9
 yj0m0IsmS8Ndv70Tr8cZ2pe0QoPWE0FbVasHgChzvWCP+hGb+PqJWEqkLGWqQsiPlMqE74XpyZE
 x0Gs+7JNEQnwQw9CtjyxJ3e3FCqnQ92KYaIVMj+cUDUriTkigKUKr5XTebqFQUNh/PwjOQNBQEm
 XJPcZyu3Uo8WQAqa2Vg==
X-Proofpoint-GUID: xYUgQ0adecdZHUE9TNrT7DioCpVG7Wrs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX2CZ/0Rq5cnSv
 FpjhvLNHA8Y8DwXKQWhyExkgXZ6F5RkRQPn02v6or7TbBRvRCIeJklXV+6caiAyiGIjfKjCNm8h
 vZstrOAibvznzYAu2im8Vw+KO88tkW0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080084

Nord is the first Snapdragon chipset with 2 integrated GPUs. It has
an Adreno 753 GPU which is very similar to the existing A750 (SM8650
chipset) and an Adreno A735 which is similar to the Adreno X1-45 GPU.
This series adds support for the A753 GPU. A735 support will come later
in a separate series.

The driver and dt-bindings patches are for Rob Clark and the devicetree
bits are for Bjorn to pick up.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Aastha Pandey (1):
      arm64: dts: qcom: nord: Add GPU cooling

Shivam Rawat (4):
      drm/msm/a6xx: Add Adreno 753 support
      dt-bindings: display/msm: Document Adreno 753 GPU/GMU
      arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU nodes
      arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  33 +++
 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 293 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts              |   8 +
 arch/arm64/boot/dts/qcom/nord.dtsi                 |  80 +++---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  35 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 9 files changed, 423 insertions(+), 43 deletions(-)
---
base-commit: cf4a8255a424f691f95dfa378e88336f33aa8ae4
change-id: 20261008-nord-gpu1-7e71a91ae653
prerequisite-message-id: 20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com
prerequisite-patch-id: 62d07f5574a5d15ac0097efcea4a70dc96331cb3

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

