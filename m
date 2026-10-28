Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201830;
	b=elbys5db4l5bpMokuNy/Neu5YXRpmI0LF4ycNSqgLp7g+krzoGUA0GHagzHpohAuC4Nq
	 rkvVjglLJtoj7pQaf+dpKzWeV4kLMntUPr2Jor4PKiCNgz/bESfk1oZZbfaCA0UfoiRlh
	 8d0mNtaAh+td0u1jPHx92CnGnp8FQ7sItE/WRRawoCfMbbiE9Pw7QnsDo5jH6G8zddxPe
	 HTPT9pEg4YCgh6vmQxuKVsTOz0uJy9tdQyJKeVTBr0qIW1i1CTNy5i60DdZlIFwFV1duQ
	 V6CLgFuzKbRqn9jB2PTgTPB9Tzx+eK8I5tjIXm3Kv0N/EOEqI/iGisgbvh4uGbXQ32Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I16DQdy1VOVFDjvuWwKEez1vFW63gYQh2CVkwH7X+QY=;
	b=S1DmXCRh34J9y8B6Y/ja2iLCQrDKGanBBr1kpCvbJ2oTidvVn+YNWOCnTELOM5BY4E7J
	 04SRAVQrV9yRjuWYw+8k4oyaYWFmYveIGPzgfQ+DzMusdyD2ld3ZF8zKGDnmtfeM+poRE
	 QsHqCvmimwBfgGk9j2RVVAid1HVXV5g/zkTGaj25ebgjo6KxC5epPPfF9K815BUIrrDGp
	 E1zCTR4YP0UtUxTZbWaudNUgg/O4h16IN0g3fVYokyELJQSVQHt7RUP/4akQC9of+Tw4B
	 coajqP/fkM2B+E4MjedFWLyQD7j8mNd4XmaAqIatiRRrZycIhCJ+LLwf1zz/OTiixpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nK/pIe0n";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1857A606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1857A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nK/pIe0n
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso7774575e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201828; x=1793806628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I16DQdy1VOVFDjvuWwKEez1vFW63gYQh2CVkwH7X+QY=;
        b=nK/pIe0ngKCTRN/P1vJMMYdC0biISm21apL8jvlyy9pwKohheWIn0VP19j9NaYf9VB
         aaZighpNrdbOYCFbqpgnbqGvf6UFH5RUZ+ELVZzGky9IXVnL3dmD3WfriJ/bwaM3WJxn
         Xl/mF+2oOwYJgBIhhwSvt0mgLyrXPeiMOtFB/JTqQxNcroTlRIYmOTGdglhjzolFs4pk
         2bPuhD4sezlbufFtuyV/1oZ0n8qdrhqCRszW24TsEl12LeD1l9QYDBT0C6k4I6JoZEGC
         atIVdwUswECGGlxuVgQFbWzQZCHYhNASNDa5DX4Soyw1WFYeSTo+Yij2BT3yf/HBDv33
         ZMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201828; x=1793806628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I16DQdy1VOVFDjvuWwKEez1vFW63gYQh2CVkwH7X+QY=;
        b=g82nhuD/HYDBIP2FK3Wn42HCCrOYAjpKVqdc63ZdFOIOWmgrdkbOLM6sethEQ2U9mB
         8FATZAKj8WLf9ol3wJHX2ZRcfszOhTZrttfiN4uLU2NjZ48ujFx+BjTonDm7vxjgrJnE
         tweAyStaudDyeuhCxg/qcxEZJhVzSOxM3Tj8MFvmvMjmWzrWHd6O/aVT+fpwR3Get/mF
         D9UDhzTeP1CnFrFWD3gxFqITu9UrltZNldvBrYj7jlbDhU58Vgsp0ySOduBEaPGX5zJ0
         hBN7QVl9uMKxAvkdzZG4k49Xy/2oOGWXabtxfpYslRLphqpCFK9Ca+tc2hAkAVHiO7M7
         OnLw==
X-Forwarded-Encrypted: i=1; AKwUvBzYTIYtx+JL8/VWJTJ+JS307DsvDwjPcxWCDILOtmIJv5vpV5Med61waZsWSrqxVQLS0yt4qhbS4W5Z@vger.kernel.org
X-Gm-Message-State: AFq9FYK76h3QkbLosBcLkQys/EQc9T0PoswxbPVSYf6oz49uziNXDcW+
	TRxXjz7fOPzuMc1FFKu3V+iiWfmMZBNE/dfzL/Kpg82Db15QXVLQ6viZ
X-Gm-Gg: AYBFou2e0GCLgEnuBgJ0yVo4c6AWBOU4BUQE3SZQ2LBIk86XQBb16jPyOw7r3vdO/bZ
	wDdOZGKs7+i/pEXfhKR2P8uXX5ie9+zIFVgWJZ0XyAXLTnMHQ9svw1FyxJ4y75wtmCSEJFN5PwT
	w7Jro22xuLbxJPx8J3v5SQQicUiLYsVSFwiv0XFmpEE2yNd61mVEn7weGM/2G15oI6x65eIGPMI
	zOk3pH81wr1x/bHJGBuoqKBw5tzg2Th2M5wtPs/8Iz4qSQkd65O4cTPKUGn0PhdNDyaLazGWNVz
	bPv12vAJgKRZ9wxvFwh5CBxyFA4N4nq2GBuql2+rjh91+UStgfGp2wW2X6vhtuBLyjFLaLces/E
	Md3rsHdlRcbOVDGLetMLtDO+oAtqJik6y3DnBkNJUv2pE4wndItStd1I8wK1Y3FmhKU7qpZqN0K
	MQwK1Vez+w7tBV/XLP77F6wIm94mT5S+Yw4vt9oW+S+eWOzFp1a8/0LPAOUH5vA292dHm4iPJVh
	q6hMGH9/WzN05RrgrGYUuVXkFihYr+g/Yq//qjw0FOKinjSb7zZjRWOf8bpX+m2zAuCgUcvguAA
	PgZE+sSX7rbk69nX8iKupNHa7jCT+dQ7vms0ziq9wG+At+/g7LLWjzHkOxbKC5ggRG++FCjtKE+
	GXfuk2SwA+Yep2ubXgmYMmnocP7Wr11NyqjQtpHXblUCcC2jZmtpsDVYBqy3/rE+Q/maTgWV/eg
	d8M9DhiPGKwVW6ikc=
X-Received: by 2002:a05:600c:5397:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4a967babdb6mr57832025e9.31.1793201828288;
        Wed, 28 Oct 2026 08:37:08 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm35488335e9.2.2026.10.28.08.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:37:07 -0700 (PDT)
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
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v4] powerpc/dts: Add Device Tree for WatchGuard Firebox T30
Date: Wed, 28 Oct 2026 11:37:02 -0400
Message-ID: <20261028153702.4287-1-lefteris.koutrakis@gmail.com>
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

Add initial support for the WatchGuard Firebox T30 board based on the
PowerPC architecture, updating the fsl Makefile and adding the new DTS
file.

Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
---
 arch/powerpc/boot/dts/fsl/Makefile        |   1 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts | 378 ++++++++++++++++++++++
 2 files changed, 379 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts
---

v4:
- Removed duplicate firebox-t30.dtb entry from fsl/Makefile.
- Fixed invalid TPM compatible string to "atmel,at97sc3204t".
- Dropped redundant SoC properties and malformed interrupts in sdhc/spi0.
- Removed unsupported properties (rx/tx internal delays, gpio-controller).
- Wrapped commit message to 75 columns and added Signed-off-by.

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
index 000000000..318430a57
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
+
+		spi0: spi@7000 {
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

