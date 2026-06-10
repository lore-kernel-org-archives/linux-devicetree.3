Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7264133F38E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781060674; cv=none; b=L/gZvDyBFXpTCa+ZwJO0tqL5xVj/oKA3k0MbgTfLczZPVW/AoIwVSn4bdwqBYCdT0hPAYw/rcDHPmcTEkbRPtYEe/hXKj8UP1PTzO8xwuLixln2kQOq+yGFbI3HjJV08vDfHECkM9+G14Sj7mB2ttppZqtU0AtNPfnF0EeBaYwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781060674; c=relaxed/simple;
	bh=9V0Bctfe83qD6wrm60uNu+uq1PpD9Naah0bpNVRvkYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pnmB9TRXdqU6/yK1pJIg3V3jDYFnSyWS9/nHderO0qxA3B3Qq3NUpfB6WefcT0a8rRTEY8G2X2CqoRlwE9/nzs/LfbJKrzE0/AgC3/NGso/KW9rGKopXh5FpXJSUKr26g/fD52J3mujFz1mV/ls2wPdwCCGcPS5TXK2U6geU7t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itfaN/Lz; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itfaN/Lz"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-842264dde84so3587029b3a.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 20:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060672; x=1781665472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLwdnFJkTban4EYcPq7DmxYQAfDer3UBe95lCccalhU=;
        b=itfaN/LzhxYIh6byJjTuqK+LdMmMNOX/ZgWmetbgTd7lGAi/56KBdOpJ91K8uFySiR
         HCil/ZoPiA7+wDA/sBDMD3RjaOwobumOTPK4h+83DW8/lVgoggvvByDcFfX728GPtJOv
         HXgs7stDt9fzJhJC/SU6jFoiePsBdIFIRfC3pXvFkGJpdsVG/K8WiOk5+l9w9DjNbJKf
         We2LtbfpBlm00qK+tqc9weTmsZsoFoIG5bswD+gaW7xx98N7KuDYwfFgsuPBWY0j3WUG
         ll9RYLgdCx3GOS/MFaC796l9AhfHqXvLEZc8ZTqMeIwy8zCwxdphMniLz4n8FtiDtgww
         PJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060672; x=1781665472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lLwdnFJkTban4EYcPq7DmxYQAfDer3UBe95lCccalhU=;
        b=bFzjqrUC8BPR5HJhi29o8so+Xw13aDxBbKy+4OnI2rJeZBeqfOFHESHfb/5yjg362S
         62CCYlC/FIICn6uvlPm3Y1HrDT0xkFm6xu60hbiMueR+f0cGt7niik9FsihgrvCJe1xv
         5CCxb9f7CzSpZFJDNTsjsa2B+3hGZltcYY9rd+nbWQ1dW1mRgJ7993eKr3ACdyhZi3EJ
         nikdAWDbmlDzlKIRHqJF5f+j0tcV8JLl1Cndx6/UrxQpqebqO7dJzV0Qu1WJaEn5Z/R5
         SLVqH1RMSK+s0gIztDj80/mAgKxC7sgh4yPYVBFOLLA01VN8ccXe44OObDYwS4+bhmtE
         RYBg==
X-Forwarded-Encrypted: i=1; AFNElJ8HaJwvcq7EC/fxkm7ou7BJ8iqmMv4XdgUBbtZgaYMn3i/cO21Ij2u3yjd4yjfxXwhd70sNwnDpa+R0@vger.kernel.org
X-Gm-Message-State: AOJu0YwGgRdpSicQsdKkzyvc+OKA8fPbHzRpl1ucCRzDZI2rlQC+iLn+
	6WfywFwVIOcdRH7ufVDoBH6qj2a8t0jkTQsrTA3P0o25UNSlroIOhJyx
X-Gm-Gg: Acq92OHGFtp2UmGX3HaJt05yVfgeDNUmxS+UVReYJhgtGrRJhA5KM4mvyx+u6u6kVJc
	V3oRepHfXtZfxbSix/0fne+bzAzYkFXUpS9PaPiqKvb1HJe9OiupaiDxjYMOhkZ4H+rxiQ31ZC9
	zb9p9xICofsCo1uetB4rBFbgyx2DWH2PlUdHwwOMieS90r55pd3fBHmEgZdh3d7TVHG/UuBwzvW
	XxTZZmcf4fhKYDMSI/YD6Mx8SV6hogIOoSUo2WYSaxzDA/qMQx88ax0olc2VdmJmOSoLn9CAH/Z
	JKHvsh5WySMMQIdhBfWSfBsk36J3tWS88JjHFaFe/9HQ+9DnIrD75gmgR+au6Z2uSLSIQzaTgFu
	Xrzq+JVcemzzeTWesJijPxkqDA32FGtiAPVjO6bb5ZaTpnkeJ8uelBrJtS9zY3xqTP7gkMgFOXF
	UApyDW9uH7YGrGEUWjFIbtWrDAsMqSie1v6tpLeZzjp6b9EzUVAFZQlqQd10+edYqF0yIqOCv4L
	25N0t41PAHz8Emtwe4B
X-Received: by 2002:a05:6a20:4387:b0:3b4:661d:8405 with SMTP id adf61e73a8af0-3b4d39f7d02mr20694441637.4.1781060671689;
        Tue, 09 Jun 2026 20:04:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm19927082a12.17.2026.06.09.20.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:04:31 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Wed, 10 Jun 2026 11:02:08 +0800
Message-Id: <20260610030208.2020275-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610030208.2020275-1-zychennvt@gmail.com>
References: <20260610030208.2020275-1-zychennvt@gmail.com>
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
index f6f20a17e501..4b9ff6d00631 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -55,6 +55,18 @@ &clk {
 			   "integer";
 };
 
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+
+	nau8822: nau8822@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a> ;
+		nuvoton,spk-btl;
+	};
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -98,6 +110,14 @@ pinctrl_uart16: uart16-pins {
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
index e51b98f5bdce..fe9e0895beb4 100644
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

