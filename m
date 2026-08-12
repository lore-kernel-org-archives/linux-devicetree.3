Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DAB3C4563
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523729; cv=none; b=Yf4S1CsntPgLkXOtO+KDJz5uydyhKWOa5YOocTcNKFD/GN+sTwg+flMW42z0/IFD4HjJ/vu7M0iwumtlcFLV3UXPq8jmQsijHn315NAinNRUqRNikB4AewqugDoR/Vylx1ssW+qWtxi7LTJRahqYcQ2U39Nc8tmuO6apqoxWDz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523729; c=relaxed/simple;
	bh=cqG43RastOfbvH6w96O4b4xl8uiCleEcq5Xpxvn+9MA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tjf2PvCHwkXGM1t00AylyO0nG64HxkEhqyaQk4ikeONIrHNwa9++sR/hA76v8zdE94Sl7v3S5FIZ+qDAQQQtdco/PLwrL7NEADWknlt5k/wr2R2goRFaFfO9yAgfKM1KdTuZIWYvrMj+hcDYPDBFTC8dpU/9ezSNgUZooDfQKYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com; spf=pass smtp.mailfrom=ferrisoft.com; dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b=Y1++UjdR; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b="Y1++UjdR"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso1135622a12.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferrisoft-com.20251104.gappssmtp.com; s=20251104; t=1786523725; x=1787128525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9o2WwbPBuxQI9iQJan0AFCDUf8L9NpbwwZeyQ4c2g8I=;
        b=Y1++UjdR74kYbbPejrUYC3tQ8Rkp585vszrzaPbBTrug4E4H/OARb984mOXcvn4I4U
         0zK7fxOoLxVJilZQatkLUOW1MhGg9F2VHasbaHQhYNzDHtw48mn9whGmQ1wbJgPVduMv
         xkqLssCZaYw9J7w9O0iOQj3k7J0So3xDSKIt16z4015zedUwZq68iI5jgWAwL6DtAhdJ
         7oEB3CKIcKyOKY3+diRkwGHATpdeiaB7OG9uIrGD3/AmkqMYJgkkIl9e6ccrdGisBStO
         ou+rUOVmrYmSV6NuMeOpzzw9/oO/eTUf4SUy+La3ffGhCI4hwBdhIU1d0FK4TaHySXMj
         Ia2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523725; x=1787128525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9o2WwbPBuxQI9iQJan0AFCDUf8L9NpbwwZeyQ4c2g8I=;
        b=XITUtBCR523tBGFCs35qxRllwgL0aaMobylrtbJiVbgEj0K1Wj9WiJM4oOMzL74QhD
         bQAyCUg1gSAHrX4KLigJRl7ARGU0XHEygP9oNN6XT/zgW5TJn86tSRCSRZRw9W/c+Bvl
         eaSX28+KfKh2XwAFPz4yfm7uuDNtN/gCNTppmmp2wiqTh+1A9PKLUEh+Zlic42ikB7nG
         QeRK2fL+hNiDPJfVd+HbVYeBSM+EwAB1kGacpnuSJj2DkPP6R9fwGaU3pv04TXkgI9+N
         ASFL6QTytx1XogTHktk3t/xTEaoANth+8ggr4W80z+6jUsoGfSPfdWV+nunfkM+fEkZ4
         a4uw==
X-Forwarded-Encrypted: i=1; AHgh+RrWr3lhZemSDbmKsOBay/2u/+yg8Gvr7tyNbUjTG1SB1T8I3JhUbfr787WMtRjHDtzT9PLNeZv2pu58@vger.kernel.org
X-Gm-Message-State: AOJu0YzVhvjAToGswNWWXL+mrffZRen4/4YU+S5qjHWoxjMZhNiOHQCT
	6/4ijiOOBnfX33htV9mr9pLxC2KoNuSKjZAcoUU12x4cI2/S6sTgKsE1+kW8UzjVkjnq
X-Gm-Gg: AR+sD13CyCKtBX0Vy15a6jAhD2FECewV1EW0UWTYnhlDEnX6wrpo+Kp9MYoJ4sGKT7p
	2pHJYCfOYQRJ5z2rIEllpIUBiTC0Vl8OUAGDDB0hLD0PsfiPK6p3pRjttdsgBqWtuVDXAFxp3oP
	foKEs531iaCA2iK8aIGNqB8Q2A0neooqw1lnmRJhuwHbK9Sl6UKp2r4g639UgZLg6hUvVbsDa6L
	f8RAZBVTddrvPirIA7bNoycTv5w2blML9C4ZiS+QykqfZRFTNZAIKifxbZuttHXOP2gu3Tyza5s
	k4YVECriPIBvQacmB6w0mYI0j4SIAoq/sb7EZE95i3YOGF+udF2sSwzqphchD5VsQzsugiS68SV
	l8N0ubss0Ogk2FX2eplBSBTumrsjybAcn9xoHeS0HpKZ0OD4GeA4dOEKRztiGhXHbPbWfT3CiCe
	8oThg5+JXlman00iEXBYNTRbU5xyOj4hlZqfDUSMjqgQBsCdHY8wfg1jB3J8meInzEJhXSo+JTj
	+lF1e3Cqpdfy31zj7PPhQ==
X-Received: by 2002:a05:6402:2425:b0:69f:4c65:86c2 with SMTP id 4fb4d7f45d1cf-6a375ea2e26mr1360779a12.2.1786523724542;
        Wed, 12 Aug 2026 01:35:24 -0700 (PDT)
