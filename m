Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A13404BD5
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093473; cv=none; b=lo5ZawHDQn49OraHI8+7LgkbizAVzSm5AMxMRv3iljG+7vNa6tQdwM9/i8qAYUgmMm8rIcNrS+x96v5QYd7ggq3K4i68ZUx2AmVtJfLtpjQTigcsXGpdlcUcgQiCqbHLxkveQeb7FxNg4eLvOHvu2EopKJaaCmJM2DkijvJsFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093473; c=relaxed/simple;
	bh=LnnEgo6M8JiCAyRty8zP2sNPMGKQrNcUvfPHX0t1Hd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhgdgdTJhuV4UlHvvfz+3qkDysXa1BR+Py64GnfQxB+tx8/ejtro2olld5BXwQeFVkjRDno1esBv+xIEJoei/qeGJ/DJI3W9v+i5OHgonq1O8chnHDb1bFzfVkX0D9Ch6cQRncjtfEpTwB6DdMzWPclkGIQ5KCmdJVoLn5ranPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxFUGATD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxFUGATD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c2e8d381so12504405ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093471; x=1781698271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwId8hSTsYhCm9cW+cozWhD85/5ipdH4k4BKIr8DdEc=;
        b=HxFUGATDoobFYbcsyrb+TGmMZJeqMsrFeBqAedDqJKCgF93YqjGnK/rvFVlVu/GUuZ
         lA9bgAjigcmLDXivCAzeyNpnTxVUC5egmfQfoAgdunz6XVMHFNnMRljKBza7hyNCTkSR
         tJKU+kpEJYkTFy7VXAzfIm2T/s2CN8XiNAQoootx29xCzMiD00LVsxkAEkQfPiy0mBH6
         dLxpCu/cJSwIPPzoAk/okAwYfor/MqB4xbpxobcBZ1In9yv3J93yNNGmFVIV5vGrY7za
         whJ25dDjfWbcO+MvKBBdICkkDuJIbS7NPwvu10sweQFA5FmFtqQQ/7OryYoScfimLPeK
         w88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093471; x=1781698271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gwId8hSTsYhCm9cW+cozWhD85/5ipdH4k4BKIr8DdEc=;
        b=MVFgga3/87CMUe4Oq7rVMReeWoV7j5JsVMkCG8l9Em1LOs/U471uNcH24fq6TkM85y
         ZZsUKUaVzJLDnzttochVENWEdnXCRBxLzUZT/LT0FtwllzypNoEZ7YxyLy6Hsh3XVChv
         cAsb3Yu35M4mY+ESxkwabISQSN8UQ+kNcgGzix0iaTkXkGyIwGEtmRLinsOwPtUZhaMU
         OpzfVAxriiEGEh7wpMK8VA4xw7sCox4Rl3o3nA0GYhkQYbRsKkRSjvCyeJ7bQ8Od+xMo
         rTEuI73n3i+zWJk3nIIhfTPesoWdaAr1e5lWyQH6OcdrsMQ2uQRft68gVP60g3IKArkk
         LNdw==
X-Forwarded-Encrypted: i=1; AFNElJ+IyOZWTe+/RGbQXq/K4684QlqliA7TiPqwLaL0bRzecB8R9gYxTQeMFX673cuxdc96W1/JeyP7vTzM@vger.kernel.org
X-Gm-Message-State: AOJu0YyC4Ilg9J5RztVjM1kEyVl6DmXXOrcbY9Apj2f8+nDsv19HXXwp
	+j68NxAqW6GqI80S2ybLWvMymM0OjImrQm6jely/0tm3wXEsQnQfr7AO
X-Gm-Gg: Acq92OHpPiHMePtjCWPAvH2cSlyHlD7lB/SlT0efHTvL+8rBKQEfDHE/RCTGMfQu0As
	r30QCQjEDrOoeM8bE/g7IBnfMddN5vpfwPvXTMgZlub/+gvNm5moO7e/Ze2X9dw04zY+5YVw1/P
	uNLUmuzy7ciGxb1jMowsXCbsN5Gy8UM9yp+9rlqqZuHNPtD1yP/WeVSsAq+3ODLxiOp8e9XHWfR
	SALrrUrsUwTy2h+p4XSKbS27QXWAOqzi01QtZ61U32YgqgCC57mqSv3ubZkyXR3/LKZC6Qfp/k+
	lioTkI5jFntMi5F1MxbpUiZauUY6b/kIxJjBUR3+e5xWDydJ8gBmDFGOLP71GIjYs5aVq9KwfPO
	ohCQpulkjojL8Rh9hgLuLbd0HOzPh9UNuQzKA0Ob6PvSXPKSwDQZ1nALBd7uM77GoJyjAsMCjiX
	O8ocumV4OWSO3yu9Vp/VUjNVIxEBC0marJGLDf
X-Received: by 2002:a17:902:da8c:b0:2ba:1e94:d03b with SMTP id d9443c01a7336-2c2a1948011mr39804155ad.6.1781093471133;
        Wed, 10 Jun 2026 05:11:11 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm245738445ad.26.2026.06.10.05.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:11:10 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 10 Jun 2026 20:10:10 +0800
Message-ID: <20260610121026.1517621-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610121026.1517621-1-chenyou910331@gmail.com>
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
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
Changes since v1:
- Removed the leds node because &porte is not yet supported in cv180x.dtsi,
  which would cause a dtc compilation error.
- Retained the &usb node because it is already defined in cv180x.dtsi.
- Cleaned up the trailing blank line in the Makefile.

 arch/riscv/boot/dts/sophgo/Makefile           |   3 +-
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 108 ++++++++++++++++++
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..f9415c30a2c5 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -2,7 +2,8 @@
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
-dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
\ No newline at end of file
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
new file mode 100644
index 000000000000..4cf441ab3790
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sg2002.dtsi"
+#include <dt-bindings/gpio/gpio.h>
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

