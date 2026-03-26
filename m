Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D55E3C9454
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520838; cv=none; b=SisNvwUSW9k6hXY4TDoP5sJXjWRZmdGk245E9wLtn6tspppUjwnNsE48Evn4dh05HuhkaHbAM0FLAPnAX0eits9v7SaPGD3OT8D9JCeuMMTpZY4n1Ma36LlI/QKsxh7fq0gryvHbZ5ND0DFLm5O4ruqzidp+TI6gMrWj0g8/wgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520838; c=relaxed/simple;
	bh=K0XUGrD5+VXgvb0goOQpiva/KqZ/ELAp73Gm7bK1j6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1Ph4jupeap15b3KIbOT/zLoIeA1rNFiq84+NgNaG90li4aVeCgGciQYwQLh34iSCDSMBP1Thb5KBbmwfXF5ON83vcI3bj0tcW5b3bIVMloy+Q4T3YASEceUVSClcvOKPhZDX9zhO7FeTVn7XuKdPsL7UzcddqSvDUofpt25X0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iHt/CdxL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iHt/CdxL"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso583869f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520835; x=1775125635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFH6znvuyd5xKzl6HZV5WXUXeZh+v+g+G9umkMozHAc=;
        b=iHt/CdxLLYTkjo4zjRVY2KaikvUvWJuogSSP/TATr0w5sbqODdPoTutldV3pbRAw2S
         670IvmZrVyg5hf3GhI82p/9hRDFBgpmJvQmoK0ABYCtgTiCMqLiTVdzdT9U2JKDv7UjW
         ZcmT/yL4gTcQNq1HFrya6u5ffqWzjfHJl0TXTCKcUN5XiJbFJEeU7x/UfCgsKUKfRg/o
         3l2uhrCOVwTdwFAzbbBBYxGVJlQreNDj0/yr17nGm2x3beDFi6oJuIlf8fTKM0ohmUaQ
         57x2p0oN9jFiTH80y8tRyq52jgK0fVGXa6iCbbKmWG5Xyr1rpsE9pv2LSLqvJj5gpHgb
         Oafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520835; x=1775125635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFH6znvuyd5xKzl6HZV5WXUXeZh+v+g+G9umkMozHAc=;
        b=pcqAkPIr/Pn6fXX3mSG64P5weqjvBtmoJWW2cdYqh9Dv3GP4pDG6Yda7nEEbLWtV8v
         JzUM0m+piSdfWOiOj5vDkFVJFjq54cZDUiEjNDCaKql/3UL2epVxziU1tD7pkGyeev5v
         t5dv3YM7ylt93lXmWQMBBeSudwHNYWJHsEr9u9No5I2ZuPyGJOK8C360yxpYvNVje6E4
         msSELMdRXrKG9JQtjmHY9kAvrJqgCxuRUWq6fS+xJV+20z0QrtVCXqMBZTP8JpGDC14H
         964Ts7iFwQMVJZdPgX3cGrh4k0okuvmPg3jIzKJhuscr1GBS14v8CwmZoyGOLDRdjyWd
         AFpA==
X-Forwarded-Encrypted: i=1; AJvYcCXel61Ok90uR8itLSCWGhE/RscnIlP9UBmHk70rKxMSgMurq1s6DVqilwc+O7132WIk8P7Kk25VsEbf@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+x3cngdidIUxRFjeE8mERM7eJH/x5pOdLuYSuRXcMMUIQpCZ
	+ADSqWV9PWzNV30W3CA8q9+gUdzPQ4rZ7Bldw0cS1UzdT3PRTUKO8iyxX7S+wvWYCE8=
X-Gm-Gg: ATEYQzzIKv+ElPH1q0pXis+yEve/Up2r88QT+kEDymkWZrWjov0AnWVbjTV/h0HMfJ7
	MpmdDku+48D0TugNBrIuNHbZY+mgftJUOOo8JF1a9nvucbrvke0BXX+dtyqM3TVE3k0UbPrNXW6
	YKrMJLggoV+QF14AUzeaJfF/n7vLYVmO1Ee/tIk6/vU6N9KW4JKcWfEj47rzV2CV10yhBOjHEJq
	DgYnNf62AeGxK21XthHRMJxBcgQrrFyYWqIE455L7yTLEUpIv0iDoGQLazr9xcMoc208hidEkbH
	5eR2wm/3WIRfrXl9rjw7u30gqzwj1KN1ThcEzU/sncFa4CEZ+dXvCghE2kw7y9S/dOYespmQ7gl
	CZZ0gcthg7ADXFf/NF64dP0WkStkv5/8M9Rnz0rbeYUaASY2sik6vlozGlRA658pY/JZu0n9xRf
	HnpBuh5w95jFSTaR6ABdl5BnSIgY/+gsUhkg==
