Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217375;
	b=3zuadUlsqDcGXo3tRgyfkIEs3GYJokJJ8RKWCXuMkeDOCwZYY/J5OH3dTtZoZntj2VCw
	 l4zphTF2mKZVwqsbOn0kWjpXIEUEx3fmftR6pSvhOCApKfUFHQ8pGCrGnN5zOChnlOmaC
	 7ArAO6mSsExJENJ7rx1ZkssXm0yuZeQ2rHBpQuNTA7iV1aSIJDam7ZHeDt2IR08IxLUHL
	 NtxE/eZ+jdQCUfWt3plf8PXFB2tsM58oTXWDCz2I/G9BT1EBc76w2UfqbNfdBlA3Y5Vw/
	 M+5XFEcDlZBtzJMMlfHNFpkNN4dkMITZqfY0iKclDsomFkfEcUP5hdZMUbItEdzjjwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XtI1+5rqnYj+Vf2F598jWJJetoz3MMJ53O3rtQ4Bug4=;
	b=sPtmQcf7LafgcQ3mdNM/GGP+4V+P0iVsTBZeVIDxK+1vtUkRRhdkd917WEKmE6uEi8gz
	 38fwAF7l8zXKRZ5RRKs7iTNEhVJeKryXaj0hCPLD3WLnsK9DDcRwL1CSUF6R4ylHshJM0
	 CBG0LWR/kchr4ks5kq6/A17E0msmDnjBiyes6M5r+dbbFKiVTVce1aO0LVpD6MARe/ZYz
	 Idzud9QXuadGASSh+F12UcuGiRNDSHAKPemoRFPQq8QiykgB4Ks1rWn5ei52wmAAEboU2
	 FfynAnL5IfnWJb0ixb5dLk5sFL02CRn8u7R/Hol1vBXMe3q6KVqsyHFotl+TRgF1tlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKl4rKZQ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2430606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 19:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2430606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKl4rKZQ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so13631155e9.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793217372; x=1793822172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtI1+5rqnYj+Vf2F598jWJJetoz3MMJ53O3rtQ4Bug4=;
        b=oKl4rKZQoai+o4YpN0CaEAOh5peq458bCD69BzKNhPMK4luHhEJldgIaVY2c5v31il
         PvyOeaRhETJLCp+YNfyS8PtMgmeoXbGVs7TD9dEHqDLcNSYS3i9B5/DS8clD+fK+pVHE
         8zWQWijh/ViDb65YnulhvoWBnW5cXlIPuEIkPTEF9xsHIm9H4kqoAqweGqgclS0lItqP
         IWNUW4I6Ap/apnjloh8/F4fwBS3l/U+lGkflqiYxEACB4gz9mx1P8iyNovHqF2oND1uv
         KUPpWlsxMzMXMpbxWPKlXaR1JLmt0PhMGp9ds/uSpR5TJHuL3DLuwObCCox2K8PD/M20
         C9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217372; x=1793822172;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtI1+5rqnYj+Vf2F598jWJJetoz3MMJ53O3rtQ4Bug4=;
        b=gtD4hXsijWq0fTsnYeeAYjrJ4wNq1cAVpETh3W6VEkrPaaLeZLqss8t/rhJS8ariDj
         gUS44KB17Q150S+6DXl3OWbeNWeb3LQClJobIPcYsKPfrUJQPC6zCdDRmilGYtOPl9GB
         DJO1s9C94DHe41nMXbAfGUkFg8dclqFaHzedu27zUUiZb8shRbNp27zZvTq+utH5WAKJ
         dn0L73dt/Nfssw0pl1PTLF2oJBPctzad2m10n536v99+jCcK4Kt9Z2u1OP+BDsd+HeGP
         TmI/c0vvpCG5d+KMQCNUbEnSoN4ANG1EzZZ8W6MFKIamhfo0XoWEjcozakZBOSBUlF66
         0ykQ==
X-Forwarded-Encrypted: i=1; AKwUvByB++2svEuqQ2Hd+3keB98Fw/Z1cy38rLfxcJIe+DhbwHMxHvCtxpcro2mL1a+VDWnp2ZeCDYlZVBg1@vger.kernel.org
X-Gm-Message-State: AFq9FYIQO6veKNUjwXO/iopWV5d3yygZFfloKPLec8z7+r1jshOanxQw
	MwP7OAvQB4pFy7JC3VvN5PodnLhAX3ikpfMQJq6fNrJUvnv1c4y2i1Yd
