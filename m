Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732CF400DEA
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 06:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469877; cv=none; b=KkVu2jqDk63BquZaPeYE5hOf0Itrid7/ErsEyYTTMi8P3mBPw2LZtwcLg5c7RqFKkciBwyHqyaCrJZC708NCU+clsiKOVBfdROhniVba4Fq3AvoI04DX40kVTC1zLQ5jrEtk9fxykdkC0VxNVMhITqLxNE+BZl6qBUSCVEdmmFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469877; c=relaxed/simple;
	bh=UQm6NkHuYIyeWv6CvUZG9GzuWmprq0FqpGDq3GMWI4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvG3YjODHs42c8HhqFMqe+sYVHZW3iSxKzNGSWRhdjDxzsKAsQ057d2Ut7ZpD1Klm1zBZDUM7tABr/lNr/PTRAIy7B0PCkHQafA7ghi8O/MFtmk7xPPwiBcuWrKs53uxO/b4HvNbi3vBvvuXfaPygLusLaetRg8mZP4nVIMvv2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC72aH1G; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC72aH1G"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b64c8311so5812475e9.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 23:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469873; x=1781074673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKD/jOSADZ7rMDpz/kzySiiUCx3Fo+KM1sW62qF4fO4=;
        b=bC72aH1GZyVGiRrtGtxYWUhbvOVTO2wdBvEgWzCJitAgNX2KL2qWRYf/nvgyif9VFb
         A9TWvgSuK/9uLAkoOZFsC0tb3GXKyO9AvRVA2/dU+ISF8EnH2dFveMNprSW25mA6x6ps
         tqjVqr3SEjuuDUbv2imeY3GFnDyd2ZQkokSu7qESsn75PYX7gOpG7hxexE3T6M1vxsZM
         Gkn3sQ4TZA36gYey6cOF/hW/pK/p71FhNXZOR9b81CW6pZ0bRoEFGPTkkyC+NnWe+FxP
         DGNSR5B7WdHNS2LyBzCd9ZDyM2YNjDBKGxwFoVrhhEYDatq0kSMvb3gM9J+NgJDaRQMK
         LODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469873; x=1781074673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKD/jOSADZ7rMDpz/kzySiiUCx3Fo+KM1sW62qF4fO4=;
        b=HGnLD/q9062Xe638TQV3XJ53EmReVzs6rOjXgrv5pUxZOQ0hd+Z0dYsGxAuPAGkN07
         H1X1ur5D8JL6WZ9b2IyTc/1GnX2YjqgAHqyOGWHFVDqxoVbQHDM0y/v0mtDjbJ/0F9po
         Lix/qpm2LfZS2wcIJPX41BvF5+tH5WETByi7Dvrhv40s2untzaKMyHjvh3wV1GMKWqwe
         vP+5002LJ1IimewOilbiOMKRA6e+M+UASJLdIGSYhEIT5a5eiXGg3lM4oD0Ze4EQVRiy
         QmNN16Ky2g9qS4932nnU/oyd/Kfh1lCqbQL6ZDX30IjZIzmCp6fdO0CNIiVqJ1cQ6h9c
         ltNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8gxejV1kcYZdrYRsluaEJvd9Zs4NvCpRb0ebY3RxZEJDiEJ8Jm4hFpUyP/fQgWqcB2GUjArGQ+eES@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6v2kaxI0P+D/OcztC3KCpyjLKC7vuWcOoZSL7jGmSAeeJv3te
	B2Th/b9rEyvBL9YlvDHbjCfusclaXh8VqPEi8sjYUprBKK31AhoWgoX8
X-Gm-Gg: Acq92OEkLJbIJYMty0JATqSD3Z3YPPDpvf4QFm+oR3+cs4FTFNZnOjJB8Y4AOVobJS7
	O6zAJc73ADPDJ7QproYRvwLBggvxJEBfSuBiAbmxe0O2rq8EtuE+n+g1qIzsHkMpfvurk7NvcBt
	xiZL8mYuHPo37IVVk9L6ZKrXTKn+6Uy0iO3AAUW45uUtNeVX6odh7bZV6vPqP9yHluH4ZgbvKDc
	R/Ikgg/f/UGQeVL0us4kyz7/VLe1Ade1UJrDQc0Qxlr3NeWOjKwC1TRgNw+elsHACHdtJ3IUtdZ
	anxGX/2aspCrAMYGyYOD0OTwOmW/IAJW2bsjGKUmn3RnazkkV9XxtB6ZIS4X08TBqdS48nXjbVf
	eopzzHrBqG58hl4GzRTXc+fZVE7+qYT4NeMbY7+Y5aFlkwMD5a8QLsqCJ+4ruxS1g+C7mfgpSsH
	5UR5jQLDSl4TqVbtAzUvZ0nRNubmDxLUEpRWxX0YdCAs2/C5qmbi0577Xmci8=
X-Received: by 2002:a05:600c:4e52:b0:490:ae52:499c with SMTP id 5b1f17b1804b1-490b5ed4620mr33043315e9.21.1780469872601;
        Tue, 02 Jun 2026 23:57:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:52 -0700 (PDT)
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
Subject: [PATCH v17 17/17] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Date: Wed,  3 Jun 2026 07:57:17 +0100
Message-ID: <20260603065731.93243-18-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * No change.
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

