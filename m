Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5DF3F7877
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654760; cv=none; b=WpOY65sBRs7aAUnCorZtwGXltg5GJc2zmeFmnHK83vdYhtiM4OpSGI1hVbN11ZFastBYGx1wWLCV7yn/5EViqfd4r8U0vgotxyCzifNW8Pqhy/M9BwvrqtcnlqIIN/+q4iAE/7qsy3b4pLmreCnw+cSh4eTztE27Ehvim4tKe44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654760; c=relaxed/simple;
	bh=UjONg0NYj4XKMunIFJbINoDK3VSOgIFWYIBOvuNak5g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mBA2qwyNEkFKxFcb605uuNlVCLz0vHy/lBJp51bWLdmta0m4+9KXIo+M063y3FuJt4vnAX3hY2ZNQG/8SKlqdxIh25Xdchw5UaUbDpSmHeMnpgbmO3pxyqYsIOqlIiMLokQRonFctTYWYRsOdwyhWkKqI7Hhshdm5FvJCV4vdzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoTPCZNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ey9U8ra7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoTPCZNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ey9U8ra7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655AADgB2975373
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 10:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YdRn4DRbFufW0fmv7Xxdna
	0Xs07PVl1QBs1/OWzN90w=; b=CoTPCZNXVLY22xU7IlGWff9+nkN8NSABuqQK7T
	yhjH5HRfRUAC2nU5amDTJOTJ8/X0cepcrQnVE6naN3qswU2gy/9MW/sYS6sFkSNb
	k+mEyavpP9eznk+hA/3jVTMMVFf4IBPR4rqLBxNSPDXMVNqPVwN8RCWZP6U2KrBQ
	DWzeRwu8FgdX+upf4gWBXo4U4zcUj3+6MlD+oA+ZYF4aODv3rf4HV1ljjnVPMLDf
	danFRBdDSE19VvaI3aKe/oX/+Dfr0AiFbR82LXwJVcC8N4X5AMj3I8m5Yrfwgjhz
	Ejehl2Yxz9mHIaMac+1UCzRDut8xVTBdP2BbEidMeb4R3x2A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnu9fc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 10:19:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0b35fa876so20541625ad.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 03:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654756; x=1781259556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdRn4DRbFufW0fmv7Xxdna0Xs07PVl1QBs1/OWzN90w=;
        b=ey9U8ra7sWfiTWZ7z0C/NJc2YafnC3Sb5hdEGYL5J/VhzDP5M8+T3lRZbADEVlvCv5
         mXecLIf1SaMTNPUtfq/dMSk9nO0ZWRjFxET8cl6VPvftIOEwKs9SdtMiTQQ5223j0ESS
         veRWjOo8XoQy5L8dBTkts2petY4wLnvmblVRLRv/yyKelz17CRv3SojUrK3w76gdrd2J
         w/8yCs1CufJcTDQQzEwYAuu4NWAfbV7vV0FIsLgU97Hj09zqAR9W35OYVjyVmohTC6lJ
         g72cHn7tNxl+ReJI7OFq/BAMeYz8B8NWOV05UoWUfDqyiawvVuJyQmNRZj7pLJo0/i98
         kSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654756; x=1781259556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdRn4DRbFufW0fmv7Xxdna0Xs07PVl1QBs1/OWzN90w=;
        b=cvi3eZ2W+GwqUVRA8o0z586vDLysUjfVY7BAw0B6NNQPzeMnqN8luvaFJZSc6Lativ
         xo+AOF44zceyUhV7MDoQToHD9AmGf4Xb4k5cMvytEKQ/XJzPtub6cr6J0EvkP91k6j36
         L2rg93VtG2tWhmON0aHW0ti+bXXR5EhqWW03jLm2xgo+6IWMn9DXLJYjbBKwUnjpAwOh
         ur5XhgQ05h42uSP31SVaFWYixjB3v/RdzWqAzDNiofYSyBMDzahI0IFWa9Wj75mYUDjT
         QEoM2SzGtBllzKK3w4SZzihYeA0CCiJoJEFPmkSMBfgRGSKaIXX8sRmrw3tJ8ugKkkXw
         mmRw==
