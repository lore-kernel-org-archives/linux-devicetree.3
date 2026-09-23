Received: from mail-wr2-f20.google.com (mail-wr2-f20.google.com [74.125.225.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F4531624
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178821; cv=none; b=hx/1SegY74f5Zfdu6pTO6Ou+7VtO+M/RAoXVAh+lvA/DI/kIQzVl4Ppt/TTndArb3dOqyvnYKiIXixvk+AFNqWU2Z0gonBXMbmBrsDQt8LttattJyails7CRUudBwI/jrCB8M3WkrbLiUdY9CIKuFqMBvJ3Mq9Q7Ks3FtyHKMwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178821; c=relaxed/simple;
	bh=Eva+ZHizA/xOJPwrntOj0lFaBBzLravCS3cca+PXGVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9WtHUkSthZ28WF7+YPiXJbMO9eXEUerPofUDaGKlyaFSJtEa70jBxmUUJYaOZU2j0afHQ112/kUbS+1i7FC/XP9JffCANgh8kulDy0fJGsC4ykBf9rncdn3JG0yXMHY6DKhLiGT4BCArU8wUyzo3RFUovumILzdsmDP1RyRBqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=j8pIjGOZ; arc=none smtp.client-ip=74.125.225.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="j8pIjGOZ"
Received: by mail-wr2-f20.google.com with SMTP id ffacd0b85a97d-482f6356256so403432f8f.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790178818; x=1790783618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ogzk1zAksC1p2lO2lX+ildRtH5U/X0N5sk/kFhqIelM=;
        b=j8pIjGOZBsxBwo2+fqjKhUrZFOHqbjQLE68IP7zZwEhxhKsdHb1xDo5y6+Oe3LY2u+
         ZtXUsHL6uYQmFsWG2XXYRHy6t0F1r1oYmo32uC2Ibj6xfpkdXGIpJ39H4HgfvUffL3xG
         3qcstYCYz1sQAgbsBxC9DgXhW4NnKrGzdHrls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178818; x=1790783618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ogzk1zAksC1p2lO2lX+ildRtH5U/X0N5sk/kFhqIelM=;
        b=SGW+onVlMsR7WKPS4E1B5VHT+Tk58MyVchNtFZGOd83h9ATiwVlFNlNVUQN4k7FLOs
         ai0gxlqxsNR3GtZUfdcOnxY/Jd5kPGMp0/z9m5b3QDJtYvDb1/HipsRkALSZR2RbvjXz
         oYChVf7327nr3dvappmDbIcwX9SKrvo0RFV/TgEcgxL3RdWmgMhLrQTvnXDoKIhUMp9g
         UbaXff6SORqm+PvUJe1GpnX//zCnrGGlIhb9ky3WRsM/7lWrcke/+aQfXc1e7Z3lzicc
         0hH1wB+CF0rMPUcf81JXISxdCwjxSGWOjTdP9u60gXIdxej4CmGA3fEhSZlju6ZhBjPm
         e+jg==
X-Forwarded-Encrypted: i=1; AKwUvBzG/3Q4gvBzrHuEK+f8trTY2Zia+OcQQI0X9Mw0ovjmZa1pRzRw8W9uvz8N1nYc433YXPAAHkPOkeVz@vger.kernel.org
X-Gm-Message-State: AFuF++nATnI4fT0heISB1ALadyaajrPJvQhTmDmf7FUvTzvq8QttbCOE
	6aMxz7B1ltY3VpHeHuk+PAMkKSecZnzrWNWzdYvxOK2kvB5K7lO+nhQdD1cNWR1t9zE=
X-Gm-Gg: AYBFou1dejoOTMR++9zpFsyJunN7RsOfhKiIWJK26Y/sjJa+N33WpcTFtIVqb+i4vMd
	88/77MUEkhrcdxNZOEWUAUVYfrq0lq8eiVGe9RNCZ76JUPOj0dtS8AbrskeZAQ+EMmXI43SMxvF
	ym5LBH5fUrFRb9W0HT7zs0XBx71WC0YXdBx7nsBP9kQQkROf0yk/LWY6trg8HPZbYvMjFICDlhD
	ot5Jq1zfse8P0HlVcWIGgjy0tg7o8kbGePEbV/wOX2WOM1dB66gBUA0ReSSsbDRgYz7xH4hBebL
	1Bte+GSK2kCmSArW6pLRwZTaomJpyLAaOh+uz5KlIdb4VKKDfiJiZXe3DKAuSDknEzf8GAD/nbf
	11lgwpxEBbQ7zITzwXWOz4IZfPtj0te5t5erlG96QKl/apcap10IEk6XfRsm7LZIBfEZpIi8Zhj
	ZtWxTt/MZc3ci9hXW2+PgFHg9hY/cHtS74+5Vk0rbYUoYAhfenH8iJW3/NlbNlhRIfivzPzyWJG
	2Sre2OnNCVvNmb4u16ORKIRZQ8yOu3A1J2n+tKkTRZusOBTB/JhnoFZ5BERQ2Keb7I=
X-Received: by 2002:a05:600c:1988:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fdf3571f9mr41898745e9.3.1790178818353;
        Wed, 23 Sep 2026 08:53:38 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm81858555e9.8.2026.09.23.08.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:53:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>,
	francesco.utel@engicam.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH v2 1/2] arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an overlay
Date: Wed, 23 Sep 2026 17:53:09 +0200
Message-ID: <20260923155333.610134-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
References: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board is fitted with different displays depending on the product
variant. Keep in the board dts only what is common to all variants and
move the RK050HR345-CT106A RGB panel and its touchscreen to an overlay.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes in v2:
- Keep the full cs-gpios in the board dts, the overlay only adds the
  panel node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/Makefile               |  6 ++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 68 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 46 +------------
 3 files changed, 75 insertions(+), 45 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso

diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
index 6cbccfd50993..218ff7fdf576 100644
--- a/arch/arm64/boot/dts/st/Makefile
+++ b/arch/arm64/boot/dts/st/Makefile
@@ -1,7 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
+stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a-dtbs := \
+	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo
+
 dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp215f-dk.dtb \
 	stm32mp235f-dk.dtb \
 	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo \
 	stm32mp257f-dk.dtb \
 	stm32mp257f-ev1.dtb
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
new file mode 100644
index 000000000000..f89641bdb23b
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Rocktech RK050HR345-CT106A 5" 480x854 RGB panel with EDT FT5306
+ * I2C touchscreen controller.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		interrupt-parent = <&gpiob>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpiod 1 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <854>;
+	};
+};
+
+&ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_a>;
+	pinctrl-1 = <&ltdc_sleep_pins_a>;
+	status = "okay";
+
+	port {
+		ltdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&spi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	display@0 {
+		compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
+		reg = <0>;
+		vdd-supply = <&reg_3v3>;
+		spi-max-frequency = <10000000>;
+		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ltdc_out>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
index f5af0913bf1b..faedddc2c914 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
@@ -116,25 +116,9 @@ &arm_wdt {
 };
 
 &i2c1 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&i2c1_pins_a>;
-	pinctrl-1 = <&i2c1_sleep_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
+	/* dt overlays don't support /delete-property/ */
 	/delete-property/dmas;
 	/delete-property/dma-names;
-
-	touchscreen@38 {
-		compatible = "edt,edt-ft5306";
-		reg = <0x38>;
-		interrupt-parent = <&gpiob>;
-		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpiod 1 GPIO_ACTIVE_LOW>;
-		touchscreen-size-x = <480>;
-		touchscreen-size-y = <854>;
-	};
 };
 
 &i2c2 {
@@ -179,19 +163,6 @@ sgtl5000_rx_endpoint: endpoint@1 {
 	};
 };
 
-&ltdc {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&ltdc_pins_a>;
-	pinctrl-1 = <&ltdc_sleep_pins_a>;
-	status = "okay";
-
-	port {
-		ltdc_out: endpoint {
-			remote-endpoint = <&panel_in>;
-		};
-	};
-};
-
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
@@ -259,21 +230,6 @@ &spi1 {
 	#size-cells = <0>;
 	cs-gpios = <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-
-	display: display@0 {
-		compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
-		reg = <0>;
-		vdd-supply = <&reg_3v3>;
-		spi-max-frequency = <10000000>;
-		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
-		backlight = <&backlight>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&ltdc_out>;
-			};
-		};
-	};
 };
 
 &timers2 {
-- 
2.43.0

