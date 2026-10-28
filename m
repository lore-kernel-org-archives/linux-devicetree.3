Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182952;
	b=1S6WNbwNVk5x7y22sxdYiyq6nnMJhznTmUeQePAPzetm2U1w68BdRlFrjNB8/XoAnsc7
	 G1TL/Pxow1br1ev5JwstmKBo0OwW4pcUUkZ5n9+45EIisK45NRCHhnb1XJRwqIBhg1SFv
	 gWLYxvbWYcY00QK2WK7cBhG8kI2M5t/sWOiaA3d9rMLdPtJAu7qOBkqEw1zCa10js7qvX
	 HsaZkO1Dg/NkGHhgk+UYW9z1wLBqAuqYJsIc/bJY3/sgvIcPbx8+srfq0O8pM9SnHk1mB
	 EL6INUCzPoqn1FL1fOsrxW671j31n5KInCxd+yBvwwdQkNLQFy2sCpb9UEGxSFHDiyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rza0kgIV8RKD+4VzREfwNDyHjukBXzxAznIzMlJT1PM=;
	b=BFkuhVNB/mjCOqxsY4YLG5+cG/hz2Wh3ll5KlKC4zC34k2VQbsZFa87OJp8ijLb88tGt
	 vkUXzX0QzFCnv1Pw3LzdVm4SGY0VVtAKxx4OwUGP1eWeMUs8s5S732OwPibUf3HDss0CS
	 AH7uAirKMGVfUfg9a75/yVQ01ifViNN10r4GnuW9quPUcDo8uwCf/4D3sCPIlLPq+q1eW
	 r6vhtZcqClWufrJLSp1YtejvIak5tZeI4wNNDny69qz8gpBd978RWYdAQQzAt3boc0YKg
	 J4K/MQ3HREXOEcz6LMKw8rusnieaSYOinavWJDqTnM3sFP8vdo9Lne38Oc88QbQsA+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oW4IAvxE;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76500606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76500606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oW4IAvxE
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d870d54so505830f8f.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 03:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793182951; x=1793787751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rza0kgIV8RKD+4VzREfwNDyHjukBXzxAznIzMlJT1PM=;
        b=oW4IAvxEO6tFXQWgIF9jFVid2BAB4I2EHM9HMlsuzOKzojZhiaih3Fo2SLqFQUvGvV
         qQ+zqPNSl7wHZpUvIHR9aPN7kSfZ1FTY87qM0WvYYd26zviY/LFu4GEwbiJhS0ADmyTW
         pkRlaLHX0lJuUqhlkwTvo5uCzK5M/Bi9pAAm68gH2d2vQ+Dd06E/go2xH51iV08dERUJ
         BBqWmJ5ScVNlRqFHV4OsevBi1whK+LbJgTZlzXYfg9dhoma/+H6UW0TsYnIS7pI+akJ2
         4FngWclLa6yeP6WSQAsMxmT6dLOtN2AliV41188zEJ/hrg5UwuqtSb0LDt1rpvkbIeCp
         FBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182951; x=1793787751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rza0kgIV8RKD+4VzREfwNDyHjukBXzxAznIzMlJT1PM=;
        b=kyvwYbgu3MUU8azq/NhMtoIMHyEtRQk3ylZtRiQaIQEw3pMb+2KniTz9M/W2x2QLzL
         4teC71MAytkI/gFPMmnkmvK71NXlo3Z6Rn3njsTK1szQdWSzRCbryqSdiEF8PpaCSl+x
         xNbKZOKq6YfM3bs7oN3wpxUfM4oA+ZODCHTOQdIVRhWy9YwkK1dVyAeQvDrRBzezO97Z
         O2QLkAE7ImUCIDGLhY1TMRcakXzUyhHGLv4IZv8DNjWebt3mvSe7n+xGLCw9qMqWGgSu
         mcF4MIIxMot3EZZM2DPXUc0EcnI+NqG3P9niR5eyjRyqyf3EEnanpl7/+8iuBYJEygF+
         farQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvjkjbOc4CdeHkdgBDqF7wxo3Tbvu7GXoF2wi5YgaG8zb5o9JSmTj4LO7gidef2Dv9sCzqZbfB/Eid@vger.kernel.org
X-Gm-Message-State: AFq9FYJNdGU2mypzcHqoxTylt7kbJwq//LPjwKePp9JnkOO4O0VIzn8I
	UiyMRgwQ+JHNMqVNvaQL4fk0/KzpGn75TtE3Mpt2BMu7N62nRvyvDu8K
