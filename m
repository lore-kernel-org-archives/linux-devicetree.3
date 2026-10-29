Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290248;
	b=U5XLock3T5aVYrJROiD3K5fJpp1airikjjOipM9cSnskDugl/qns13yWp4wiuarIVlY9
	 49b7bAri0xXKUwnzhTI+aZtmTwuhcgiLkid1xh9GUY0hrp40UoPlr5fNQYynutFJ9pYY/
	 bdGB1DJ5OcJaCXuUmmEI6OFQC61fIHLuOJ7JmtjSP9BbT9sTcz8WKPok7SRtR99tqcFUP
	 MHk8KvZjcUP9o8fmnl4cg7GiVPKn4r38RYajVDgIKVm/V0AF2roVKFRm9AVsfddgN+sbQ
	 mWue+lEg3EwyfZFuJ3eehTvZ1HD2Oxqp+I2U/ANHhy2U29ht9tlpVPKfcDcGP4eOzjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Olu1HZtBUL1umhLjTK2ztuieF0PyP+Vx+Ejrhr2YE+M=;
	b=Kg8+DSWCbpsMyukZX4qSMwR+/XQ/ezQtD3/9tOpkthVmXIj0nxixKR3w/NuAshcRR/iT
	 s9qD2RA46NuVzySFQPPhF6dpfPtyjgKYxw9gjkCXYnsa9HAkoSXJ5wolZs/q6P6gFd7XE
	 ix0ivUl6azgWtAc+qKFY3o7ojJFb/BpEKJHpW3K8n9Rwp+yiQQ19RJSpP9eVa0Xkzd4ns
	 yPx+cCZaZyL8swicW4HadANFFRdlkF5Y2p6W1P9RnTYkhaW0DHOhIb++QRJC69sUfcy2w
	 jWCdddU/2UP/keZzD/NjtArYom4k+DWOaDqUEGFHfvG87DqQjNjrL3K4jOiD0TR1eTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9YrGQu7;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C65C606E007
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 16:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C65C606E007
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9YrGQu7
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1946072f8f.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793290246; x=1793895046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Olu1HZtBUL1umhLjTK2ztuieF0PyP+Vx+Ejrhr2YE+M=;
        b=y9YrGQu7j/5Xc58wMM9nDCOrp6ffjxx1Sh9wGY7LFggALIye+of6Dm1fMl6yquKFWT
         QiNC9x9KouvMy0SsRvve54ECOfduuo88Uu6717Yra7tKlxShS5NMWDa2fRvMsl0VX7dg
         BTf6QpBOrKuDbPwRe8S9LH2ZqMiPoZPIcPHkQrdCRdgjMwRidSMfixsX7kd/7ztrD1PH
         TwXglWpa/dqpCe9gPFFGEJRfIN4jSbAV+5wd+cNfeed6SAnAD0VaykhRvfyStxjSNMEQ
         LthgviMq0Me95dV12s1bKY5PuotOGjFAJ0QZRcIHyUswka+FVk+qwcIBb+kd33LAouVX
         FpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290246; x=1793895046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Olu1HZtBUL1umhLjTK2ztuieF0PyP+Vx+Ejrhr2YE+M=;
        b=jjP7QoIptmp/qoRqDhUZZQE9GZ9F3xU43iojFXgUk21WMqK3W4HJIFX9OEW7lbQaWJ
         wBekB6iZKtHqQrjj/P7q6VVFp9M9VtAp1yGHJp/sU8mrrUAZiFzOW3GOVn6XynVcUB5x
         G/F90yE+EKDNPktIlubyW9HaI13fsgasDydGOE6r47dDBTPmMkzbzwFvnlp/5BgGvBRy
         A3c6HgAibhKxOSBgsYbI3LMU3vsMhA94jRwlWAVNbVlVlSnwKks2xO3PJMSj3ZJsHyik
         UWkDHYQeBJQwjmuvss+0PYWl8U4NKnq5Cx7jVQByBpGwjK52g6baZm9ifJJTqVZkBw5o
         Z+Ow==
X-Forwarded-Encrypted: i=1; AKwUvBz1fW/wvCbyVanTvpWrpQJM0jNy4/6hoJjpolsy55gd+3aSOskhkm9Oau97u9RysLA892Ic6Q1xqpQH@vger.kernel.org
X-Gm-Message-State: AFq9FYKaHOIvt9IMna3y0NV7627DizmUxY7rbkFx5kWtfzWs0MgyqWpW
	d1aIF3PmdEoYQNKrSCnZckT3zuXVEfL/zZomg4KP6VSawpQNjgo4B9an
X-Gm-Gg: AYBFou2UogwiFgECJaQOk0XEM9fcWtoK/Tl5yMnCLPo8QopUVF/GnibU/qMqSimL3Vp
	o9yNW39HcxmnWY11qSuRk2mam3k4z+a46dO82ImCsuHjyJeRxaemutru6q9cgykS/uvaJGQGckr
	HoD5MtioRgWOy5dElJM9aZN2lm+8uZ66YfLMPjEdk5URjBldd5+dgLlqV9eIq6Hw6ok8dmrRMSg
	Rj6xoiG9VYCnoh1wMITNy/8B+oHRbmqTUiUCE8cQmnsY2AJ1IhpuNAcBYDaww1sSXI/6m8ukRdQ
	WXVpGRKsxANEJ4Oab7UDZWluIm07bKmpBBXAUI/nR+a7dBS1vXrvCAooj/GIdxgjTKfpETUrgHj
	pWZl29VZqPV3yGXu5pwA2Tq8OaDbhtZLXMyQWhbckSB053lO8P4WgStu95ek2retftkuQmSbl4r
	p3Xq9OLGqL6YYDTdlWZAXeiFXL9YAjchvPcDqhOH/O20FZA+QO4N1aAcPEF7Mwz2FouSra6+pLe
	DpiBrSF5kM7kmfhcMV1x5Ws2iS9Wx05FNWThunXcCaVU7RDTV6ia5/8V++xo00WJM3/2VwIXzSv
	oS61zHVg38wlawhRmaGkVsHzRP9NrhGq2YJIyQUQrwvyeeZDeTGAPGn6CR+a8itAIWVs+oMSR1v
	3+zNzOrCY6x3zNiVyyXC38N7QYn2PFF5o/AV4QdsjVJvo/W2knqw1DnlPUF2et5khz7mtVQDk/i
	Dk
X-Received: by 2002:a05:6000:1862:b0:48d:fbe1:bb17 with SMTP id ffacd0b85a97d-48e5d4681femr14535967f8f.41.1793290246032;
        Thu, 29 Oct 2026 09:10:46 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df1dfa5sm146254f8f.2.2026.10.29.09.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:10:45 -0700 (PDT)
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
Subject: [PATCH v8 2/2] powerpc: dts: fsl: Add support for WatchGuard Firebox T30
Date: Thu, 29 Oct 2026 12:10:09 -0400
Message-ID: <20261029161013.52866-2-lefteris.koutrakis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029161013.52866-1-lefteris.koutrakis@gmail.com>
References: <20261029161013.52866-1-lefteris.koutrakis@gmail.com>
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

Add initial device tree support for the WatchGuard Firebox T30 board
and enable building firebox-t30.dtb under CONFIG_MPC85xx_RDB in
arch/powerpc/boot/dts/fsl/Makefile.

Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
---
 arch/powerpc/boot/dts/fsl/Makefile        |   1 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts | 386 ++++++++++++++++++++++
 2 files changed, 387 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts

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

