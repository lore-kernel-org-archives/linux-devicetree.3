Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D01392836
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002059; cv=none; b=PDOcowUZVEVVRI0TBQIL7iUuhmF5JDl6brx+J+uz7E7PiiM+QQ/M7DlYQaZrHYWRbWYZHwC4bx1lpf1j6OavI9dYtPGiSRBt5MAs1NlIHNBoioJP0F9WjIhDRQ80z8kYU8zNGokYHC1Wv4c/WrACmmghgRGLih4ycl4GhaEZt6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002059; c=relaxed/simple;
	bh=z6uzbwrcOov01EjwziOQYmuDCveUrzDWnXGNZMo2r2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlUARnlSD2haRiA4bhHaP6gIyfjKRic07vOFcMZpr/Di92JuMIbc5P0KedXSlSsXHsdcK2QOcChckU3Vg24rwtcDfew1PY2lzzqAerE6ADNb7Lb5UdkBoh6fjF9m6bHGvtxcNnKx/7uiydmVeC6rOoOabcm6a1kgIZP/1AT8GnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0CPBPy2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0CPBPy2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-380f3c1b087so237223a91.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 10:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002057; x=1785606857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvOKbp3xG4QlT34RdqQIXOPX+sCqsh5Q/jZI9nYCgFU=;
        b=A0CPBPy2UmhAs5f+d5pUQCrrhlwBR1vbebN8vfA+otGVcsT1kNF1uh/+KlEKmdFN91
         IL1w0hW3NEWliPuXzgPb77oxE9aZ06koOx5ZXCP4q4S5WsYLziOBebzP96J5zK8bwLpD
         xbtPbZUudvInm3fJpyl1n3rF8lK33Ioo2iMdkOOl0JH6z2SEhE15k+9/LitDA9noZGhR
         INqdVW1D/U/LFHSvFC9u1Js7yLLL81g13/XArAJqI1+t6NkBh+kwZqjvL8WQrD9jo/qW
         4CtbBaD4URWjQIk9yXCnPtbofREmf+rFf9jHhYq/O7Bu3ZtKOrWXPS9aS5+Gj/7tZv8t
         pHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002057; x=1785606857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvOKbp3xG4QlT34RdqQIXOPX+sCqsh5Q/jZI9nYCgFU=;
        b=bdAjK3TGwSGQPS8gkQxJSYx3Pbpoq6znJtZEvtQQ5llAuW8gdkdgVMB4QsG2tDLaaJ
         znug3oUL3+i08NOkOTt/+ZGmyYWTOhNJyPwpPex+OKHstQvo49L1ePrLadXSU6Y5G1Qz
         98DAHegHKQfKjlEkEIyIntxuXz9s8b9vMfC5rwCjCv9VjdSPQRBsN531xcIWge+9oB2+
         WC2jq3vkdZRC0xgiASzCwi+yKLlAZH+M2qWEW7xBDTy7Oa97yCbJpJBFPwmrVZmAhaeR
         bSTi0RgusDV23lfZgAherrD7ZWrG4cfWuGKbZBPDh6atNm9VDKROer/tv0N6wDyXOsYu
         aN0A==
X-Forwarded-Encrypted: i=1; AHgh+RqHLOyH8sDI6MtysGa2oCh/yYjP2+MENotRhkkDqv+85Z7fLx0fCGfPRAGw0ZV5atQuS7nbZvWHiu+4@vger.kernel.org
X-Gm-Message-State: AOJu0YyKnSKdk5plLSOkcK+c7OeWZgnQtIWwaBs4wIN9Y4yKojrFsjJ1
	1oMXd4mf2uf6Vdu9U7PWo2jh6H+NJ66zFGgnW5dOGl/ApWvYlwBvU21B
X-Gm-Gg: AR+sD11wmLUEHFezJX8j7BzMKtqopDbLXoH33+Ew0rvz/IrRXSHobyD4Gm/PhBdgPxU
	hIgXmxX5//df+tnb3CcW4bmGDnohRxcMJx1Pt08B7N+e7HYNLxtzOQuuo4xPEQ2qIRSipf0wTF/
	rruWriL8EQxRCIz1MNhYtvaAI/dCJIAT1cj1cKvsX0hQzWugbQu4wbfPidKpdPCuyOkppjwj0jL
	m6Bep/AJvm7F0VZGbC14wf5fswT5T6EdENUrt64ddZmNQSeLwk7le0kt9Ssu6sbCg/DAozb8VQP
	Jh9KfJdUzYzcpWHdJVTJi80H89nmYkb2k2BbOJoAC7OKVPN28ywcboaZcrRyq54Di7YZyqhub4W
	HE6764IhJihxn+fImsax/SuTciugtDUb0+2rBOe87ODf5nl8indrorKHp1hPekMys8wpRZUZCX5
	mxpzkea2Vwtb9/zpdRQVDfO6v/T0YqttIzGshgxDev/KP+mxlbVSHOReSFnlN+wcVz/MmBLOsYb
	pu1sY5ZZg==
X-Received: by 2002:a17:90b:314e:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-38f293c6d6emr2056503a91.2.1785002057132;
        Sat, 25 Jul 2026 10:54:17 -0700 (PDT)
Received: from chenyou.hitronhub.home ([2407:4d00:cc10:114a:3b0:934a:d409:94fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm3005276a91.0.2026.07.25.10.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:54:15 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v5 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Sun, 26 Jul 2026 01:53:45 +0800
Message-ID: <20260725175346.139173-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725175346.139173-1-chenyou910331@gmail.com>
References: <20260725175346.139173-1-chenyou910331@gmail.com>
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
index 000000000000..a2797c0bd767
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
+		coprocessor_rtos: region@8fe00000 {
+			reg = <0x8fe00000 0x200000>;
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

