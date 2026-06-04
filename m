Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7017B481257
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581187; cv=none; b=eppOvzfco0FG3yNqLus2sRZ1/Kq3EiUDAF7azV8hVc21fagoNMgvvYNnO8rY/4nK7xO+95VLUgyN8JUmAffJcdo54SMzA1H8C18pOstdz84zWIGHlck7bgM8y6U2XmRiTqXXxwdGVvFrg80tsb+x5NMP0u4zzFR30Ik0Ot1yQv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581187; c=relaxed/simple;
	bh=PruqalRhu/z+DKkyMkBAp0/bJ7evWCq2fSw38PfA5zo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PY/AGhawK1yo1QaJlgRr8DrZbrqucWetQXXZo5PwtrdZxglChqRPpMhM12NSKda03DDaCoZoZDo/+PlJXLcRXRFklE6/m+nBBoxqcEyzPktJBEDJTatSq3lL2otNHzT65uM6UPj84OsskLECgsoi6zRGHeUzh9TCP4dN+J5Kqkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAJwU3U5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAJwU3U5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4600ddc4017so617599f8f.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581184; x=1781185984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y0cyJs3YzhZbMhMCeS+YcB/ZC7ibeA7FwgxaOl6j4E=;
        b=AAJwU3U5rihahWXlDWTX5MTDCBWIB6hKwHJc5GsXjizinfZkYKyUwzkyIxqEbhLLka
         rifQARAZWOOI2BRSoYFveQ8MZfb408Bf5kcGhxBlboOovz/yzsIxhNun4o22mU7Z3M1R
         TP1jC/+7j5cLAjmY18TDmFYelX7oKyDiVSsKQgA+ryDAluhEssyKmPz+quFv8STpy2/F
         JtMU8bKZ+pe6sz3uLDkg+cBb+NzDfp+cR+foBN2iwfJ4PPR5dN6A5gmUaQLHXnJj1uYI
         n5Vpw7rT+SkxJIAueN0Cosh0PpDaWWJcvM8ZkJfbYmhX+cgPnFELQkk72kNZLEbl1JNZ
         /wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581184; x=1781185984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Y0cyJs3YzhZbMhMCeS+YcB/ZC7ibeA7FwgxaOl6j4E=;
        b=a3+G2m3RRWKLdevXgdBAb3GcMpd4Wy56eSN+EJgmBvDeJUOHMA+b+jBxq+PHVvqttv
         EvyuFjXwrI4XySXo1SEObFbNDFXtUxA6iVy8zaiCRhXDrKOfbGL6jFliBgvF4iqFF7dI
         1I169xnBpc+4YJIlB5OtnzeOLLf5HS+aAB5ss+RHM5rTXdmGF6yPHFDmOYbkK0R/NQ+O
         W0AvpWHv6e6o9ILmSolVnG0wPmf7RGnX1dt+hLY/XjPPoLAo2rRA+3K+pyZ7qNjMlyNu
         RbvyOjVHSXjCSjv5hDP3fPLVLXqY56mbA2G6IpI27pG+a+Epq9TNx6tOI0e/36jI/shg
         ulqg==
X-Forwarded-Encrypted: i=1; AFNElJ+VJC092cWtq3DMFC5EiDUsTM/CQrSDr76lObpO9keIt8XqnLqTHn/+aVz9razXuehICKSJOuv5JUYn@vger.kernel.org
X-Gm-Message-State: AOJu0YwIyEOX/NbTtjTxAv/SOTQP5LQO1ZTLnpVUVsJcpTqZKCF8Pe93
	BVt7+XE2CxrRG9saSwEPM/T2uE9uTRuGv1jQGM56K0hkD/HCEh241dSW
