Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDF615746F
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886634; cv=none; b=DkByd5wMtbdrv8EDuMwDgpmTjj7vgxToRoAZSkDEvzKkyUZVmXDx8JdFP0ofKz3PbGafu65FYG0IdyK7nFumXoLyp4t9TZYopzDzoXz4DnJefU/7ELbAZTd6r9+vOLPY+pOAL6E8h5loH4YgSm7bX5fGKQ29cUcxZdBuDpuW6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886634; c=relaxed/simple;
	bh=YP+18ZtwjtU3nUHwx+tBGgStmo1pSIBVMNOd8oxFD+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fr1NGBI0oPDoKGjq8DO84SVghsKgwJ123j43SbZZ8jFXsdt8XRUBbK/xdiJZn12cDRg6fdP0GlUuJp+8aCO54W9i9eEBgZZjAk322W+l147gV3wa+fMQfiinY+Psg8+unKx9lj5Y0BcnRrmE1omeGcOVM4F6C60o6CpD2EIdZp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QikgHeQH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bp6eRoNV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QikgHeQH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bp6eRoNV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8RmnW302871
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Iyghy8MFwYNuGQDyF9Cj/p
	HPGN/MU2WtXwUAR2dYSmc=; b=QikgHeQHbc3tpD0I1eJEHI6jgE680Fty8o73dP
	pSqipWE74RRKYLhGr99uOKiS2zpUS+Ydr7t9oClXyHGQ/wgNkUXkHan2eK39ZEEb
	4MvW1mKBUW2q3ki9GsVEMu3uLA8a9ffVBSqcVvkjICBTPWTyHWzpK/3XpgEdda2F
	xq+EcpiXBv+8Q6/UO1vy9IvEFBMJfIc5wzzXUY8Rn/UT2jCdnCTsKj3lfJU7w5Sv
	FWnWPAkBDmPawYww+3wmEg/xIQQ5YMyJiQk5aNWQMGdtx/Df+K3M0f30fYpzbGnK
	sCrGz/yePcqVMZG/OmpDhw0BXzMW92NjSvYchicDKjBvX1cA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqab2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:17:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so3236883a91.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886631; x=1792491431; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iyghy8MFwYNuGQDyF9Cj/pHPGN/MU2WtXwUAR2dYSmc=;
        b=Bp6eRoNV3UejleBdBd57nH5paTlWeW8KnGSb4eSYSvMMqpxK8H5XI7YhsFRVFZ+K+w
         6Yb7Nr1nezeujS4bNcR7S9RGqsYvgsnOyEViGJQnQXo55VWyjsTPJotUFq1DaZbcs70Z
         a0ilBZUa5zNEMMdvPYTwxIOTz3Kfbgis36GHeetBob71bmv/Rq5z12UWNhs3X/LQ2TRn
         DPA9yJz3eYD8U6KwO8C5XvA44F3LY09dGrmLrmqHDXRqz17bVzCI750oERRw7X0fUYIo
         ouxxeGtb2o7g/ou9NnJuV8CEp0SMlJFbTqjFa+fe1rPdEChQ2lY+V9Dzz4ZLTcE8PXaF
         2Z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886631; x=1792491431;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iyghy8MFwYNuGQDyF9Cj/pHPGN/MU2WtXwUAR2dYSmc=;
        b=NosdVsZ8LOmRhYfCnxDyOwx6CQygtMZ7i7ey0OA52/JP3MSCIWC9rhgw5iPcyBbFhH
         2NwC4FMFwZ1HBJLh/JQ5M984kStA19F76ar/LxVFNAZ5ITDiHVxdv5+dlmTO4Vk4itjA
         mK6nPWTU/RgftT9cX8aewiQ05nbekISS/VZDhFCmR6Li/4lnof+Kqboh5HR8+0sUPU+8
         3PUh2pAIYajP3Ew/pGCbFgT6AtPnopR7wc3B00zZsOpZQsKHfCWUWDr6fKBcUIhwDFVw
         xz6m5jJM0NJxKndXFiYfiyAtyHtuZf69/jk+lMYSFOckLEDMqLktKMlG5Bqfato+gINz
         jiiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI5Eng8vOKAZ97VFn+wGRFiFRSQxSokTNiQwo8CZoTvLQmLYKfc0Z2bD4LdZS8nANZGUEi0rK5tJ44@vger.kernel.org
X-Gm-Message-State: AFq9FYJxTH9taqzJXnH4LQcZIMIYew5w0pWn0uqr1wx92jZgYeI2KZ02
	5ieuoMPs+zL4diEavEa2VqBbggjZhBV61cHdpI9hyDgb/WGMNrBjAYeO3Qgb8NAeZUSO1YRXbYl
	MawBvhXgI10PvVrd5WRjq3AoSPE/8gDQqtpaLlb5g+BzQX5J7Eby0BUjx3vouYHPk
