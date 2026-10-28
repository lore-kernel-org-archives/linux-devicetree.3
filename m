Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198068;
	b=dhKh27O7bPTLr8Z3OqrSftKrMVjc+GHXEaHK+fRI9D4eLfdn7zUARNP0kdDytrA03Dui
	 k6CN9CO3rujwBNARr602ES/2hdBw5eCoxTJg3Enpj75braBeAsEnfTZkra6T5DXTqOjEh
	 vNmoqX0Ezi6lLdEq/bKE/eHeOZHCYK6OvRGJGnTNeYZLoqvCsPLJQTJslLYrVDkAWIgVa
	 iKZZXl2kH4pOaXtgNxjSD38y7gwLhxfM4o+imZTa0FzdMjTvLSmfFLZvMgFoJrlDUMe05
	 bhf9cuZgnLogx1EnKRrxhYsA85jifZ2/nBvPSlSdhRrDiAOirPHZ1l/orOfiEr8u18w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vyhcMfYicvnsGtBj/rE9dxPeB2D14M/Y5t9f3Exa9/8=;
	b=BOqbMjbd92wS140u/qgasM9AwziI6SfSiv7b71zIkI6RiUq5QZgA4l1cFgL6ouk6JglI
	 bZCvJHu98B1/JYluL7cXp7189OkDhgyWBFH3QLPVXTWlufgtImxjfkHqbprl6604LCN9T
	 9j8Qy9tNisRY4Tlwd3AXSJiXzj3827yZVvol4MnZuTFM3F3i/O4srzS8rfe44n5FOH4NW
	 0Qm0AEf8bOV8H8qfzeEX9UlutZO+afSfarZcqi1BGybBh+PUQNlv2sCrDUBZVmfw5Tpoz
	 lzExA2QZ3d9RC4vF9ow3IaTGoIILmbWH+DLjXB+zgwveA4T9P4H50DH3VGzqE7q7kVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqUHWjsF;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221F7606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 221F7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqUHWjsF
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso681791f8f.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793198066; x=1793802866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vyhcMfYicvnsGtBj/rE9dxPeB2D14M/Y5t9f3Exa9/8=;
        b=sqUHWjsF1p5Bff1KonFfHb6b5/wqg0Lpky0oQ6lb9xwn76xce0uZul2YvadWm25c3E
         cJTE6l5G2+ydmeV7PA76X8meSPOza/SdrC/LiO6hR7Tbs0y3N0NWacVG7PLht7J7JwTF
         JEum6Qc6Uy+Y4tczWInfdyE5ZU+ttHRivO9m2bcZcu430ONomzOZJk2jbK6xAYEmQZuk
         8c7EHuhQwulY92kojaeUwzigncpxiUf/Q1GpBfMpMGTTl+U8Xba9HvxzsXL6624Qkszj
         1BY8Xq9xUlvkgL5w/y7ONAlXnVY4nFlYSZ8XANhDtMcth2hUjKmVhYC/mdhdC3kLMgVV
         QCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198066; x=1793802866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyhcMfYicvnsGtBj/rE9dxPeB2D14M/Y5t9f3Exa9/8=;
        b=uglZKN7H9XbuHb+r5xMTFxiDb5uGZbrzd1FCXhU7R24JQkuUjVfXiWmYz2EcaYI9ez
         +XZbiuFmfPixxJXddk4kuMgqDVe1nZ3D/N0qN+t8Xk7DfDWlCRBFnRkws+xX2OeSF2p2
         CrW+GVJD8KwNlXwqt+UBXFWe8Jhxhi9zGvbQ9BkY4cgiXYfDaGEX3VTRVmWPpl6l9DwI
         WjVV6IyHcGKgHPV94IXsZ5j8TrnRkl4Kjfhcnli+xNhLrKq+rlVNQYnZwFZkwQ0l5OYv
         Of0O+TODc4qWdXfC0Xyq5cx89EhUesFebiVNI4DQqHEHNHs8uGde4ctU4oSf/G4RuitO
         XYUA==
