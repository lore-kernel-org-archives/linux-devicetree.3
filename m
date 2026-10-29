Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793273272;
	b=NeSee92NAYyo7wcUs4yRa7x++nJsehlb7S9xpRa4q2cfvvmgK5Gr+CPoA/qyOYqOSs4Q
	 sr0qgg24t/53dGAlVh0ZN3LWX3LYowQqJ9SBkUKnLdE3NkePETmOWeQjuIFzWVjb5iFDo
	 cZN2emdHqM68kINlHV14kw52a7F12EDdqO2Nxn6zRlTm1aeV0Oi2mn7cgxyu3pQV9IQu7
	 YopChBk+4PQZ4YS3yg1tkBo2FR5oleq6X5m4CGrdSd1ZJahCB8odd1NDpauJw/QKOKCpG
	 bNsJKvaMDKa3FLc0lsDsMCgDOnyWRqu1cq3CXUxOeH3ozmSdrdeerKa9ZrGSvVjdiTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=risrBQtG8qA+1se5uHVK1FVnhNZdOgvrDeWq26wHG48=;
	b=jyKE0xwm1eBpwFXkNneE0Q8LC4cz+wW6IV2K3FPvRdTdlGJbPPMtupCaC5Dud9c5RzlP
	 Avvh6WuablSJzYg3n/qlmJjKA0WpJhiB4rnGzLZpd6qmy4TijiMxM1FmqSsot8EcrnCrz
	 kfIqsgoT9RSzNBjcOhXhu+WrlbeBx9gmC0J+pdWYz+u+IAoA3irNJvDm3G6DYFWLdl7VA
	 tePHa8g9YHY+GI/T/zznMHTGU3sFw4pNhQctGWgadp3W2/ppqH0e/vq+Ltogtvmbyzvig
	 w3tbKz7f9C0NUjQrQZ8JLCJSnp3JW5C9OCIZEyyrB0sZi/jHa4av5n8Og+W9QMTISRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M/at3/6P";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC5A606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M/at3/6P
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso16299205e9.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 04:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793273270; x=1793878070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=risrBQtG8qA+1se5uHVK1FVnhNZdOgvrDeWq26wHG48=;
        b=M/at3/6PpkWBvMlWU6rsZo/hFRpEVaNhsnSrH2XzqbpYC8GemmY7F/BJbi/TvDD71z
         7mI5as9vrkOmQ7JIyFdgnlJLPqyvDZky0Mpblnywt3vlQXKJcvhxUAyh+9MiZLDsPE9v
         40eq1H86kWVc256fL7VuDZNmBAxNTqaS9yUVh/3fvabwer36rQXAWh+WREfpG4o8W/MZ
         s1LeGsTCLZtuYG+tkPKh9hjt3vLmq9h556jwRttMK69gw1BbA4Bskkc+IkLdvPyHU34b
         MiVXfHLgz8INEVbEy8aGXRQ8Zj8586vf5viJY4XPyiGGbM/Eqw53BrAmniJaauX+pBQW
         EqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273270; x=1793878070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=risrBQtG8qA+1se5uHVK1FVnhNZdOgvrDeWq26wHG48=;
        b=lxxP2o7blRRREa0KUG/NhcU9kl8qRBaz51vc4EDb9Ol6JzIXwSKuMRDj1kkxf9LP2q
         au2EVCR3xsi1LZFqZIbCw10q7WlR4naJ3MG4YVOnYknqIiZCcWvhTgHSX1/EBIPdaphF
         Y7wEhQeoW6HakFiPliNnG4c0X0eKptZTItImi6TMP5uyICTH51ZIaIcu7a7DklZZ33g2
         yO8kuu1D4t52AeH84ZyaXHMglmwbDG0Hnb08X/CtYIM9lP/ea9p323L0Ok3oXUVcd9FD
         l0weBVILfsQTMOREZM5j2eYhBO4/ijhJYIMzXtx7d83DQcnNXu9lI3HObmDGFCEuoRwf
         l8rg==
X-Forwarded-Encrypted: i=1; AKwUvBwBu5SUTj45k8R/wKkdy9UjiAkgAEzXKefYEtxiuCmvQRTTa9J9nGgYDIIumBIYYnWzUCsIASY2gDh0@vger.kernel.org
X-Gm-Message-State: AFq9FYItEVQdqFDIrpqnhEiZZutnw63kcQYru0yFzB3GQk1HUWpVFxoi
	lZ0GVvtcLdcfqztSckZPkVvIJZmK16zV+yxuvPPcyPFQREo0aCG0cRPP
