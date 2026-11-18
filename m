Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044623;
	b=EZENawMLuQOgqfVyjcTEzaGT9uGn+wd4Ywl244XfIbJNa7cfKeE85LTWg/c4Sbnaqtf3
	 d2se9qThc1pVYuWQKZiohHRP1j4SgQn5leYtEdfu88AhkN3lyPawQHHK56x7nDJga+O2/
	 Z24UH88BApUWgL0u7BogqP0/7OPbahYBzGLjLe/5pqs4KAXF7tBXDP24NdRU+wZcfw3tF
	 w95cIdCHZHsaLOXx2B7dDPJv0diXPoXUpIzdyLHa40hYBgFIwP8bBe//gSQnKCv4RMXQ1
	 Y7bbsQqOP1u4ikLeiePnd8zn0r9lc2Lh/Z28FA68HeXJ+Cyjw0HAAgMpaLVefdpT1tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=D4kvXPXjJrJfC4xPYDD6GGUwfPJQ0tfGxICatFpEaO4=;
	b=5I/yV1BTyaUWNxq/khq/j6DWHJkegvszJgVl/cHFbsLeCh4XRdT2s1FGX2gc6DZIlwRg
	 puw4/zCFrNBaodTHZy2bHuo3kaP+Lwsuf3D+1PH8oOp3HQA2hUKTIshpTlX+ThDgvb7qj
	 63sNI/+kgGt/fOBsJAfK3/3kZTtPCPUMP5yLIBnlD99t00TATExkL2cHtyNUNUBYw8CDQ
	 MFQR7bVD7GGp70FfcOL2uyDXrdAoCFOp/REYnsCuJS8zIzmdNnQvVhj/nm/btenR1W5pY
	 wIJR+qEZRDDuir2/l5b/hcqyVp0xtOdc4KOG9EWKiKFLutlB+H2ZVr9uQRx33zjFjcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AOm5Xxm7;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6162606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6162606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AOm5Xxm7
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c511cdd5a82so141695766b.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795044620; x=1795649420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4kvXPXjJrJfC4xPYDD6GGUwfPJQ0tfGxICatFpEaO4=;
        b=AOm5Xxm7n5D7dFYdRBI+Qmp+3JaaK/o2fbDAVT4Ikffp9/gWc8fowiFex4V+pCes7I
         Q4p8DZubFdamjsfE7z2CyEUuLsw27T+QAxCJbVUyQyD3lbrx4ufPh60XT7TS7wmmt6b+
         1d3murFIt1o6u38IQo5EsC5Bsg2l7Ps4NR8tV4cfQejbQy4gBC9AmPTtVi73OZ56Jt+Z
         vYy7HjPmn35L0AS46P5garyngoQNxQrPGQE2vOxoGNsq2/xmbha4etlR0RePULu+FeiR
         FfWB1TaeYbRSoUScQWfuykF/1ON5jM9bVrQEIApNXRz8mK1D7eVKDCdWG6r+qZaIe5Cx
         CMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044620; x=1795649420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4kvXPXjJrJfC4xPYDD6GGUwfPJQ0tfGxICatFpEaO4=;
        b=z184OitkNNlpnpkI/mjdliLDP53UkE74Kx60zS1RkCair2dD6uNoIniChKogdvwf8+
         dfjBXS2623WFF/YMVVjJ/t9D94vD9wzSyVQ81RQGL/ZzRKUAgiN4/1OLUbnsaxJEFk1d
         urf+yLJ/iIP22GJLwc7UUhVplrzB2pGUwMXtTR3R2PB/43LuYvgMN3z7jjfrfeaCYq+a
         VIZeUs99tMXllx1OCYw2UnTfWgXFU+Gkn3pGNoSt69FK/K+vuquPSteJ+Nvx55rIvkKK
         18aDMWKi2dWNY4np0ry0KqzDihJDS5vIDhsaXhZQaQ8DIO3zHLlFQniN3svDJLVRpINp
         3o/A==
X-Gm-Message-State: APuU4Z9jad859RxlkZ0xYOVD3OpX0vZmboEO7hiIgwomcirOC/uL6bQn
	GdD12Z7MZ5f3+qiJMecOBHQ26FUalZGpHQq6BEzsLAJ14G7F8roZdiVO
X-Gm-Gg: AYBFou0wshm+LdGufPRMUr583Yz5DO7dRO5HvXWppjhXOjwvO2EAEAsISWJ03QmpmiE
	0GJBIm/je1vkmkhQiyTQYU/E/GBczaYkBdQwx5WjRVucTLJx3XBOxA5dW0E5hu2yNdu3GD+yrHr
	wY1l4o4YbJr6NjeC7wcz/BB7qOfDUNhOdlzJ/KbaDLk8noGjeTDRLypOu658SvsVDMZfijqE3yo
	LBpM3tdWB1EyUz1kaV+Aiku7k8p38RHW5GrGeJl3FUpVzPZt6y5cbphcYvULziuySoBF50OVcld
	XxyLfSjQ63DjTF0QuLB3TYY2K7hmuOU5UlIeMrLjJjB3EUVQe07GSygdVweT052slRzNnweaqOx
	kS+WnrS/fWpKBJi9ZRZ4aVs5/fos6E5r0HOfPOeMOROEC7k92zuXT5v/dJPnPnbPOOLp+4DGc/G
	8GKuqhMgPAnWOskthRZawJ+0oUBLws7xkShUv1Z6dQmiGF6RxDDa9akwAWOg3wEZfNk73DQj2KH
	IH1x8x68crD2BurXmTAMaZq12vM+q1a8rhxi9Sn8MLr0ZD2lQ8PdXfMBirOCJswMPmiX6OuXsyb
	9AwsAyTs6ViXEHaGMPFR0LG3oa8xQMEQkLqyEQtpYY8=
