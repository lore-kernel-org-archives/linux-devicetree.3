Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437399;
	b=czQrbv57hOYvWuaQtKITIVRk5wS4ps5JVRkdhrXwfr0XNIqSWkKoao5vyGtFar7RbF+O
	 SM1x8yEV5JCagojv09ytfSJEDDbPsJC4pUJFax0qUnYGEnm1dPjv8FVJRnZsyrkP2Zg4j
	 Rl8YSyIoA8Xzyr2mN9h48Z4vIjHpqURhtL8j30DXawQoEusLXqXvOHVb4wiaF2Uyiz4Wg
	 4uyoyVR5ZAPbf4tht96yspJdemm9sk5C66V7TMdNtCWZt3c+6UqGJmzZxWkE8smKJhrzt
	 Gyvj7GLVhEdxZvev9RGU/EVTXIaRs3IqD9QBT3c9URDpKD2XAPD3Mmvf05q08Y2jPWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WWOU0iP3SeVqsec/eIN2jpvmWs801fi3504yYJIcgxc=;
	b=oQpC+xrxL8yj2j3dGHCGrJqGfAQ8XXKbKWFzbyP63/Z9nreYFarpunK0r/HArgbqjcVK
	 pWfLlKW2tKVSZ9jczXvzgBR6Fqf0Bwyv96vo/7PLa5FJmhY28Mq7RbNz2JvunGrzrWU9F
	 S78Yg6UiHh26G4W5OpcBLpWIjE+RMP8maxmWXHMH07LTtv7ajaPEE6UBteKb0gr1SFCTp
	 Nv7Ja/TNJX6xRBRYeKSu6bpx7x2TpqC5dgqnQrPn7jpMCDl5NNe/5wzb3WYTbyCJTGBnp
	 Izd8A+16xTbwZ0Yo4jL++Dx9a/7v96PFgj/cfto9znXC4d3kCGR/uDE1YHRakzuuf4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oYNRImbY;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8A606A6B5
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F8A606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oYNRImbY
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so8904444eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437398; x=1796042198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWOU0iP3SeVqsec/eIN2jpvmWs801fi3504yYJIcgxc=;
        b=oYNRImbY2PEyG/MEIRUM+wGvHKT6IKmNRD79HvBJeSn3KtzKkgAZkIxfMa5PfscSTR
         4hOkxRJqfCWnkIr1FGL4CQXvkfDcOjG79fPVfgbjkEfXO9JZILRtpdMIB3v1g72QQWYL
         6ds2MiqdVYRb76D8Mn64jSbSIAdJnQ3MVQo+sSP/4FDnKRCJzvfME0WeFID9frzlkWDa
         LZt5hI/Qd7MkburAy8cBGVXdGewDxYcMTYfS4+bybq5X5MIkI4/dE//ohZUYlU6cl3oc
         6/T4j8h8SyM2vA1Tgxl8AbtXUsdRe8nBS//My2K35rCgExd0LtvazXnzC//Hr6mFgYEA
         BjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437398; x=1796042198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWOU0iP3SeVqsec/eIN2jpvmWs801fi3504yYJIcgxc=;
        b=vGu16rx6WZLyJsGt3LkP8vtiAmsHvV+HdiExemTNkhgq26tTnPCvhGMNGGajCmcBDp
         PDjtoV+WZQFxjsMPrgHBflvKi5FKdm+pHmvdyvGE758C/myJ4QBX8R6C8rRjw8tvUbTK
         Aw0JlBOizDznfdiio0F/ZlOFXAJW5PkGos1aD+bzjZw126YbzrVzGtsQOkkN7a2J5/vL
         mJiX6NeEoVyQtx8wJ+xUTXUNGPCQaoiyBfbqq44ZFElXFPC9pcoBgF6fl9QJPF5BBQRg
         1yI/S+wKimPL1neAzdKO2sMGdEos8yQtpsEAClzSw3Cvda3bj/XYhyQU3Wimkue1cw9U
         /cJA==
X-Forwarded-Encrypted: i=1; AL+hErGvdI0BTepRH76ZVMcWSGtQsJWyklOSyDuQhWfYyjk/0AwxiMeYH9CU2zq0ZHnxkZsmk0Cj+mv3zfrx@vger.kernel.org
X-Gm-Message-State: APuU4Z9HYYTEuIZMoYe6pZ6kDi4IdsX2IrYUpLj/I3fE9NWEU+GQhVmJ
	Fh+E5CmN6IcfA7oqsGwWdTtZcJCRLtdHd++qtuFO+mAKbq2XW3hCfwOy
