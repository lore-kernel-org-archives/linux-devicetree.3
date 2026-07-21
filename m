Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2683B4446FA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676932; cv=none; b=I9sZQNYAIzNLXBMfqBwGDN2XokGwjUGjcJvANGGgstrcy2LpfHycTMve15LwnGhQFN0ARx8vSM1twLC/Wmij0upvl1W+mfBM9j5i30at+7g+esjIB/dtmudVporCa+WTEQuDAVlPpL3VsoHTlc+FuxuKcTxk0whaPtnIwggPTw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676932; c=relaxed/simple;
	bh=4pgycAz8dHsjrElWNtLLwG9xn8sGYdGkxoKcBO7/0Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jG6natj/OOvx3CSr5OVrwIPDtppDe9s4bB61ZJErhUXareX52rLgE4np/IBUMpp217R3kF/7IyExRm3dOL9pQaKVsdgiz5ksrVDEM9SrfVTQIK7IwqtDGzH1uLzQLrGLPPA7EEBFeDq3H8oJ42FIWr6YMitPamiKZpnGdgmr6QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKyClgGp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKyClgGp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf30af983aso8869545ad.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676930; x=1785281730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJgBeOO3ejSAAenm/fnjt2f8BccFZ7Q+isSN8vs0qFY=;
        b=DKyClgGpXakS9qqwLhsGH7s3SFpKEwSP4hcoSKmBzU3zrV7uGxdGCd9x3Bz2IcN+b7
         uTL6B7XDdv/KzKNfSwXxH6cgugFVZTSWA9cAi+1FWDHsOvXwBNpbZoJGVcxA0Bpqztrw
         757T+n3zxC4QEzQ0DdgXVZQsa8OTqa3ZC8dyUJFTJKehIhK7RzIQcOZzAUPKIqMXNaCh
         GnNiqcGYIdlJZNssR1ZqgFyFKxnD27AkhAWC2fQ/DzrbRA2+821qXhD8TC91nfASX2Gq
         R1DJy86+g3ZTxKN76Kblc+O2k+bQr7nNWzbk/GjhuTPdekaTUQfq/iG+iTP31+oMrMPO
         bmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676930; x=1785281730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJgBeOO3ejSAAenm/fnjt2f8BccFZ7Q+isSN8vs0qFY=;
        b=GmdVNGcaXKCvY3blEbilGn9d4PqeR0Kv6Bc0VQadcYNIfqtfDwAVsAa2SbPNzxdMsf
         jfrDb+sAZyN+1G8+tfG8CVp1/MT300R/uO/GhMldPjUdEhK/1xE0MdTi98EXEEq23K6n
         7ONLnLXw9R0grKpCzlm7haJ0rI6bE/EsBXLFYVwCXJqMIEruBs25IcthvVKIRATdn8pk
         U0ScSdDbSfxMrCUPEtomCwtBcb3YDjYE5ipQ19CXr/Tz04U8eULB70ZNgLWg6iLK2oHB
         dzoAN6eLdjjC24iC62d5THKIwO54LK6IbeWyJ3s2VfrMoF+QnV/BeFXnC7+oxZaqobQl
         9gcg==
X-Forwarded-Encrypted: i=1; AHgh+RpDApitncr51gK8y2XgNYfnY/JCUarkoyjbt72QY9+Lsl7bq4ViJGfK/SENDq00Xt+NJYisbFMq/7jm@vger.kernel.org
X-Gm-Message-State: AOJu0YwSsvkTUc8smhP60ee0BtvceNsXykyK9p4EJXuTymxgLN0ikR+M
	vUTJNa3spmo08uJr95k5SA5/7g2/KYeC0xbNuavgVpeepzkO/4bSHKDf
X-Gm-Gg: AR+sD13mmODKF2C2xakTgUl5Ps2A20/sUInzaHwJyKzFZYa2QF18SDTtNHPp2N4pUbN
	/OyIsHMLOTspl7BI1lccF2OrX1UJukOinBIHUHo4oXTgPXx6KNDvT/uRwMOxW4GgYb2UXAeliEG
	O0qMJev09b0dTGjjhUJsJJbGeLrcqSvT7z/0bWuHN0BkoBmJwuq6u+Mp+jlfxrI4hIIzwe/OI2P
	B/n7SeHq4oMFaGGacjLgMs/ZFMoETYwOk5OrEP2MlqFexojgs0r4cYeFxPONazZZcHmMy+HRwoq
	ajviKOcsnVT2TuUNp6GUTKX7gPFZNOfDE8eFNAr69Yh0wIrQfvsVcARsGlL6WkxCyyyHZeJFLh/
	YZo8Mbwzk90xl3u6yi3mEUUEAFBJ0x5pJljhd5if+nsuy5VyHDt54yYCvtiqR8QrLz+qieecaGp
	fFhDblre2pculu90C//5ZPuUfQPihz4qLeIvB0Beeta8Je6xw0a6qkbs5KL7hzfeIqxNXA3UCF0
	eG0rDCuvt0+Qw7JHkAesCUN6XJH7gO/IlFAmPW0
X-Received: by 2002:a05:6a21:e0a6:b0:3bf:b84a:f3d8 with SMTP id adf61e73a8af0-3c42bd60404mr928427637.0.1784676930438;
        Tue, 21 Jul 2026 16:35:30 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebfcesm245353a12.11.2026.07.21.16.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:35:28 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 22 Jul 2026 07:34:44 +0800
Message-ID: <20260721233452.112204-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721233452.112204-1-chenyou910331@gmail.com>
References: <20260721233452.112204-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Duo 256M is a small form factor development board based on
the Sophgo SG2002 SoC.

This patch adds basic device tree support for the board, including:
- UART console
- SD/MMC controller
- USB host
- Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)

Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
heartbeat LED functionality.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 121 ++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..1ff69cf7f178 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
new file mode 100644
index 000000000000..21ef6ed9f0d2
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2026 Chen-Yu Yeh <chenyou910331@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sg2002.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Milk-V Duo 256M";
+	compatible = "milkv,duo256m", "sophgo,sg2002";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&porte 2 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		coprocessor_rtos: region@83f40000 {
+			reg = <0x83f40000 0xc0000>;
+			no-map;
+		};
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&sdhci0 {
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
-- 
2.43.0

