Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442283;
	b=BIS2Bzx7RoVnFrdV27FJARLjBskdjH3CZc9bfI8PUmrKrD4ohRNMBW+7tzwQAXU8Bzht
	 ixEc37WWFgSEIMbuT00B/5uJilgCPVEioAxBZRrdCofUVy/00k644bjGg0wq+RyxExO7w
	 gaQu4xvi+u4K7bFloyn6OckD/hthmjPu2kfj55pgbKB9h7M7X69j8dz6Gh0wyAdsrY/xt
	 N/iP+gfU/WuG9WBDhDTOoZnu0Lb12S34b3mMNBYIwllSLIS+Q82hJyA6ExUWYjAZRjY1c
	 5uVtjBcX6uT3Z5LgeHTPSUlf5ewZHgS0pvMk6lBCUVIuGLLdeqWIu45VEW5blOKezww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rNrAG0FwlseYPe/ZdyatSVBSgZTqm1Xim7o4c6/vvS0=;
	b=wno2UnWE98NWpLVWlQkOILk+fukkkO41efHPIjBN9x73hdh0TbBWb6YIbZePgBRxaTSz
	 GhMawKGIFUffKvf0dK3BRtejM7ibEY7ZLe2WUamB0PbxQqZYnaDm3R2VExbLY4P5D97Bk
	 TC4S8k3AXaGlT7NPtvQQHaRgV7PbSYMUwhfcmb8/XwalrSoTzJcrag5tL37ZDE3lE1sdN
	 rBHrESs/APfNBz6QHpUg5R5g5AN/ZeorEBItjmdd23ybOGSaIIGf+PeGxJGneLU/E5BtL
	 OvmKKfmoenxVTTXkbY5NF7sbgZ+ECgMD/FccsKLpUNrdKMhtTqqaMBUwjCEcWIigXWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEy3pcRf;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CE6606A6B1
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6CE6606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEy3pcRf
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a42b34e930so2919666f8f.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442281; x=1796047081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNrAG0FwlseYPe/ZdyatSVBSgZTqm1Xim7o4c6/vvS0=;
        b=sEy3pcRfo8cHflY2T7S828p4717fDh7JpH1WhbLZ3kQUrh/oxE4KRMjg8ZhO9ERZD+
         ubfr+eE/zfEmyrgXj7IcdVVJZZHulIs3OGfUHnlaFdRRvWvOtTYhsfkzKmpXJilNcnLZ
         nRxKCChVnFAwAD9Rrxaf0M2kjjOJcHD0ReQDNia6fMazPiqm5V8m3/emj3ezbbIrr8fE
         M0xbRdBEV6q9Zs5cxgNVlyKUBVcjvbleDkf8jyDal0S+jbSnbeNacUaz4LqTTfpu5D/E
         eiXNzDlrLwQW4FsrA8MeV5SwuP2FR9fXtBbsQJkaCGbEk+bKhC225XT8OZMKyMFpLRoH
         twTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442281; x=1796047081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNrAG0FwlseYPe/ZdyatSVBSgZTqm1Xim7o4c6/vvS0=;
        b=oSpAkJzrXLOldlypJJ/cO7NGAKnxLzjBs9mcjRfI1mvU7ZF+9dnhsGkWn//SXuMyas
         /G+qEzjwBuCc5eiPz3FoZbesNweINLo4xTzuLA+DZ3KH2h5WUpkSpRE/lT4Ua88YVOe2
         ySCk0O06veOnj94hgVlm+xQlEm+Tc0Ma1kJmALtJ9TvTm7JhALns1aDA6K0xqZ+aACqY
         aGOn2bLc3Fbpb2gkG43ZFgm9nzryMawNPAW102Foru3AMQhPa6ZZ7w8r9u0dwAXaI3Zp
         RuVqvhXCaMGiKVBXJIB+dRXyc3rOF0OYhXmCRXVfWqdMHI81Wjk36LUk+rXNx/N0k6OO
         bSdA==
X-Forwarded-Encrypted: i=1; AL+hErEIjm7rQ6hLEbes+VJLTXjBV/Q3SsmxwZu+hkZu+3YpNNrkecPBjN2VkQX+TvDIga6LU9Cq112imM80@vger.kernel.org
X-Gm-Message-State: APuU4Z/hVJ2WIGA3NMTQbsSTIz18UeQAPL4P5agZs5hcAUF4ga5KdXAD
	Kgsp90nZkWGAT8gHRe1G1tTYMrNQga20tRcOf5A4Vsr0eU6sVj0DKUPw
