Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447724;
	b=P4jI/FjgQFyN+DF51n5NZXj47ZLeX9WcXM4zMsxVsb1TvKORvwhFFnAiUl1KZT/YtZVd
	 5MG290VnoSpBy3cqEjWd3I6vq1CXi5FKJrKz583uY1gHNyAKoCqpHupnlfKOXfC6LZJC8
	 eQQl8bhw3bqaE0f9DvqfM6ZTBxuZdOXPCNfyvA6AN6t5edQlDNdACZq2Db9wn+EgPMwpC
	 ZLKi3vTB54pj3ix7zWl4K9aCOGmTj+53APiA1T3sNdgPLXWt2t830Zl8MEQTomdCgDFmY
	 m+nCDyf4WoDX9wAAnM4PGeBL2vGfJASozansm9SPE3vCR2x6AlrhyrfGcS+ccG76/zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5DQ4nUiYeunRFOSY9YE+opZLL40y/jePvd4SaAvI8c0=;
	b=hWHOORFCU0fR23bnG0d00mB9Yrad5f5WIChkoYicMmeWnxAEn7P+Sub1by/CGRBnfyId
	 m8oNV9GrLKBaGaZz5NaJR4ZH51/rKAK+hy3oh1FZNm6oghn8jgnzCLcuBukEJnDxN2whi
	 7BcuCcAnmY/A3jzQQr0JbMDgh+kwoRcspGvXmkXmL4jy4mWmRw8RGaFZgSX0YI8rO27xT
	 GixEzFDyYLEmx0zUqP4xwcU/XNGQZX+PT1MpihA5sPJ9VXUrtxhIFYn9wjdNcQ8AEGCzv
	 MDd5QVkKeFfuVcdsnHbyoX32/aUputnDlGiOgzB6MwOIAaZ5LIpQDWPpJsHK+3XL5ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anfmZC5V;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2BB606A687
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2BB606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anfmZC5V
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386ab9ab619so2517220eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447723; x=1796052523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DQ4nUiYeunRFOSY9YE+opZLL40y/jePvd4SaAvI8c0=;
        b=anfmZC5VLhD4VBfDaPjGHgAcEImV4TaGeS1aBn4RpFdLo1qnz02JcKS1L5OyWTncNY
         3OQstA5KZmrpRSCmyy5YYdRxM5Pf+w4Vyq9gFYi/WD/kyA2f2vWC9sO1LyYDUzcfv2Ru
         TmBL0aMKk+Fj4WizI8LMbngiINE5VbZOCPJV2hXEQ3CbHVjm0g322WVpF5yyAllj72iy
         +PHw9p0nKMwUiMQflCRRLrQJbCBQRtQp1l8dPyij3m1T0zyrpRFZiKXSlMcaw02gXS6d
         YHt1tqroIZRQ8QoAZL/sU1AP/0SzPce8VGPWDQ2t0wCzUgWBd2/o2K8K6fmWY0jtom03
         zlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447723; x=1796052523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5DQ4nUiYeunRFOSY9YE+opZLL40y/jePvd4SaAvI8c0=;
        b=DR3qyCFacSICVJ9bQJo8vg/w1sDHheJnIzu3p0QdTk/PVAorN2X5FwpHq07NiiHKjJ
         qq/CuhFOnr6YWBguami158fVoo2+20gZ772qh2Rj7uG8M1fX4CnxL3btLvNVsyP8acog
         2sz1+xxNYda+M6D6UQAGSIdM13Ew9u5qoD8I6+z3pxdjlDW6Hy/B4qQUDNigs9s/icZH
         GCPVBOt0+2yo/GrNaypU9qAH2wXD4WCxkz8wgvotY1/C/AVdFOnUmhn4K4WZbseYxbhw
         evWwlHtXQELn1kRomldK6RehPynIL1cY04/cxoCDoTelFCaFEE2lPATq331SJMzzgNkw
         775A==
X-Forwarded-Encrypted: i=1; AL+hErH4E02K/lTkRmJ/8G5h8Sn0cRQNqBmlgMnUqeRw0xwwWa1Lj/0FEeRDHhAUBDwyemWd4DBoRFYsVa6+@vger.kernel.org
X-Gm-Message-State: APuU4Z8s7WZvsngrxDx8B6x5tD4+1nGZB1UWJeIxoMRiKQg7IX4a4Gr6
	rX2Q/8TaoiUDc3qg4Sm2Wyc2BK5HB18z8qZ1TtqpV7i89clvK0t0AYx0
X-Gm-Gg: AZFdTZei/ghrlRh9BGiUoYS/8627YWH+pB94rlFf+52nykWkGJPqjsLI+iplfjvI8RL
	xZPpJsZz/DMlDgsGQQ8arlvo7onIE8Fm7r321/H36qE96BDcu8Ynq/kjkcuXrbcnT8fIw/0ty02
	9e1W/NBv060RRnHZncRZhEwVRBty1Ue7Ka7xwxZXq2ALwlVZod2PN+9cbCQhGzBhbTgk5RZ2N4Q
	Nw1nJYybBMrDfc4+QgGfQDSKO0eWkpxDcljQZM/yD9sDZCUETnsy+gG9lu+HDBZr6Uf1W+2eSzG
	Sre/ZJzL5+AekpeBSObq60q+PmxcSkYhlYNGB+N5Ff6m0pS7DDklcDTKqwjIThtUceUv4oz4J2p
	jCJFyIYXQtYncLhPrzoi4Pvojrb8t+XVkZCMKrX15sBO4f6RbYfkEbLSyJrJVqNT+qDYt7uK43x
	ZUrWEzYeT+OAZqPCPqy/x41C/rod647y3pvRnLKWfRmIWBVvAYLBNn3Jda2NmH9KXB04hebFS/H
	izorwZwKG4BzwW49lfxuYthtzKf/mgq04MjyHgxwGVpWl8LuMM9o9p187eicfhhS2lKM9OZAAo2
	qiTO1QOjqkqfsWib1QKaaW91/fUzPKtzFvNKjsOn5NqSGw==
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr12415282eec.36.1795447722735;
        Mon, 23 Nov 2026 07:28:42 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:42 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 6/7] arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
Date: Mon, 23 Nov 2026 22:27:21 +0700
Message-ID: <20261123152722.168879-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

Add the camera subsystem (CAMSS) node and MCLK0/1/2 pin control states to the Qualcomm MSM8953 SoC Devicetree.

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