X-Gm-Gg: Acq92OF2L2/gStqbf+wYZ6aMEzEy087/USLoFEf1hWLQ20Nxpuzpb6+9Rdp/WdgfL9f
	AmZ4cWjLMDmFiJdBYE+QtfYpEJymsYkFrOIJhEtwhqG9AXvAtEwNqE6lTVzHjfhIKGGkFpzy+Q0
	jZqIVRC9qA+9Mlk+DDVOfQAH1weJ90jJldMCA9OweuaSoktSH2vuZZNBabiXZYw6ZCKP1CBS+Rp
	56IhLqjtN9q7wB4WkAIA/9Foa4odkYJpQOf7bUGg94kMoyV3QW5qDA8enyUO7yKNQtrfywWYBQv
	BnDO//BJV/PFVDaOpm5F8e9DbiXcbTjtwS0i5wKpKWtz5Gknb22RDOLRr4vYoF38WZzpbZiQUUi
	jeuadzj+BX6mqSxxj9UIB32NyJz6ZSRy9F+6Flz9ZkNh/oEdoeL+zKygCmT+nNbM0yBQvX+MsLF
	Z2v62L6BKHoagslDRaJPvJ/lGXO8O/ZRjPSOr2DG0HdBVj6gc5PDPDBswHxQFNFE0=
X-Received: by 2002:adf:fc48:0:b0:446:96b1:f53 with SMTP id ffacd0b85a97d-46021844e6emr9463717f8f.26.1780581183713;
        Thu, 04 Jun 2026 06:53:03 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:03 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 8/9] arm64: dts: rockchip: rk356x: Add the NPU and its IOMMU
Date: Thu,  4 Jun 2026 13:52:54 +0000
Message-Id: <20260604135255.62682-9-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3568 has an NVDLA-derived NPU at fde40000 with its own IOMMU at
fde4b000. Add both nodes (disabled by default) and the NPU power-domain
child under the PMU power-controller, and point rockchip,pmu at the PMU
syscon that controls the NPU NoC bus-idle.

The power-domain deliberately carries no pm_qos: qos_npu sits behind the
NPU NoC, which is gated until the NPU is brought up, so a genpd power-off
QoS save would fault reading it.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 64bdd8b7754b5..50ce5a5e4fc24 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -512,6 +512,13 @@ power-domain@RK3568_PD_GPU {
 				#power-domain-cells = <0>;
 			};
 
+			pd_npu: power-domain@RK3568_PD_NPU {
+				reg = <RK3568_PD_NPU>;
+				clocks = <&cru ACLK_NPU_PRE>,
+					 <&cru HCLK_NPU_PRE>;
+				#power-domain-cells = <0>;
+			};
+
 			/* These power domains are grouped by VD_LOGIC */
 			power-domain@RK3568_PD_VI {
 				reg = <RK3568_PD_VI>;
@@ -948,6 +955,37 @@ qos_rga_wr: qos@fe158300 {
 		reg = <0x0 0xfe158300 0x0 0x20>;
 	};
 
+	rknn_core_0: npu@fde40000 {
+		compatible = "rockchip,rk3568-rknn-core";
+		reg = <0x0 0xfde40000 0x0 0x1000>,
+		      <0x0 0xfde41000 0x0 0x1000>,
+		      <0x0 0xfde43000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_NPU>, <&cru HCLK_NPU>,
+			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_PRE>;
+		clock-names = "aclk", "hclk", "npu", "pclk";
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+		assigned-clock-rates = <200000000>;
+		resets = <&cru SRST_A_NPU>, <&cru SRST_H_NPU>;
+		reset-names = "srst_a", "srst_h";
+		power-domains = <&power RK3568_PD_NPU>;
+		rockchip,pmu = <&pmu>;
+		iommus = <&rknn_mmu_0>;
+		status = "disabled";
+	};
+
+	rknn_mmu_0: iommu@fde4b000 {
+		compatible = "rockchip,iommu";
+		reg = <0x0 0xfde4b000 0x0 0x40>;
+		interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "aclk", "iface";
+		clocks = <&cru ACLK_NPU>, <&cru HCLK_NPU>;
+		power-domains = <&power RK3568_PD_NPU>;
+		#iommu-cells = <0>;
+		status = "disabled";
+	};
+
 	qos_npu: qos@fe180000 {
 		compatible = "rockchip,rk3568-qos", "syscon";
 		reg = <0x0 0xfe180000 0x0 0x20>;
-- 
2.39.5

