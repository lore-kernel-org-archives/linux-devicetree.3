Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7E442A82
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138038; cv=none; b=bV7vOD50UXCTGXO0tVVlr3LZa0axKNzIQRa9QG81bUY709MUCy5y14RNJh7+lkfQAcpNWebiUWg15GcjUu+QehWKEL159VD9eiJ53soHKhIWYM5rhSHVCYDTqQlhXxi9prSMH3sknPXkHhfC2OZ8rdhmXSfHpOw/kQqOecWKeR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138038; c=relaxed/simple;
	bh=g6p4i+BHr3Zaaaw6Qv4lSwUrvdEWvb3uKZ2V88aqy/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMeE5wJy4i5OHE1+oqBXHk7bZ8Ub2Y0CU9U8oNrWclepYkwm23ZhM65/UbQJVsjqZYaeguiV4CQEA8xWKIKKYG0hwcLglR99Tc506b8eh+o+EATISJS0nPcvtRRUNiV6HUqM34yRSyvcRPyZmh3/o8XrwDEII8gXrX7XAfPwJCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Tm9Pvbfo; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Tm9Pvbfo"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1434509f8f.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785138035; x=1785742835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgqY24t2LnW9I+18Wnpp+SZS+jYp8rky2mYR1kjD0VM=;
        b=Tm9PvbfoimX3nXDXYxqdaY4pl1yuUKI3uij1G8c+FuDY861j6xeIoWkCuJypEyQk1M
         k1BfvMjqhZ6b4G1tEWe9Um4MoPb21M0sshC6G3DddY9DpDGgJByQG/wPrKfT3La6Qclt
         rydnJIRrNsbLhxorHMABkT2zz2gJg+7955MLXWyUGgGZQUJDLBKyr9sGMHEcoNM4Lfty
         bMZls+THvT06Er0y3QNmXg+F68l6KDq3TJZsAJLep5rFdlOHdtTc02s6k4ep6tTSdTL0
         yMVk+nM2Bwy/4ehfAVUMAwbHN7wZWPZ/2t9WfnrZNWgfa92Le4puVua7i0al/RvmZNUz
         caEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138035; x=1785742835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgqY24t2LnW9I+18Wnpp+SZS+jYp8rky2mYR1kjD0VM=;
        b=ndYFC3o6X5cZKH4p9z/O+7av9MSbkKpAILpba6hjtRKjMGqFRkxVCfT0ZcVDbF67p+
         cJLw5SvaAhYMah6X3NMc3NW7gOCU57qu9c84czsjD/I14ner8qCe6PNZdYiLUw4lSl+f
         zcPIYj+xSLJi96L2XyzDWN19MFmsZGIplwAQvmNFJLD9HDhlUeW9f6OkR8mx+fShrhYR
         lFW22bhHIgiSwKqNb+yxXdL6YCcONDikQttDOJEgGJ3zXA3YEIRbQ4ORq52zaeQ06N0+
         omDiwZKC/HOxi0wA45chWCaAHUDhg2debyJ/56LUiWl8MZzd84zbNZJOEK3pdN6G8Hg3
         wHNQ==
X-Gm-Message-State: AOJu0Yzm3YyxLat14MH+37V2VoY1IPEx7MDC92ZbIEpe00ZIuZNWrHAx
	z1z5kvRKrHCEjZShkm6TYsHIf2Ptr4VnX7Nm4m0dzOwtl7DUuqZfv/5kARpWubEqttw=
X-Gm-Gg: AR+sD13thij7H7hb/xUz5tgalRzPxNI6cHQHbVNyDIZPy7HYGA17pNQE68msaxNbWEZ
	xjMkV0WKKPuVo9TBVXTICGc0a10ZPb4v69v1Ue4KcBUAuWI7cAi+Tz/vIHHVL8q+RQIny59CX8I
	CNYtuNzncItfQYwLy4nJQ1DubFpZM/tOkmE5iN2rXuJuyZaUWpDErgUbx1tcZ+xXjDhhy+16Ut3
	1IL9GH2erhQ9MsWPYyqdTxWdfSB235movs4H/1lZ+Ne9khjM6MjtAC9N/p5BwEUM8AQcihuFeGB
	MQx174euk4DhvS4S/S5QlXTzfWAiN3meB6BATAlBwyDe5XeqyIDoidpeB5nrpb9CY76FQ1TaSrY
	RBKYDqEFj51FofbDEsmVsJM/BBSjb/N+PYgw3PAdUZLLmP1LCX8ntkqqCYPuVpL50yymqK1UaEk
	JCWdlILt+W39aEMES1RZKeNvxQ42SfxtuUiorBMGP+jtLed/b5hEiIvWKJl9BhXFDO7BlxeXvB3
	4eqLN5E0qYhFwI=
X-Received: by 2002:a05:6000:188e:b0:47f:7759:89df with SMTP id ffacd0b85a97d-47f9fc9d2d3mr9130842f8f.3.1785138034634;
        Mon, 27 Jul 2026 00:40:34 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm43677682f8f.10.2026.07.27.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:40:34 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 27 Jul 2026 09:38:08 +0200
Subject: [PATCH v2 1/2] arm64: dts: mediatek: alias all enabled serial
 ports
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2

On most MediaTek boards only serial0 is aliased, so the remaining
enabled uarts get first-free ttyS line numbers from the 8250 core in
probe order. When the console uart defers on its clocks another uart can
win line 0: console=ttyS0 then ends up on the wrong port and the boot
looks like a hang on the serial console, depending on probe order.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts              | 1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts               | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi     | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi     | 1 +
 12 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 0e086dd487d9..63659e240b1d 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -20,6 +20,7 @@ aliases {
 		mmc2 = &mmc2;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcd0: backlight {
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 8c3e2e2578bc..7bccad118d24 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 19f538d160ab..637e5567c1e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -21,6 +21,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 		ethernet0 = &gmac0;
 		ethernet1 = &gmac1;
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 5d8e3d3f6c20..9dfd882ca484 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -16,6 +16,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index a8e257b21a88..ae957deac8df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -13,6 +13,7 @@
 / {
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
index ac2673e56fb8..233711cb4556 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
@@ -9,6 +9,10 @@ / {
 	model = "Google Hayato rev1";
 	chassis-type = "convertible";
 	compatible = "google,hayato-rev1", "google,hayato", "mediatek,mt8192";
+
+	aliases {
+		serial1 = &uart1;
+	};
 };
 
 &keyboard_controller {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 1f59b5786b81..13132a35080f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index a30ee523b0b5..c535de34dfac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -24,6 +24,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..26e24431d467 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -33,6 +33,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcm1: backlight-lcm1 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 888248a75e93..51f12328a1d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -17,6 +17,8 @@ aliases {
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index 9f5a0ec563e8..668985428fc2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -31,6 +31,8 @@ aliases {
 		rtc0 = &rv3028;
 		rtc1 = &mt6359rtc;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcd0: backlight-lcd0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index edc5539bebde..86e487fb1832 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -22,6 +22,7 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	chosen {

-- 
2.55.0

