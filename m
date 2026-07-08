Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093BC36C0D6
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471468; cv=none; b=QTEB7gl/ZZWJIaQyLx20ZBtEnZRei8DUEjmyDMBqE66W5ZBmoCrelbmC6nki0zfRCB7RRbstpK8j7n7iGAHT0IsT/RTl23LKRbaK/G5zUr4PCcMrXr1ld/kz1if45Udy58G92+ndXtbqVypPOuDUfqVMmVNCN0Yk/c5ueu9TBMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471468; c=relaxed/simple;
	bh=KG6IhenAM5s0mejKKhRtKitoXxMMqh77cMpucAQ+OYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWeskYqFPGChGWqQBVIevEyvt2/1LurlCRKN2TtwARHFkrtfvahm7PLg9ueYjncVZVfUg9vl7hDznFHGMI//RQflLfFbxtUgbSYnKYT4yNiFbJEUIIPmGorHfVtGfCQveUnsx2VYU6OYpo8a/LK5l5ehAIAnxnNk9cVtkjQAKgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kYOqLlBU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kYOqLlBU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b779003fso269515e9.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471463; x=1784076263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AV1Ev/FdL/nkF8a/nhCCXdR7w0pYdi0qaR5oxJuXiQ=;
        b=kYOqLlBU6FCtiIXoJkjTB+P7t950QxUnt/tRzO7EteKqvrG4IqeUGHSpHX0c9tRa30
         +vj311ksUT+t2/xhooARwsKCq2kT0GXBeX3uExR35wpkCiXO4uIas17Kjnl2q4/K+2Ty
         3ARsq31sMuUDqoO1TqH9dlizgoTaw0Hr8uBlDSXN0/YPUBqeuDkx9KZHuRr3fM5gZjg1
         BC/p14SATI4XM4qpqqSexMCmCoOMTx9Jtk9b65JnBvJpdbIeRKzhEZfKoa87dHHAfYGh
         ULth4Y8c5sOBabHWz9IGIVef0y1JS1PJtBEM8mOXPdIOfl7I/+Y3tJPBUCEpD41Nby//
         EDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471463; x=1784076263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/AV1Ev/FdL/nkF8a/nhCCXdR7w0pYdi0qaR5oxJuXiQ=;
        b=CRQEIV//SUBrY+hRjo2cBe+bvgSQeGXuevKqMZKxu14+QmV1NGG6r5U0zC1mRs4JzD
         pAcJgv5gcWf5WAOHX17s36CdckQG2xPPx7We075iG61OxPYED9hnvma2QW3HiMMH4f6z
         T7H3K/QHsrUD/cuS2ay3+YgYHMyJx9z07xWQW7nLS0nKVOg4sqtKsIfj3eoqx81M9eZ6
         7puU3V3FwF4xAQmp+eaR39ayC2E/hc0QTvyyH4pzRgj/0B8zRejuNGsdLa1bM854Troe
         J7dRxGft3wFBOqCfz7ph7BAV9BnI7acn0zTCfl/TStZj55rttm3rLRTv12mPOldRcuxC
         7rXA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0uwqFS2ChrBxeAcpJK+PBJCsCSWi5BInFM0KG5kLaZak8TqFM7l1U/X+71e5GbvP6nqT1SLbqETd6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6dPFKBDUwqOImS6VEtwvAWNssKM9zZONLMMiOzlLznbY2yMao
	XaKIExvfRty7RHrMVeNbvvU0XH1QQhQ9vld3rpqOTJvIsc8kuUU/NN8L8iMprq0W68c=
X-Gm-Gg: AfdE7cmhl35ApNxFO14wvzZcGirA40PJUNuNgel8sDtRlqrDzNiTS81UhCajKYHP9JS
	0NRGnKvw/Qu1nZU/JFWOjA+IFIzqbSBo7Rp9SaaTW4JVFJ9ruzxyV5AmDRDRr3ZhVBBFXMlqOnK
	8akZS/bbouEHrZOfkvESNP2edRE6cAZvT7jC3W/GuFviBQkhWlh5AE1zKQQyH2upAZxWrdWado9
	gay6oAKtJpFW7wgGBWXScUsW9pnw5Nj/MpmQvw86Tkr/wPQS5GR8TdONsRitC/lqpD0rH6bKTib
	HFdPHI7t7EoTiyfsjUn4GpmHtbLqcTd1LhhSuFw1dATa5jW6m6x38ZET11OOAAFgJCR5OruF1+G
	e+18j/2uYjBRpbgSS+WOotFYRfPMRHrKzX9vUN9jrEt48R29JLQp/f3gAWMyFRq0Nmd8vJSF7AF
	VR7rbXsiuatqW5ia0dcQ1gKeg=
X-Received: by 2002:a05:600c:c4a7:b0:493:df11:eab4 with SMTP id 5b1f17b1804b1-493e69b0db1mr224875e9.8.1783471463378;
        Tue, 07 Jul 2026 17:44:23 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:22 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:10 +0100
