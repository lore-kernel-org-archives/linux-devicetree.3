Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2466A3BFAC8
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828058; cv=none; b=hXqFogrMvNUG3xi+iOtgzi9wCfoxza2XweBeKGxMVGBiBTGe9wUDB0HvCFm1abGQ4Dtx4WG9ui0FIFRpcWOTbozcAMfZ6EmYP+bJvLrym047R9drCS+iU14UIki+pROsFbxwYRtPuNYsUufButJgFez8AYNHfktFqepnLzW8sT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828058; c=relaxed/simple;
	bh=GY+3JuwvqmoMB+7D3MTbrtRBNTJrIqJO/hk0l4ca7mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nt3okGgoJkPob7Ro1DhfU23x5TAT05lZCC3ZH7yotoxYx4i4Btv+fSoosHFL7SEmeZxfwKlsquCHgkMp+JQc6M9ReSgT2Wqq1spAh7J5JMYUt8qaHSWzssXOndQGU6qn9VGs8oKdU9BpWvVsvL5MX5UIMOSnzCpV/RHHxK1DnvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8r1Kjad; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8r1Kjad"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so6302470f8f.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779828054; x=1780432854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3zfcrPXxIeWk32OZbqQALutCssJlFsmq9m7NFPHnKI=;
        b=F8r1KjadpNixTcU7aIj7JzgixOq3A7EhNKjW5rNrGf2wZMHIJz85EgJHBXu487duIX
         XfRrqt7JFsaercxVXCuV6hlb/+gqQvj4w1fyNoBPAqthlGVZqtcIRpMuQyB8awCW1Rwt
         HzSFRvQcAnX9WfamIhQQcZRu3a5+vC7IycPVQHa8drhOcpM3Pqg3ZruxX4sLH4jCYNTS
         pbbRwNiaL7bKPB2TPEIsiwBdMPzlqTyyxF9iNTx9BWItr+LLXMv6T+27qc0VUlu2F8E3
         4y2GhqJWrgBiBPAs91JZtIDsRMhXsIHqg+T+Qxvvo+w16/kqIW+qtFMEUvyd2UiJ8ube
         oJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779828054; x=1780432854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y3zfcrPXxIeWk32OZbqQALutCssJlFsmq9m7NFPHnKI=;
        b=CrxJLB1qcD5S3XUR5gw9zIGZSMbYFwDm1hW+ER9Wvv+TN8wRvVBSPVyou/CGghDXro
         Vdur8QMapSNSEWibuAdcsO9bAL01gsrEg5yXeaqYVz6+W+RvqhkQ+E5WyQ1HLlnpZpki
         VaZ7SG2Wa23b0EgbFt7D52f1dArwrfbD+ClnGQnc2CCB2Eaeh0LSRbAtTxatLi0Dqj+K
         Eu9Zo8mx5lNRBbmAanuNvalDELb0EhfJoILzUQPZaAiB6NDkSJVTIK11YLHwBBR4FiH+
         hVfgtEpd9zhnU51P0XMkdp+A5wwAYNoXhD4IGVDj7JMRiunUnVetRfrLh6tMA1EwsFfv
         n3LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ooXQUj6MbgQQX0REtDx+VGyL58VMn3B5D1O+6ew+9NxHeX+6h+4btKOix0MiNNhyYkM0ms9HM+PXX@vger.kernel.org
X-Gm-Message-State: AOJu0YwQhf8hd+QHEO0tgdchWtB6Vc/UshdeTTxZutFv1UnGzwc9O44t
	Eo+hEhCty3sfwOoSESh2kNWWPN0/VrUYmgSbD0hiR3TFB2ofubz+5/N8
X-Gm-Gg: Acq92OF9Nadaohlhvtl9v7GwyZAsUSF9AgN4m9JAoLEPe42O+hLRJXxlVQsworuTafd
	Vu0dGVCvQAlMOB+bJH3sAINV5hXkeX8nQ7nQBFbLpdik8EM73vmuk2hyNn8D2DsaaTpT2Q3VOh4
	YUvk9o8o4vWUqQcm7D9k+qst/lM88+PpUekDlJi3Pf4JyL5MDMMitrNFeC/bwy6HKoauCocHMbl
	FYRDBuwu9PsWrHtsGK3y+EO37sbhNprjmoM1PNNLEBIik26esMeaHOFlSNMLixzZjhYi9zaD4af
	vHKusmvo2dFNw9BR5zR+pbOScNNxGCQ/XnaukDem9I8q2QOVgp2gj3SmLpWCJ5qHPf9mwMtDOBN
	pMPTVTefPughggbIla9zyj8ExC5kdO9yaFYDmxgQYf1svVFpeOZkvWEupfAGzGvvo4J/9cwRJOJ
	Wbyj/5bPYorPaQW1NJFKHl7nMjj6Q1ZcNmcU9i8xpkaxJ03Csw2STFd1Q4TD4L3lDKsEjK/L4Jc
	b5uipIDQpWVjXt/+x/nEWgoI/RI+WGbBwWZAaK6J9lthubq
