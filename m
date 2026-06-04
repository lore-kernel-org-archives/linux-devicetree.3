Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA064657C2
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576280; cv=none; b=CswGWf7ZbhuVGRmqyOGo3NiSxichyLi1p6pbTcNlxYIU8L+3Kz9N4Lu/rRuCCNypoPmG9w1YiyW4Pb3DwCN7ziyNF+/ztqdeRRlfm/nmV/7B37N1wva+Z07hUashGazgxE1zcFfSoWzzXApNabY+xfH1gyo3TgywiZAKQZ0ar54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576280; c=relaxed/simple;
	bh=BzGjWMm7NOWQTFGGfvZVv4acRcjMzGDbIyUMsF+f/Sc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V4nSEsLDlHKON62Gu6JRXtkVqscIsfSYtGdp2hK/W652yerIx8GIxOz/GSOUKF47Ru6AQiO76CKkV/fmDndXVa7tUxKE2nsEbN3g1QC4xK9HIGfa+hPCXzC2nY5inr341QubIxES8lyeI82KkVQMzNwp4BqMSLcNIufy4G7hDNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3NI3kj4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M6ZyDX6p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3NI3kj4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M6ZyDX6p"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548Uia91132984
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 12:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oVCtfvOAMMbqkNqCa+q9Cb
	6hDsShNb4EGCU/ePnP6H0=; b=H3NI3kj4ZuurxfJZVm++bRwxL3cJBUp3YZlXUY
	MwZqAuxKRSoKNb7pTolPXWLrEWW/mewM5klj2kkr0E4YieQ7DnsM15srCgkkAVHl
	T/6sm/yKEJZmxZ9QfqkB+Fs1zLKE8yVOYPR+Hs9pvkW4D6xJ2kp0qHU0eSP5P2tQ
	T/WBDbfO71UaczluEjEdzQC30KtAKRwwrLv5FvS2XakzUKvTtB4uRzgX1SpjESqS
	mHXEmjxcXdZBkAPtMO3XKa/yHOT2xyE9L/2rP9HUdBT0/6jV5x0ztjhY16t1GkWs
	4peHABjNr9tIVkG9kF32L/BNUOk8/yqOkNIScjj0ZhqJMQrg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsgw4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 12:31:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8582b167f7so422446a12.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576272; x=1781181072; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVCtfvOAMMbqkNqCa+q9Cb6hDsShNb4EGCU/ePnP6H0=;
        b=M6ZyDX6p2sk16eS8ktoJItCHttLDInPfo9enkV0mw7FXiTGM3qpJYh2gDq+fZLKB3h
         8ImcywnxwRrvO4mc1XJZLuznjUilqRwNMd7QGKlITJTLY7SBPTXvLrOARINjrDw1QadN
         mTRO011ml2T2lMX56k9HweIMn9dER7RX82u4OM8lecdzjkm8nUVvrIib+XnCXr/WAs1K
         H9GZSO4GZ5UT2Ou6K2eFSWeZcbgq7GvH7zxqAcLBl4/xJHXmVV1cyauewluimqciQtGM
         bOKvPeMuG7rPxZ9+BvKP4MZqb9n37sxvZIwe2+ai/QeH6MCWlD/oPWsWmvksSulQk6m9
         9y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576272; x=1781181072;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVCtfvOAMMbqkNqCa+q9Cb6hDsShNb4EGCU/ePnP6H0=;
        b=cZMjrVhYHiAVXeAJur7N1X7kCqrq75qTKlS2nubrjmNzw+xYHJrDqfhKzQP5EpVvcg
         +bIiHgK5YwlrKBvBhS7liEVeEVjK/drPOdlXdO6n09sjoYTAN4qTJa89GzUKm1Al8Uyn
         M2aVBFo/PnQxDy/y7Wi/2+ilr0KrchhkordFeHMaFFhY83LC+4BGKxnOfUYejfkwXzT4
         HKsHlb/HOxDEHj9QuNzaGd7mLDe2Zvn3TIMtVGkwMVQKhkWxkVHk/oUBhoaSVi6GwrtG
         aVUEcGxSh4UwW2hz+/JnQvh7bPOZx0oEDv2zUP06sEuZCSj9EE+jp8bkqzVniU6S0R58
         IxYA==
X-Forwarded-Encrypted: i=1; AFNElJ8SF/HfciI4k4ptcq2oswlga9v1lOqrjlbFgQ+M7ofll7jqn4uZx8iM7SI9kTyany0AZvywUvQ3U+/a@vger.kernel.org
X-Gm-Message-State: AOJu0Yza3+YvJfWvNBl2n844KKHpH0WZMF/IeibpBvk3YVRSt3dE0BqU
	uv9waAdk3iV0737vx+z/rVD+0FTdHcL2bJu/jUlmApmOlhbPQKWH7OEtcVolZHNxoQlHdED6y6U
	QNgKeXf/uF665kUZumIYFkl+qk2p80FFrgMAnUn9XsFF1GEqGF2t137OmFtB1iZWO