X-Gm-Gg: AYBFou2yZWvf0iCkss6DnlLXduhLjCLwwwGJhxN0/dd9Ir0rbWU+K5ZZCWnXX1Y0xBo
	BgcEt2lCIAMzJBfvBcfdVsiE1myfYTULjd1dgzsgPAkqjk9avD/Rp+Mpvyww3Z/QCrkQmS8Jwhd
	byCfVb0R3RX+jJihw8qZtQLdxDCbUv98od90GT8cRuhx/houqka/+FfU78iwWEzJ4KFcHir0+xY
	98M29Lmg3KyGolXCeGRdv7aBK7b5YVidRRJ9eAoSNGUep4LkzWgU3HZSZnKbqcMXYskJJmH7KBs
	AYDyYGz5H6b2x94FNLU8fzowWnfCyanIaftJdNSkUGd00a3PHc10y6ikiiNNQfnyZVYo5DZM5fS
	41P4gfKUbItHiaC194ugFhLVQwUfv27G69cxF0bYtlfqMF2oCdtV4CEFYMThyJrPjXaEGZVmu27
	qXdcfdGQlCSDe9uOyzLzNF8CUtlF+dRWeMBGyveqy4QfGEg0A5A7psFEgcXnDX0MnkdoewxK/mo
	n9EZReazI79u+Kb2L9R9uXIVvkTKRZXK4EfQyFNrqBwUfzTmkS9OnV4aJuvgIxqnTAOCzc4ZZVW
	Lutl71GejTan6/N5zN6+rl4vSPFKFTdyLHl0emL1/HDrXJR9M9FzjjH67q4PUi69f53WH35KSti
	BA0EYR1qujmSrh8aI5U7476xWxQmYaXCj2IqP1pUqeAFfINBDevsJ4W67ImiuJ3wbWRVxA2DSOu
	Iew5I3P54Nnx6BbP0=
X-Received: by 2002:a05:600c:4e42:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a9678c276dmr75393635e9.30.1793217371871;
        Wed, 28 Oct 2026 12:56:11 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm14775125e9.5.2026.10.28.12.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:56:11 -0700 (PDT)
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
Subject: [PATCH v7] powerpc/dts: Add Device Tree for WatchGuard Firebox T30 (v7)
Date: Wed, 28 Oct 2026 15:54:23 -0400
Message-ID: <20261028195602.56136-1-lefteris.koutrakis@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This commit adds initial device tree support for the WatchGuard Firebox T30
board and enables building firebox-t30.dtb under CONFIG_MPC85xx_RDB in
arch/powerpc/boot/dts/fsl/Makefile. It also documents the watchguard vendor
prefix in vendor-prefixes.yaml.

Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
---
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/powerpc/boot/dts/fsl/Makefile            |   1 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts     | 386 ++++++++++++++++++
 3 files changed, 389 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f9..898bb9396 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1891,6 +1891,8 @@ patternProperties:
     description: Wanchanglong Electronics Technology（SHENZHEN）Co.，Ltd.
   "^wand,.*":
     description: Wandbord (Technexion)
+  "^watchguard,.*":
+    description: WatchGuard Technologies, Inc.
   "^waveshare,.*":
     description: Waveshare Electronics
   "^wd,.*":
diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index d2cc8e1f0..092616c5b 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_MPC85xx_RDB) += p1020mbg-pc_32b.dtb p1020mbg-pc_36b.dtb
 dtb-$(CONFIG_MPC85xx_RDB) += p1020rdb_36b.dtb p1020rdb.dtb p1020rdb-pc_32b.dtb
 dtb-$(CONFIG_MPC85xx_RDB) += p1020rdb-pc_36b.dtb p1020rdb-pc_camp_core0.dtb
 dtb-$(CONFIG_MPC85xx_RDB) += p1020rdb-pc_camp_core1.dtb p1020rdb-pd.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += firebox-t30.dtb
 dtb-$(CONFIG_MPC85xx_RDB) += p1020utm-pc_32b.dtb p1020utm-pc_36b.dtb
 dtb-$(CONFIG_MPC85xx_RDB) += p1021rdb-pc_32b.dtb p1021rdb-pc_36b.dtb
 dtb-$(CONFIG_MPC85xx_RDB) += p1024rdb_32b.dtb p1024rdb_36b.dtb p1025rdb_32b.dtb
diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
new file mode 100644
index 000000000..ec6cf911c
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

