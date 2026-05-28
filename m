Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2314A345CAF
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951768; cv=none; b=BmR3IIeMNEftufRB8RijHjZzPSuR8Db6XVfKYqrZRjnQXHW8FAORwmefIjUSqdbUOC7Afa8RxJd6V05cAJR9UZYzesy+hINGpyQhOS7QLmTWZN1sz5EC4UuQgFkMLBakLoZ2tbzl7bzBvnHJdb7TPIVz/aNyUOcQwJYk9gzFl/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951768; c=relaxed/simple;
	bh=OSwO8Quw0mGn2zzjnQSe8oDeaDN8sCW2Vk3k8tor4cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGKp5eJ1QmWZ3i/OznTS8KLJ7EJLypL/VlthKbF0JibrLvmW5BmDLTPtU9UDkGqDVqcgvLtNMu/fs2htmLTZC62H1dnOL8V0BjxLTFJoCfsoZseyl7404r1eydbPU8L7oMotV31pt/58HTSoMmeXdMe27awDFzn/Qmis5IGMukE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYla9j6e; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYla9j6e"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49041e84237so50364565e9.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 00:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779951763; x=1780556563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHVNKCcJfHbhCv4abTmlnrVl7h7/qI/6wywlKQ29e1M=;
        b=EYla9j6e9jITKe4HCQ6MQ0/9VXGR+ucnfZzWertqbc4q3tn2gIFZSuue+OMWWu/1uC
         O81+tK2V0T1TV+Wswm0NfTxygX/UXpYM4OJYNzugXSHNPdYY9XymafOaGk0WSenkpHzO
         IwLyc/x2NJa5JIMz4Xo+9vlsT9+PZmMX/MDgVfDbhQXDhWYSq5Qhtyq5MdEoe1nOjD7b
         AaFB9pJOFh7J9Qgj8WfpJSz/pyGjoRAOkpRCUXs1mdmdSG2pMQBpxT9h/T9pHPAp3Ln1
         Q8Y8eP1ihnGf43h/VbOpemmOlhEj/Uavapz34jjgBTviMClV0RmaGWCj69ZiRrtdbskf
         xhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951763; x=1780556563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pHVNKCcJfHbhCv4abTmlnrVl7h7/qI/6wywlKQ29e1M=;
        b=TA4jwLZYber5sjnj8vj96D51WS5LX7qtMq5mS3QWHaPc+B6vYuPMawdZpUXYfMB+gK
         xUcBkSCmu7CY99Le/dv38dPJSTxSU+wMKeRjtaCaqrdMNpbR8gurTkOSx9Ih+IxfjKS2
         4pHjnlblkRO/jfvwOFfNMppmlS8uhuXxLSv2srl6f8449hch7ACWFlxprRBfrB1qn3n2
         /6Q9nbPfUzIxAoQ34/l+h0sK8ooGfHZNhdvhAM3VJgg6P4SVt/EQTgg9Eb0hCrTMyPSa
         XIKnz2ziSz4zTTIG+te9c8i7GRJFXJoo6FseM8SZQMew1gkGUK5J/tL7rGOvHvp8HFwj
         My5A==
X-Forwarded-Encrypted: i=1; AFNElJ/4EQMRg8NsMtUmxuTodIYb/JyE0Jirq/HHwL3G2vTg248bWd0G4EiFU05Biyo9ClI9n9w5QC709BhM@vger.kernel.org
X-Gm-Message-State: AOJu0YwBsabgwQcACbW5tGbJpTtN8b0KfFgzM20S1q1dHekIwp1AsdU9
	0GCYGoQu+iDXTRiqh6ZKDHGb8J4PBLuxQRB7mqaKzOVV08xLEWWkK0yW
X-Gm-Gg: Acq92OEv261DSYI60ZemC2BaR3bbBrUBIcUtASKaqhuP6g9ojpDw/GsdUPActb8jOTV
	UUK70hFtLodF8QyUHkOiKCfSJtKY800sdJ/jkTwUTj8LqLuWK5kK6ty8NUPpJWIqlHQ0ulAIlui
	+P8AIY7dAXGyo4KxOjQ/0B0B6HE7X56GvZ0SvKNdxraLw+AucIMZbjH5lI65XB7/97s16CEspzL
	m9tJbnkcrL+y4kCsaiH+iL48DeCMuPSf6+ue0Yudf556CcwaH4GF0k/Slf+rCLAazr0PGskuQWr
	a9LLU4MT8pUcSgzrq9VQtfZgayrm3UM6Hcj772eyBn2SwY1dt0E+dhN80/JgvREJOM09XopIIVK
	+k9+kiXm1lT/oBy+Z2XKj/Qmx4AbDN73GBfDEkdqZ3dkugL4oHfXs7MGDUrsd9/HCK3xXOy6qUs
	Ymq4E0K7Cm7tr6FNLvJWHvFOGWXfwMzfvmDZpTOdqbQRcSFepE+jn9WvLR3r4=
X-Received: by 2002:a05:600c:3f18:b0:48f:d620:c27f with SMTP id 5b1f17b1804b1-4909478ed20mr5399365e9.4.1779951763248;
        Thu, 28 May 2026 00:02:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c724:a823:10ad:6b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm28528385e9.2.2026.05.28.00.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:02:43 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices
Date: Thu, 28 May 2026 08:02:35 +0100
Message-ID: <20260528070239.33352-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528070239.33352-1-biju.das.jz@bp.renesas.com>
References: <20260528070239.33352-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable I2C{2,3} on RZ/G3L SMARC EVK board. The I2C3 is enabled by
setting SW SYS.2 to OFF position.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 29 +++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  4 +++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index ef00e316fbde..1512b7df39bd 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -11,6 +11,7 @@
 #define RZ_BOOT_MODE3		1
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
+#define SW_I3C_EN		0
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -33,10 +34,28 @@ / {
 		     "renesas,r9a08g046l48", "renesas,r9a08g046";
 
 	aliases {
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
 		serial3 = &scif0;
 	};
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+#if !SW_I3C_EN
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif
+
 &keys {
 #if !RZ_BOOT_MODE3 || !SW_GPIO4 || PMOD_GPIO4
 	/delete-node/ key-1;
@@ -52,6 +71,16 @@ &keys {
 };
 
 &pinctrl {
+	i2c2_pins: i2c2 {
+		pinmux = <RZG3L_PORT_PINMUX(A, 4, 4)>, /* RIIC2_SCL */
+			 <RZG3L_PORT_PINMUX(A, 5, 4)>; /* RIIC2_SDA */
+	};
+
+	i2c3_pins: i2c3 {
+		pinmux = <RZG3L_PORT_PINMUX(2, 0, 4)>, /* RIIC3_SCL */
+			 <RZG3L_PORT_PINMUX(2, 1, 4)>; /* RIIC3_SDA */
+	};
+
 	scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 06c6ccac5ad2..17bf44778398 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -9,6 +9,10 @@
  * Please set the below switch position on the SoM and the corresponding macro
  * on the board DTS:
  *
+ * Switch position SYS.2, Macro SW_I3C_EN:
+ *      0 - SMARC_I2C_GP is enabled
+ *      1 - I3C is enabled
+ *
  * Switch position SYS.5, Macro SW_DPI_EN:
  *      0 - Select multiple SMARC signals active
  *      1 - Select LCD
-- 
2.43.0

