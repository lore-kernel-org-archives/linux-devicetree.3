Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B842BE056
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784468290; cv=none; b=d8gdCCzZ9TYgJewVRii77/kp/Nt0RQAofIGwKDOj8fND13GFEv3bKYaBnIwCyIz+j1pyGuFPigFgE7tLXyfa/1DZ1s+DGx3WDJe9zU49IeQ44/WuHlKalxywv1tPnENY14xTvQHB+5w+POISqsMUVCGRPlqMVsFZj80+Yz/iUVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784468290; c=relaxed/simple;
	bh=WftaguEcCAcPmKC9Su5TwqMoY3w6a0AarFeIyjamMCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8GgjZJBEsDjhS1JGYdJWCcCqfxgxzKAVDNJXqSmoza0d89qVNdf7TJcKDGBA6Ptuk0u/a1HKGNI2YNbplUwrTDtWATGg0+fmwA2nvs+ORHoe36SWhvE0Um5tIKkdu/MfOsPoxQnCbtUldPmrOgMDDiwSuGAJhwTA52sfg/johA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUugsB5c; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUugsB5c"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590dde14so5187935e9.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784468283; x=1785073083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpzzNW2sfZBH0zCyv8njtaSsrPQC9iQno8eKZX+8/b4=;
        b=BUugsB5cWADzNMpelhEwbaw7eYt36ZsNqOC3WwG7CkLVlT92r+2aYk6nnRzI4Igtv6
         TFrCG4xnJgMqmpw+yVgbyAnr9drVYyDX7YwkFXgC0h40WwPjwyCKwq767MWWfcUrDmEa
         vo7+Rf6clxP4ALsALVghtUvY4jkuX/2nYGs1yDMCjWnjyO7XSNPj0kJzCEhhzJmetmpg
         BP5gPh92Kxpx131pcgaIE1bnVz/JFCLxgebqKcIQboSDmVoPIhQS3Mx8PotfKTGvN+Or
         jPXTtYvNpjPaU9ih2DAiKyA4leS6d9rfkYwol+CtDqZ+5aAu8KZlZmvBxbN8t4Wy+ETy
         fdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784468283; x=1785073083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpzzNW2sfZBH0zCyv8njtaSsrPQC9iQno8eKZX+8/b4=;
        b=kZPw+NyoxCYt7QI1frJZO9YawFNbcvErz9AlzpQuiQy6TNHt5Weyx4tweIcwP8c87I
         fkzlIqZcyjD/rv4gESLrRpatRDnwiMZi7eVdgRJBZIWdDW51NxfzSR3wGSsrLm1gw5wH
         hK7uhcJIxz1oLEi4zfYvU6xuXVRhwSVvYDnuNqtbdKqydNb9OkiEXRGRsUx9PH9MtMQv
         ejeoWAPAFOe3uBU1BxMMT99v6mghmtp19ykJdVOQ8VaCdaESrDC61qk/72/ze6BnbMzj
         BXGUpARE+IYUgfE5rA8UqsjV3rMdN8CqdDR+dhvCnkxU5yOs44MgiLE4ttSbKwB2bvVl
         oysQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsB3AdNLzLmMv/v5jA6O9339RBd1u/O0OjPW3QK2qywVTb5A63NGl6l+dAjJRd7qrOASBwfKWAXmcu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2jieO1gNqabAhlVbSHDbjUOvQNquc1cRZsMdm2SYXPBwJvME
	LXrmT1Dd3sVEezXlO/G+pBa3tDoskKcN2je4og9Kjc5Onze8KAzxCFya
X-Gm-Gg: AfdE7cljKB8UfL84QwBHzBFWe+mg9KZMdeOhVWQ/eGryk+dUA7fZu22J9lfArnwj4CN
	f+wHoVzf5Ec8EbtmdyRi8sQ/nzFvQ9BFbGPV1L6KjcFPBckGrU1biU1tJ8biplCy6n057ugiMT6
	8prnmkvLlQnnaR6sbbvH3x+iSKQKtTk8D3pKl4XfK6RdkGpepz0/Gr6BEmULoBOJ5dRF+1Dwydu
	b3id6O5VnmMjUHKyHKYwuDi8WfX84KKwGQPs9xvQXn9Vh2GMRERAs5VwI+398e3LCHttGx++wKx
	mapUxxtSSMPOYwDrDnDofQ3UE6MhOrlZ4/FS0eycK0qs9526qbtssZN/UUHrsd4gi73BjSyDBJH
	qvTjQWkDgRBd9aqUWRCBwqIRYMxY5vGR0DhFdaJlSZWhBmmpEqRCxEQczk9TSrveRvVr3O0Bzzu
	rX0911pOI56RnHDZyBsram8TjzD8sn5HzyYvf5d7a24Amo
