Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACA43F4DFB
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070176; cv=none; b=lwOFblcOjheQqqEi4H+dY8kPRsWGkaeRRw+tnZpmDs2vN+I9MD0JYFC1zCFL8RbZHcA+5OyIiaHYW6t9HVZBsvfCO6ROmo54B8qIPOFuOFDVXef7XEiMv8wi3fFUHkVM7tBUmNOEd4bLNvomq5NE5qTtS+cnOTtJxJWxG22OetA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070176; c=relaxed/simple;
	bh=pfzdD5QBsrRG+g/YpXX56oNZmnkuRJSc0BJAKCqLm6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pYyciLHMpFIgQrS60K/G26JiXB1thWObMHOduqHyacQG/aJUR3hfhkXIqGmZvUOr8swhaYkPtv01cgnBQAy76VUK/0chZOEW2Jd5jzesssISApno5VykQS4OwRshad7n5q3H3qacnuwEX7WGhzIPvHHDN/xRj3MXr51P+k1v+Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjPHzpsH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjPHzpsH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso95586145e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780070173; x=1780674973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1A+YljpcvCERY1OoB5p2TF1PX3S8oCba6E+e91fZVo=;
        b=VjPHzpsHTlvc7cFwGrabzlNhwOgRmE2x/03OFhZLgKmW6YR5fo8DeNUsRX3Nf/vUmP
         M0FC+lgdxfY/eFIYrqs02nzq4YcF5dpFZDP4D3I0LU7FX7eodP++mi3GvLmusOKe2F+V
         Hu66zfIyuAs0EOvJJNnhvBTTlo5n56Y0QBagKn/kI9mJfTPtwp4ADiVXsKUO7ObSK+CF
         LqUqL82a9UH1eoZnWCTbsrgbrFHSF2j4AxuqOn0BwXWTSxivwCY9UaIboGnasbvh4O+K
         YSmncEneIYfjaM1WZJ/pNfhlj9ZThU7yZQZ+w01WbRwviBQYefXmgHfEjtrp6a/d4U2v
         uXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070173; x=1780674973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1A+YljpcvCERY1OoB5p2TF1PX3S8oCba6E+e91fZVo=;
        b=jZznstSXBUAodjqpMmVyoDiqlig+dDyJqMz3kLfrhpHTfjO/bWQvN/nkd8aWoqhS3s
         uMRoMa47eHhH/DqeZPZOL99psyo17QVBFoZQYB6jRsZNZAfzNuS6wcptaHvLsrEdQPzx
         lg+t9KF4qmgr0x4dOaqtDX9d/MjVlObuSxXrHYyev2LN8U2dnWEBPQC6ApawUYTg91U6
         Zv8/pJVmL43lzuitfUiYl+2PArm0HF/EiWWzwXf1tfgR+iWWkPSzOidDg7HWHYr2o39v
         0xMGhR4nQrXs0tc6Krpu9LJUllzd8iRLNqcqfqpnqZl7gK59OniFuIvCcuHeG+cf4o77
         L71w==
X-Forwarded-Encrypted: i=1; AFNElJ9fX1sMhMZeCe33D2ZCkn1mSLjcVm5U/TTaCnKUEqfae6is1xoDhIOKjF9xJRxlx19KVy+BzexaJR2H@vger.kernel.org
X-Gm-Message-State: AOJu0YwnByyDWye9dgFa3zxU/ejEPgnrsLea7Iw02aPDeByHtVp4Rrsx
	xQVph8HSMdd4H5do7T6lZ8ZyKNvbU266T9krwe8E1Z+MnfAhtcdqSn3L9c4tFbHC
X-Gm-Gg: Acq92OEfzcTRa4/oZ6WbpKR+lx1jBGY3pyA3OGtF4VYH74u6oP0dpUE5DFz707PAZEA
	g1WZdNf2ieLiKHPmZHqtz67t7Qya4V9ubUTe+1S9dMbtSZjkkVtAw6qYbB1dkxcqkAGW755Lf1b
	zoWpVwzr+t9xzVS98m416Zmg/4EEYI/bO338bxxWocn8bso3+y8Y7p2HdtigP5sgltDLT2SVtDz
	e2h520OXK/iY5Yxe9f3mVYLqclnkx0q5pf4G54rkuiyjrhsRFjbPVlY2lIkl0tZsfGy54kIul9R
	e+LRca99LjO/i2opOh/FKkWRyGpMu8EyCMB3GdBMRcDtIc5MkVGpwYE0e5n24X2SbcmFXTpFpma
	v+L+8p0qANu5KNrmlax4yvST5jbTtc3NqjEDoSywxNdQixJ3dhuNGgViGkF/ot2nEuiCwHV3qwW
	a21M4sLzgfKTOJdW5CZaX+ruOKyyfNVynG6eUU1RhOyuBpVDBMrhJLWiZ9tCumo/zjvNwOidxvP
	Buv+pmixB0j70sJnTFxC0IePv3KDO3SUhwPjm1g
X-Received: by 2002:a05:600c:4703:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-490a2915c45mr3835355e9.14.1780070172686;
        Fri, 29 May 2026 08:56:12 -0700 (PDT)
Received: from debian.tailb81abf.ts.net (2a01cb09e0354cc878d00097536575e1.ipv6.abo.wanadoo.fr. [2a01:cb09:e035:4cc8:78d0:97:5365:75e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm55150315e9.15.2026.05.29.08.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:56:12 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: rockchip: rk356x: Add NPU and its IOMMU
Date: Fri, 29 May 2026 17:58:23 +0200
Message-Id: <20260529155824.3099831-4-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260529155824.3099831-1-midgy971@gmail.com>
References: <20260529155824.3099831-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Midgy BALON <midgy971@gmail.com>

Add the RKNN core 0 and its IOMMU to the RK3568 SoC dtsi, mirroring
the RK3588 pattern in rk3588-base.dtsi but with rk3568-specific clocks,
resets, power domain, and a rockchip,pmu phandle required for the NPU
NOC bus de-idle sequence.

Both nodes remain disabled by default; boards enable them as needed.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 8893b7b6c..2c2a57ea3 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -929,6 +929,37 @@ qos_rga_wr: qos@fe158300 {
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

