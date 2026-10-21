Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580079;
	b=wngrQ/sVUQbOy2dgwqdctzbcyu363mtGERaj3UtBKL0ikFvihakdg783UW7WIE3U2FSo
	 6CqIacixcUqMIkt4qT7XAVG30sOPD93wreZJnEEYsmuS4vUyyUM0C2X65luCBFxvfTlpt
	 ceJRpIVRXr5iaqC5S9R4T8VOe+Gn8V5qJWt0+az5KOMd+wNlsfyUni1e1cQjCJ6OPQxFm
	 Gf9I8RgTKrB/DM7Y51WFgXwilbCXFw4Nem4f/w3TePmK4+Wp7hnBhFRUh3hx9Zx/WxIBv
	 XBGB2rddpWhTV9MBfKgDngT06+ueFPXOOFs4Lp39lfMltVKstdzgy59epFfKIBM2d/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ocwe/ua5bx6fTunJTjbDvG/Rp4d0BH8Fbx4UwIDjj0c=;
	b=D3s4D+YBzf66awJWrVAwjnMP3tmOlmF9ygaSv8M1R1ZOtvs7gA1vBiZnK7RLASvXsvgU
	 uIxYSsTt1xyXtA3g0YxnvefH3Jiv8dkBbtis6AJBON7EZ1qK44Nxp0iCUBJCmarb+chTF
	 vxcVKoOtT6aDGgYdo40xkjngYi2XQK/Z4Oja5BGwk+aP68eIgyJDcY3I62lvnzITCUZAb
	 8tb+7J23ojymrzk/XY9T6G6sATOFAUY6xy0KqGJfjVvZie/iaB1wKKFWtFN6CDqnM+/u9
	 khulA4CfR0qeAA1Hjmohgmkm72kI9jjQVr0z8c9ewjgLLeA5WPACq7J4ue0HCdOTa3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gfzKp+Jf;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D470D606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D470D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gfzKp+Jf
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso5400845e9.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580077; x=1793184877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocwe/ua5bx6fTunJTjbDvG/Rp4d0BH8Fbx4UwIDjj0c=;
        b=gfzKp+Jfn9HGkFwZoxtkVcqi981cZV4VqtEWhYSXm2NmynKbW6dKPR3a8/uUURLl3R
         vI9yz435S7jU4KQiqljr3ZwskHWkkF13uJcpLJVER1WSrG9P8U8ig6w3yDiIuUP+jHfO
         oL3+ic7Trpf05BRLN4lJ861emswggMn3PXinsni5/T2RGhHmvDCiZSDqkpeNMxYkUQpF
         NSpIfWQdi5/agxBX9Is4/5s1mwYAvyy0J/t35aETrsEDr1nNpY5USkXyYW+HkqhUyza4
         GbUtDbYdCuOjga8YW9VFuP+srgb7925VYCsk8F/Zq0N0U06Euk0RMrrLi2slNppjlkDd
         Duaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580077; x=1793184877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocwe/ua5bx6fTunJTjbDvG/Rp4d0BH8Fbx4UwIDjj0c=;
        b=YhAcz8eYAJ3plDH+i34NNkTNwKQxPMQVvWVGFNin/siLtY+EH64N7tsKDVEDr8nyd9
         XNK8AJ+tbavkP0Rrkf/n2Fo8NejUGJ/ccrqiJljHNj95gLIf6bqSca+E6tHw/TIfIWO/
         SaEQ3nlWuhU7M6M5gQyMkfjkYzbQUkWxbXxDvyX0WL1QE2jyHiEv1AEghF5IB6uqHe86
         pbXxzblvtLQgXUIcuD93xt9Uodu/GSqEvw3Qq6D5rb65GfewdGxbGa7oxp4IkMXyrauA
         BOrrSF9/vJXgfxUQUkwaSkDrtyLhLjfCMq69zv/4C6vwvD9mPcQj/PukNuEqAmPAg1Yh
         TL1A==
X-Forwarded-Encrypted: i=1; AKwUvBxLuEYB0UCaaHxx2cCgzfaWQ+bAQ5NdN+1UC7Rx4PTG50+DStnJF56uLjaLeoAeRRWm6rdXIA1415Gb@vger.kernel.org
X-Gm-Message-State: AFq9FYIpaIfDMIt3nHcg9UMbcBUdxJ2UWTS8EwVcz7sFIRqtDu59LYD1
	lPQlhqaF2JkEZvGBGQ9z1WjphZhmr0faf0yYP5Gwb0xBZ0FaaliWe8KC
X-Gm-Gg: AYBFou3t6m1czyOzQ69t+wqgiFH5p/cDpSJiA8DLqLeUbs4u/Ag0POvtpJhu9oZbEC4
	fHfAZ/n6nFESnNd3CIdNVSe5Za3Kdjodu/s2nF771dpASXIC5Gj+tzSzR4f5ZzxXY3B/UqgN/cY
	GY5KHwdPLq4klSdSNcpn7z8EQR+FlmyrCXl3ZZ8k/I+hKLzbvqUnkcPTyMCC4xWvJzyiA8yJSgq
	oAa1KBZP+m6cYYNO/lC/oZXAihHd8eidQqjIANFRMZaRUlC9rofJN6iY1uaFn7WD6s5LFijqlRi
	F0loPIP9O4j/c5U8WxhvRUmqvZf+w+wgIw8/LKE4Q8Vyu6F6ubD5wv4w5x6Wdx3CoWDlVIOr5rL
	Mm0wLQLdnZwlofqQo6mdUrQ5Hcvi/Vlm/HidEReawzj4R5blaxuNWx9aymnoq6a6eJTCxzAwLT5
	RjCM2w3Hp9MSLQAczYDhoEAwL+UpRoFYMmRMNz255NwguwUdxgPu8liIxhk5O+B10toDT4ouodm
	vvKFjobK4ek9Klt/eq2K6Mf60D/DqYvWSeTCiJ6HayM2NxdEy8=
X-Received: by 2002:a05:600c:3488:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4a1fd8a0560mr37336685e9.2.1792580076920;
        Wed, 21 Oct 2026 03:54:36 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:54:36 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Wed, 21 Oct 2026 12:47:27 +0200
Message-ID: <20261021105109.199886-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

From: Val Packett <val@packett.cool>

Add the dtsi to be included by all boards using the MT6392 PMIC,
providing support for regulator, keys, pinctrl and RTC.

Import the new file in the shared device tree for the Pumpkin boards.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++++++++++++++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   7 +
 2 files changed, 152 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..cc4770d70246
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6392keys: keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392regulators: regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vproc_reg: vproc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vsys_reg: vsys {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vaud28_reg: vaud28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vxo22_reg: vxo22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vaud22_reg: vaud22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vadc18_reg: vadc18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio28_reg: vio28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vusb_reg: vusb {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmc_reg: vmc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmch_reg: vmch {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vemc3v3_reg: vemc3v3 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamaf_reg: vcamaf {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp1_reg: vgp1 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp2_reg: vgp2 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vefuse_reg: vefuse {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vm25_reg: vm25 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio18_reg: vio18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcn18_reg: vcn18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamd_reg: vcamd {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamio_reg: vcamio {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vrtc_reg: vrtc { };
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 805fb82138a8..b19d5792bd89 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
+#include "mt6392.dtsi"
+
 / {
 	aliases {
 		serial0 = &uart0;
@@ -160,6 +162,11 @@ &i2c2 {
 	status = "okay";
 };
 
+&pmic {
+	interrupt-parent = <&pio>;
+	interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.43.0

