Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6723D339719
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498782; cv=none; b=Lg1CZU7NTNtAfD9itrL/1hkw9f+2PATRmpD43Iaef7lif6MhDT7QFuz3gDfkgUkNXfS2lW2cXBaWN2ZlQ5EzWxOxDyEMjF6GN8Qpa62dW0wDWk9OaL5bl6ynktmj9TaAcIFDIPJELcd2ZA3FGI3XelqXbdKJegJXhinyyhe1WAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498782; c=relaxed/simple;
	bh=tlczd3hbO7jRStxmbXwY/7Pvez+jwqK8qrOvD2gZiqc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n2ZyiLtfbOeJmUHsnJPgnNgHjutlK9EIFpNXGMVhi+WPQVt0dw4X9EQ7rSb32ixm1ITAJoOFAwrKIbCeVmQ2UgJ6KauhI2U0H74Z72pnl1XsUp0OssQIdu9GQR4THlvV75HAwPCSgQkPkPb9mNQF7G/Hn4NRQb/jGc9VYXzHsJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGP0dkdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBm2NJjG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGP0dkdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBm2NJjG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653AB44o3552293
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 14:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OHsKV+ltiKXXlmj8cUFWo9
	IbTkRATlv2GK6UqkbO9h4=; b=LGP0dkdDB/zIX1VP4TSAhzZdDunN+X8a21fjfc
	kWdA25gpjcSUH4hBGFoMDe15TSA5J62MDzzfPpR33WVdWY5QlZ++2ocwmD8DT0im
	/CSnTGyUec9kqbVoNIzXvCLbZ8wHhm/fdT8tjf8lY5rs/G3h0wUxJWQGUg7JqnT9
	tbuLiIZTgtxwggkRGdUQshxJsIEP8se1b4FYjiD4OHnlhAKYXP3p4k4qBszLFiS+
	89EVsCwGN9DfKnutMcAfcVKnQrhO3cxak98I09t18A514ss5hzrWZIPhKJD8GTdA
	JrkY9YAEbCBdbioM3v58dOE13HczH2Ce4JRf5CnK/KXN9Hbw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9ms4dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 14:59:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8525f0807aso16490823a12.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498779; x=1781103579; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHsKV+ltiKXXlmj8cUFWo9IbTkRATlv2GK6UqkbO9h4=;
        b=jBm2NJjGELzoz7my0B/RuipeUYhMjpAY8McP258sFq2ejq2//avPTOaQ3YIDu45vln
         s+FVd+C3QIoPxiVAz57q57zziMVggAX7KNbFF/wxYGhKcuM9p7QU4xH4X2e/e4VZSyXl
         aXv2fr5nC16OE5Yfo9kXrLmvNY6p7NINNGMGprGkv5LYISdBXYvT/deU8Jh2zJNueHhg
         rrhsgcCleiiuS2FYLPsDSed+OfjHT5m/ZSE+J9wxlQnX2+lMrtLdrQepKzRy65Trccxe
         w0LmiT538p4Bmc5UWDRw/v5HkgZQZbBMP4pEV+nyDj57LCZk7jdJG16ndBin+1XhNC5s
         WOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498779; x=1781103579;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHsKV+ltiKXXlmj8cUFWo9IbTkRATlv2GK6UqkbO9h4=;
        b=np9zg4D67GnqKcpu/q8Gpon2eKuWSNJVERnnKw7db9ThCvIwkwVX+3uo5CZU2fx2ct
         hH//goA6pNkPP6/s6KcbM4HwIK1+KiUdtB/q2LkinewKOAKeZty5L0iuZIJGwfwW6xp5
         Iw4yQJ6UH8scZ56AJZ4g/rl3+At3b2zSPlGe00WCWr4sij7QsEXoDHNmhDsrQmtzoTkP
         iBDSUY68QYulsn4uh2cNeBDK9o7Go9RGJpg+1D9RZQ8FOkF/SlcyN3k7S9rD0tjslrMD
         MoItqlu3+WQJxBHLaCSCHKRJMIe7a3ox0fQSgdtOp8NqQSAFLMvNHGDbhmfHSKwtXm1e
         3kaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8i9vs9WYredmEWRWSeOAvMaLJlGFkXxgZgsa5Ka6T9x/7mO9BOxc5qmtq6I22aK+d7p8YcQr1dSvLz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2HvYb+rJ03WNFIcNxCvjfZRV6yitxLXfpO8VXFNQFrAEwjQb
	yMSTKLmLgR+3MMelMZsJWpjwfuNzcPjGas8G1DlvSiriume+21MNLECtbYTPDkM9tczdx+Y3o5D
	lyAKLK1ToOwACqXZtXm//IntsvbNkyYi1ROMuw06BrxnPanYdGuImUbedKFDmFgAJ
X-Gm-Gg: Acq92OFMdUDwFhXcJ3VraFLD+1InxddhXhLp2ciJs0MbFFT8kOP+SqY0T9PMYIjh4mf
	Ts6BXS+I1awRW/r+Tty7yBUJX0HF0bAiFBQ3ppjdKdHQVGJBXC7nQX900dNBEc1yhlNJOyyL0Y4
	xsnjEE4/JOQbdDO/3N53xSnGrI8N4ML9sQZZsxmPJiumOKOM8LDx+o53AqMWUFfE0cuKx2D3LKT
	T3WU07HTpYp6ELT1g+q5or/CH86egrrIRh9zr+ttG+FzMZ/qmmTGWgcaKc9EeLS5yhqBftV6H+8
	t6BJJ413AMV978z1j1LBOCNJiOnMx9v9n3rXETnWbYCx5BNqDmKopD9Zdxrjsd0aEK6+AF3Nw9H
	mBcSx3GqvRKCw3GI3IdApPPB5oAqKLyWZkJu+YeqUyiJwUscGa3QU9gLpHQA=
