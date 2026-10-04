Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F052D3C1991
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130345; cv=none; b=QDWMGUcuErXW8A8M+vBB09Xhw0qpM9O5vWZDk/3XAhEJgT+7GH1jy1tHafFitKvDv7H/H6SKYQPTmioIk6VvJaNGRSRSYz53MKhFq9W1BDTUt1jvTFkclPT7/ojMPyuf/Lh/QSkOjHhedtGHKFHuqzqpIIMeDfGtOLej54xxAg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130345; c=relaxed/simple;
	bh=ISBUPqFw7wNmmwSKd/t0me9jm+A7Arcai1rEaWlJqlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TKR950LTZhJ+TFAbnPqOftnyBhhpXobWexlrFdhPThrvbXbCtQqeRXtCmIqmDgxWmwz+p6MhObgmCf2fngomxN7wz/ky0+L1tIGPm/a9GyroY//AYg2wciyuS2nkT3SSzKEFxRkYY+gM8SAOV2T+7tZbySLMsX9Ne9051Dlb0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oaImtvPC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oaImtvPC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso7206635e9.3
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 09:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130342; x=1791735142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Ta+kiTYB3jF6AJ+xesMAUOcOgFo1sUTMQNfw2Twlgo=;
        b=oaImtvPCmMJqVUkuUvdwuve+EblECKDB0CsTWmFMpbEnBMPgL7Ie/J5oOEheWgGk1R
         0TEk6NhMKOiZeBRiYUs/xm1yMzxami5lXIAKbJbDgah/QniZRW7AsPI+/bU2ACeTiaSA
         IE73j2yJZ5887WCDn/hnMoBBC8JA66UMdJ4Ueo5j1hFQvCA8gfiP19CWHAUPkG/2dmzx
         0STScztkadYO5sqOSqsRQvFcQDUFz8ovygq6PcYBU1syEWpAA7PmjPb4g0ugQjbjIOK2
         jU15RPe+evmux2n23engIOFUcoZCP2z5P3s8BrUnJglxIlH9psDXSgw2yve6ZO6c6Vnk
         MpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130342; x=1791735142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Ta+kiTYB3jF6AJ+xesMAUOcOgFo1sUTMQNfw2Twlgo=;
        b=fV2BtPd+gSF8DASWI8i/eEVLvXbW2JGrXjZ/kEVFNykyUCFmBsQbG+u2PjJ7HSX3W3
         nUjLOy+eTA/TSG94QqKXgWOYkM3b3siygf94YKlA1Verjn3OfwVDnwD7T+4q2Ay3wKo/
         3ecMyIP4Q/iUI13S0Qi9+jwYb2w5vFb59lWoD7X0Yk1xKCVAOEjVVy5Xtq5T5HtAxewr
         i9hsdFp1gPMA8Udypn+Uk8gc/V46oR0ryrImEORpQVcHpx0CeJzd6xvaOc+mdkTUUu2I
         wOzBrmc3cjL5nku4yThEyJMixAVMP5KgMbJhsDbYaXTIw2EL6KTzQB8ZX5E4bFaOuuG4
         WQDA==
X-Forwarded-Encrypted: i=1; AKwUvBy3r6+hWxPY+oDB3WWpjYSzgdQr5F9ZlGSkPWEQ6SDDtmEzvxXEedB5d9hnuA/E62L7vof9yYFj9aCV@vger.kernel.org
X-Gm-Message-State: AFuF++khWnh0Il7l2o1HxMChefUVsaDTkfdSGzEQFoTZTW/p/bfbbv6G
	4x5hWfwr7AWw1ZhmkaVW3OHULtJFQdTR/eVKKy0yAoysnWH9TcA8Kgmn
X-Gm-Gg: AYBFou0XO47YeB2GGSHrVfYyaGXyX7h/L/e+DBEw7mozovsJX/2LjSbHFrS+mt0kcHu
	qNJ1PCHyCKgDaUMo1/ZtrdOP6QbpX2owOcJkMmVXq2WGqi4DF0Q6Hoac1R2H97ow1Vr5ogubK3W
	f5IEwvT2lBhA6Szl1iWleOGjZuf2hdp4b110BeiaelUayjb30Z4L0FgWYV3t4nAvwjU0vO8eaL3
	dk4f96gNDD3N4k4fMSqkiK+z5LZM5dutrJSCX7/BSTENC+zSB0dtGrSMWTds0MDikmGoanZTfxn
	DzcahU9xDp1+oi2lB0v0xiXn+EM2WughLIE7Z3kKsYkgAduyZtW7gPXx3iDb+lxbsdFdRA8Q4CS
	3BIY79YrmtEOniBvYTJa6p4/CKNG8AQH+o67Bv2+S2bwTEMOg59jLj9Y4B/dRcBmHjEnFqERYmx
	QXtnBHq2JOT57AMk6rV0iKPQFNZC6bZNDcdNHvVGmkxdPM5srtHojTI2hV0H+ZAw9uyChIuUmPZ
	j8zUUZO0n2R617f6HTTdeg1YBw=
X-Received: by 2002:a05:600c:8b81:b0:4a0:136d:f721 with SMTP id 5b1f17b1804b1-4a02759b013mr132352105e9.17.1791130342155;
        Sun, 04 Oct 2026 09:12:22 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:12:21 -0700 (PDT)
From: IS20 Tomer Maimon <tmaimon77@gmail.com>
X-Google-Original-From: IS20 Tomer Maimon <tomer.maimon+nuvoton@nuvoton.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v10 3/6] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Sun,  4 Oct 2026 19:11:48 +0300
Message-Id: <20261004161151.803563-4-tomer.maimon+nuvoton@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
References: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomer Maimon <tmaimon77@gmail.com>

Move the timer0 and PECI nodes so the APB children are ordered by
ascending unit address.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index a92fbd3..542f27e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -58,22 +58,6 @@
 			interrupt-parent = <&gic>;
 			ranges = <0x0 0x0 0xf0000000 0x00300000>;
 
-			peci: peci-controller@100000 {
-				compatible = "nuvoton,npcm845-peci";
-				reg = <0x100000 0x1000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
-				cmd-timeout-ms = <1000>;
-				status = "disabled";
-			};
-
-			timer0: timer@8000 {
-				compatible = "nuvoton,npcm845-timer";
-				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x8000 0x1C>;
-				clocks = <&refclk>;
-			};
-
 			serial0: serial@0 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x0 0x1000>;
@@ -137,6 +121,13 @@
 				status = "disabled";
 			};
 
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks = <&refclk>;
+			};
+
 			watchdog0: watchdog@801c {
 				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -161,6 +152,15 @@
 				clocks = <&refclk>;
 			};
 
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 		};
 
 		apb@fff00000 {
-- 
2.34.1