Subject: [PATCH v4 03/11] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-3-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10820;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=KG6IhenAM5s0mejKKhRtKitoXxMMqh77cMpucAQ+OYc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1c2eeMG3qBts/h7vy8/UKzyq/o4qJyWcgH+
 NnA+aAieZyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXAAKCRAicTuzoY3I
 OiJID/9SYxzCFpV6ez0ufZl3nHBfyBNtbnMdWY74uDuvs7ALwL/GAnlyuScBs1RxLzbq0JWrZic
 Lprw5eKsdoE59lQRZrzwtEB6C9+YmyiszApJvOwrN+rmw4LhqwIi0dWn4whqZTxayo0c228eTs+
 XqNfdVpK0Xumlh13Ma9i5UqQqxKGZ5Yg34/bOYR2mCM5NuDnS+7Ly1S2bHCObCioSoIG6tsSxMd
 Xp9SNv9kQZp8Mb4hWavDX2Joz/VSfiY3k2Br5KecJp3SOcAGJwKa7pl8Dd4GYcDPxWHs5F2yP5U
 58KgD63p0yEGTQq298XA9TcKbb1NWTiD3UY0a9CQh4wNV9sjQyaSeoZNwMnCSt8wdpcaUpHsv1y
 TrFtMVLgvF4Y/dv3H+pgDdiPEEDwqyPSiNRfYCtSfYnWr6g9Yur6tQIIf0bM2TpkAl63e+IPPVI
 tqtxMC7OJamp8BKOaR0OK5O99n+YXFAbCZehkLxjiUBvK1mbirafrvEP29QRck1/RXaqtuSJBiF
 Yt3iJtFNbVJG+Gp7I3Ju1ez6ugyVOAxhq+/lXLhRNP+MbklRr8tYbsreeBO4Zsr+tU8Hcaf0xWF
 YHXFHUCJ3e2NGHgGfybeFMWHkOh4VhG95FmEM37X87wug+U/GXWQtPCKpO+1larrsWT3Ouxbz4I
 p7fiDaSibaYq1cw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add dtsi to describe the xe180100 CAMSS block

4 x CSIPHY
3 x TPG
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 363 ++++++++++++++++++++++++++++++++++++
 1 file changed, 363 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 9a854da9550c3..19990964c0c46 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -5629,6 +5630,368 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb7000 {
+			compatible = "qcom,x1e80100-camss";
+
+			reg = <0 0x0acb7000 0 0x2000>,
+			      <0 0x0acb9000 0 0x2000>,
+			      <0 0x0acbb000 0 0x2000>,
+			      <0 0x0acc6000 0 0x1000>,
+			      <0 0x0acca000 0 0x1000>,
+			      <0 0x0acb6000 0 0x1000>,
+			      <0 0x0ace4000 0 0x1000>,
+			      <0 0x0ace6000 0 0x1000>,
+			      <0 0x0ace8000 0 0x1000>,
+			      <0 0x0acec000 0 0x4000>,
+			      <0 0x0acf6000 0 0x1000>,
+			      <0 0x0acf7000 0 0x1000>,
+			      <0 0x0acf8000 0 0x1000>,
+			      <0 0x0ac62000 0 0xf000>,
+			      <0 0x0ac71000 0 0xf000>,
+			      <0 0x0acc7000 0 0x2000>,
+			      <0 0x0accb000 0 0x2000>;
+
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_wrapper",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy4",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "cphy_rx_clk_src",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy4",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x60>,
+				 <&apps_smmu 0x820 0x60>,
+				 <&apps_smmu 0x840 0x60>,
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x18a0 0x0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			phys = <&csiphy0 PHY_TYPE_DPHY>,
+			       <&csiphy1 PHY_TYPE_DPHY>,
+			       <&csiphy2 PHY_TYPE_DPHY>,
+			       <&csiphy4 PHY_TYPE_DPHY>;
+			phy-names = "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy4";
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy0_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy1_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy2_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy4_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+			};
+
+			csiphy0: phy@ace4000 {
+				compatible = "qcom,x1e80100-csi2-phy";
+				reg = <0 0x0ace4000 0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+					 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>;
+				clock-names = "core",
+					      "timer",
+					      "ahb";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "top",
+						     "mmcx",
+						     "mx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy1: phy@ace6000 {
+				compatible = "qcom,x1e80100-csi2-phy";
+				reg = <0 0x0ace6000 0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+					 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>;
+				clock-names = "core",
+					      "timer",
+					      "ahb";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "top",
+						     "mmcx",
+						     "mx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy2: phy@ace8000 {
+				compatible = "qcom,x1e80100-csi2-phy";
+				reg = <0 0x0ace8000 0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>;
+				clock-names = "core",
+					      "timer",
+					      "ahb";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "top",
+						     "mmcx",
+						     "mx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy4: phy@acec000 {
+				compatible = "qcom,x1e80100-csi2-phy";
+				reg = <0 0x0acec000 0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+					 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>;
+				clock-names = "core",
+					      "timer",
+					      "ahb";
+
+				operating-points-v2 = <&csiphy_mxa_opp_table>;
+
+				interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "top",
+						     "mmcx",
+						     "mx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy_mxc_opp_table: opp-table-mxc {
+				compatible = "operating-points-v2";
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+			};
+
+			csiphy_mxa_opp_table: opp-table-mxa {
+				compatible = "operating-points-v2";
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

-- 
2.54.0