X-Received: by 2002:a17:907:3ea6:b0:c50:bf14:8ec1 with SMTP id a640c23a62f3a-c510e4c7a66mr412768966b.33.1795044620407;
        Wed, 18 Nov 2026 15:30:20 -0800 (PST)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm47809166b.78.2026.11.18.15.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:30:19 -0800 (PST)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Thu, 19 Nov 2026 04:29:40 +0500
Subject: [PATCH v3 2/4] arm64: dts: rockchip: add Forlinx FET3568-C
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ok3568-c-v3-2-071840643591@gmail.com>
References: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
In-Reply-To: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044612; l=8183;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=kwtI6S0QcRAZXZc30UUXQRskuC6D+uY+/6wBkU3Qvlg=;
 b=hF9VLMArxbcCXrfEOl+09lVDEFP7Wi+2yTUYDj5l/OTDw0U/OkI0Cwyy+l/bmpqo95DuJguu6
 c/n5PjDR4EaARBmYxWyAGJtIQzqTscMbkVkyiovmZC+47dXSVmNFk/s
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
This SoM used by OK3568-C Board.

FET3568-C features:
- Rockchip RK3568
- DDR4 1/2/4/8 GB
- eMMC 8/16/32/64 GB
- RK809 PMIC

Add devicetree for Forlinx FET3568-C SoM.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi | 332 +++++++++++++++++++++
 1 file changed, 332 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi
new file mode 100644
index 000000000000..9a3e810c46b5
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi
@@ -0,0 +1,332 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "rk3568.dtsi"
+
+/ {
+	compatible = "forlinx,fet3568-c", "rockchip,rk3568";
+
+	aliases {
+		mmc0 = &sdhci;
+	};
+
+	chosen: chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			pinctrl-names = "default";
+			pinctrl-0 = <&led0_pin>;
+		};
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	vdd_cpu: regulator@1c {
+		compatible = "tcs,tcs4525";
+		reg = <0x1c>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <1150000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
+		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
+		#clock-cells = <1>;
+		clocks = <&cru I2S1_MCLKOUT_TX>;
+		clock-names = "mclk";
+		clock-output-names = "rk809-clkout1", "rk809-clkout2";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int>, <&i2s1m0_mclk>;
+		#sound-dai-cells = <0>;
+		system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vcc3v3>;
+		vcc2-supply = <&vcc3v3>;
+		vcc3-supply = <&vcc3v3>;
+		vcc4-supply = <&vcc3v3>;
+		vcc5-supply = <&vcc3v3>;
+		vcc6-supply = <&vcc3v3>;
+		vcc7-supply = <&vcc3v3>;
+		vcc8-supply = <&vcc3v3>;
+		vcc9-supply = <&vcc3v3>;
+
+		regulators {
+			vdd_logic: DCDC_REG1 {
+				regulator-name = "vdd_logic";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_gpu: DCDC_REG2 {
+				regulator-name = "vdd_gpu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-name = "vcc_ddr";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdd_npu: DCDC_REG4 {
+				regulator-name = "vdd_npu";
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8: DCDC_REG5 {
+				regulator-name = "vcc_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v9_image: LDO_REG1 {
+				regulator-name = "vdda0v9_image";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v9: LDO_REG2 {
+				regulator-name = "vdda_0v9";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v9_pmu: LDO_REG3 {
+				regulator-name = "vdda0v9_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vccio_acodec: LDO_REG4 {
+				regulator-name = "vccio_acodec";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-name = "vccio_sd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_pmu: LDO_REG6 {
+				regulator-name = "vcc3v3_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcca_1v8: LDO_REG7 {
+				regulator-name = "vcca_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pmu: LDO_REG8 {
+				regulator-name = "vcca1v8_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcca1v8_image: LDO_REG9 {
+				regulator-name = "vcca1v8_image";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3: SWITCH_REG1 {
+				regulator-name = "vcc_3v3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_sd: SWITCH_REG2 {
+				regulator-name = "vcc3v3_sd";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	leds {
+		led0_pin: led0-pin {
+			rockchip,pins = <0 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_int: pmic-int {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&sdhci {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <200000000>;
+	mmc-hs200-1_8v;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_datastrobe>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&tsadc {
+	rockchip,hw-tshut-mode = <0>;
+	rockchip,hw-tshut-polarity = <0>;
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};

-- 
2.56.0

