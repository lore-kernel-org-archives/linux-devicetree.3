Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977EF38E5DC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154056; cv=none; b=GDLaJb3MPPSfv0s3aaT9gDx2a1jnKcY6TM8KojuNt2aUpjJG6Wf5Yled2hORYUSNvrYT2SVifiv9PTzddyUpD5qxOlqU+5JKvyUl2uFZD3W1dz/4IqcqdGtKhR4z+zBFMQLSyzVPfv0v1ipsNkF9liomf4W5lLvxCpcDKI3r8ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154056; c=relaxed/simple;
	bh=qyiSXr9m3e+ricjWc4HaLqw5V+1A1GHs9xGgqQrmD3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trwZlhvqowbFobPnZ8yDZt6PCc2VMGjoCYTO+vjbPx805wISd33ulqoGotf8fvRfsCdlDp99gwtw8CC5IjwSvyyJwMueeKmmouD+IkX7zP43J12OfT79uACgiKqhcWe4Bv97Ev9rFXuRZURI0ubO1p/pHoPDrs7c50t6bGD/6HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZEcpuad; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YW/z0YWa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZEcpuad";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YW/z0YWa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NXiR3183743
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WK2uACQoFktTjYhZJ1pH9Ou6MkkiqsQrpjUWQVaNGMc=; b=SZEcpuadVFgTrMLq
	QP5THvhBSqz0+G3c2e0wBp4ZZfRXHbPmD74Yyys18JPIM+DxUaYaeH4n00k4vEfA
	fDYuNPPOKrydEb5lnMsVWAYxfyRgpULu7exJ5c4hRg73xplESVqfPE6fW0R7bPnu
	WFdXoX3Bg7v2poPP5SrHNXa47Wlrr0UfYvDKHCUKyG6Xrz1+Nt6AcMj9kWHUZuXf
	QEXyPAUPfLYi77cY5+0tOwogjxFYFHHXLgpKupPqkZ/QbyUan+vxUYYZ+ZVKQq64
	L/Sr2N+q8pvtg5FU6EfCvwNVtPyAwlnhE4oDSqCxx1aemuJXzBe8kjCsz5B/Kw6o
	q4L23w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1npt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso76544215ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154042; x=1781758842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WK2uACQoFktTjYhZJ1pH9Ou6MkkiqsQrpjUWQVaNGMc=;
        b=YW/z0YWapW5FlG9Zc7nxh5hcQdKA/G40Dmu7b7XWN/QDQhqwV+uakn6G6aF1W42xrY
         9BAbLWKyMgo5+0b8LhAICELmggBp86S7ftAzLIGsN26o0T/rM6hsYjHv49HEer0sNOUz
         eFh/Q04MSyROgdGhdKQ1od2lizZirSgW1oqoGDACNaIRhnttQ59K9pggK2mWnHxMr2Yl
         z3DUO9IKKoSZ3q8VEOaTV122LJgIkR/VYtbG6xMxW11mNiYxYCsFHDmxT8v+fKDbbKVr
         KaTMbCRxPJAkFIej5TIMTYIpwslXnCkBe+XleB6B73fxH4ZzI+inZnpKiuyulMJ+bWIP
         6EzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154042; x=1781758842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WK2uACQoFktTjYhZJ1pH9Ou6MkkiqsQrpjUWQVaNGMc=;
        b=XliAhFZUlH5wMWe3ZJqF+6LH+HDKmi4pRbzPMye6jIzdiVjWmYdplcD1giDOfE1DfL
         6arHswSWiKVzmYS1+KPlBCA376/r/rLRdT9nb7zPSiNOSYWuih53Oje8nA1BId9yD9xR
         ImZ9ZbnfFixaqykmoQ/cM21gQliItaUfOGljZCcanRiSENGmx3pL2fkrG7QkRBR5Fzkh
         BxqdLY+c4JazuMJg0JJX2bvPWie5vQ2vV0NSR+64iYC/dxmu+i6Rum+Ai2BQfCUPm1H9
         9SutJkLXP0WGB3l9CXmTLiiCef5bMrvlyNdy+Z1POCisz7crBvtxR4qfNIO+JFfwvsB0
         dVVA==
X-Forwarded-Encrypted: i=1; AFNElJ+x5aa0Ea/3u+6wjSgTT9WtNU98gZQZUQqZVjDn38OhQ1FW3Ba9aklWr7Q0wogHS586Ya8X46+v+s7R@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8fzMN8lYtlokxOW7CtYXjXqEsFGh0VqNuSghvmUgZHL6X3qb
	0ttxk3MLfJphLvU1bukmCB97PAA8/Ons/zbpeGcqDHjEoW1SeNOaquNorHbIwrQY1eACD/PDG5j
	hZHrWW1mpJz7icuT8gl5pDQxmL2K1q0gPSkjfxwn6Q2QkWNMjoY+Ix2kPaBw1l3HC
