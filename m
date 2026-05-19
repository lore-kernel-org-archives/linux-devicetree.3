Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9363839DBF5
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184833; cv=none; b=OWYukTKzyPXhhndKHNAsoQCmz3pPdnQ+hyG3WUJkXsphzo7WAJJmRr+ZKxX1Dfp1HpVVVDZ3XytldxcBem7nT1sn9dBMM8hQxOiZiMP8QJIWsbfsIigC1VLk+Ukb+VEqEXdNbNBGk+H/4IZ/xUFgt7BEgk9AwNKx7gpKs2dMxGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184833; c=relaxed/simple;
	bh=5j0u2RnxP0jHys87rxUZZRx3osWfqXXcqHUccp6KK0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7a+JxtcIxR6Zij13RjXXWElKTRZcJtfwqNptVN/6j0xSlNQSex+IDsxk/cUFUs94z1WleRYga/TpZ1LHoVDg69KjlgJQIil4VzxBVj1Uv7XzGLT8mDuJempmwS20YRIEfzC3HgbdDeYhVejeC5cQELL8DZQBkuGA12HgW/zXF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lv6ymv3k; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lv6ymv3k"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490229aa522so1323425e9.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779184830; x=1779789630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnXM6WilpGB4pMHM/1Iw3JNt6TTKPPLJJFtEz5cx7fo=;
        b=Lv6ymv3kZIzzeIRcQo3Lj0qUKnU0YrnGGLFxOzcgNskArU27k31GSrlLO7/Q1MTrVs
         vaOCr7giUtKJCWxu+rm1x/7LzXgabzmrV3sgnEklwT3kikZo4rYDWSWVj+y38pGbjOuM
         1I+ZywOqcrruNMxpNgcvwETLAtRQ400XDhR7racbS9PMZTJrfRb378oBWC5ZL8U5aMwu
         caQrr25q2rKqKfq2Zi0mxgn21FRI39zdJq0CSz1LNSO78nURc8430JtwcYAeArPeWfcD
         TW6UxlMs8kYHNbIglltDuXzw+xHKufm4rg0piRfLzGkHk8rVqejlBy/yWYkgnuEa6Eh3
         6TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184830; x=1779789630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tnXM6WilpGB4pMHM/1Iw3JNt6TTKPPLJJFtEz5cx7fo=;
        b=QllDzpYNtJ7FaOCu+jdk1NKDG5y8fxm70TqP9njP9w2bsikOfqkAAcVoa9i4ZQokHu
         ELVmeCml2yic6oyK2Vu5c1TTUh72Nq7wOIVFfCik+0Bj5D1gLYqLwErIQYozTGvldPiW
         7Zj1JFwTayDlmz14Ibo6zU8ycfhpMjJ47l9kMrFBDadc7Yu9iHe3vJpMAf/UutsGY/Qy
         xfOrvwKCjK3eV+aP4Wx+LPJ9csgfRYUdEEI71oWooRiWT4houJ7aTPV1DIm9k7Rv6Vo7
         LUz1lNAZ36OGUyM+3IX4xRcKjtaf+zVsNiLtDVp/5Azc8iiGbbXwyN2boilq3zWqMh2H
         YiMg==
X-Forwarded-Encrypted: i=1; AFNElJ+v1ig7QHve0OrkjNObPiF7p4l75MQM3Feus5B28+irJQ1g11IUYGILsDYj/w0tVNVCD9tiuYkiK5Dj@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJRJIrizf+Kme54QNJeM7gLUa2mpKoARye53kqdXixZqY7vS0
	gZfzQfxSFvIjOgq5a/+BKQhgdgQAXzzV65ofkHD5EjVRhz0JNY/H2KaC
