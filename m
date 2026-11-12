Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509334;
	b=gHDlfuDlIXISjoe5RVYUr0FbX/qw7VCjKLJd7BRpyxUrn7TYazNGXQssKW9V7RPxK3Bt
	 yTcO5RgIwEChEE09p/QGNlF6+QPInLwQsWslPXccHmizUvRXHYdhxQlxTBK/hC+W8KgWb
	 5Dtzn4gkXYllsOV4zNaP/0F/mNxWIAjQPD+/WDzYmbg+bYsIIVkz3x6TMS3mKF1Y3ot4/
	 QjsIXSFsRWqt5ihYWqyTduQavx6K05KTCDzxP2Q1e3JdzRm0jnEZrKnyM2bg6dJmOPpgR
	 PgjSjyjUQVKCK/4fFmkr/VXHVzNxgRKfjnXvBWqr+UTfLCjH3A3EvOaMgqBF6GtbEmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hJHTn6g0mPNKGGagv6KGkwERwVl2+3Gp2YG4+afMNK0=;
	b=EGSVKhkhO6XhzwY2bJSKp/qRA2W5cIelIjO3PaGnZTWgmT0ycqWkEjdG8eN+YaibavnP
	 /ufOD3uKl/sqQqXRersnV6RwNClixhBGeoAxN0ORNnp71ObOpVAm9eAHpBNdyguqNFrsN
	 p2MHrihfaz/bHHZXf47wtoTC0REHJzkzWWEvrnh21qxZoaqH9dd7Ahu2g13YHPi3t1EqG
	 ebBzgisFgqrIGdG4OcMVRLbt6rFE25VpeczTuOK5fAvXP7bce9rWyehqpgf4nqvUbhpW7
	 skbvkzuOoeh4v43vHrd5BX/CEEK8Hrmcn5WT2JD5uLQDDxqtSfxqgr0wTB8dbb57Ybw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e3Eh0pHj;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025E7606A332
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 025E7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e3Eh0pHj
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49a92144733so42387f8f.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509332; x=1795114132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJHTn6g0mPNKGGagv6KGkwERwVl2+3Gp2YG4+afMNK0=;
        b=e3Eh0pHjR3JIZVevcIkgWKTuYil21CbD+sOydYw/A5voLDZhzSEcU+/831i/UaOf/a
         AlG3if6ivtCAXu0MNOFlIwXj4mv27DJgDmyCAFwcpiN+KA4EE8zLX1rxMeEDMMZqqS2I
         L6KAo2oogtZ1YLopAaurIUei0Z1OtpCU5wrNkcQHdHy9luFhSthnRA8yFaNOhjqhjZdn
         Q67taKAgm00DbR9ZeLku85x+g0maUw7Mk/3B7PyZQy5GFLtLOLZi+vfOBP9kE5FLfgwt
         lcNokoLN/Lgp0W2OV1mqrxcPfKZkTXT+1kBwWCwoDywt5C3aLuf7/M0D6r/2QP71sgLJ
         a6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509332; x=1795114132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJHTn6g0mPNKGGagv6KGkwERwVl2+3Gp2YG4+afMNK0=;
        b=TKfRLC0TILE/iVsz3xYM4h5aVAZY7AV2YwDdIRMLHaSAn4KWiDZVhTGJsYZkBeAFSf
         +uQiNyY8flxizhlebAw1kmmq0U9eRG3w24cga2SR1Kcf0vV/R6PxSUlYR/Ju9Ord1Meq
         McuAfIgoBJeCGblqGGzCljLV4CiipHoEoOx4o65FpB/FWsyiGcTTXsrZdFLBHZZdtl7r
         YqFiWRa43nNLszmgYuUy1zmGdF0Jy+DJR3EU31xw/1g/xQBtuP9iIeWEvBu1dXBbzwve
         j4Yawx52caqARzexBeJf+MdzDo8XMacadmeHS51sdnMRYKpgiU3KAgg1i8jkovxRZFwC
         OWHg==
X-Forwarded-Encrypted: i=1; AL+hErGNDJw0tORQZsozLkqHg69FZruuX+h5n60Y7dYH2i+ucFl1TgPRUDkHH4VC22hIU9/n3wknLDz6P1lx@vger.kernel.org
X-Gm-Message-State: APuU4Z81ysWZXmyPTyBDafg+ftboC9pntut9xu/1wFM0mXgIAQ6PUe6p
	mJeoYb3pE9xg1CV13Bhd9SfwHV3M3+tLqFO0BUt8sRohIoLtS93pjGeg
X-Gm-Gg: AYBFou0C8po62FX9T5jUwx+BJVp34I0/USVsOzLdfiCZV8uZIlClpBada4SQeM3DbGP
	N/GAeiTSbv4J/ot46eFIaF1eGSQpbktoRB6TBcgukjM2+0lyo40AILZnPILr5fOImiQT+vZF8nc
	pbOCQoKGmep6fNCNpD7XI8wpe3J0qHJAMoAR91moEKTyzPZRmdlN/+gesIpAj5jzHc83d/XqLLU
	as0JHqYyyoBVs1pQQR72C03/c0LwyKCR5G3J1De+t5lTq3ScfJm3bgjXpdjuo0J5+rJ19eKxBZi
	5OIUK+3iRWD46hedAx/23dzq0XDGq8Wi9NF8vwrEgqqfrrY/6hHL2JEP/3UVX+3HxhzqaV1lyEW
	hib3rULiNR2OG9BFligJkCTWj9cbzYZNX6KNSr72wXH4dhWcykiLuNhn4IJGi5mzriMJXxGxzEh
	FPH8yOkBkHkJfadAY9MWFpWTgMs+zm/1jd9qv2+1+LHqazvRHJaKi6Fzhkf4+WgLpJVr1+pYCz5
	6XPyBdNNFFfe8rClmt1uzou+oeLjDxYyDf0D5ZbgsJLPLpVAc32o57iyV+hkN71C2r6LBiexP8/
	Vd6Mgv+iEPHRSML8q1uOJFk5/kFMnPtuUfYsLP9KdilVqJFrEO8/LK47c2Y03j6YLw==