X-Received: by 2002:a05:6000:1acd:b0:448:69c0:8da0 with SMTP id ffacd0b85a97d-45eb3692456mr33444947f8f.7.1779828054000;
        Tue, 26 May 2026 13:40:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6e49:e380:c3e5:25e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm904864f8f.12.2026.05.26.13.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:40:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
Date: Tue, 26 May 2026 21:40:45 +0100
Message-ID: <20260526204045.3481604-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.

Configure the xSPI0 controller interface to 1-bit (x1) mode, even though
the connected MX25LW51245 octal flash device supports octal mode. Add a
corresponding inline hardware comment detailing this restriction;
operating in octal mode causes the BootROM to fail loading the first-stage
bootloader following a Watchdog Timer (WDT) reset.

Configure the xSPI1 controller interface connected to the AT25SF128A
flash device for 4-bit (x4) mode to utilize all available data lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index f87c2492f414..fff63d08e3a3 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/net/mscc-phy-vsc8531.h>
@@ -20,6 +21,8 @@ aliases {
 		mmc0 = &sdhi0;
 		mmc1 = &sdhi1;
 		serial0 = &sci0;
+		spi0 = &xspi0;
+		spi1 = &xspi1;
 	};
 
 	chosen {
@@ -331,6 +334,59 @@ ctrl-pins {
 				 <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
 		};
 	};
+
+	xspi0_pins: xspi0-group {
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 1, 0x1c)>, /* XSPI0_CKP */
+				 <RZT2H_PORT_PINMUX(5, 2, 0x1c)>; /* XSPI0_CKN */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 6, 0x1c)>, /* XSPI0_IO0 */
+				 <RZT2H_PORT_PINMUX(5, 7, 0x1c)>, /* XSPI0_IO1 */
+				 <RZT2H_PORT_PINMUX(6, 0, 0x1c)>, /* XSPI0_IO2 */
+				 <RZT2H_PORT_PINMUX(6, 1, 0x1c)>, /* XSPI0_IO3 */
+				 <RZT2H_PORT_PINMUX(6, 2, 0x1c)>, /* XSPI0_IO4 */
+				 <RZT2H_PORT_PINMUX(6, 3, 0x1c)>, /* XSPI0_IO5 */
+				 <RZT2H_PORT_PINMUX(6, 4, 0x1c)>, /* XSPI0_IO6 */
+				 <RZT2H_PORT_PINMUX(6, 5, 0x1c)>; /* XSPI0_IO7 */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 3, 0x1c)>, /* XSPI0_CS0 */
+				 <RZT2H_PORT_PINMUX(6, 6, 0x1c)>, /* XSPI0_RESET0 */
+				 <RZT2H_PORT_PINMUX(5, 5, 0x1c)>; /* XSPI0_DS */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+	};
+
+	xspi1_pins: xspi1-group {
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(1, 0, 0x1c)>, /* XSPI1_CKP */
+				 <RZT2H_PORT_PINMUX(1, 1, 0x1c)>; /* XSPI1_CS0 */
+			input-schmitt-enable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(1, 4, 0x1c)>, /* XSPI1_IO0 */
+				 <RZT2H_PORT_PINMUX(1, 5, 0x1c)>, /* XSPI1_IO1 */
+				 <RZT2H_PORT_PINMUX(1, 6, 0x1c)>, /* XSPI1_IO2 */
+				 <RZT2H_PORT_PINMUX(1, 7, 0x1c)>; /* XSPI1_IO3 */
+			input-schmitt-enable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+	};
 };
 
 &sci0 {
@@ -395,3 +451,86 @@ &wdt2 {
 	timeout-sec = <60>;
 };
 
+&xspi0 {
+	pinctrl-0 = <&xspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	assigned-clocks = <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
+	assigned-clock-rates = <50000000>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		m25p,fast-read;
+		/*
+		 * Configure for 1-bit mode to prevent the BootROM from failing
+		 * to load the first-stage bootloader following a watchdog reset.
+		 */
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+		vcc-supply = <&reg_3p3v>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2-0";
+				reg = <0x00000000 0x00060000>;
+				read-only;
+			};
+
+			partition@1fb000 {
+				label = "fip-0";
+				reg = <0x00060000 0x007a0000>;
+				read-only;
+			};
+
+			partition@300000 {
+				label = "user-0";
+				reg = <0x800000 0x003800000>;
+			};
+		};
+	};
+};
+
+&xspi1 {
+	pinctrl-0 = <&xspi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	assigned-clocks = <&cpg CPG_CORE R9A09G077_XSPI_CLK1>;
+	assigned-clock-rates = <50000000>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		vcc-supply = <&reg_3p3v>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2-1";
+				reg = <0x00000000 0x00060000>;
+			};
+
+			partition@60000 {
+				label = "fip-1";
+				reg = <0x00060000 0x007a0000>;
+			};
+
+			partition@800000 {
+				label = "user-1";
+				reg = <0x800000 0x800000>;
+			};
+		};
+	};
+};
-- 
2.54.0