X-Received: by 2002:a05:6a00:4085:b0:82f:6e9:d1c3 with SMTP id d2e1a72fcca58-84284ef2c4cmr4096563b3a.29.1780498779031;
        Wed, 03 Jun 2026 07:59:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:4085:b0:82f:6e9:d1c3 with SMTP id d2e1a72fcca58-84284ef2c4cmr4096526b3a.29.1780498778597;
        Wed, 03 Jun 2026 07:59:38 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:59:38 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH 0/5] Subject: [PATCH 0/5] Add Shikra (QCM2290) display
 support
Date: Wed, 03 Jun 2026 20:29:25 +0530
Message-Id: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1BIGoC/yXMQQ6CMBBA0auQWTvJUJMWuQpxUdsBRg2QDhAN4
 e4UXb7F/xsoJ2GFutgg8Soq45BRXgoIvR86RonZYMhYsnRF7eWVPEbR6e2/SM5ZZ6hq/Y0gR1P
 iVj6/YXP/W5fHk8N8XmDfD+zSrYlyAAAA
X-Change-ID: 20260603-shikra-display-07767208fa90
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=2627;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=tlczd3hbO7jRStxmbXwY/7Pvez+jwqK8qrOvD2gZiqc=;
 b=NuBmKboJ2e9mtFWMrrsLSiNUZwFZCNOuWYAD9ECbT/obdMO75IR3X0zKzn8SsFhx1YCJYfXpd
 t5w8rKtPPLWAIxXudncUKr9Kq4VWoutNylTrUaf1UuMDOP8r2sgYGcu
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: oyLHIgQNsnPGZ5zAGFfWPUgudFwyPNM4
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a20415b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sFAlhcv5WihPgsyf0pgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfX+OJbcNbSV3E5
 ev2QkR+icUatKL5wKOoVqlUFgZ+BAmkbMH2KCZVkP43AvaZ4MXJKQpXWsoWWwOsOWA5VHhNQool
 6hZy65yKiKaF4GpnHZeeH6jSxSePBu74KgM81OH+bEVe0k7KcW9nr697mFR5G2ZMPJf6fJ2KIQt
 Y8cxccmrXC1VKOmAWhaDnHHkLn0CWDk4Jl8Y+1aIizc98nR4eCILnxWfQMzHmr3IEJF8v2ZfYWC
 RjrkltUclEhNNUlo6o/RHpuw7TzZ0ZhE3JzYQLpFHmQmWCvXgydXZHd5p+3MSIfawO9o3GhArhp
 tk0VkZPAvWZGX6s8uPOYusUSstKLgH5EEYrfcn27vzDB6dEsUDnCUnG+fd7fuRE0C4YqFL9se4j
 arpCT3FSYdCPMClkN6NdV8Of8ZEg4THkkryaiACZJKsGyWyperqX904Be+ll+paf7Wo4wSgoEzu
 CrQTahk2SBNFRkqydvQ==
X-Proofpoint-ORIG-GUID: oyLHIgQNsnPGZ5zAGFfWPUgudFwyPNM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144

Shikra (QCM2290) is a Qualcomm SoC based on the QCM2290 family that
reuses the same MDSS/DPU 6.5 hardware as QCM2290. This series enables
the display subsystem for Shikra by adding DT binding updates for MDSS,
DSI controller and DPU, drm/msm driver entries reusing the QCM2290
AHB clock and DPU catalog, UBWC configuration (no_ubwc_data), arm64
defconfig enablement for the ILI7807S DSI panel, and explicit SMMU
client table entries for qcom,shikra-mdss.

Tested on Shikra EVK board with ILI7807S DSI panel. Display
pipeline probes cleanly and panel renders correctly.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Nabige Aala (5):
  dt-bindings: display: msm: qcm2290: Add Shikra MDSS
  drm/msm/mdss: Add Shikra support
  arm64: defconfig: Enable ILI7807S DSI panel driver
  soc: qcom: ubwc: Add Shikra UBWC config
  iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm SMMU client tables

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml		|  1 +
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  4 +++-
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 34 +++++++++++++++++++++++++++-------
 arch/arm64/configs/defconfig							|  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c					|  1 +
 drivers/gpu/drm/msm/msm_mdss.c							|  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c					|  3 +++
 drivers/soc/qcom/ubwc_config.c							|  1 +
 8 files changed, 38 insertions(+), 8 deletions(-)
---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Nabige Aala (5):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS
      drm/msm/mdss: Add Shikra support
      arm64: defconfig: Enable ILI7807S DSI panel driver
      soc: qcom: ubwc: Add Shikra UBWC config
      iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm SMMU client tables

 .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  4 ++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 34 +++++++++++++++++-----
 arch/arm64/configs/defconfig                       |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |  3 ++
 drivers/soc/qcom/ubwc_config.c                     |  1 +
 8 files changed, 38 insertions(+), 8 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