X-Received: by 2002:a05:600c:3b01:b0:495:4fd4:144b with SMTP id 5b1f17b1804b1-4954fd419e8mr72113155e9.21.1784468283025;
        Sun, 19 Jul 2026 06:38:03 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63edda9bsm21807179f8f.31.2026.07.19.06.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 06:38:02 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eduard Bostina <egbostina@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 2/2] ARM: dts: ti: omap: Disable keypad and enable it on the boards that use it
Date: Sun, 19 Jul 2026 13:37:30 +0000
Message-ID: <20260719133730.3551691-3-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719133730.3551691-1-egbostina@gmail.com>
References: <20260719133730.3551691-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The keypad node in omap4-l4.dtsi and omap5-l4.dtsi lacks the matrix keymap,
which is board specific. The binding requires the matrix properties, so the
incomplete template nodes fail dtbs_check.

Mark the keypad disabled in the SoC files and enable it on the boards
that actually complete the node with a keymap.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi | 2 ++
 arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts       | 2 ++
 arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts             | 2 ++
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts            | 2 ++
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                      | 1 +
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts                      | 2 ++
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                      | 1 +
 7 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi
index a356b3a2f24e..b97ab2906950 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi
@@ -4,6 +4,8 @@
 #include "motorola-mapphone-common.dtsi"
 
 &keypad {
+	status = "okay";
+
 	keypad,num-rows = <8>;
 	keypad,num-columns = <8>;
 	linux,keymap = <MATRIX_KEY(5, 0, KEY_VOLUMEUP)>,
diff --git a/arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts b/arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts
index 1d9000f84f1b..e72ac17fdd96 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts
@@ -18,6 +18,8 @@ aliases {
 };
 
 &keypad {
+	status = "okay";
+
 	keypad,num-rows = <8>;
 	keypad,num-columns = <8>;
 	linux,keymap = <
diff --git a/arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts b/arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts
index cc3f3e1b65ea..62f87cf95f74 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts
@@ -46,6 +46,8 @@ slider {
 };
 
 &keypad {
+	status = "okay";
+
 	keypad,num-rows = <8>;
 	keypad,num-columns = <8>;
 	linux,keymap = <
diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index e11d1931c42a..d51913620f06 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -428,6 +428,8 @@ mpu9150: imu@68 {
 };
 
 &keypad {
+	status = "okay";
+
 	pinctrl-names = "default";
 	pinctrl-0 = <&keypad_pins>;
 	keypad,num-rows = <2>;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
index c1afc49f456c..00f98991cc5c 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -1200,6 +1200,7 @@ keypad: keypad@0 {
 				reg = <0x0 0x80>;
 				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 				reg-names = "mpu";
+				status = "disabled";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/ti/omap/omap4-sdp.dts b/arch/arm/boot/dts/ti/omap/omap4-sdp.dts
index b550105585a1..a04234b3be2a 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-sdp.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-sdp.dts
@@ -531,6 +531,8 @@ &emif2 {
 };
 
 &keypad {
+	status = "okay";
+
 	keypad,num-rows = <8>;
 	keypad,num-columns = <8>;
 	linux,keymap = <0x00000012	/* KEY_E */
diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
index 72849e1c95b0..af32ca329930 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
@@ -2449,6 +2449,7 @@ target-module@c000 {			/* 0x4ae1c000, ap 11 1c.0 */
 			keypad: keypad@0 {
 				compatible = "ti,omap4-keypad";
 				reg = <0x0 0x400>;
+				status = "disabled";
 			};
 		};
 	};
-- 
2.43.0

