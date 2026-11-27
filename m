Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787173;
	b=Vw5ThQjdXGBezTW1yuNFvkGImPhFiD+cuL+H8FHnm8BlhB+KyoXrx9idCmB6m+FahDpT
	 i8BCX+Q84W7tAA/dw2RMtlYeECPrCUK0jX+H/F6W9NEdkffMsKMOho/g53WVmpFET3r9V
	 VT4NK4Ec4Nwb5pFIcBrhRaCknd2juKtzO/vd4EZ0n3LmFSa7wznlMCHXFW1r9eE2E1rP2
	 4R0H9rQn3tRnCVmamiow6WzLTij+vaW4m1fmzg2bV71LqfeSskrpcktaBGtH9JIYsHtJv
	 bdhgZ/wGxdJp+r3ybiPMQ42NsWRUGQBt7u4TPX961ES4PsEvauOyghWGOBsgnkx6D3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
	b=kRoIjroZO1c9JxZ3ASM6BB2Vt+JEGaUgSEQ6BHtdcboSWnDaMoeSpfmeVgd0t6Lur4y1
	 7s2DhedZnrg/Mbz0flBShwqBOMTs8KcLm7ATEtSFTk1UxeW3zz5pNEXQLgFBHHulSLoD8
	 5NYfNQ5KAYrxc7zaJJHTt4aAn9TPjOyhuEAinjryiG5O+E58heeq/5XayYOIJlCa5eioQ
	 NcGex/wAIANmxaWm/k6Qg4NaSVyNuI7eqcaKoa+NaCX+yTZDdBdyRhxi9XWOjULQiRKPj
	 vUBi9ho5UrrBNZ+qsY1h8ogPEyg8iKcsF1ySQ3ishB++BhcvoOuCp/qXJIxkEapkwYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsSgoHTp;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671DE606A692
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671DE606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsSgoHTp
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06e79e152so3940939b3a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787172; x=1796391972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
        b=qsSgoHTpvT/9ctbzZttJZbtP2h5pd+ESqc8K/2LSApxjk/xCp20O7Fx9kzvh8G6913
         7ZnaOx9ePfZQFSFrXeKpDFzMGe903VH/MGVYaeQN9rORudZ7+77YhFmlHb/7kXxEKLCM
         DTG6EbON6clJR0AvkEmLs0oWREJkTIbwlTzyyNb2obn3/UfC2sGXsjUgAD8vQ/b+fObq
         WGsVkxQf4nbTj6KKbRaJKRsxodoDy4rhSUX4QxsnplgzF/G/Ky6T81XzaoXbDStAZrq0
         ua9/JpZIS5oTK/rksg14NStePupbw5EDsZXPQqpy3cyTW/kRk1fIQWZ0H/na+TYZCPXU
         nhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787172; x=1796391972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
        b=xzxc7wSmsalln/OWYOzsD50E8Z2KLs5JKFmrQ2unMkKsDmLxNNbQWnBRHfCBbqtDfs
         zdXA/V1nupNUpGAFhloDtlFZ7euw+KTzsQ7yC3Fc93/6hbrx1J+tkuD/01VIBF/p6j6z
         Yhy/60Js4IYaU8cDVLozwhFoRjlvkQZX5DJdDpPz++d5tj2TevrtKIxOlQKXrwPviPRI
         CnnGO/0NrQj0+JDRsZ0S7BVAMwh+Uh6ivSEPViBUHItdTYYLBHgMcnYEYAI8REajKy8Y
         hqR+TrWVMppPkweQNb/ng5K2pdT09iXNmWRzLlhwu55MYLObGvpGlwaoWDdhBRhXzKFh
         kQJQ==
X-Forwarded-Encrypted: i=1; AL+hErGSWx2llSOsH939m+kRu1eg2dJZiPR4P86MCvtythOFTcDnCU1YrJDQO+homVOmFgARU/DmfR4mT4sa@vger.kernel.org
X-Gm-Message-State: APuU4Z9aV5gxQICTGXg6gjR5mHMNvFHvUoVf+vlukQuginHnCCoFouru
	koCkYI1YblGkqVZGmUQ8lQxZ6H0h3QAp4jODxLM8PZ0h3xf5ukT11iea
X-Gm-Gg: AZFdTZeJW03s/UMZDLGBVDhCu0WTXpk7QfI5JdCtq6Ia4+S2cuCIDnu2J74zPjBI3Cq
	nyudaIFn9QJZdYEPdnPIYuLIWR/Mh3tyn8/VbVtvo5fvi0bvhx2CWqPOlfLd3FnynY8dAdvD6D4
	gCJbNYgEmrda6IKHEI/sObU4rK2kd1v+ZA4uKYlrFXBkJoiHNo2FZdtdpLy+qoiIXHWTimVRvWf
	1aP1BcNsuV+waCERxzWjqwHGR9m5OmKz62/4e/g8zwRkPRDcxOY4AdrgBD1+Ghtxh3nN5SfuMq8
	10B6Ul6YWgVfsHLiP63MkXNACvrgY6tJYdI/LPtPGh6wY2wXEBMORc0dK4lrvk1oKRYTML51PnW
	hdWCKto3CV7TeZ+GXeqAGU/AzOXZLraMn4DWeP4VHcDVYDrcKqDxNrbLu7tPIy5nq2fihoDBrUP
	I5QeAiK8L4THLpOSjOyMkkFq19R9550kwiSyllDOPrhBe1yBDYnjhMLq/ONZfcqsdTJVvIpv22W
	QpfuxvoA5WwY4ArdnWJ1H4oHdHG1b2q1QA5OS4de5Q9rkENthigcZEiLa1xF03JHHMWQV33cMPc
	WZhc57nYT+UnMfr4KL/l2bKc10k1vWriCHLlmCylgVuz9A==
X-Received: by 2002:a17:902:f792:b0:2ef:e864:e0fe with SMTP id d9443c01a7336-2f03f1d70abmr227466355ad.25.1795787171767;
        Fri, 27 Nov 2026 05:46:11 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:46:11 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 6/7] arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
Date: Fri, 27 Nov 2026 20:45:06 +0700
Message-ID: <20261127134507.125513-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 145 ++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 753167c3f861..396472ba8f28 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -753,6 +753,27 @@ i2c_6_sleep: i2c-6-sleep-state {
 				bias-disable;
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
 			cci0_default: cci0-default-state {
 				pins = "gpio29", "gpio30";
 				function = "cci_i2c";
@@ -1214,6 +1235,130 @@ mdss_dsi1_phy: phy@1a96400 {
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
 		cci: cci@1b0c000 {
 			compatible = "qcom,msm8953-cci";
 			reg = <0x1b0c000 0x4000>;
-- 
2.47.3