X-Forwarded-Encrypted: i=1; AKwUvBwHMtP+7/A4sSdlnBCt/C3cSfzXPDQX1sLaGB6YgTYUn98soQu0Nki2/+VGQZsWGiY78vkqszMPJjy9@vger.kernel.org
X-Gm-Message-State: AFq9FYKVY8WQ6fUOxahm4jFvNlDp96jv/8BErDK+pbdOalT1remTmaGv
	XzqHTOSpJon349ODcayKuLv0wufHKc7KFaeXuiAKO+QsRpg6Od/SaWkM
X-Gm-Gg: AYBFou0fHft1OK+G4UKj/u1TqXYPP2DVo1g+QOJGSPmdDhFM9nZys+/6L4ttq/AYsXJ
	VTj+JYkrEBZCq2iVXbgnu32QToft+EKWjEVQ2N+GtH6HKWjnWWLQXPQxMlXbz/vdL1pDsYdepsS
	gl88/uBTuEjJGtD4LuklVRKX3kH2C6cThPjISnIzleTLCznk9mySM8YJXgqTQ6RemsBbfEclnRf
	F58MQiDHtVhTPQerp+0tYemTPZcK2djM7z1pjkAEMc7U34QBndY8wWdAj5olN/IJzcNer+vgkrV
	osraPfBWuxKMAbkS8Y4SZzHAnsrOcGzd1knS557ahmB/3ieE2mHms4a4oTVf+Sm+MBXiAxaswTP
	7+zqfslQ6VJBBonIE+GD6sJhNuxGxd2Vveaa9GHCaOsOvRaJn7iZzXs7bwxwvIZrIAPjiTXz1fj
	SuadT8569e3++tlKK20kvb8IGj3TPUDEqrJ/0BQNH22udgb0TxX9aNMUqNM3pmeaPbUt3Tn8i4a
	Z8a7lkrtqN8FYOw7k1ENBJpX8SHeKkg2IuBNPyfdMaC/bmfFeqLzjcBIfZjeUU946TUjNkOkpzS
	VALaTPUu1aQUjjq+UdqHtD5ZngakrIahTyuSbqk/McbfLnS50KXzHeIYBUgzhlQN+icHj2a+EWd
	JxFQ2rgPshOYYFy2zDntwr8oX1n+LZyLqumVNa9g7IsPSTskJUJEFXRS4sHAKVZGyKfzMs86HAW
	KHjh6OUNtGQDWUOF0=
X-Received: by 2002:a05:6000:2006:b0:48d:faa4:5b66 with SMTP id ffacd0b85a97d-48e5d2f95cbmr6601405f8f.36.1793198066354;
        Wed, 28 Oct 2026 07:34:26 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm28289924f8f.39.2026.10.28.07.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:34:25 -0700 (PDT)
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
Subject: [PATCH v3] powerpc/dts: Add Device Tree for WatchGuard Firebox T30
Date: Wed, 28 Oct 2026 10:34:21 -0400
Message-ID: <20261028143421.145290-1-lefteris.koutrakis@gmail.com>
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
PowerPC architecture, updating the fsl Makefile and adding the new DTS file.
---
 arch/powerpc/boot/dts/fsl/Makefile        |   2 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts | 398 ++++++++++++++++++++++
 2 files changed, 400 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts

diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index d2cc8e1f0..0a5c8b596 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -3,6 +3,7 @@
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
 
 # MPC85xx platforms
+dtb-$(CONFIG_MPC85xx_RDB) += firebox-t30.dtb
 dtb-$(CONFIG_BSC9131_RDB) += bsc9131rdb.dtb
 dtb-$(CONFIG_BSC9132_QDS) += bsc9132qds.dtb
 dtb-$(CONFIG_C293_PCIE) += c293pcie.dtb
@@ -44,3 +45,4 @@ dtb-$(CONFIG_GEF_SBC310) += gef_sbc310.dtb
 dtb-$(CONFIG_GEF_SBC610) += gef_sbc610.dtb
 dtb-$(CONFIG_GEF_PPC9A) += gef_ppc9a.dtb
 dtb-$(CONFIG_MVME7100) += mvme7100.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += firebox-t30.dtb
diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
new file mode 100644
index 000000000..6e9ec7f90
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
@@ -0,0 +1,398 @@
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
+/include/ "p1020si-post.dtsi"
-- 
2.53.0

