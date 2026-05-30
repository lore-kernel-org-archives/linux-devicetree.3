Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AFC340411
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157460; cv=none; b=cP6j0/hsJP55YCsfbDjRfWSaJlgbHI759B0xqudUFUMG+HDCA3gA4Y18w3tIUeX58ofXL14Z7SNvL6jh2jFUEi9z7AJ9IV7gDt+TBm9OCtl2kKI5ax8Xu7PacCL8XV/cHZ8GhKhtJ3a1UFnR53wQQAhU0EH5suMPydJVEJ9hfOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157460; c=relaxed/simple;
	bh=Zq4HDqdq/amEjEwpDojI3gBZJRNxhTtuW/kuu9W4J94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAY6CD3xnse8XmF6OkI9oBMqkCOTBgldiXksSkMRfn1WA1DEOyC+VXq4dLhBSz5MRO4bm/b0yvw1J3DZzi8JdFiz2Wq2PWF/gZ2kZ8IXcRfq/4etR/uAViSuayVaJ1XdFwKF+oew/meFNlq3UOC89u0ILdzAUMNwMGAZVZIyATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrEFCMyX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrEFCMyX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso129104645e9.0
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 09:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157456; x=1780762256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5GVrSM9pPs0a54glN8EjZh9p64imDHQ+yOD9WsC384=;
        b=rrEFCMyXDaH8wl9AVNVlUsdMXRp8Zc1u7DHz2v9oOFOfNmfbWuwXw5Pu5qw+TA9aJf
         IW0RoXn6oqgqLu5stWCZYMUfXDDrMM3tmmWdl3+fbAxC7D7Z8RvtACPmor8wrzhe3krM
         owTCcPug4Yuaeb2fAzEmN4Y34ULj3SczG+h6Cyx89nx9NNfziUjBMznJlpVOCgmYLpij
         ciLAA1802sj9aplVrYFkkhDaSaPOVSMb63kyqk++Z6zZQ4R33v5XRA4ATUgTHxS7+YuK
         Ki+wRqEbObjDxAGSz+OW2I/WjmGbF/ZDx5PfVkh1/AlNsrkC4k2yM6b1p3B72LyFILqF
         Sshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157456; x=1780762256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5GVrSM9pPs0a54glN8EjZh9p64imDHQ+yOD9WsC384=;
        b=mtPCwaE22+NruSj6cETqWVkAb13zKQ4GioHUjm7GHfxJhAXgTBNpfJ1wK5JFs/Stbn
         oS0RfDeBL36qLT5ZZZytWQUv/PpY6e33wqW/h8rjBOQ+Q3dkx4Q3N+wueIuwFNHnIGGP
         5mQldEPSvAta42UxJaGpFUk6btIeiWnCsQT4xY67dD6YWD9hF+AzwyEMn7xZmelS5dRK
         TiciMeuXCcTS6F/+iTgX2Jp7CdU+i3FU3Lq7eBL7M2FF3DXw8wDaVab3nSjMeYWBjAxz
         h0btrkK+OekS6m0lG3GaBOjQyzrH8eHbBuM618hjdCTth6sEBH346BFtcLBhrNupZ/SO
         0dew==
X-Forwarded-Encrypted: i=1; AFNElJ8eVrZ30GRvbaqHrU4IBsejn9hLm0o84b3IOw42jLZ0q2ZHR2wvyXsQxfTcxESujL157TVDbKalY38g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx32T21Vg54m0dHRj96BOR91SOdGYPkT5WuULu++ah/bHh6+zFZ
	cU/kLe8ELI/Cv1B0PgqNcHJu0t4cvm/U/i7OW5uGN3ya5LEfftivQ1NX
X-Gm-Gg: Acq92OGZnOL/MaeqR4Efs/JMD3xL1xCnU1U3mYM0OEzc/KsSqj1cY8fHuAGz1+XLXc+
	04/8rzrgFeSP4TTvLImHpOHVLAO8izYdQi1IOjNa23AQVr1awtpJuBSM+Z0eNC+VkjO4qhjkpSP
	q5eXc9a/8Y5Df0F5Ksk3o4oVUxGnSOEuzckFWSvVV4rC++gZxr0gWSJ3NuAtKo4PoVLqj53z9uX
	ddGV4/fPVrFTDduv20K6ac63U5pEfJQrEKe8ZPTs0dxoiJAKjHUmRYEYfaVEEx0AsV74oruu4YF
	ZYvsI6KdIs3KJf44ZbblDxFeDh9vrawLCoYk9TapuLEB3qREPBdBd7/H6OWXKD/tNLSGwDLOE8H
	fSigmm5UlW4aKzkGzGcyMeosiaRe9OuynLptVRxaJlH3N+9vJm3j1q95Tug2dzGVdTLyxPNMFGF
	uTchWMHM1cTCu8LWGVTqoDy1WsBwpGNgmIWLS7VE858Gwiqn37JcCdApA/GDk=
X-Received: by 2002:a05:600c:8582:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490a2933360mr53158135e9.22.1780157455386;
        Sat, 30 May 2026 09:10:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6f35f8sm105350435e9.13.2026.05.30.09.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:10:55 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 17/17] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Date: Sat, 30 May 2026 17:10:44 +0100
Message-ID: <20260530161050.131041-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530161050.131041-1-biju.das.jz@bp.renesas.com>
References: <20260530161050.131041-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
voltage regulator for voltage switching. SDHI2 signals are muxed
with I2S0; the selection is controlled by the SW_SD2_EN macro in
the board DTS, which must match the position of switch SYS.4 on
the SoM. By default, I2S0 is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 446c7780cb30..3d5e6b8489a9 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -42,6 +42,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		mmc0 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	memory@48000000 {
@@ -296,6 +297,74 @@ sd0-data {
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
@@ -329,6 +398,25 @@ &sdhi0 {
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