X-Gm-Gg: Acq92OEXQAzXPu/zstxDNMvRKNiYqq718sceNz6Tr9Pq845fn4GVBRlQ1ukPZVtzRgT
	PJEQseOlSUsiN7++ZedCkL6BJLE1duceFlazLpp0eVkdwF43Nhg0jr59YQwtslziB42nFc6kPSj
	sxwq5pYOCwZGBDy+0pzZeZDVOvaZTTdp4gRjsUJTUyhO7vAmDBiX+wExTmu+IORyYtOBL4eTZwU
	mKKDMVGmi5w+OE8FAnuX97dGHdFQ3nZzbXDs97yJvnOQZ7RjyZUNm12fAaoB0nuBwoLqTkaSlfU
	QCUCZN11KeJuLCzJWtgOwE8UvE63I7y/Y1IVW+43X6L9OdiQMhTg4RJU6c+eRNx8rl90H/mvc2S
	ykNoB1gpklZ8oF9XcSnCtnIr9LvlFAQs5DqtHYIHsaQjeiZZk0UmScixkUD90JQGN2WCFyoluZL
	LXIh5eY0CmjP+aGtByLScmYl3C2+ak7j1GCg5OOeqyVo5vP2Tu
X-Received: by 2002:a05:600c:c10b:b0:48f:d1b8:9aa4 with SMTP id 5b1f17b1804b1-48fe5fcdef4mr223994295e9.7.1779184828001;
        Tue, 19 May 2026 03:00:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febc56f89sm131791455e9.3.2026.05.19.03.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:00:27 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable rsci{1,2,3} nodes
Date: Tue, 19 May 2026 11:00:18 +0100
Message-ID: <20260519100022.116318-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
References: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable rsci{1,2,3} device nodes for the RZ/G3L SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 80fb4e53c24b..ccc0decd89ab 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -13,6 +13,7 @@
 #define SW_DPI_EN		0
 #define SW_GPIO4		0
 #define SW_I3C_EN		0
+#define SW_SER0_PMOD		1
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -37,6 +38,9 @@ / {
 	aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		serial0 = &rsci2;
+		serial1 = &rsci3;
+		serial2 = &rsci1;
 		serial3 = &scif0;
 	};
 
@@ -134,6 +138,30 @@ i2c3_pins: i2c3 {
 			 <RZG3L_PORT_PINMUX(2, 1, 4)>; /* RIIC3_SDA */
 	};
 
+	rsci1_pins: rsci1 {
+		pinmux = <RZG3L_PORT_PINMUX(D, 4, 5)>, /* RSCI1_RXD_MISO_SCL */
+			 <RZG3L_PORT_PINMUX(D, 5, 5)>, /* RSCI1_TXD_MOSI_SDA */
+			 <RZG3L_PORT_PINMUX(D, 6, 6)>, /* RSCI1_CTS */
+			 <RZG3L_PORT_PINMUX(D, 7, 5)>; /* RSCI1_SS_CTS#_RTS# */
+		bias-pull-up;
+	};
+
+	rsci2_pins: rsci2 {
+		pinmux = <RZG3L_PORT_PINMUX(7, 6, 5)>, /* RSCI2_RXD_MISO_SCL */
+			 <RZG3L_PORT_PINMUX(7, 7, 5)>, /* RSCI2_TXD_MOSI_SDA */
+			 <RZG3L_PORT_PINMUX(8, 0, 6)>, /* RSCI2_CTS */
+			 <RZG3L_PORT_PINMUX(8, 1, 5)>; /* RSCI2_SS_CTS#_RTS# */
+		bias-pull-up;
+		power-source = <1800>;
+	};
+
+	rsci3_pins: rsci3 {
+		pinmux = <RZG3L_PORT_PINMUX(8, 2, 5)>, /* RSCI3_RXD_MISO_SCL */
+			 <RZG3L_PORT_PINMUX(8, 3, 5)>; /* RSCI3_TXD_MOSI_SDA */
+		bias-pull-up;
+		power-source = <1800>;
+	};
+
 	scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
@@ -147,6 +175,37 @@ ssi0_pins: ssi0 {
 	};
 };
 
+#if SW_SER0_PMOD
+&rsci1 {
+	pinctrl-0 = <&rsci1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+
+	status = "okay";
+};
+#endif
+
+#if (!SW_DPI_EN) && (SW_SER0_PMOD)
+&rsci2 {
+	pinctrl-0 = <&rsci2_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+
+	status = "okay";
+};
+#endif
+
+#if (!SW_DPI_EN)
+&rsci3 {
+	pinctrl-0 = <&rsci3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
-- 
2.43.0