X-Forwarded-Encrypted: i=1; AFNElJ9eadcYPDZq8H21RzQyjM/8CstozTi0FiwSCGO1TYB9nDozZe5IlO5+TFNC282fsOR+FFcXqbRw95xC@vger.kernel.org
X-Gm-Message-State: AOJu0YxNF+ZiYzIHf8jjkUDytDQ4kh8wtiATyWDH3u8HEFU1V46z0AEc
	UbNRdxK37sSsXQu/abKundM8E1XFqWqYn4m6FF2fsjnnVua7vH6pabFlSdCM/p39P+nZVv7nk0P
	jKPvNQ43Nr3MZbRBwPKjP0VfxVXBLZvOjY1izby4FXm4gVWdQpZiraQnWwrxtVdqJ
X-Gm-Gg: Acq92OEKzp70V7ChHSJs04vaaNmwPOneSvlHGABvt6E094eT7HAPB322jwU9LZuqwkn
	ftaeDz4TmOVYtmTtxd17tmNIMnC5CgGISPuJuxlJ6L1whGHJaacZUF2ucN89XH9fYlFVICunnMC
	qxirc7mAOiYJa1suA/e18hP3LGIDV+dnLcprn/hITJM4T0GzQgZCI+Sso27jyPPiHqNMLgRnic8
	2ndRpLExyOrT8y5GfifhPUFNuX1vYEi2ugSu88gc9EU5hr8OzGivrV2DSUndBgqLnwysRT6xMXh
	BO5/2+tDgsdO5vcKdKgbQYRvKu4YGes8j6PaX44iHdNWRZsgPGLeN6FZD1wE0rpSM9NmeBZ8PuK
	lJIudUk8geadLVtBHroGSN7BCMFhyjjHyVRs8+LoBX+bhrZygNipTn8asp6w=
X-Received: by 2002:a17:902:d58f:b0:2bf:195d:21d2 with SMTP id d9443c01a7336-2c1e7e44e91mr31358865ad.16.1780654755826;
        Fri, 05 Jun 2026 03:19:15 -0700 (PDT)
X-Received: by 2002:a17:902:d58f:b0:2bf:195d:21d2 with SMTP id d9443c01a7336-2c1e7e44e91mr31358275ad.16.1780654755335;
        Fri, 05 Jun 2026 03:19:15 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:14 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add Shikra (QCM2390) display support
Date: Fri, 05 Jun 2026 15:48:50 +0530
Message-Id: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIqiImoC/3XNQQ6CMBAF0KuQri0phVBx5T2Mi2kpUkWKHWgkh
 Lvb4sZE3Uzykz/vLwS1MxrJIVmI096gsX0I+S4hqoX+oqmpQyac8ZKVLKfYmpsDWhscOpgpE6I
 UnO0bqBgJT4PTjXlu4On8zjjJq1ZjVGKjNThaN2+LPou9v7jPKKOgQWWyKhoAcbSI6WOCTtn7P
 Q2HxA3PP5XiS+FBkXlAuCyFrtUPZV3XF6jbTxkLAQAA
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
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=3346;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=UjONg0NYj4XKMunIFJbINoDK3VSOgIFWYIBOvuNak5g=;
 b=NYZsTfhD6L1pZkrKqjY12HiGTIOPAad7elMOIEmgc5l650WfUBoPQwTaiYI4OYgsjDKjhuKBL
 jCLt2KM/JUJAy+tdw3EdLXgPUp6qTh8OMonqEGpoxLFIK4lrDHSxFSQ
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: LELGQKRzvwHCS1Wxd80Q4vDrqFFOYx3H
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a22a2a4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_or6NCU1o4AAqT2-bvQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfX7GK/KieeO1DT
 AjXd1kugfSg/X391Bz+7sbHh2H7emqCv0Ud9Q19wy+X58S8N6K2lXuEeKGQWbl5Dvh/CyqszeR8
 Zy3cD+Xr41pBOzBtsNx/0wQKVObOmVK0ZGUw/HB95bBe8oXuk3L05Ns9BMpHcoj8zqCvHblba6o
 rblL8HRIviRelOskrlSsIe83w1c5Pil+buoZeuO1xAnHBIsokX79misoA5540WxhdvPsQ0FfKdS
 gbPuC7Wt5+sUZL4GdXyCBocp1o0CvP59pFiWl9Hv1LLjUUIMBlPI+p8RdjM2NW0XqIB0/HDD978
 x1oWhSM3JNKFPkIi4UI5Hu5i+FghJnvDun52YfzQaFjiQQhhyeHIdvcsK2J/SFsfWXiE2f0uIsB
 nS27za5ULzIPrjNQWARzVsKambJ/OahD6y3wFmvHgq3HVDmHwlwGBuJNOOGkJkuOsjRsStFXvAk
 /dHqJM14QVpYZl2yCUQ==