X-Gm-Gg: Acq92OG4m2PU4UY4r5XvmA7pqlXwWe4GC1QuACFMCB/LJC6sVeyts9ixzp7f2OW5Xa+
	P9NgRfSV0+ZLzYN4aasODpl39+PzLQslFadFKj65FKeklYe0ivIMogtOWMO+p0g87p4X0dEWdoU
	KqldxO/dxHJDSUhDRBGz11Lon6DGf5HSPnyylcZi3CGkiklMt8QpPWcR6H++2YLE/P9IRP71KXP
	9WS5pzmFpDltM13tRdPUHlwC7mNhk9S1CfxTaaLzDP0ovB51EB8D9xKs1a75Kn6kt5STqlLRT8T
	ZHBeflbhmujxFd6Ekbml0GjcUzFrY4GK3sV1Dv577zG+94cUlw4M5ptLll/RNOUy7MzwOM6kVhK
	zjJGnAHKcEIbJ4HUIw/NYEjL56ry7cFKNPvXaWzjVorNaDaQbEkOEyqZGGdYBO0cz6gw=
X-Received: by 2002:a17:903:2408:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c2f18e2accmr13885465ad.1.1781154041806;
        Wed, 10 Jun 2026 22:00:41 -0700 (PDT)
X-Received: by 2002:a17:903:2408:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c2f18e2accmr13880945ad.1.1781154037786;
        Wed, 10 Jun 2026 22:00:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:02 +0530
Subject: [PATCH v2 26/37] arm64: dts: qcom: sc8180x: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-26-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=4757;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qyiSXr9m3e+ricjWc4HaLqw5V+1A1GHs9xGgqQrmD3o=;
 b=6gvATxmPbnsFsLmbQBWRpgGVdMC9KOD0DdSY7CyPD52csRzz1Oe7UZrhfbajXfg7wmSBy6UXP
 Y/jYgUsyUJjCqlxoL5tUsTMgJAqedXNY7uIu8z9GXx9x0eP0noo/bGi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: pfh8g9_hH6iX1TNsefht2EcS44pQDfxg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX/4xQfqygmXzH
 vAXn7U+lDbidBErPhHzK7ssRI6MSsQxZE6GZ56qohcjklk96mCOFi5mR90jMtFGQKad83gJ8vOo
 B467ccT6VgG+rx1WqK/wqQAuoIDSlCg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXxtF/IgDAkCKj
 D+VkWouzFaUEoWwHqjngZOzzGHjg93kQsgvwYwTm1zPLG092QALfyKaLR3U7KrgGitZJK3CZo/1
 VGtB+HpY6mhQsdCC5o9jLgIimVDPG0YKGHERVTu80CKFH1Bv+SX3JXJeZqcqFBMGX/9Sn+T8qYO
 6w/VUUC4bMWPlN53dMMMoGfUqdZPsBFUGBAOXoFPuYNbspLCVwiuOkowEEjm2/yBd+bx9US9yg2
 TFKNnGZjxTKOGvj2ZxN+zLQdW+hGvRJJG97v/zkAZiNYbYOLL1jaKzm3tMcIFsfXPI1SzAnzPzB
 FUtRgM3SbIIi/R2Rta9qeLUmMkYdwEub3cHP+jbSyspAdYJR3F0JDno9NOeIRWaeZUdFvXi+poU
 iDv9IbzeEmYwDP32YQjSVsMlV0hgY0VO2pv9+U9Gb3YlwL0Xgm+tUJwBs2UahAqH8BIZleyCvfb
 RWhYmb2Z2PpH0MpU5LQ==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a40fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Pn-WcxdREE-ERze4qssA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: pfh8g9_hH6iX1TNsefht2EcS44pQDfxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
labels to these nodes to allow board-level overrides. Move
perst-gpios/wake-gpios from the controller overrides to the
respective port nodes in the board files, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 24 +++++++++++-----------
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 44bf3db01d3a..c2d9dcf8ed64 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -457,14 +457,17 @@ &mdss_edp_out {
 };
 
 &pcie3 {
-	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie3_port0 {
+	reset-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3_phy {
 	vdda-phy-supply = <&vreg_l5e_0p88>;
 	vdda-pll-supply = <&vreg_l3c_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index a4644ecca536..1b50baf0271b 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -558,14 +558,17 @@ &mdss_edp_out {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5e_0p88>;
 	vdda-pll-supply = <&vreg_l3c_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f45deb188c6c..b6966ec7790f 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1779,13 +1779,11 @@ pcie0: pcie@1c00000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1793,6 +1791,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -1898,13 +1898,11 @@ pcie3: pcie@1c08000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_3 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie3_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1912,6 +1910,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie3_phy>;
 			};
 		};
 
@@ -2018,13 +2018,11 @@ pcie1: pcie@1c10000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_1 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2032,6 +2030,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 
@@ -2138,13 +2138,11 @@ pcie2: pcie@1c18000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_2 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2152,6 +2150,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie2_phy>;
 			};
 		};
 

-- 
2.34.1