X-Gm-Gg: AZFdTZeCtOb+sDXRXqIZR4WqUiGyFVdZ4FlaSt8eStfNzd6ib/XoI9bXQxmsdZt039X
	pGpAS5R8w/X23srxD45R97PdNzaygnZwovWwShVwdnOVkDBgqBfcwvyrRZGqyryCS0bijG9crfj
	9atdgFvnCeOUFKgqLlJ/+sBMZ4R3IeqRpPL+1XLMEdKR21ogxHfErekrNr6ybNoRtOxYHs+jYb+
	BR/kImxM9L82tT/vNX8uAwAwpVSBbVry2I+BEhlxsGA2FvKnmK+9Ag6Oc79eC+OCWSlCVxdejjR
	Pk04npWlKnHIZwyRtttSzOSzXjvkDu0E2UEsWk+1Yh5KIgF5wW3H4dYzPvOz7/Hz4qe47Np1JAB
	90G1sic5OHfXvJi19tM5Jl9pzuOwUa2P8Reh0GgJCPgR5oxoeZ23PSkxn2rADrHOTK2rfGqOt/a
	gTD8D34LjF9hSeGTyRI5/t2MLTLem0wE2asiB22LoXIpns/t+8hmCB/G2wjec4y/DSqfsxOCcEw
	BDifMj410CkdVhz5AhXzqS6vVI6aJFC7088BTJAsrBI3EJL39Kork5E64okaCAuobZ3e6ZntEJF
	gQhlvYzUINiun3x3fJqh6Y8MGX4OANfbHN7U7/fC995/FoE=
X-Received: by 2002:a05:7301:fd16:b0:385:8744:658f with SMTP id 5a478bee46e88-3858753a876mr11826804eec.28.1795437398385;
        Mon, 23 Nov 2026 04:36:38 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:37 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
Date: Mon, 23 Nov 2026 19:35:45 +0700
Message-ID: <20261123123546.152162-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the camera subsystem (CAMSS) node and MCLK0/1/2 pin control states
to the Qualcomm MSM8953 SoC Devicetree.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 155 ++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 753167c3f861..2e64fb8bbb2e 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -902,6 +902,27 @@ sdc1_cmd_off: sdc1-cmd-off-state {
 				drive-strength = <2>;
 			};
 
+			camss_mclk0_default: camss-mclk0-default-state {
+				pins = "gpio26";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			camss_mclk1_default: camss-mclk1-default-state {
+				pins = "gpio27";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			camss_mclk2_default: camss-mclk2-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_data_on: sdc1-data-on-state {
 				pins = "sdc1_data";
 				bias-pull-up;
@@ -1257,6 +1278,140 @@ cci_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: camss@1b00020 {
+			compatible = "qcom,msm8953-camss";
+
+			reg = <0x1b00020 0x10>,
+			      <0x1b30000 0x100>,
+			      <0x1b30400 0x100>,
+			      <0x1b30800 0x100>,
+			      <0x1b34000 0x1000>,
+			      <0x1b00030 0x4>,
+			      <0x1b35000 0x1000>,
+			      <0x1b00038 0x4>,
+			      <0x1b36000 0x1000>,
+			      <0x1b00040 0x4>,
+			      <0x1b31000 0x500>,
+			      <0x1b10000 0x1000>,
+			      <0x1b14000 0x1000>;
+			reg-names = "csi_clk_mux",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csiphy0",
+				    "csiphy0_clk_mux",
+				    "csiphy1",
+				    "csiphy1_clk_mux",
+				    "csiphy2",
+				    "csiphy2_clk_mux",
+				    "ispif",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMSS_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI2RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE1_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+				 <&gcc GCC_CAMSS_MICRO_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_AXI_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_AXI_CLK>;
+			clock-names = "ahb",
+				      "csi0",
+				      "csi0_ahb",
+				      "csi0_phy",
+				      "csi0_pix",
+				      "csi0_rdi",
+				      "csi1",
+				      "csi1_ahb",
+				      "csi1_phy",
+				      "csi1_pix",
+				      "csi1_rdi",
+				      "csi2",
+				      "csi2_ahb",
+				      "csi2_phy",
+				      "csi2_pix",
+				      "csi2_rdi",
+				      "csi_vfe0",
+				      "csi_vfe1",
+				      "csiphy0_timer",
+				      "csiphy1_timer",
+				      "csiphy2_timer",
+				      "ispif_ahb",
+				      "micro_ahb",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_ahb",
+				      "vfe0_axi",
+				      "vfe1",
+				      "vfe1_ahb",
+				      "vfe1_axi";
+
+			interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "ispif",
+					  "vfe0",
+					  "vfe1";
+
+			iommus = <&apps_iommu 0x14>;
+
+			interconnects = <&snoc_mm MAS_VFE0 RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>,
+					<&snoc_mm MAS_VFE1 RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>,
+					<&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &pcnoc SLV_CAMERA_SS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "cam_vfe0_mem",
+					     "cam_vfe1_mem",
+					     "cam_ahb";
+
+			power-domains = <&gcc VFE0_GDSC>,
+					<&gcc VFE1_GDSC>;
+			power-domain-names = "vfe0", "vfe1";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gpu: gpu@1c00000 {
 			compatible = "qcom,adreno-506.0", "qcom,adreno";
 			reg = <0x01c00000 0x40000>;
-- 
2.47.3

