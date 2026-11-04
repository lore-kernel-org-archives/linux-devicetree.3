Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783291;
	b=Jr+4onVYFiYfd9phATC+FzvD4jyMk747rjm/dRWLjpc67qWAJ2tbXulZ+nYyYWLbSL0X
	 A0CQ+U6Beji58TG3VH6WSX/VMDD6sMvOL9Cy21jwyd1fReLjb7NZwYechT7H4p7gV7PVC
	 +o3JH+W6ZshbaCM/iwVKUTOaDZyv0XFS9y4oYneRC8nkgGboIsnzbsOn2mxjdIThaKTzU
	 of1ywy+EGF62UbX8/RNlMWTMRh8QQd9Fu8eLsX6WlOjCewwnqz9pSL1lx2U7Gs223kOq3
	 x4A5oyf7kTttXnXk3T2noldf0qBlwB4YysKX7mCdmPHuQdwjbq4LGkEocOsU0xvn8sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dIHAyqbJuJM8xf+TtEAHAZ7qkX+1IxTcwMBz+ggyJ94=;
	b=pBySdMuBResaYCuaLixlEMHDHqqPZjw0Sghyvu/0p0TWNWTZs+XR5IgcN8Ht2REUhd1q
	 S80JfLmJ1sAxWggnSf+L5A52/G1fCh6q7tCC92HhcHM7/8kIQF8fSDHNy1T8A+kwrvyAn
	 uBpSFMK8MLB4NZ9fmoUA7jecaZKSHltNuEnB5XECcbW161X0FmkLbNFNv4Xn1GiVKk5x3
	 sk9Mwtl9i2wGJkgbajBCXVIhU7AVcWvxiIgOsedpARIkHRBV1aE3ky5Y2nEsP5C52l5y+
	 HpE0peVSvoOro+7abLkmzaDQWqUeBJ98y192WnxH1ZEUnrl0V9mbUTKxIIzcd+NwIuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Szh/pzCY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fcz6pRVx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22408606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22408606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Szh/pzCY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fcz6pRVx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Kevi1849223
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 09:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dIHAyqbJuJM8xf+TtEAHAZ
	7qkX+1IxTcwMBz+ggyJ94=; b=Szh/pzCYqzI6TkPPX1DEi95U9EljTdBKKGbPKD
	SZwVsRTYslQaY5FRA3++Q/5jBvlXwq4HVUyPgXNdOyawhAJKMQX2D/fr9sCJ5bt4
	42UxcLLwHovmFRnVwotdSEQBAlV7i/W7Cic0VtNb8CDeQckMtI2MrMnjmYrL+FQS
	ByD/LFljdEgC1Y/tI9IqEDvm0sV9FQroxFPWkj+AeyoSYHVEyP7JmQmKMzcfVW4j
	w+3BNhiLhKRzcD/cWI7NXkNd+NSl5OVts31ajapLoVjccuvX2xQ97t8MmKvq7zEd
	52DytzliDoojXSimvM4Hd0tMhxR6mqOIwgv0srUJHALWQlZA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpbmu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 09:08:08 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-85d502ea62cso624149a34.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783288; x=1794388088; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dIHAyqbJuJM8xf+TtEAHAZ7qkX+1IxTcwMBz+ggyJ94=;
        b=fcz6pRVxiJbAvaEvgiI6WqJWnG8lD/icvPlCfp1ku1kmtaKHupqfe+ALFqj3nTVg9E
         Js6k7muBljKmPc7Sau3qiIvXvFIy1C7n9DizjpMwaKcgomyEdW4qc/eKqLT2BRzFn0HH
         iecAG4I9x4KZ/hy8s8I+imu7SAuf+eSPaU2CX6x0NxjANlUg/pYp++5hw5VXC7YSycMS
         Z2Zu5RU+RmFMHTJ2zvndgPRQtRiWf3nTo9cxDmYJmKXFLFOeYFdIIn4UWQpKf3xYUI8B
         uVxAru+SBlDLT1FUty6TsLaz8CpOj3NMBGDiCELVpmXpVNytcFnSzbNuBDoK85a7ZxTR
         sSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783288; x=1794388088;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dIHAyqbJuJM8xf+TtEAHAZ7qkX+1IxTcwMBz+ggyJ94=;
        b=dZwfniatO/BrjwnFbjHtwcqzf+VE23knf83eMLfqhPMDVbv0fa2esFQvVRdG/S1ECr
         w1RGUazN4KSZ3Pyz5rzHgCcRCAScO425MyO23ZTnkIdERw5BS0kc0aNtARn4mUcu/ddb
         lX0KeetdpooUfpbY0dAFVxXXkCxsz5uH1oLU1AIRuDHDfsczbm7R5lZAkt2mkIn1c0V2
         R91k6/J9UQ1kXG/VjeVTKrulcBvq+aQFvKUq78wOQ4xDQrOfyxN3RNQtW4gajo4L+kW6
         +UEi6/NZX1z5adJePlYDrnSlcVrj1X+PuZ8JOgc1fOWTfBVP1CG6OxIiZfhL34/k2KQp
         0J7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxkVtCjaZY6ygaFFNCdQgIFxWipEIaX4o+L/UdwPaIPM4ka2/Gk/0LpI8J97WJDQB++XOMtQGiwhh7n@vger.kernel.org
