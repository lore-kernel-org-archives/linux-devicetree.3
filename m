Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AC037AA6F
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782680184; cv=none; b=kM9jStAkPO4d0wRU9ewGw840VM8MB9ZyIdnJsRhNH3qmaoQBvXCCHQMvsxwyBOZqHpnxBJQTLl2sU8p/4gYcJN+5sLRsD6kgHIH1va0DMZz20dBuyN+7IlTU0l/R6FvJUcfPH9y6WQoZnpo7C9XTuG/ym29/Qjc5E6+Azn8+f9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782680184; c=relaxed/simple;
	bh=PzEoXbKsalgHmdDHJDu/eXB7upLld2JvXdex27Wp9tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFYlkBmRSoDnuFfRo9gJp98MZwBN9MV+OonSaXuulY3tFG/QlyJV6ZXGYGxgEwWzpBWPL60UXvh8PVMfHnh1QJztGn0DA1vN6lk49UQEGdF/HzQW2jBeGauKF7Vtv13PlUofesRp/tV8Obd4vPb1/6Xt7UxS9RQFKB8NiEt5uI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBLL0UhZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBLL0UhZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46cbe01d4b6so1484040f8f.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680182; x=1783284982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KArzNrp3nOw1lgRz1Z+GPBMY0eXF9VWyBsMl6ogscOc=;
        b=dBLL0UhZF0vk/JOzWciBpMRplPwoptgGDcT+hyRPjQ2x3ctG9XiBEOmwD47sUdNhz9
         NvMj9ZFdv7B1Z/8FI1MK8emQqhOiL+vBN2XA2RwGOFFby5fAoxdgqbmePmqZERWT3C3W
         zRPPMmfVr9QwwWkMY0RvBo16oTpRJxFMSGLkoD++OkjKWXhEklEgwE3xtxhdX0/+czFM
         rjJd6R+jfO8njxVYgitPegrMz3S0YkKL92ftdZrLFfHRxNoJX4s/MgPFTY7xSkzofjs/
         Cll69f2MFRKQgbl22eHb9Z8FTn+h1XWND6ch7bVYfTDyfAtCLwmbxqSqIoHTGUgRA6Yw
         i9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680182; x=1783284982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KArzNrp3nOw1lgRz1Z+GPBMY0eXF9VWyBsMl6ogscOc=;
        b=M4dFiqIpL1DaaaeZH5k6LOAzYOkOE6P6VXJNZLTpAkn76q0rY87p3+s2oFuAaKAeKm
         KV1D5+aII5ppNl12pyICUEy0f5M9GrfJog54074zHKVSrLgNc6cgYeNXWJwtEsDq5JyQ
         Tz2C1hbfod2Mp8HGcPGGK7UBNFzLSCdswhVEM5XreCOXksg6P9IQLV1QEu6ZNZALZr5o
         sXvfLUIwZQuarF3okuI+bLR29HAPWUjp8Kmjazjdldu7ohydzDIq6Zze8CD+TekNRsov
         +pS9CxXe22+qffeP+mjCgaFYnTQqjxuO4P36mDtAqcP4NIJ3+Uo9IwAhX6eIy4v1va+6
         /zXA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/7O+pTTm9iouEKdN8npxecF/8QivEVLyLXqmMRyuLD8Z3ZPOdnp3ysZZQdZz+8oSOTOj4uJ4hdc8F@vger.kernel.org
X-Gm-Message-State: AOJu0YztKsAR/Fz5XOiQyjsAPYyemzYDb2ljKv0dZ0Y/xBY4qMsuNO2M
	ucYlq8JjfagfBM8f+NhoP7XHB/HmM2a2W+d95qLVJ0rSFIOPaZhI/29r
X-Gm-Gg: AfdE7cmH9Hc+dXIWoJ3kJFJXpeu6/DR/CUgvJtrcyEGfmcU/0p0h2dM/P1LBowSjaQ+
	Y6G3o+rckvcR7KCmsx/QkZIyawVybHMBQ424ulGZ0cng2/TbjQhi9Le7hleyY/q2DfJfX+Y5jl8
	m2L+KV/e1KeNCtQ9f1sJxZUtI94fOCLv4kVMIIIiMHefcjqX8ltqsP/0lHzV9RzsutJTC5STuqN
	8GD+twgk47sPMH04SjE7bLvVBP3UHyRB2bMKU68SzDtkB5YQlfX7yuM1Im8SaC5GPzP00p5DhII
	ShuAy3U40q/juOags6+t1C9iOfTh2yNH11B+y0H0hViz4zJJowTtzJSf8wrgQTJb542r+XckcET
	pGigND3SNbqoc79tin3F9rkhQMqCkTdfAyUvEUtQvwZ9VLkHbMKXoNcDUS1HAxCnaK/HnbQ5q/P
	Ym+7GHA9dWwksfQ/Cri3wELT30G0Lp5oQQdTlYH2VHQJ0uFb/u/af53fsLE7nRUjDDUrh7xugsk
	JFGg7U/X1fSCAqAaHtNBUeEUFjHiFaAjVLI
X-Received: by 2002:a05:6000:4007:b0:46e:ed68:d249 with SMTP id ffacd0b85a97d-46eed68d2cfmr16832946f8f.3.1782680181530;
        Sun, 28 Jun 2026 13:56:21 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f86c34d76sm19448910f8f.3.2026.06.28.13.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:56:21 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 3/4] arm64: dts: am62p5-var-som-symphony: add touchscreen support
Date: Sun, 28 Jun 2026 22:56:07 +0200
Message-ID: <eaf0479114137e4472b4adb3df82a5bcf78405a2.1782680023.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782680023.git.stefano.r@variscite.com>
References: <cover.1782680023.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the capacitive touchscreen on the Symphony carrier
board.

Describe the FT5x06 touchscreen controller, configure its interrupt,
and mark it as a wakeup source.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fix commit message

 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
index 5ba4ed56755b..5c41647ff43f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
@@ -293,6 +293,21 @@ &main_i2c1 {
 	clock-frequency = <400000>;
 	status = "okay";
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch_pins>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -307,6 +322,12 @@ &main_mcan0 {
 };
 
 &main_pmx0 {
+	pinctrl_captouch_pins: main-captouch-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01b8, PIN_INPUT, 7) /* (E20) SPI0_CS1.GPIO1_16 */
+		>;
+	};
+
 	pinctrl_extcon: main-extcon-pins {
 		pinctrl-single,pins = <
 			AM62PX_IOPAD(0x01a8, PIN_INPUT, 7) /* (F25) MCASP0_AFSX.GPIO1_12 */
-- 
2.47.3