X-Gm-Gg: AYBFou1u+JyosX9YdnwF3GvHQP5KNY49ObReKEUUwo9oZvlewdUF8Lk9d6wUbdO49So
	75PblkAZiVsISFeaKl17slPQ4MSRfDKW/lrRkyB+qx1MdQzdWJuMLsGe7cN0XRH78MMxpzbF9UQ
	/usvupTqYM97kkWNZKuH/aRmRgCOYTEivlUApdIjMIwCD/FqJv78e22gXDI8zMlcS5xpRf7h9+0
	fFYHUOXBio+eU5l1oBFDZnvV5wwolR1fBO6yAV8yz7dCEbwLR5gqA45CE3/hx0FnNH2t3y44NgN
	WudaIJ38IwQjpl0wGhqlrBZS/Pg83+JXKfm5PG9PR4x9YKixwj6YdTy+tuplpguKbv8jXbaMfxc
	InoVyC/ElPXUfRWEOB0ossqTUWqJLmRlghCOYo+yftTMrM992uDngpFP+8iwvt5hTB1neD+V1Mp
	zN6UnM6+J3OMEpcqJoOV110wnPHNMPgjgmJPTBoE7jNNGUutGLjjvKSRly7/983QJUyrUH5APdW
	Rbt6oYQ+gpSRL6bQHgg1JAngy2VD1Y7MS0Nzr9a7cOnftspEsXeiaWjVCHITlInBiUZ7AIARuBC
	wCQ9xy5lfCeRjpyYfugQMse3PoCjf20z3S1mq1aR9tQYe77jfUQvA8uB+AGasG+IVbgfSoNAc0A
	KIAWwlSb69v9mXFHn9uXj7GynEjczujaMtM183vGvpSrVcQW2BROq4mMn/e0Ca/MhJtrbn3WJfZ
	KjWinpJdu6kjE1BQ4=
X-Received: by 2002:a05:600c:3b24:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a966e2b4damr109547985e9.25.1793273270398;
        Thu, 29 Oct 2026 04:27:50 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm69571215e9.9.2026.10.29.04.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:27:49 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: krzk@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v2] powerpc: dts: Add support for WatchGuard Firebox T30
Date: Thu, 29 Oct 2026 07:27:41 -0400
Message-ID: <20261029112742.10238-1-lefteris.koutrakis@gmail.com>
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

Add initial device tree support for the WatchGuard Firebox T30 board.
Enable building firebox-t30.dtb under CONFIG_MPC85xx_RDB in the
arch/powerpc/boot/dts/fsl/Makefile. Document the watchguard vendor
prefix in vendor-prefixes.yaml.

Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
---
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/powerpc/boot/dts/fsl/Makefile            |   1 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts     | 386 ++++++++++++++++++
 3 files changed, 389 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..75fe4bcbe5f9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -2017,3 +2017,5 @@ patternProperties:
 additionalProperties: false
 
 ...
+  "watchguard,":
+    description: WatchGuard Technologies, Inc.
diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index d2cc8e1f007e..8b5d0ac0ebad 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -44,3 +44,4 @@ dtb-$(CONFIG_GEF_SBC310) += gef_sbc310.dtb
 dtb-$(CONFIG_GEF_SBC610) += gef_sbc610.dtb
 dtb-$(CONFIG_GEF_PPC9A) += gef_ppc9a.dtb
 dtb-$(CONFIG_MVME7100) += mvme7100.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += firebox-t30.dtb
diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
new file mode 100644
index 000000000000..ec6cf911c66f
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree for WatchGuard Firebox T30
+ * Author: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/include/ "p1020si-pre.dtsi"
+
+/ {
+	model = "Watchguard Firebox T30";
+	compatible = "watchguard,firebox-t30", "fsl,P1020RDB";
+
+	memory {
+		device_type = "memory";
+	};
+
+	cpus {
+		/delete-node/ PowerPC,P1020@1;
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
+		gpio0: gpio-controller@fc00 {
+			#gpio-cells = <2>;
+			compatible = "fsl,pq3-gpio";
+			reg = <0xfc00 0x100>;
+			interrupts = <47 0x2 0 0>;
+			gpio-controller;
+		};
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
+				compatible = "atmel,at97sc3204t";
+				reg = <0x29>;
+			};
+		};
+
+		spi0: spi@7000 {
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
+				nvmem-cells = <&macaddr_nor_cfg0_1894 0>;
+				nvmem-cell-names = "mac-address";
+			};
+		};
+	};
+};
+
+/include/ "p1020si-post.dtsi"
-- 
2.53.0

