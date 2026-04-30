Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EC541325F
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553637; cv=none; b=MpJAeHKy3C+9Bu+iZRTNO1t18jrKAHjU+Ioz29lHPOfwNGDDCMWM5Yeyk1qBy95XeIaM3JftF64Zb5RDZxIBNwNGjTuzqY66CY6m8gudFsu5Paq8s+ejJFSIwMNbNtOMUiMdBl0z5QlNSKvhLAkUAd+DTpxzPFTCRLqPj7VDWFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553637; c=relaxed/simple;
	bh=RKgftYwLZm9ZGB9SUzhmAcs8FH11+yEFMapqpF+AAXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvWqggUs9kx1WZf1SIRGfRDYD3/e81Zuxvd3+2wCLVdKexiYRrKg/ErEJLIdSPSwOTZygfZtD/Aw/5aU1h1awpIROWqmjqw6D5xbVRghlZl++wS+42pxrfRa45Fp0+7BVyd3t2SzqduiZUgoFyks5wJlu4aBTcVcPOQkv1m64i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3xXQgeQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3xXQgeQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so12272155e9.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553633; x=1778158433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ui9wMRPRd5WRi+7Ed1qkDLUf56FuZLXbegfJioV/+c=;
        b=e3xXQgeQ+1SeOBl7dPMOJcmlczj7DcTyqNJjQAHoN7lYFzP7YY1R5f582vPEWh7U53
         OeId/INBuVnTsAUw3GcX+a8mHI9bmpd9zTq3FQHrpwsLLwUS7yPuEsJrOmwwbYyhz0cr
         xM6OpTrjjcQZhCyyAFj6xPKezUk9d53QbKllSaiSW9rgpAaLOd0WU5+RcIsQlx2Ux7gQ
         oMMGmE27FDO0hd0BoKIRrlrNgcdu0rZ9bvRLeVXI9f3PL030cK0jZmEjVAT7vl5YxyWY
         /cZ1YfDsmB+QeB8ntNFhFX20toLtb2+HOecjruvHIT4lviyU5lT6AkU5Z46zd+bDH0aJ
         VkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553633; x=1778158433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ui9wMRPRd5WRi+7Ed1qkDLUf56FuZLXbegfJioV/+c=;
        b=E1Ui11ezRKjtcisrfyUkOAGbqA6yYVXWTyTe2kEQXzt604HUyMs1M10dOZhIl5B511
         IDJ7OEM/mxXReJmG3r8bndQDfzpqz6jDfwHNn1uwvPt9L5krkg7RawC3tHLGttZq+u6d
         ckj4t3FzzlMcwpIbnOFv6apdgND0YbBzhNDNBCRHldUdNfGu3/zt+OAl2Gmd8dBQsVNX
         cBTUrk17yJn2RIkdeHOgPtiqt3XmgI/nrjfASHZWaDOK5VI8Kbf2GyHMtJ8bng5zwRK9
         3t2OPdchl2/hEIWrb44nzf52p+kj7HnIJt8YOMwyfBsqNo+Sm7XRfsGWrjWRSvi53rZ8
         IHcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QIx0KfYC4KN6ggvUwZDWy4vGCivAAh7IMvcUXhZF6hvyNua0TqHBtLpezQNJQZmN82q1gApBA5z+f@vger.kernel.org
X-Gm-Message-State: AOJu0YyCeqpdBI7UdwH3zKavTDOf1URdOKORIDVSgxqFXlGGKsI7P0GM
	kY5JBZzi9mM/YFOQYWrkwWzYe7OQvmM0J4kTA/RT5E7IlexS2faI9H+7
X-Gm-Gg: AeBDiethkfGzQ1W8HltjzD9DSVZMdVuXCkGJGZkyT1k5Wwr4TUie4gYZbW+vho9orBb
	5NN7HgsbQHsTnYoe1l1qs5fIRaBg7PKPrHgl2JN//cl90n4Nr394Uq64bk05LL9Ip001K1YnuLj
	cU7787OTxu4ebXKkp/LGizPO9AnnN8qnuFjF8JQFn/f+M7ox194EdzAfm0uoZflaqqgtBklq0zC
	ZIc1gVMo9crt+R14HOiuoYjuvlodeZHkNfiBZOdzDBdY/WfpB2l4AtwpZiTFPS2w6VvgB6Fmysk
	5U/1LFCafnJ20MATFuQa9DsS6uB62WCoTFRQpC89xqxgcaOaz6uEouaf4zXMQXwOyap4KhAwg+x
	MAiKKJLbEGns9xMqORz+6i4eKzQQ26qS61g/guIWFsOBnVd5oKV6USWgcSwIawyU6a1cD91DskJ
	/zVmkXHWe+n/0SJxttL/n0u00Fm+IVTw2TkWkik4k=
X-Received: by 2002:a05:600c:8b62:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a8609bebdmr41523175e9.14.1777553632363;
        Thu, 30 Apr 2026 05:53:52 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
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
Subject: [PATCH v3 5/6] arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl configuration for ETH0
Date: Thu, 30 Apr 2026 13:53:09 +0100
Message-ID: <20260430125342.439755-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add pin control configuration for the ETH0 Ethernet interface on the
RZ/G3L SMARC SoM board and also enable hotplug support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * Split from patch#6
 * Added hotplug support.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index acead2b1c842..0ae052238b3b 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
 #include "r9a08g046l48.dtsi"
 #include "rzg3l-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index fb781d9035aa..d0516d7db8ba 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -23,6 +23,8 @@ &eth0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
 
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -38,6 +40,7 @@ &mdio0 {
 	phy0: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
+		interrupts-extended = <&icu 3 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <1400>;
 		txc-skew-psec = <1400>;
 		rxdv-skew-psec = <0>;
@@ -52,3 +55,32 @@ phy0: ethernet-phy@7 {
 		txd3-skew-psec = <0>;
 	};
 };
+
+&pinctrl {
+	eth0_pins: eth0 {
+		txc {
+			pinmux = <RZG3L_PORT_PINMUX(B, 1, 1)>;  /* ETH0_TXC_REF_CLK */
+			power-source = <1800>;
+			output-enable;
+			drive-strength-microamp = <5200>;
+		};
+
+		ctrl {
+			pinmux = <RZG3L_PORT_PINMUX(A, 1, 1)>, /* MDC */
+				 <RZG3L_PORT_PINMUX(A, 0, 1)>, /* MDIO */
+				 <RZG3L_PORT_PINMUX(C, 2, 15)>, /* PHY_INTR */
+				 <RZG3L_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
+				 <RZG3L_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
+				 <RZG3L_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
+				 <RZG3L_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
+				 <RZG3L_PORT_PINMUX(B, 0, 1)>, /* RXC */
+				 <RZG3L_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
+				 <RZG3L_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
+				 <RZG3L_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
+				 <RZG3L_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
+				 <RZG3L_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
+				 <RZG3L_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
+				 power-source = <1800>;
+		};
+	};
+};
-- 
2.43.0