X-Proofpoint-ORIG-GUID: LELGQKRzvwHCS1Wxd80Q4vDrqFFOYx3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050099

Shikra (QCM2390) is a Qualcomm SoC based on the QCM2290 family that
reuses the same MDSS/DPU 6.5 hardware as QCM2290. This series enables
the display subsystem for Shikra by adding DT binding updates for MDSS,
DSI controller and DPU, arm64 defconfig enablement for the ILI7807S DSI
panel, and UBWC configuration mapping Shikra to qcm2290_data.

Driver and SMMU support are covered by the existing qcom,qcm2290-mdss
fallback compatible string — no separate drm/msm or IOMMU patches are
required.

Tested on Shikra CQM EVK board with ILI7807S DSI panel. Display
pipeline probes cleanly and panel renders correctly.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Nabige Aala (3):
  dt-bindings: display: msm: qcm2290: Add Shikra MDSS
  arm64: defconfig: Enable ILI7807S DSI panel driver
  soc: qcom: ubwc: Add Shikra UBWC config 

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml 	| 4 ++++
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  7 +++++--
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 22 +++++++++++++++-------
 arch/arm64/configs/defconfig							|  1 +
 drivers/soc/qcom/ubwc_config.c							|  1 +
 5 files changed, 26 insertions(+), 9 deletions(-)
 ---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Changes in v3:
- Use a fallback compatible chain for qcom,shikra-dsi-ctrl
  in dsi-controller-main.yaml instead of a standalone enum entry, with
  qcom,qcm2290-dsi-ctrl and qcom,mdss-dsi-ctrl as fallbacks
- Replace oneOf in qcm2290-mdss patternProperties DSI compatible with
  contains: qcom,qcm2290-dsi-ctrl to avoid duplicating full chain
  validation already handled by dsi-controller-main.yaml
- Drop unnecessary select: block from qcom,qcm2290-mdss.yaml; default
  dt-validate compatible matching is sufficient
- Remove self from qcom,qcm2290-mdss.yaml maintainers list
- Link to v2: https://patch.msgid.link/20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com

Changes in v2:
- Drop drm/msm/mdss: Shikra support patch; driver reuse is handled via
  the qcom,qcm2290-mdss fallback compatible string (per Dmitry's review)
- Drop iommu/arm-smmu: Shikra SMMU client table patch; not required with
  fallback compatible approach
- Fix UBWC config to map qcom,shikra to qcm2290_data instead of
  no_ubwc_data; Shikra shares UBWC support with QCM2290
- Refactor series from 5 patches to 3 patches
- Link to v1: https://patch.msgid.link/20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com

---
Nabige Aala (3):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS
      arm64: defconfig: Enable ILI7807S DSI panel driver
      soc: qcom: ubwc: Add Shikra UBWC config

 .../bindings/display/msm/dsi-controller-main.yaml  |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 +++++--
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 22 +++++++++++++++-------
 arch/arm64/configs/defconfig                       |  1 +
 drivers/soc/qcom/ubwc_config.c                     |  1 +
 5 files changed, 26 insertions(+), 9 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