Received: from zenbook (45-11-61-69.ip4.greenlan.pl. [45.11.61.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a376891e77sm434527a12.5.2026.08.12.01.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:35:24 -0700 (PDT)
From: Greg Ociepka <greg@ferrisoft.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, power and bandwidth votes
Date: Wed, 12 Aug 2026 10:35:22 +0200
Message-ID: <20260812083522.774711-1-greg@ferrisoft.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The four USB3 controller nodes on Glymur (usb_0, usb_1, usb_2, usb_mp)
are missing three property groups that Glymur's own usb_hs node at
a200000 already carries, and that Hamoa (x1e80100) carries on all five
of its USB controllers:

  - assigned-clocks / assigned-clock-rates
  - required-opps
  - interconnects / interconnect-names

Without required-opps the controllers place no performance state vote
on their power domain. Measured on an Asus Zenbook A16 (UX3607OA) with
a SuperSpeed device enumerated, CX aggregates to SVS while the
controllers run their master clock at 200 MHz:

  $ grep -E "^cx " /sys/kernel/debug/pm_genpd/pm_genpd_summary
  cx    on    128

  $ grep "usb30.*master_clk " /sys/kernel/debug/clk/clk_summary
  gcc_usb30_sec_master_clk   ...  200000000
  gcc_usb30_prim_master_clk  ...  200000000
  gcc_usb30_mp_master_clk    ...  200000000

128 is RPMH_REGULATOR_LEVEL_SVS; rpmhpd_opp_nom is 256. With this
patch applied the same measurement reads 256 while a controller is
active.

Without interconnects, dwc3_qcom_interconnect_init() silently does
nothing: of_icc_get() returns NULL rather than an error pointer for a
device without the property, so probe succeeds and icc_set_bw() on a
NULL path is a no-op. No USB-DDR bandwidth is ever requested.

Without assigned-clock-rates nothing programs the master clock RCG,
which keeps whatever the bootloader left behind. On this machine that
happens to be the correct 200 MHz, but ftbl_gcc_usb30_mp_master_clk_src
also allows 66.67 and 133.33 MHz, neither of which sustains SuperSpeed.

Add all three groups to the four nodes, mirroring usb_hs. The
interconnect paths follow the provider layout in
drivers/interconnect/qcom/glymur.c: usb_0/usb_1 sit on aggre4_noc,
usb_mp on aggre3_noc and usb_2 on aggre2_noc.

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Assisted-by: Claude:fable-5
Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
---
Note for reviewers: Hamoa additionally marks all five USB controllers
dma-coherent, while Glymur marks no peripheral DMA master as coherent
(only the SMMUs, PCIe controllers and remoteprocs). That difference is
deliberately not touched here since getting it wrong is a silent
data-corruption class of bug, but it looks like part of the same
omission. Is USB DMA coherent on Glymur?

--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4572,6 +4572,10 @@
 				      "noc_aggr_north",
 				      "noc_aggr_south";
 
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
 			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 90 IRQ_TYPE_EDGE_BOTH>,
@@ -4584,9 +4588,18 @@
 					  "ss_phy_irq";
 
 			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
 			iommus = <&apps_smmu 0x1420 0x0>;
+
+			interconnects = <&aggre4_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			phys = <&usb_0_hsphy>,
 			       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
 			phy-names = "usb2-phy",
@@ -4647,6 +4660,10 @@
 				      "noc_aggr_north",
 				      "noc_aggr_south";
 
+			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
 			interrupts-extended = <&intc GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 88 IRQ_TYPE_EDGE_BOTH>,
@@ -4660,9 +4677,17 @@
 
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
 
 			iommus = <&apps_smmu 0x1460 0x0>;
 
+			interconnects = <&aggre4_noc MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			phys = <&usb_1_hsphy>,
 			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 			phy-names = "usb2-phy",
@@ -4723,6 +4748,10 @@
 				      "noc_aggr_north",
 				      "noc_aggr_south";
 
+			assigned-clocks = <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_TERT_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
 			interrupts-extended = <&intc GIC_SPI 871 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 89 IRQ_TYPE_EDGE_BOTH>,
@@ -4736,9 +4765,17 @@
 
 			resets = <&gcc GCC_USB30_TERT_BCR>;
 			power-domains = <&gcc GCC_USB30_TERT_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
 
 			iommus = <&apps_smmu 0x420 0x0>;
 
+			interconnects = <&aggre2_noc MASTER_USB3_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			phys = <&usb_2_hsphy>,
 			       <&usb_2_qmpphy QMP_USB43DP_USB3_PHY>;
 			phy-names = "usb2-phy",
@@ -4869,6 +4906,10 @@
 				      "noc_aggr_north",
 				      "noc_aggr_south";
 
+			assigned-clocks = <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MP_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
 			interrupts-extended = <&intc GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
@@ -4894,9 +4935,17 @@
 
 			resets = <&gcc GCC_USB30_MP_BCR>;
 			power-domains = <&gcc GCC_USB30_MP_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
 
 			iommus = <&apps_smmu 0xda0 0x0>;
 
+			interconnects = <&aggre3_noc MASTER_USB3_MP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_MP QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			phys = <&usb_mp_hsphy0>,
 			       <&usb_mp_qmpphy0>,
 			       <&usb_mp_hsphy1>,
