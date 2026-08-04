Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D9A447813
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833564; cv=none; b=V1qr1/0wNZakJCLwe1PyD4/VpnigQDWsjMpxakAqCyLS2bklu1RnJzKSqz4EAgqFyAHNA38cztX1vjH8TbJ8mO/Mz6mP6sNLKV9mHbEiIbi0Aj1DowHjMj5M6qmAEictxgNS4i/LyuPIVpxJziE5Sbmgwq8WCRm/ESFfrY+a11o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833564; c=relaxed/simple;
	bh=0aK3nrisfIvMUC7hMzoMx1aGyZsFxW2jrw74ipuIpwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AMdd9l2jDq3b6OahwCm/Gw7lz3lysu1M9vykRpHTdAcrMID/bWu5eEQPqnnoOhADvatWP8Wd2xPcG9CFMsH77uDrpVcqKe450kjIQVRcocQdD9lpnFXb03uC1PhZQCn7LvqFFX0+Q8yrrGZCcL6uEQn1z5MEG74PRXf/G97yWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRAOUoa5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRAOUoa5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3790194a91.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833562; x=1786438362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=IRAOUoa5Fu75vOAr+nDQmTX21AjDq5fnRNkRhtewt0/rrwII7On1qfaKxdYX1opMo+
         9tinDeQ95Ext4zRkzWzZcU3OW5KhH0p7Ii8cW0rxe8psAhKaiDqCRSrcPUdWZQO2E35x
         U+tFyl4rtTObrI/ogBMoU5wtxFOpRBAYpOUErT8eilTDPFJ7RX0J+ldH/ZvGUXyr4zJZ
         6Ysq2X7HPdisM4cKapR9Qf4ygD7mrFAHdFJVmwoOTglAJfOZ6Wn4cYbdXugogvQ/jgac
         tvZrLZap96vyQd43uP8GaRYVu/4ouhuhpccH7NMelgY29XD5D3yhPWzt58TAOLxCxdUb
         R7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833562; x=1786438362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=DlWwFoHXlu+GQOjQJee7q3QX/uosT0FvSAUfK7pzdAazCCRlRUP6UhKzhUm06CkYC4
         8iRPWlNN5jhMYUK8zmYbuqGgYJJJLFWMDZjk8W5WupeX1M/cAaL9SrPQxJ8CZfw3fPC0
         T6RZvF8Vvdw27kbtBahRIGzzgStlu+vc/g7nZG5haRWoj3/SLPY0YVPdtBzwBbhlnQbJ
         RMjgq9036dHLDCDXwK7iG4RvUkBlbfpUC+EnTLboiMjsPw/XuU+r/+Xz8vpuQPin1+Vw
         O4tMRWH9+k0dkoo/lzuXMSp2VRN0yCMoESqtYS6uvQOZcarbR8SZ9phtep4dro+UXwqO
         4LcA==
X-Forwarded-Encrypted: i=1; AHgh+RoBxWydSdzDRDxkwTmP44lY+vEH+/7qdDoh/VKZNyNkovCUnT7DlIstQ9g+/pFQnUk64xwigyy7NPrP@vger.kernel.org
X-Gm-Message-State: AOJu0YwckNRLQ5DFd6ysFWTJdv8KFp0AzKN0j+l7d/JsotzhjjxkL1QE
	dSGcwoji7gXhOM6ylFfkwVBs1/CdrBLtrdMjx/UKFnIgRywWFcsZ+4fi
X-Gm-Gg: AR+sD12EZrZq+g/n2TxXL1SjGkRfy2BKkiUPc1m3xoOecdM3dr5wCe0XIJ4kA9lVtCo
	srjE3+2tiamBhdH0vru1CpDhABNlr6rxF7ca4pBDyHn5ow511o02N0v05qbMAITWnKV6CPiUtbL
	rjkzpcDm9m34i5p9pxQimHtKxh9MNVMWti6C/PxNm+bQSF03EsjRVMkom28X5t4tp7j0zVISYx6
	RLUM8uKqgAjt7M+y4VVbtYE9fyX5tnb1P3i8KQX1L2ElPPjocwHpNcpvNZbG+ONh58Kd3pjuJeQ
	Um+zhzmLDFF17RpOXuJp4eC208mJkgZVTrVPL/wqzaX83XzQfrAvXD2l0a4qE1I8ZdzFaY9GNTh
	lPfbsU+vC5Ogq8Tj10bmk7tPamBFbMoEcG0kLBRxxutriDq3B4Qo1g1MYt0kfTJ0KNTywtml2XN
	O1E0R87eyIlEX+nfiVzGExNsnpv+yKpiSjpEWK39AKzv38n7e2o7FFfX4fMZWXcMkaOk1wKe1yt
	S4X0jQXVUtg56BnvMFNpHSvFYwZzmIG7Xu1zK4k61fmxUs=
X-Received: by 2002:a17:90b:5867:b0:38e:bbe8:5be0 with SMTP id 98e67ed59e1d1-38fbc4adacbmr12546764a91.25.1785833562389;
        Tue, 04 Aug 2026 01:52:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febffb36dsm1012000a91.7.2026.08.04.01.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:52:41 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v8 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Tue,  4 Aug 2026 16:48:06 +0800
Message-Id: <20260804084806.1846570-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804084806.1846570-1-zychennvt@gmail.com>
References: <20260804084806.1846570-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add I2C controller nodes to the MA35D1 SoC dtsi file.
Also, enable the I2C2 interface on the MA35D1 SOM board and
configure its pinctrl to allow communication with the onboard
NAU8822 audio codec

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 20 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 72 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..422468dbc3bf 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -57,6 +57,18 @@ &clk {
 			   "integer";
 };
 
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+
+	nau8822: audio-codec@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a> ;
+		nuvoton,spk-btl;
+	};
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -100,6 +112,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c2: i2c2-pins {
+			nuvoton,pins = <1 8 4>,
+				       <1 9 4>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..28488889f564 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,78 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@40800000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C0_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1