X-Gm-Gg: Acq92OFKra8M/lMQDtFxfoJd7hcTbx6BKqtlfVJOd7mwYnDG4gHDxxy2l4dWY83flUb
	1dc9ROtK+I+5fKv2XPQb1+VQ9q67XpYr6yJwflzf06YQbkt8ahElSHRdzXz+sMMEJNsNy8ofNmE
	PhCbgs6qIEZm1Ns/4vzQe3zjpIphoFfTUljQ4w9P41OaEVqgRDkaERrB7YHwTxndYPRiV0d9B2r
	/5Ob/8e4ijv1nqkzqWrSh6tRkMgQnvU0wkCieENR+ZD6YZ2jJIMnRZmJfn6RX61wevsO/w5u83u
	ciUah4wbyMsiN3/U28w2sdBO60wh3vNao4EzaRsPZLHUY0CQZJEbMMu5cKoiQ0F/CijSXtZ3Wg9
	LgCl6Qe5jHt2nyR/Xs6LU0hMri7aSsdxcMy80XIYJDD6tJvEuLkuZoNUzbJY=
X-Received: by 2002:a05:6a00:368e:b0:841:dc85:1638 with SMTP id d2e1a72fcca58-84284f53d31mr7173809b3a.42.1780576272425;
        Thu, 04 Jun 2026 05:31:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:368e:b0:841:dc85:1638 with SMTP id d2e1a72fcca58-84284f53d31mr7173753b3a.42.1780576271868;
        Thu, 04 Jun 2026 05:31:11 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Subject: [PATCH 0/3] Add Shikra (QCM2390) display
 support
Date: Thu, 04 Jun 2026 18:00:46 +0530
Message-Id: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPZvIWoC/3WNwQ6CMBBEf4X0bMlSDRVP/IfhsJQiq0CxC0RC+
 HcLnr1M8pKZN6tg68myuEWr8HYmJtcHUKdImAb7h5VUBRYKVAopnCU39PIoK+KhxUWC1qlWcK0
 xAxFGg7c1fQ7hvfgxT+XTmnG37I2GeHR+OR7nZO/9lc+JBIkWTVJmlxpR5445fk/YGtd1cQhRb
 Nv2BfxvrkzFAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=2713;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=BzGjWMm7NOWQTFGGfvZVv4acRcjMzGDbIyUMsF+f/Sc=;
 b=DMPp/3/P7p0mXsQD7I5mVa3XnUwoOu1FC9g/lOw0Oil7tXRLfw36d3FtC9Vm0lebimbzZc3mx
 2nZUxp3Ljv9ArLU9lP93ovjQqDjl059xpYQ4hTofSNFsZeINsNo4k+V
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: lCY7fMNvehrSwNphr2UWnDahpO4Kh1ks
X-Proofpoint-ORIG-GUID: lCY7fMNvehrSwNphr2UWnDahpO4Kh1ks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMSBTYWx0ZWRfX82a59BwiwaE0
 7uRJaIf21uf96u67/jQrP4BXIrT8IdU15S/NaRDBNfIv/e/AaaNChrSVuxUEYKtvfaOvlsd3m5m
 pC8l1tK1+saeZIlF4YvB2K9/nV973C8FME05iGULZxt/L7xRH6KCjuvH5ee8CXIKZJaEyOuMVXL
 HK8RHDaeA5DJUuGDifujObajFmbOY35NwyjLCHJVsWoPR5s4M8MnTRWiS8kpzKnAH2FrgjPVzIk
 67m2oQuy6sKES6CnEM4NNlVG/uJnJLM67RU8bbcFig3uww83mJ1yqBfwXrZl4qzH7ofWKRaBBz2
 ICKuYJVaSRaLaOkQ20F+fO7hnEBKxbLDiqZdbyBtfQdkPHQ6SdzeBF3NUPS4Gaow0PNRD9BzNc+
 RFT7tLPe20Pbhwn2n45caC1RlXFvcsIF1ovWHpHbS1jkGMi9N/uuioiSEsCjza0dgAh57otDNSB
 CKiDqGhy6YrhawVoRrw==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a217011 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=3zM2i4eYArf5VB82j9MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040121

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

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml		|  1 +
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  4 +++-
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 34 +++++++++++++++++++++++++++-------
 arch/arm64/configs/defconfig							|  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c					|  1 +
 drivers/soc/qcom/ubwc_config.c							|  1 +
 5 files changed, 33 insertions(+), 8 deletions(-)
---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
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

 .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 ++--
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 38 ++++++++++++++++++----
 arch/arm64/configs/defconfig                       |  1 +
 drivers/soc/qcom/ubwc_config.c                     |  1 +
 5 files changed, 39 insertions(+), 9 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