X-Received: by 2002:a05:6000:490a:b0:48e:353b:9f28 with SMTP id ffacd0b85a97d-49c6dc01369mr631766f8f.1.1794509332386;
        Thu, 12 Nov 2026 10:48:52 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:72c6:df48:8225:6701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm712972f8f.49.2026.11.12.10.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:48:52 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 12 Nov 2026 18:48:50 +0000
Subject: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
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
Message-Id: <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509330; l=6783;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ZBUpEdCwH2Lq7V3xolPsCub9daf52igHcZEGlvTYJ6Y=;
 b=7WMJWEQSNnocGbbay4QEY+IEeGTlvK6hlX+vPtCx0DyHbsB3EHNinz9agnAziVYawnOddE2S7
 GXKV1fXEHQjArHUCyHb7aumveuRNA7oCEmcb04GdhqMl71PIpQ8v2a8
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree nodes for the three SDHI controllers (SDHI{0,1,2})
on the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC
EVK platform with pincontrol and GPIO-based voltage switching
regulator support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 73 +++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 88 ++++++++++++++++++++++
 2 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 7e379f6ab837..29ce1ab2a57f 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1062,9 +1062,80 @@ dmac: dma-controller@11820000 {
 			dma-channels = <16>;
 		};
 
+		sdhi0: mmc@11c00000 {
+			compatible = "renesas,sdhi-r9a08g046";
+			reg = <0x0 0x11c00000 0 0x10000>;
+			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI0_IXRST>,
+				 <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		sdhi1: mmc@11c10000 {
+			compatible = "renesas,sdhi-r9a08g046";
 			reg = <0x0 0x11c10000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI1_IXRST>,
+				 <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi1_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <1200>;
+				status = "disabled";
+			};
+		};
+
+		sdhi2: mmc@11c20000 {
+			compatible = "renesas,sdhi-r9a08g046";
+			reg = <0x0 0x11c20000 0 0x10000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI2_IXRST>,
+				 <&cpg R9A08G046_SDHI2_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI2_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi2_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI2-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <1200>;
+				status = "disabled";
+			};
 		};
 
 		eth0: ethernet@11c30000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 9ffaead2c6be..2f3266129733 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -14,6 +14,7 @@
 #define SW_GPIO4		1
 #define SW_I3C_EN		0
 #define SW_SER0_PMOD		1
+#define SW_SDIO_M2E		0
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -38,6 +39,7 @@ / {
 	aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mmc1 = &sdhi1;
 		serial0 = &rsci2;
 		serial1 = &rsci3;
 		serial2 = &rsci1;
@@ -69,6 +71,19 @@ codec_dai: codec {
 		};
 	};
 #endif
+
+#if RZ_BOOT_MODE3
+	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
+		compatible = "regulator-gpio";
+		regulator-name = "SD1_PVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG3L_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <1200>;
+	};
+#endif
 };
 
 &i2c2 {
@@ -195,6 +210,68 @@ scif0_pins: scif0 {
 		power-source = <1800>;
 	};
 
+#if RZ_BOOT_MODE3
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG3L_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+#endif
+
+	sdhi1_pins: sd1 {
+		sd1-cd {
+			pinmux = <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
+		};
+
+		sd1-clk {
+			pinmux = <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
+			power-source = <3300>;
+		};
+
+		sd1-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
+			input-enable;
+			power-source = <3300>;
+			bias-pull-up;
+		};
+
+		sd1-data {
+			pinmux = <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
+				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
+				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
+				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
+			input-enable;
+			power-source = <3300>;
+		};
+	};
+
+	sdhi1_uhs_pins: sd1-uhs {
+		sd1-cd {
+			pinmux = <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
+		};
+
+		sd1-clk {
+			pinmux = <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
+			power-source = <1800>;
+		};
+
+		sd1-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd1-data {
+			pinmux = <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
+				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
+				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
+				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
+			input-enable;
+			power-source = <1800>;
+		};
+	};
+
 	ssi0_pins: ssi0 {
 		pinmux = <RZG3L_PORT_PINMUX(H, 0, 9)>, /* SSIF0_RXD */
 			 <RZG3L_PORT_PINMUX(H, 1, 9)>, /* SSIF0_BCK */
@@ -255,6 +332,17 @@ &scif0 {
 	pinctrl-names = "default";
 };
 
+#if RZ_BOOT_MODE3
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sd1_pvdd>;
+};
+#endif
+
 #if !SW_SD2_EN
 &ssi0 {
 	clocks = <&cpg CPG_MOD R9A08G046_SSI0_PCLK2>,

-- 
2.43.0