X-Gm-Gg: AYBFou0Aer6r/clYTByxddI45eCO38eylRZfLSQXD3wFaef0saXVAm7Yeljv606GYgC
	Fm+65IfsqSeLo1M7q6kqSFJEg2CAFM69aj5sXrHq5aA0sEq/Fr20Me20yJ8hc6O/+Ii5yelG5QJ
	0VNRhzM3qKvhFmMcif50qzM6OjuEnHyGe/HVHK1FVBvnioE1VG8+T5Nx1XNjQghLklVrStXl1OA
	BYQxwb668U+2j1T/B0/dQoTViXcgebHw7RJrnFRWd10pnsZn03+2vSTTNqony4oVokTspzDCkyT
	h6iOGUmGaZJCI14hh6hirBBb7Xd+onCkmOD8l2lgI3euB7xthqddTB8sAoVoM2lNzXqL3/nVqcY
	Eeew7JDwfhQOXbRLcIzElV0+fclHxVKxXWkr2n7Rcc7nc3dW5VBtlxGpvkE9dVDt6qmQJGP+5+d
	N43P8XMXAkoMwruJQX9aJHWce4dRlSiug7IN9Yugg9dhZJYb+WVZDjWU7ux0OeHzzePf58YaA8Q
	FPh/n48gkTkjdtaR50FgUXSoITK2sckp6qyHBokbjmrRdN3eOvlyKzJBB2OiUOUzqNafL6kv9Ab
	Xe/A6R55N4Adb1Hj3H24yFmUVkuoaPc4gs1LoN+Rg0dFsOZ2snZSCEnvO77Z9pC5CH/fVvhZOVk
	GbzheC07BJuXa3kWFs+YeNVot3YAY0sfoR6bJJPQGRVDUArVD/wBP2xlEQ2Id/BV4rj1Z/gGrCa
	o1m3pD1ngArQ+8EJMbP8ippa8XReiraowka9HV
X-Received: by 2002:a05:6000:2488:b0:486:f6dc:52c8 with SMTP id ffacd0b85a97d-48e5d5a4030mr4706468f8f.37.1793182950573;
        Wed, 28 Oct 2026 03:22:30 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm27135788f8f.39.2026.10.28.03.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:22:30 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH] powerpc/dts: Add dts for WatchGuard Firebox T30
Date: Wed, 28 Oct 2026 06:21:58 -0400
Message-ID: <20261028102158.71032-1-lefteris.koutrakis@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add device tree support for the WatchGuard Firebox T30 and T30-W.

These devices are security appliances based on the Freescale P1020 SoC. They feature 5x Gigabit Ethernet ports, USB, and a serial console.

Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
---
 arch/powerpc/boot/dts/fsl/Makefile        |   1 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts | 413 ++++++++++++++++++++++
 2 files changed, 414 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts

diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index d2cc8e1f0..ebbf301e1 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -3,6 +3,7 @@
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
 
 # MPC85xx platforms
+dtb-$(CONFIG_MPC85xx_RDB) += firebox-t30.dtb
 dtb-$(CONFIG_BSC9131_RDB) += bsc9131rdb.dtb
 dtb-$(CONFIG_BSC9132_QDS) += bsc9132qds.dtb
 dtb-$(CONFIG_C293_PCIE) += c293pcie.dtb
diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
new file mode 100644
index 000000000..546e98938
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/include/ "fsl/p1020si-pre.dtsi"
+
+/ {
+	model = "Watchguard Firebox T30";
+	compatible = "watchguard,firebox-t30";
+
+	chosen {
+		bootargs-override = "console=ttyS0,115200 rw root=/dev/mmcblk0p2 rootfstype=squashfs rootwait";
+	};
+
+	aliases {
+		label-mac-device = &enet0;
+		led-boot = &led0;
+		led-failsafe = &led1;
+		led-running = &led0;
+		led-upgrade = &led1;
+	};
+
+	memory {
+		device_type = "memory";
+	};
+
+	cpus {
+		/delete-property/ PowerPC,P1020@1;
+	};
+
+	lbc: localbus@ffe05000 {
+		reg = <0 0xffe05000 0 0x1000>;
+		ranges = <0x0 0x0 0x0 0xefc00000 0x400000>;
+
+		nor@0 {
+			compatible = "cfi-flash";
+			reg = <0x0 0x0 0x400000>;
+			bank-width = <2>;
+			device-width = <1>;
+
+			partitions {
+				compatible = "fixed-partitions";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				partition@0 {
+					reg = <0x0 0x20000>;
+					label = "nor-cfg0";
+
+					nvmem-layout {
+						compatible = "fixed-layout";
+						#address-cells = <1>;
+						#size-cells = <1>;
+
+						macaddr_nor_cfg0_1830: mac-address@1830 {
+							compatible = "mac-base";
+							reg = <0x1830 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+
+						macaddr_nor_cfg0_1844: mac-address@1844 {
+							compatible = "mac-base";
+							reg = <0x1844 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+
+						macaddr_nor_cfg0_1858: mac-address@1858 {
+							compatible = "mac-base";
+							reg = <0x1858 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+
+						macaddr_nor_cfg0_186c: mac-address@186c {
+							compatible = "mac-base";
+							reg = <0x186c 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+
+						macaddr_nor_cfg0_1880: mac-address@1880 {
+							compatible = "mac-base";
+							reg = <0x1880 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+
+						macaddr_nor_cfg0_1894: mac-address@1894 {
+							compatible = "mac-base";
+							reg = <0x1894 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+					};
+				};
+
+				partition@20000 {
+					reg = <0x20000 0x10000>;
+					label = "nor-cfg1";
+				};
+
+				partition@30000 {
+					reg = <0x30000 0x20000>;
+					label = "nor-mfg";
+				};
+
+				partition@50000 {
+					reg = <0x50000 0xc0000>;
+					label = "nor-bootopt";
+				};
+
+				partition@110000 {
+					reg = <0x110000 0xc0000>;
+					label = "nor-extra1";
+				};
+
+				partition@1d0000 {
+					reg = <0x1d0000 0xc0000>;
+					label = "nor-extra2";
+				};
+
+				partition@290000 {
+					reg = <0x290000 0xe0000>;
+					label = "nor-backup";
+				};
+
+				partition@370000 {
+					reg = <0x370000 0x10000>;
+					label = "nor-ubootenv";
+				};
+
+				partition@380000 {
+					reg = <0x380000 0x80000>;
+					label = "nor-uboot";
+				};
+			};
+		};
+	};
+
+	soc: soc@ffe00000 {
+		ranges = <0x0 0x0 0xffe00000 0x100000>;
+
+		i2c@3000 {
+			rtc@30 {
+				compatible = "sii,s35390a";
+				reg = <0x30>;
+			};
+		};
+
+		i2c@3100 {
+			tpm@29 {
+				compatible = "tpm,tpm_i2c_atmel";
+				reg = <0x29>;
+			};
+		};
+
+		sdhc@2e000 {
+			compatible = "fsl,p1020-esdhc", "fsl,esdhc";
+			sdhci,auto-cmd12;
+			reg = <0x2e000 0x1000>;
+			interrupts = <0x48 0x2 0x0 0x0>;
+			interrupt-parent = <&mpic>;
+			fsl,sdhci-dma-broken;
+			fsl,sdhci-ahb2mag-irq-bypass;
+			fsl,sdhci-adjust-timeout;
+			clock-frequency = <0>;
+		};
+
+		spi0: spi@7000 {
+			compatible = "fsl,mpc8536-espi";
+			reg = <0x7000 0x1000>;
+			interrupts = <0x3b 0x2>;
+			interrupt-parent = <&mpic>;
+			fsl,espi-num-chipselects = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			flash@0 {
+				compatible = "everspin,mr25h256", "jedec,spi-nor";
+				reg = <0>;
+				spi-max-frequency = <40000000>;
+				m25p,fast-read;
+
+				partitions {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					partition@0 {
+						reg = <0x0 0x8000>;
+						label = "spi_mtd_0";
+					};
+				};
+			};
+
+			slic@1 {
+				compatible = "zarlink,le88266";
+				reg = <1>;
+				spi-max-frequency = <500000>;
+			};
+		};
+
+		usb@22000 {
+			phy_type = "ulpi";
+			dr_mode = "host";
+		};
+
+		mdio@24000 {
+			switch0: switch@10 {
+				compatible = "marvell,mv88e6085";
+				reg = <0x10>;
+
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					switch0phy0: ethernet-phy@0 {
+						reg = <0>;
+					};
+
+					switch0phy1: ethernet-phy@1 {
+						reg = <1>;
+					};
+
+					switch0phy2: ethernet-phy@2 {
+						reg = <2>;
+					};
+
+					switch0phy3: ethernet-phy@3 {
+						reg = <3>;
+					};
+
+					switch0phy4: ethernet-phy@4 {
+						reg = <4>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						label = "wan";
+						phy-handle = <&switch0phy0>;
+						nvmem-cells = <&macaddr_nor_cfg0_1830 0>;
+						nvmem-cell-names = "mac-address";
+					};
+
+					port@1 {
+						reg = <1>;
+						label = "lan1";
+						phy-handle = <&switch0phy1>;
+						nvmem-cells = <&macaddr_nor_cfg0_1844 0>;
+						nvmem-cell-names = "mac-address";
+					};
+
+					port@2 {
+						reg = <2>;
+						label = "lan2";
+						phy-handle = <&switch0phy2>;
+						nvmem-cells = <&macaddr_nor_cfg0_1858 0>;
+						nvmem-cell-names = "mac-address";
+					};
+
+					port@3 {
+						reg = <3>;
+						label = "lan3";
+						phy-handle = <&switch0phy3>;
+						nvmem-cells = <&macaddr_nor_cfg0_186c 0>;
+						nvmem-cell-names = "mac-address";
+					};
+
+					port@4 {
+						reg = <4>;
+						label = "lan4";
+						phy-handle = <&switch0phy4>;
+						nvmem-cells = <&macaddr_nor_cfg0_1880 0>;
+						nvmem-cell-names = "mac-address";
+					};
+
+					port@6 {
+						reg = <6>;
+						label = "cpu";
+						ethernet = <&enet0>;
+						phy-mode = "rgmii-id";
+
+						fixed-link {
+							speed = <1000>;
+							full-duplex;
+						};
+					};
+				};
+			};
+		};
+
+		mdio@25000 {
+			status = "disabled";
+		};
+
+		mdio@26000 {
+			status = "disabled";
+		};
+
+		enet0: ethernet@b0000 {
+			phy-connection-type = "rgmii-id";
+			rx-internal-delay-ps = <2000>;
+			tx-internal-delay-ps = <2000>;
+			nvmem-cells = <&macaddr_nor_cfg0_1830 0>;
+			nvmem-cell-names = "mac-address";
+
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+
+		enet1: ethernet@b1000 {
+			status = "disabled";
+		};
+
+		enet2: ethernet@b2000 {
+			status = "disabled";
+		};
+
+		gpio0: gpio-controller@fc00 {
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led0: led-0 {
+			gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_ORANGE>;
+			function = LED_FUNCTION_STATUS;
+		};
+
+		led1: led-1 {
+			gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+		};
+
+		led2: led-2 {
+			gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
+		};
+
+		led3: led-3 {
+			gpios = <&gpio0 5 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN_5GHZ;
+			default-state = "keep";
+		};
+
+		led4: led-4 {
+			gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_ORANGE>;
+			function = LED_FUNCTION_WLAN_2GHZ;
+			default-state = "keep";
+		};
+
+		led5: led-5 {
+			gpios = <&gpio0 7 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_POWER;
+			default-state = "on";
+		};
+	};
+
+	pci0: pcie@ffe09000 {
+		reg = <0 0xffe09000 0 0x1000>;
+		ranges = <0x2000000 0x0 0xa0000000 0 0xa0000000 0x0 0x20000000
+			  0x1000000 0x0 0x00000000 0 0xffc10000 0x0 0x10000>;
+		status = "disabled";
+
+		pcie@0 {
+			ranges = <0x2000000 0x0 0xa0000000
+				  0x2000000 0x0 0xa0000000
+				  0x0 0x20000000
+
+				  0x1000000 0x0 0x0
+				  0x1000000 0x0 0x0
+				  0x0 0x100000>;
+		};
+	};
+
+	pci1: pcie@ffe0a000 {
+		reg = <0 0xffe0a000 0 0x1000>;
+		ranges = <0x2000000 0x0 0x80000000 0 0x80000000 0x0 0x20000000
+			  0x1000000 0x0 0x00000000 0 0xffc00000 0x0 0x10000>;
+
+		pcie@0 {
+			ranges = <0x2000000 0x0 0x80000000
+				  0x2000000 0x0 0x80000000
+				  0x0 0x20000000
+
+				  0x1000000 0x0 0x0
+				  0x1000000 0x0 0x0
+				  0x0 0x100000>;
+
+			ath10k: wifi@0,0 {
+				reg = <0x0000 0 0 0 0>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				nvmem-cells = <&macaddr_nor_cfg0_1894 0>;
+				nvmem-cell-names = "mac-address";
+			};
+		};
+	};
+};
+
+/include/ "fsl/p1020si-post.dtsi"
-- 
2.51.0