X-Gm-Message-State: APuU4Z+2u1yiLuDoPCrYP24sIvQYb5LkXvPUK1d1LIgNDhFpDSY35aoT
	wKblpDdzolH/hCrCd6gm96U0HEcVbjJ/tvcUq9kMWtFuAkharzGSjSQPo2mcyQFjnUew2CKNuKq
	QQ1jgaXW3D0/k5nr83y5z4R0A6rEHMHwuldIwKhvv4A2SvACnZUHaiZk71YQ+3j8Q
X-Gm-Gg: AYBFou1HnPZBo+6zy8Wt6oFWv6cRulIgzfP0KPY5dw9NOrIZ6r4iXvk6zgarXSkD+9Z
	XsECLfWPVH7mFwQHyUQxXdEN2uRHlW1CJyiKXVl6MGTm4obtpSkzbxFwTKDpOWH9k1gKYXML18i
	7rAUSifyfnIlKd/rOpqMWN6nvEseIRGOpaWsh5HOw4eAXU2tH+fEx/Ec7eeo1Eh2G3oLAa1SqS8
	o/rM3dRBLKS/xWfjRjaDILHxuCXvbOsfh0otMAl1YSA2DlHPW2GKYA4r/MWHRoLFff7rFiPxWak
	OL8/6jJWusDd/MeBMICTlOzaPsGq8UuYayY9H9GOu50kwhbLxQO+pYhf8Bw8GODs3s6orrkGQPL
	iZQV2WEt8XZ95UYRHWeIrzh6shlJmzKO5T55f8ikdj1NFA51WmzUrBz4KUU2GLMgoaZaGCVZUPu
	KQPg0ovL9FpPPAtOZXS1E=
X-Received: by 2002:a05:6830:6512:b0:857:52f3:a5fa with SMTP id 46e09a7af769-85d361162aamr12702437a34.2.1793783288352;
        Wed, 04 Nov 2026 01:08:08 -0800 (PST)
X-Received: by 2002:a05:6830:6512:b0:857:52f3:a5fa with SMTP id 46e09a7af769-85d361162aamr12702403a34.2.1793783287669;
        Wed, 04 Nov 2026 01:08:07 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:07 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply support
 for Glymur
Date: Wed, 04 Nov 2026 01:07:59 -0800
Message-Id: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/16moC/yXMyw5AMBCF4VeRWWui1bi9iogog7EoaREi3t1g+
 eXk/Bd4dIQeiuAChzt5mi1DhwG0Y2MHFNSxQUUqkTKKxTKeDvsBbc3UQhrdKMxNmssM+LTwSMc
 XLKvffjMTtutbgft+AFq/88ByAAAA
X-Change-ID: 20261103-phyrefgen_1104-1b4a2e9b7918
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=2118;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=k51MqTDW41CB3iyARbpzUvcgecZ+3Ncq5B/uspwZ0zg=;
 b=/Uf3U/8snPQDj1QVx/LHnLiITObnl/oE/Kcv9acMok7n79ZjF6k7AQ6qY2vodmPIUFkyp73JS
 3EVNn1M93wxD89fGAl1W86kDs8dxMACqJRG2THI13Z3M+L5OhNRgs9r
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX0ppZIa220ttv
 m5tH41qRjgQ3TYJMTKNdC0V7aq6MUsm1jPCLMjbWFJnuttFDTrK9rNkwvM3UQd9KFCxmgLfx9pt
 WZO8xX8H6BmzPTUVvi+4uCYaZ08dsUjvfePcZwHcyA0luOYtyvxmLfcZ8GvhxHtQ1rOBdYl6dHj
 wW2ROBx0+zZMnd/4Tl+ttEhqXTCIlm8rw1zA0MY7cCUDlteqYboqv70n5VJveigxHVJRJnH7tIV
 oXBHyrtrcSM7YZtOrH4U4wkvuOGe3poI/NAppJsX/UO15cfmy0oRstcbk296DUNSfqulCa1GY+T
 go6TAHq/v6/NHr3dxH9EQTjSvs9q7qmZjWDyyGPaHT5roImJ0xracShzUrDvICBI5boBCJ3gwBm
 TEq66NSyroO899xC1YJFtTiU56d7nSV4iLHJnrZiz/wShRgsYx+aAnP4nYdtTdyy+a6FaVVW3lY
 xQruaduVcP3YxFY8z6Q==
X-Proofpoint-GUID: eI9_8fwKIuyKhIbx-r_JqoKZtMb9cYD7
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeaf5f9 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zVOB84EVDXTtx2zVcRUA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX8b4iTLTTfXd0
 JfsSm+a3iQh3iu3vlLRCZ41oVWcMgGnwEHhfoiZHpKxotvLWhwLZSte2tX206F4Yke5eO7XyF42
 M4LRb1JZEQeSh/8nH44lcFw9fpXyKcY=
X-Proofpoint-ORIG-GUID: eI9_8fwKIuyKhIbx-r_JqoKZtMb9cYD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040036

The PCIe QMP PHYs on Glymur require both refgen for stable reference
voltage and qref for stable reference clock. The refgen requires two power
supplies: vdda-refgen0p9 and vdda-refgen1p2.

This series creates a Glymur-specific supply list including the refgen
supplies and updates both Gen5x4 and Gen4x2 configurations to use it.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Changes in v4:
- Add reviewed-by tags.
- Link to v3: https://lore.kernel.org/all/20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com/

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
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261103-phyrefgen_1104-1b4a2e9b7918

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