X-Gm-Gg: AYBFou1Whrxs8WEjAKE/BZLRreRW3rJPHJE1ExiyFitjdSl7wGS5pG2x9w0OXCDVoZt
	RWGtKx6A9+cWiz81O0YqHTd1NPzuGGlilnxHDWkIfy/Qh0K+LK9tx+metC9Opl31ktcSjAq0lld
	Gc+kuBNPXc98eAeYEz2OFVamz6Bz6Qs5dTkQobnCeKFtQehNvLwu86Fmc45CNYq9peUNY32brOa
	GBlY6KHI5jpBKHO9lOGWoWo2HjZxo80AwjJUbgxG7F5pqhDfI1UXkFztksQzNor5XeMtpAeErIo
	NHphyxrkIFTnLSDbyx6Qk04NDykw36AW90z1A8e/iVvEy4dLI6+Kx7RL7HOFGiNm1pI40C2n5bR
	agD42DQtsYzYSzSbT3xGMWNsbo2SRHuBA0GRlHpy/FgVuSNY=
X-Received: by 2002:a17:90b:35d0:b0:3ac:450a:fa46 with SMTP id 98e67ed59e1d1-3ac450b7738mr1018305a91.10.1791886631074;
        Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:3ac:450a:fa46 with SMTP id 98e67ed59e1d1-3ac450b7738mr1018281a91.10.1791886630551;
        Tue, 13 Oct 2026 03:17:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:09 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply support
 for Glymur
Date: Tue, 13 Oct 2026 03:16:44 -0700
Message-Id: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAwFzmoC/yXMyw5AMBCF4VeRWWvS1i3xKiKiTBmLkhYh4t0Nl
 l9Ozn9BQE8YoIwu8LhToNkxkjiCbmzdgIJ6NmipcyWVEst4Nh7tgK5ha6GkLXJrZJb2CPxaeKT
 jK1b177CZCbv1zcB9Px6p+5JzAAAA
X-Change-ID: 20261011-phy_refgen_1012-10f76fb054de
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=1971;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=YP+18ZtwjtU3nUHwx+tBGgStmo1pSIBVMNOd8oxFD+s=;
 b=6frf+yFXAaqyaPmdIMAnDHUDfI1y1k+enC6eYkVgkgwXK+bAtirq4hJ2csHaAqmIn+syIomZF
 29mOtBxSC7pAmRLvlxvB1iL5wicGJueQVPw9Dj+sFldDwnqxrF2p8l5
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXwrJW6YFYzL5n
 o05ZN0lMkKel3TibgnmqOMCP/eh7vtAggXbWll7dxK9LH085QWSccWTvFsCrisFnjWK0M6hiZjE
 K0gXnxllP9PWPuFd8MKtMe6ksYbZT9ynRx2bc9y0WS5dvfuAICc2DNrvU2phRXgkbd9u6TKiQ5H
 siCm667qSeZ28ld1MlJJyI8amGAcHpahY/w4lyICzMRq6st10ROIaPaINDS/wVoAcAEPmRvvDke
 lfvaAfp1rZgLMZAMTljMqnC/byjMpzQYLXJCXPZo9DS+wJkXv5edAwsYeuOoAFQw7VnYJuBN4oa
 UzaMQ2rQGqsAGQAaylu779ipXT4HxKf/HwfqDTdxdjvkGFQO/YA0eHXZjo1PYo9l+whkDqVGIDL
 aylJCJsJq06HI/6adPmAHwrXcSESBxSCU0ZUuetV8woBlWj4bdjAxVGj7xkNR/omF/SN1e+2K7O
 vbPBXUc2QxXnSnlLfEA==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace0528 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IXTrTkLk_8iMRye1LOkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX46GK0AlUS0K8
 lNR5Ftz9tV0LoWs7i/ZXp+/xbVvXFFuD5f+UJ/CHfwJYpKAskBBAR4rA0IpdT82/KTQwokAJD69
 7RoY0L7FFpX6qNxneEg4GptWo85Byys=
X-Proofpoint-ORIG-GUID: szCf3TjOThalFMEhtLl8DmlOOaXRdQH9
X-Proofpoint-GUID: szCf3TjOThalFMEhtLl8DmlOOaXRdQH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

he PCIe QMP PHYs on Glymur require both refgen for stable reference
voltage and qref for stable reference clock. The refgen requires two power
supplies: vdda-refgen0p9 and vdda-refgen1p2.

This series creates a Glymur-specific supply list including the refgen
supplies and updates both Gen5x4 and Gen4x2 configurations to use it.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Changes in v3:
- Add vdda-refgen-* porperty in all glymur and mahua board.dts.
- Reword commit msg.
- Link to v2: https://lore.kernel.org/all/20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com/

Changes in v2:
- Add dts patch in this series.
- Reword commit msg of dtbinding patch.
- Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/

---
Qiang Yu (3):
      dt-bindings: phy: sc8280xp-qmp-pcie: Add vdda-refgen supply for Glymur
      phy: qcom: qmp-pcie: Add vdda-refgen supplies for Glymur
      arm64: dts: qcom: Add refgen supplies for PCIe PHY on Glymur and Mahua boards

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 .../boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts   |  2 ++
 .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                 |  6 ++++++
 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   |  6 ++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dts                  |  6 ++++++
 arch/arm64/boot/dts/qcom/mahua-crd.dts                   |  2 ++
 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     |  6 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c                 | 12 ++++++++----
 10 files changed, 60 insertions(+), 4 deletions(-)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261011-phy_refgen_1012-10f76fb054de

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

