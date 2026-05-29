Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3242C21E8
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059291; cv=none; b=sg4gJ+uwAg4sqkuzUdwZdc344FFsSk3oGPjEDXvH+w3TMzx/+rAi2UiCr5Ha7yneEk/sJJlb39A7ZP4jRGFsuUarzuMTb+xyLt2k4xH5ESKibilIfVdmTDS8kRHVYnAPrH4Q/kQm7uI1UHzUuY6cBhG7cTynhdebtdVGkplsY6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059291; c=relaxed/simple;
	bh=cLDLzfRzL/iWdI+EEKBcb/jXgTAtbt5D6sMaRuAwo50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dYlK32f7AoM4U6Bbxm2dHMs/dPbzA5hIsMpCnTq/jZ6LJ/YcKveQhQ8TR04vPFOJq5aBUX8qhiElkWT/V61cSshcCktUTzkxCuR1iUuRuxmdpxRn7mS4LCU+EDUfoESu1ucw8/99gIPFbmgz0qEPwqG7ofWp8a0HuBeSq9uAXbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CchEurjZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CchEurjZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso62029025e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780059287; x=1780664087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pP6WBbFR0rqelNglh6H5g+knQHo3T1xmXwPHqlFYGx0=;
        b=CchEurjZdwlSnimhEi0f0DoD901Annvw20HzU0sC9zDX5tqm4xKguYMfCImUmDzNMi
         40qad8+yO5PwBXxZEOH9tbu2CMMR3FVAPcY/La2GZwX4gUwFuvy1dvgYYArtDNQA+/Vc
         qUAYufIuV6VPpU88+MchvLOcz5d+DuKySiAL269yzPseYZ3MVbuzaqU+YYlO85b1vbms
         JdQs8lEP+JUOdDpFCdPZIWmviQJatlRN8WJus3P6j2FPDhUO5yRAAyVaLVHhP/ESJM+k
         2NQB2h1QgK9+Nd95MRN1fR6OFoju1OPNI1u7xKflcEaib69yA7QCA28uRTeSfWQuqwiD
         9BpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059287; x=1780664087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP6WBbFR0rqelNglh6H5g+knQHo3T1xmXwPHqlFYGx0=;
        b=YSAKPgfiRnd+yDBdeFdeYOjHNTFZekoOeCxud0e/zhf4yURj7G3at/hkATsOKHcdwI
         szW367ZGQ1Ql58prlKMDX9YUuXHVi7/5LTW+I+w8ovqkSqnsrDN6a3SRNak3db0Q1FTQ
         tm/glHvpfeRXJX/YYWXA+BUy/zzJPvVTG8tNJdt7DOz41so+5oOHbj3r27JAJc0kAsQL
         mWmfMhiAS8MEovlDzZGL/hDvbWQzJGCfGDbbp6TRk1wbI1VQ3Ao9FXHhCt/LDCLFeN4G
         8nYVKDsajWk3u5aORBmzW9SaD5kPFbWXjKpn7AnjiOZ7IPZ6Wbb9m7rIudz0T0cGlr0M
         9Wyw==
X-Forwarded-Encrypted: i=1; AFNElJ8rQ0AisW4yZfXcMJ0NR5mV2vbhO5hhGlLTXE8aqU0VikC8A9xVQUJ+QLuSVR1tnVwOdDy27dAN/cII@vger.kernel.org
X-Gm-Message-State: AOJu0YyF8mw0/U8IPvTWYbzannoNZSh/UnOp7FD9sFzoSGDE9S8dUXZi
	Gbiq1K2fEJGRPjiE7WnJbjOTR7xsADvw7B0/C+j+kJ+RIOCae3RZinsi
X-Gm-Gg: Acq92OGZioGbJcQJlGkMuK5ETPyvQJcdVK1cTYFZf+ikfgEbhQsi5Anh4zHL5eZRRNm
	HRpvHTx3uRG1tKys7wdzMQ978wf+gsJzTTYyN7u2kExlWCyvD0hSWRuh7niQhRs1ASmB+8OMuYn
	sqw+OEWJdU3PyKLY/7txalHLLjoWF8XPI7TBm94Lr5sXJUSxKeoyOr+aC76cX/8HrB1ysbgR0Y3
	VV4+WcRdMjwyrV5BwwtQc6Z39Bykmntr5x7bOIkvzQGARVeBVsATrPpPOwVxcipkQx1ugRuk/Ej
	yIMC4LBTiafUU2J3KmV8m+URhLVM1b2+QCDVIJ0RHmSsWyz9vl9kKdnEdmuivlbp3T11dMcnAzx
	iWXyRAigKP24A6EdQtlo0WL54MFx0WA4CD5eDhZlrEsG9mzJEGMVkU83fd0yBtcYdqVbu723idz
	MiJ5mtsea3IEJ8plnYE0WlkiEZ/Va3C4vLIBPAz212BrepvZqLggGDbCDI1IxK2J35JWSolQ==
X-Received: by 2002:a05:600c:4e55:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-4909c0a7eeemr55869565e9.16.1780059286890;
        Fri, 29 May 2026 05:54:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:df4f:8f31:69aa:c094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0aecdfsm14200725e9.13.2026.05.29.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:54:46 -0700 (PDT)
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
Subject: [PATCH v2] arm64: dts: renesas: r9a08g046l48-smarc: Enable rsci{1,2,3} nodes
Date: Fri, 29 May 2026 13:54:40 +0100
Message-ID: <20260529125442.327290-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
v1->v2:
 * Dropped SW_SER0_PMOD macro check in rsci2 as it is always available
   for use.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 32d3b08a3cf3..3ce24b66cb8d 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -13,6 +13,7 @@
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
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
+#if !SW_DPI_EN
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