X-Received: by 2002:a05:6000:2287:b0:439:d242:e8fe with SMTP id ffacd0b85a97d-43b8898d586mr10627732f8f.11.1774520834494;
        Thu, 26 Mar 2026 03:27:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:13 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:40 +0000
Subject: [PATCH v3 03/11] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-3-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10431;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=K0XUGrD5+VXgvb0goOQpiva/KqZ/ELAp73Gm7bK1j6M=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQocuCewVL84DItYug5qMV6u5Lr4Kgm1nzMrW
 dBg5+te5DqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 OjBOD/49Tlr5AAyTiqKa0SvrESFBTKBZ6WWfha5YLKcMMdxcDjjIuhGyrCS7j6dmhfX+zIeh4y5
 Nkg69sFqrF8ebq1yEVKrgoW1NA3Rf1ro27pbXzTTfcPSrbLvocuklrOA8WhZoPVSDQ33T9HGH0V
 jYEyclBIoJOqemz3CjovyZKCPohLqX4XErNQCPPswDzWvprDQsA3vZH/+IT+AOhJDwfOQcs1v3d
 Wj2VksYKAuiiZjspSjl0aNECLW1y/Q8vPhwmwSAZg0ofT2qjEi2U7Lk9zyrtdHetOyjm6tPyB1t
 7fNZo8Wj7f1bAlgQkv8vtOfeatwUdiGK8cCGq0DCPc9Y+NDDM3GEEDOmhxgpztI/AU2cRXdkH5Y
 mh3lE2F0R8twtxdtBBWKyNxkJfRNh4+38TmBBuBKoSaZJrgsfw9rXfcHuMD/ipK8EAaijSyQH6o
 A54aAuJk0ykLt7cEeKZaNrBcBHxThMU6Wz8kuHwVjLQZFev5Fed7wjjoo9wc1vlf9KQWLb3VMc+
 XtRgV0wB19pS/5jzDCriFW1tMnogWKTebVU0OCvyNhuA9OhVZhi06wOSa9gS9ZkzBX6KUpauMGi
 UGCEqf0XYcwtl1sjf/b3eScyUo3zcB6cMGHVcwEEdcRbN9la+/M4IwVNkqPuEh9rzGMhckepODC
 TUGFFs8kYCvHpMA==
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
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 348 ++++++++++++++++++++++++++++++++++++
 1 file changed, 348 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 38f9da6ad9ca5..9b7c7d30d7093 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -16,6 +16,8 @@
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -5543,6 +5545,352 @@ cci1_i2c1: i2c-bus@1 {
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
+			phys = <&csiphy0 PHY_QCOM_CSI2_MODE_DPHY>,
+			       <&csiphy1 PHY_QCOM_CSI2_MODE_DPHY>,
+			       <&csiphy2 PHY_QCOM_CSI2_MODE_DPHY>,
+			       <&csiphy4 PHY_QCOM_CSI2_MODE_DPHY>;
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
+					 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+				clock-names = "core",
+					      "timer";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&rpmhpd RPMHPD_MXC>,
+						<&rpmhpd RPMHPD_MMCX>;
+				power-domain-names = "mx",
+						     "mmcx";
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
+					 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+				clock-names = "core",
+					      "timer";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&rpmhpd RPMHPD_MXC>,
+						<&rpmhpd RPMHPD_MMCX>;
+				power-domain-names = "mx",
+						     "mmcx";
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
+					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+				clock-names = "core",
+					      "timer";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&rpmhpd RPMHPD_MXC>,
+						<&rpmhpd RPMHPD_MMCX>;
+				power-domain-names = "mx",
+						     "mmcx";
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
+					 <&camcc CAM_CC_CSI4PHYTIMER_CLK>;
+				clock-names = "core",
+					      "timer";
+
+				operating-points-v2 = <&csiphy_mxa_opp_table>;
+
+				interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&rpmhpd RPMHPD_MX>,
+						<&rpmhpd RPMHPD_MMCX>;
+				power-domain-names = "mx",
+						     "mmcx";
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
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

-- 
2.52.0

