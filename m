Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D893403B1D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089935; cv=none; b=Jb06zEoAqXFVvzvyxy4dD1ef1BgtmJMBgoEzNI96ftUCzwa8Q8AlLgmYULnfQbNddHhIM8HqFP8T0lTzI3vjHfkBdlh2hGsmygSratFhDryIBNoRtwpBEXqgQTQqzvsrYKi9XSOTrxzNQEtJulseneEGFc0jZstuq74/y2kA90k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089935; c=relaxed/simple;
	bh=vOmQpMOTQmAD5HUHEObt2DjkT0/15ApbNdH9hc08UQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dr8hRxAMYg1hWFvXIzXuRNgP9H3BsmL954D3Fk1gjF1Fu2xX43apD1x+ut1Q+wcVXubsL0RNHrLJmL2O8SkDrLkNCSoRPjfxV6jemTr8oonpt405fuvHhgRJzRpNjNWhy+DUh9QtyxxdNDIzt9F6Y86vcb7Jz2yfPkemRUnX+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn4PZRlg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn4PZRlg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf13f17da8so5419285ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089930; x=1781694730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax95pId9QMw1FjsoGhe01/2Zutu0csI1tByOFuVoTk0=;
        b=Xn4PZRlgfGC6rAE7lBHXGGN2/Hah5y/hlNrb7wE/HpbuXzEprgGcLRm4Vah1l7gE6E
         z0gy7rAGbZsqgYnc48gXNIGF3bbmtSvIQlbBR0enwDl7NPNJoybh7AIrhW/IVgb/QVxe
         DTfAzsFV6HxqrtL9eYtO5aXkYglr/gDEPc2OkOtrw2wNdNRUmnwQECMhG76Vh2WvcDxS
         QJJrKYpeAQiNzYB82TB2v0XpGv6d/6xctSr6afvs3VYJXIc1MfKMHji5X4J+E65iFhPo
         5+tvCyUtGIZ0MiQGOkDAKZLn479iU0Ouqa7PPiyeXHJQ+IjZiv9gmcTS9Y8bWR+5tnSw
         +SmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089930; x=1781694730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ax95pId9QMw1FjsoGhe01/2Zutu0csI1tByOFuVoTk0=;
        b=k17aQk49URPHOPaCfZGVwGueGHebQ+LHKiGcBtfVbPaJmQ5IIJU554fkcSFbDmqAQW
         J5xc0bLblSWYFTyqQIXmRsktffYS8RxHcwneXSs/HuM5myKKm6Nd1Mj2BWjxPnwRhykc
         vMxedZoeZamjthVf+mLR+NfIR6Cn0UFPDIvCP5zUM9xCvjMLsBh/fg909sX5Ka/A3kjq
         cT1jT4LlHO+h1NWR3x/Mx/e2R7/i6hBRN+5amIGZxLG+clMZ1d2P50te3yxyg3/1Y7e8
         rEmMQWKk14PrnpigdyYIC4QeAQbroDRaViIUkmZADC47Zm06YMPO174XuI5iygEzSSlx
         l63Q==
X-Forwarded-Encrypted: i=1; AFNElJ/8RkD5IRW8M8lXHkdmYjPGTqbRbNATQr+62PyQX2fN8x6AcHh/vzAyeeBScAr9luLc0tGid/Hj4OZh@vger.kernel.org
X-Gm-Message-State: AOJu0YwkzrDBXKqqWWFN1+sTVI01dezfXaD9c5p3H6gCl2CYe0PLx4c2
	Pj92Ne6pIO1gVgzNdb6BUKu4UIhb8zsUGxVNp0O/2Y5jkwkFz6dlZaBP
X-Gm-Gg: Acq92OGFqGWCVktgNkNn6kFSeZXxyMUBIXtWLTbddauH6Xyx7kXgBxYBXWsrm0ToiHA
	ubPbzivvTvHNkeLxwMSk9pIYOaZF0vt2nn6C5Acxkd2dUW8zzqXQCtEoM3MIdn+uOI2k1MW3oRe
	9vy69QGK4PgMGuv59KgGL+5/fAo5K0L+v5RorrNhbORHeINPTnWKKaKVxnrA+FYsox49WWNQvv/
	Dko0v9MjspyXQi2BzVLs6PsJMRlp8bQXjQ4lUv9qUrTyLvV17eCcHIT/MTCxybxN3IrhOlfaWMR
	CgJpt1iV/glnN/ks1uRelvsqLFOYDe3il/oFd/04ekr5d0IflyD57SIyCKZHs5rJOn42Ijxq7nm
	igOB/BQ5UcSMhgDfxuAi8y1gOaj89AI30+H8+NHvEx1OjuF/PqH9HIyGOWJY4iYGjTh2kDIExAe
	kkdbC/5HCZkP4QaLZxWKPeQa2V072bFslSYsogsifS2oPkNDI=
X-Received: by 2002:a17:903:46cf:b0:2c1:13cf:19a0 with SMTP id d9443c01a7336-2c1e8332ademr127346645ad.3.1781089929478;
        Wed, 10 Jun 2026 04:12:09 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e234sm251328535ad.53.2026.06.10.04.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:12:08 -0700 (PDT)
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
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 10 Jun 2026 19:11:21 +0800
Message-ID: <20260610111136.1514155-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610111136.1514155-1-chenyou910331@gmail.com>
References: <20260610111136.1514155-1-chenyou910331@gmail.com>
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
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 119 ++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..e49c8233ae1f 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -2,7 +2,9 @@
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
+
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
new file mode 100644
index 000000000000..882fba441396
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -0,0 +1,119 @@
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
+	leds {
+		compatible = "gpio-leds";
+
+		led-blue {
+			label = "milkv:blue:status";
+			gpios = <&porte 2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
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