X-Gm-Gg: AZFdTZecNZ849lxd6r3J0BSr6laG4JHZTm2S18kz7ex+q12C3nzEIhP/Iqjgc5fFBSu
	Pm6G9M/zL9ChVTbJIlFEMaoulh2XjfczxRSMspBgxbJ6+00YlrdAKebMr6gcQI2sOXixrknyKFl
	ndGbsAzuNo1chp+JngDVlm3CUbU5FkDFIseRQbL1jgLL7Xj/TMFvxTYboqJa12E6gvKBQaBMpif
	ncRSZZ7R3+mYafHO/v5jNRRml5yoP2S2LVF5CHDHns9t3K749AmFnrFeS5Y8pXTBdFkXRRY4YKR
	nUQ6goSv/iTF+v+9aB71IualfN4lJUhQ5Y+MdqsaQtvwj+i2/LXDtrKA3OY14J8VvK8OdBiJsOA
	pKVMA1xnE/UB0a14oPcVPJYKSPZIbYW8+JUVRazRTQ3knqAruexwJ6bG9qyok7/vy2eC+f2TzhL
	5HoDiJzMAj4WQu5F52MnmWqGxYs72KghnuuS/YtrEHoAT/o8jyAdMlI4bk4yIph2Q33g2/LSui8
	RZouyW2s6R/kgK1d7HkWFTvg2nWFV87nI2Gp98a927efIdSiPYhJLd066WErW5xn6zzyUp8ECnN
	Fts68UGnlBl4yW9YWNyiIf7LpCzzVYkk4p2lJx+dkWfT4YjQ7Ra+AHsQdrc6H2Dr/A==
X-Received: by 2002:a05:6000:2409:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-4aba56f5488mr21665771f8f.0.1795442280851;
        Mon, 23 Nov 2026 05:58:00 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d6f4:1401:6558:1dff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm22109308f8f.36.2026.11.23.05.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:58:00 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 23 Nov 2026 13:57:55 +0000
Subject: [PATCH v2 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
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
Message-Id: <20261123-sdhi_rzg3l-v2-3-bad3a6358849@bp.renesas.com>
References: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
In-Reply-To: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795442277; l=4238;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=SdO9oPTeSId+gQhJbIDdaFXl20G3i+msvzfHkDzH2Mg=;
 b=Oc+V/0XBOdXK9fNQw7BgpL4HoMlMkSLmcZhLE7VBiY4Fks59eEM53bZjGz52HxBOdwgaK8foJ
 O1v7zPBqfHeCrxztvDiJiM5DbCp3np/XDuc1z6q9Y9lW+DqrjaFQWqh
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
voltage regulator for voltage switching. SDHI2 signals are muxed
with I2S0; the selection is controlled by the SW_SD2_EN macro in
the board DTS, which must match the position of switch SYS.4 on
the SoM. By default, I2S0 is enabled.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2
- Added a comment about the SD power signal.
- Collected tag.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 11 +++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 88 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 3699712d8bf1..e59126e7ff9e 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -34,6 +34,17 @@
 #include "rzg3l-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
 
+/*
+ * The SDHI power signal can be controlled either by a GPIO hog or an internal
+ * regulator, so a customer design can use whichever matches its hardware:
+ *  - SD0 does not have an internal regulator, but SD1 and SD2 do.
+ *  - SD0 and SD1 use GPIO hogs to control the power signal on the board.
+ *  - SD2 uses the SoC's internal voltage regulator.
+ *
+ * The mixed usage is only meant to demonstrate both options. It is not a
+ * hardware requirement of this board.
+ */
+
 / {
 	model = "Renesas SMARC EVK version 2 based on r9a08g046l48";
 	compatible = "renesas,smarc2-evk", "renesas,rzg3l-smarcm",
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index e64a611aebec..fc5ed4907a65 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -42,6 +42,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		mmc0 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	memory@48000000 {
@@ -355,6 +356,74 @@ sd0-data {
 			power-source = <1800>;
 		};
 	};
+
+	sdhi2_pins: sd2 {
+		sd2-cd {
+			pinmux = <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
+		};
+
+		sd2-clk {
+			pinmux = <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
+			power-source = <3300>;
+		};
+
+		sd2-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
+			input-enable;
+			power-source = <3300>;
+		};
+
+		sd2-data {
+			pinmux = <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
+				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
+				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
+				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
+			input-enable;
+			power-source = <3300>;
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
+		};
+	};
+
+	sdhi2_pins_uhs: sd2-uhs {
+		sd2-cd {
+			pinmux = <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
+		};
+
+		sd2-clk {
+			pinmux = <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
+			power-source = <1800>;
+		};
+
+		sd2-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd2-data {
+			pinmux = <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
+				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
+				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
+				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
+		};
+	};
 };
 
 #if (SW_SD0_DEV_SEL)
@@ -386,6 +455,25 @@ &sdhi0 {
 };
 #endif
 
+#if SW_SD2_EN
+&sdhi2 {
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&sdhi2_vqmmc>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&sdhi2_vqmmc {
+	status = "okay";
+};
+#endif
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";

-- 
2.43.0

