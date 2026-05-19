Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE88492519
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189607; cv=none; b=fPT8E8cqfAUByDkrf4hT1Rpkeqhrs+X7BJxLXUN9isA1bfQNVWFUjSTXJOBg56AnNgg5cUzDCKOXJ1A3gnNIKi3xtUCsvMFWI2bMB+CUn0ooupx+Q24CjUQ43wjHGJ8INOUUHw5Cmzf/n0/dBJwl36AvqyasQzpn9eZ40oixCmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189607; c=relaxed/simple;
	bh=Dl7uP6sMy4Y5E1aSHV8CCjm79ZIYkee/mZXdcp84aTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTDthxSTnwnEqQfNgUzydfcnvfU7C8AyYP3Re+VTSB3sXT/FeqfqbtuG1NZ+7/Zv7qervIKCEgFkAZzQCGPNry0SWtESh906BzmB9TUdzJgh4UzkW8RFAbB4ZNMhMgBeop7UCrQr3juUnxwzUv9Hga7pWL5sUqBypN+T1niPZ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7Y7qjkj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7Y7qjkj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so51024505e9.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779189603; x=1779794403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r1fGlnqMtLmqRZgghcpUpURLRsPg5qGSam8KHLk6Zc=;
        b=S7Y7qjkjFUq0uJLeluu2jGVBJlIBkiOQx1o79eRLG6vwluGsQU44ceAT5zKGL+BUtv
         0RTY2Tzi9jFLru/GbTZ3td0n64uXgyEZviWG/Rcl+R3NBZWQ3IXnef361U1OsWZ7YJf8
         hRedSDxs3Y/g8sOSWWhAPB2+DIfq6zWGOVdQTfb9aSCORSaPN7Mlf4JBzx9VbstmG5tV
         GGps3oK3bkA2xR8Dy8JtFsoul8A2aynRN4CKBFUE74OvW4goavTjKlirQeQzKpSs/shL
         qgJOAcLNMkhsh9mSjTLaFsyV/ItuK5RTUUHItb7b2qrLAv2wyWq8NXYPzoz02PbgFvjs
         b9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189603; x=1779794403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7r1fGlnqMtLmqRZgghcpUpURLRsPg5qGSam8KHLk6Zc=;
        b=Jsi//UwwfRc7BDlBwJ9k/+kHOd7Nrta6jvkRt/YgmPzYQS1kSzpdyZjqlTsgGActKr
         GeH57XjItcP3RNJkt/ewLcIVIhJVPnMKChuytWKokOUrD6Z4o67EEOOjeoeevsE8Io7P
         zP7/4mPx1pXZYI45dYucb8e7NtQGjPx96mSXnR8UDIh1PZeOEnqKNtWCDlEMVgNEFgv+
         k2tuS4z+xopxv1osJQlCh/bncnC7SOR1SSARLTeL9ArbosMMhL8MpoDZhyK2E2g4b2du
         QPoWS209xPtvBMd8xpoAnN12bHOP73WhVBz8zM4r1+iSSGAvejNxwfQ8lzjDrnf0DI+V
         ImwA==
X-Forwarded-Encrypted: i=1; AFNElJ9onTfZTM56w8BJNmISe4clARryCKT0T5rYV3mObBQJSdSt0ePCa7mqYVqOP3Nbe21rZJUaNEAHkBkn@vger.kernel.org
X-Gm-Message-State: AOJu0YxZfWytHi5CXC+oujt1Oi+jK7EJI9MnXiCVugJ4OZ3ubTEgs60D
	RaIisMLGVcbF31+NJn5oAyAf0nz3KH+0Du3K/1sLtPJxrVbRFkqftTw1
X-Gm-Gg: Acq92OH4NIo/Mu6cxKJ6HnAanRb60CfnAZFS6MDo4Yez6Crr4hM9XZQL4UfoMZvdN29
	MpvBsEy4HjFWA2LIbI19cd3MB3AfjFCu+hCPfK2f3WrV92mYrtDR0FXvZ2TEH++zdvHYzDsFyKw
	gWJbM3p4Z7SkIOMYkl+2SB3diyiOkcdb2VruPoKhILqrFLMAAfCWsoee/BHDEhUOzG3CBWUJWIY
	u9QcZHnJNXNh4B8aH4LaYf83v5+fJXJJt0YTEg2eWypFK7Wvf1gXH4PixYg00t4bfkMUNCjnoVa
	qGMo/P5XLRpV0kYVPf5XO7AquNnsGGLa3lFGFbrUZW+pC7keLH2ajah/GF9ieo68eKeHT7XqsPf
	ecKm/EJBXpJi4fVeiw1vZ7xo0y6TFtvH9sS5LOmGJfQCDynlUq0jaTVeR8j5zCftH8ZjwRmzF88
	jvHlwaGKNKwWsVQ3x7EX0dlHkG+lUsr/oA9J4aSqgqWxOEnUji
X-Received: by 2002:a05:600c:c087:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-48fe60de6a7mr236756825e9.3.1779189602901;
        Tue, 19 May 2026 04:20:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm46066323f8f.34.2026.05.19.04.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:20:02 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2
Date: Tue, 19 May 2026 12:19:54 +0100
Message-ID: <20260519111958.233194-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable RSPI2 on the RZ/G3L SMARC EVK board by adding pin control
configuration and activating the rspi2 node.

The RSPI2 pins are shared with the DPI display interface and the
two cannot be used simultaneously and it is controlled by a switch
SW_DPI_EN.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index ccc0decd89ab..3e3028b88f22 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -162,6 +162,14 @@ rsci3_pins: rsci3 {
 		power-source = <1800>;
 	};
 
+	rspi2_pins: rspi2 {
+		pinmux = <RZG3L_PORT_PINMUX(6, 0, 2)>, /* RSPI2_MISO */
+			 <RZG3L_PORT_PINMUX(6, 1, 2)>, /* RSPI2_MOSI */
+			 <RZG3L_PORT_PINMUX(6, 2, 2)>, /* RSPI2_SCK */
+			 <RZG3L_PORT_PINMUX(6, 3, 2)>; /* RSPI2_SSLA */
+			 power-source = <1800>;
+	};
+
 	scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
@@ -222,3 +230,14 @@ &ssi0 {
 	status = "okay";
 };
 #endif
+
+#if !SW_DPI_EN
+&rspi2 {
+	pinctrl-0 = <&rspi2_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+};
+#endif
-- 
2.43.0

