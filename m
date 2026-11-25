Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618571;
	b=qEfozHNRB7WLVg3W5eF5G/oXZrsDKbJ/Bp+lJURoa95B/avS55REbcbM504mD+6DFBmi
	 xCHnI1BOZdncA85HeQssJSuadU0HPZjYqhjoJ63czGQypzcYR2zcuWMco6QVLtcBLpq9/
	 GoM/WXbUiLxB6Xw8dJeR+TISPBZ/AldWhESFmLvzQVR+R872dqfP34jfMY7DIFQnU6dUh
	 318sIB1Vs60NGoD/JChPIl22MExlnEFWH6isLtShVT2RgFeVnaCKfRbIpkLhA6tOjia1R
	 dMF/BZkNAc6JlBycncNJetIN87tndR0w8y0oQrkKfSEszi/40gARpO/c/KI+7X/kEnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
	b=KVrkBTqHCDmmKNTHEENPzpgxXpOwniut/zNfq81AyBmTOcsrUZG1umE1EfG/TK/huPhp
	 bUadBjg14UiOt8mwjFMmSvwflohrZ1FOXzhlViFgNUg2X8Tu1mqKkt9d1Tou4xFLLPo8P
	 efl0mwmUjh/R4JQoxuGRbDwOy6qofhSotjdXG/b9BTMJDhgbgeuQTWFwpZduHcaoNaDkZ
	 Zxp/qLkcZRWAHfP1vvlQhBXgNelY+G1qtJ75HpTi+cdgenmaELptrcWyxdMbJk9uYJ4AL
	 zqE2AefyTNdTjh7KBlMvw44vUa8JzIhkxZxRuTbpV1AfeX/5DipfklSoXYpAh2F+J6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyBp6Zzy;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0BE606A330
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A0BE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyBp6Zzy
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so50756435e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618569; x=1796223369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
        b=NyBp6ZzybTgL5anA7PEentaRAANmzFTfxfpbAfB09gjk5clY6CenD3BlfincLQEiOf
         3+7Udtjkd1LcHafzRTG0PPSuUmZqH92mByg2bepvLe/4Qhsz+DMX83b2Y9NVGOG0g7ts
         t1qCFom9nM2irCvkukudEu9KaU8s7Jd8uuBwQwLpIh9bY8DN/dFXqxNF6XzA3ja7Usb3
         6hFg3N9Tog1NWZAb+iQ8ZpOY1qe/Y7BB8tFgc0jmswKSAefPw8gOFTl8cqVmIY853W3X
         rtt4ArDelubu9wxmlmA8q5jyBeP2wI/FFUgKM0aZ77nnifctX9fU/K0ZLZQ4YmoBmehm
         0xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618569; x=1796223369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
        b=oVFyEWICYtkie/XbMFWfPhdZnO7ghpoIzprup/WMgC7pjx0Mowqrtm4+B7x8ZTQZD0
         bhRnGL8mKWgInghhROtvR2jid67Xvdpn8cc+ezx4/vuWBlmxWUVMEE7rEMwv0noEC4Ut
         +t3WbGHY88clPxI7ivj3qTlro0vJ12H4rfWr3YlqSV2KhQq2D5KHhdMPGDmwy4HwkM+P
         at9tKA5W5DiEIbFb0YEFc3N7Elhx7nvrgbhbOGP16afMxncUX9zxMqKJAVUlEs2l+qWa
         qnXBQLVifZm39TerSYkc4DDx72+MGfuwTbEqRpRQbuwh9duMz8L+Gw7Wf+8WRO6T9Tty
         T0IQ==
X-Forwarded-Encrypted: i=1; AL+hErEBHJUfjiSKY0fVeVG+6VVxhwhyXDEPMFF4EQcBhyCymbSxss2FlTwMg5PYdCeNVMgyIkHfHD24Jr3x@vger.kernel.org
X-Gm-Message-State: APuU4Z+LUA/BhQpwEDTqmTmNg6xNVo3ipszBebdKwowFCcgbVfMDrTxJ
	WUpyUU0ItBjXxOSVWDGjtLf2n7Vv1OLf6bMTwMcZNk0xMQVG7/4LLp9L
X-Gm-Gg: AZFdTZecuG3k4g9u+ACgnyyPprH1dpnnnoskwBjuuc0rpULzxNgD2d/awo0Rv+OJZLV
	yaQzry5Wb6nOWq8+ea0j9gMhdOvbdiOefL5bY/+rQgz4RS2vnsHL3X4H0co9zW54xWWy0s4CJ+r
	tQ+2ETn5raLemD0pX1M/xvwvwJH7/rfJPC2tM4rpvIdFfQ8GrGAx1W4Lrn+10vFH4fTf7oHberb
	KeHrs89RrU0RLI3m6m5LlDB9E0H1T+nxF6rou5sXWLq3wRkGRIfkrrilWYHl8x+1LnV7dDWs5Bv
	BbFkxDlwGbJTlBzPcqxzojF2S/JUhXSJcZNof41bAgg3yElU+/hmnLkqTQAQk76TmN3W2QFJL05
	/8HMlspKOkRYu2DVJOOoGK6QEVfcH/UTEVLfuPJFrtjzX+LgW/5UJMaPf7Ih/L6EcX0IPnmCc1y
	zqVGUVBAtzTon4Zlb43Z3nyGhHAxySsrgX65Mhd50bfVb1rwJ5tR6vzhyjpUr1t64UjDDR1WofO
	9rn36TvGWnE1EjMzJhg1c5pYr/GKjYslPUkNc8ojlzrdQPUtAKGqENdSVX76wW+kdiHBXJTSzB7
	tK2EzRKo9m2ksz1O/xCDsIqZl4QTAbivc1hxCSdB6hOq9uBHfwohxtnLYZfL6dWwUpPzJ1BllFm
	Sq4Z1G0mJL/RyDRRQxNC+KhU0BVTTCSefd2E=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr362757815e9.26.1795618568725;
        Wed, 25 Nov 2026 06:56:08 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:08 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/5] arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
Date: Wed, 25 Nov 2026 15:54:56 +0100
Message-ID: <20261125145458.2594179-6-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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

The Samsung Galaxy A8 (2018) has an USB-C port capable of USB 2.0
speeds, used both as host and device, and is used for charging the
phone.

The physical port is directly connected to an S2MU004 IC, but until we
have support for it, we can still use the USB device funtionality.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - None

Changes in v3:
 - Move status = "okay"; to the bottom of the usbdrd node to statisfy
   dt-check-style checks.
 - Move maximum-speed property to device dts.

 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 4b1961ca365b..f93996e7321c 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -59,6 +59,12 @@ power-key {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
 };
 
 &mmc_0 {
@@ -112,3 +118,25 @@ key_power: key-power-pins {
 &serial_2 {
 	status = "okay";
 };
+
+&usbdrd {
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
+};
+
+&usbdrd_dwc3 {
+	/*
+	 * SoC in theory supports SS but no known device (including this one)
+	 * has it wired up.
+	 */
+	maximum-speed = "high-speed";
+
+	/* Force to peripheral until we have Type-C working */
+	dr_mode = "peripheral";
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
-- 
2.56.1

