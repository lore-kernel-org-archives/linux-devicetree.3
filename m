Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5CC480DD5
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492387; cv=none; b=QKCbvAqSIERvASh7oj/e0LuHhAoKKVeBJLbXwVddvuVqft3gwjcabgnWRCtyT+8ddBMQ4trLoOml0l70DYw9evm97dywdUM6EI+BrKZRzOx1VJdd+34Q2LmAFAWeipppfbB4mWkmjiFt6xRChsgyU4Q4qap2nu61bwAgJSJPUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492387; c=relaxed/simple;
	bh=4h1Q7+2YaPhGhV6oc9CjfjSPT8Bgj3OdcJgRQq8MMEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJZ/ANH1CygSeIu4T2q0/WOGLVlb0es15EeJbPEZ0FavY1nXF7neQsNK0MpNoluKkRLEHGvo3lAliccteqa9+9N+dErwRAvzYRRSskE0cHHypaTL2D3xjnLgi6lGqVWwAiXApI/CGbN2dEXVdHPNMVIvf9qvWWRQNdLwyOu/j9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkwHDOEM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkwHDOEM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49068493267so75672725e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492380; x=1781097180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPCrPM7joQMUH1pWXZjT66gyl3muFxaL8zTs3UpJDxQ=;
        b=PkwHDOEM8BiD0+xCSVeeHVfSGmULZV8AGhD59douupVQ/hUlhsA721fOhEpW7wirAP
         B1YNiC8WC/U9z22VfpQOmaGVVDMLd0KxudRxSeXUSjDU4Q5nEeAYkQenQX8aIVZN8Nmj
         M5vVDSqw84Uz3GY/Hagc+8LfPyQuc304kMFsTrJybChReWpYybgHJs0JFHOwS+ueCGJH
         MWJAOuisnPt8k+70XqFgMVOTTxEKQXz10jqb4uKA6i4ww+p733+A9Aqh1OmC94BbU4MD
         jUep4+O0eKa82Vqvc9IRj/L5u5HyYN4N+h1kb3v0cFY8lCFOdbn7d3x7LwR8ZgKYolFV
         Hoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492380; x=1781097180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPCrPM7joQMUH1pWXZjT66gyl3muFxaL8zTs3UpJDxQ=;
        b=LAz87r4t+pHvU2OzqknQHw7wg0EtdLb+FkeZa2VV568T2PefRoPBi3LJNfWUqAFMzo
         rNBZXBdZiCQQ2aLPCMXnOEVucfdAoQjR9v92ICKKdZhtk35GHZA5pv6BT3cqQUm9sbI0
         SxtOvH/sn/9qwtOUKpUw+3frtRe8JZuPYcpLyCDemw+Ggc39z+fJVkDmgjvHkgfzmXAb
         hBgRhLtEk8Vc/NdrsOn2Ug1Ft8MQqcRpimrf1p6lJn9DEK5IYvopO3Jmbl5gjkaGX7t7
         vY8DSJ7/3c8XrVDPH+WSMB/onnxPN6zKNbXAKskIX1N/J43Aac18Cg3Li+T7Iu0hzFHB
         beKQ==
X-Forwarded-Encrypted: i=1; AFNElJ891WqgIVZ/CqrqjPKDbUcICMYdbtDUOf2h+YpobhrjthheK73xZMszylBprz4Lr7N1ENbPEh3XhyPj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Hf1XbcFq9eDvenGRjzGr+Zrf3BzAJZamF9RaWGIJqHKFqsKM
	RFk4kr33B4Ya2IaNAw2Uq199YH6QUO2k+PJ4F4gBsMXQfIG8DkhtrR5Q
X-Gm-Gg: Acq92OHGYUqbAiTzgIPMdU5SPdaxIxdqICi22vV+QCy0Mx6dkznh66lcmIR0+KOdgTw
	Rtvhe0UQKaqi+Hz63+8gmxSLoaiK1QWq0Yb4AnF5K0Tx0bipb3Vh6r5hbcIDK/xfx/H4B+hTgPg
	K1uIcU6uIPDMdlpbsGrtEst8iZj3YGjR4fJxylt2agGNGIpVB6lKqHwT8onWBKgCf24P0yUDE/b
	TlwHtnVsqroZRLiR62qRVnZ1qXPXT9PMg+/j0mdI23yUrUEedh4RrIAr03KG7wyxfYRbTCIQeHZ
	NOMYe3mjUyIQNDxBvgT8xfkArbYscNwm2Ze93C9mZr0iTQoQWeqFzqf1lZ8OEQMVW1qAlY7XZJy
	p1IXUsiNvmyF5eSwPsE+6zP+tSZJpU0VQJCTBQxuP5/kQwSdxG4MfYBrLmAO247CXBGQ2u46bdb
	m/K0ntYHup4lShxeZ03lSuixzwk+1OMxWIgPZnowEwRVdC2JzN3DXmg3+GC6g7okKyB0wg/lQ1j
	cgWAvInzR57DciGhmzm2Dalg1m8rCgU4nozM9x2r0UxwXe3VbfZXSREI2E=
X-Received: by 2002:a05:600c:4fcc:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-490b5eaab2dmr58645675e9.11.1780492379682;
        Wed, 03 Jun 2026 06:12:59 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 06/12] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Wed,  3 Jun 2026 15:12:44 +0200
Message-ID: <9a937fa5f65dd23515d4e32f8a9cdbe5a674c9a7.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Configure the PHY to use an external reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9500c9bf0f42..a928dc2d9adc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,17 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3

