Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD632512DE
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976083; cv=none; b=CQGm/cEk3lA0Zj4q4yOLd09vUw80i+BhbzP5oYECoKaNSr5JTqRcrdhFlV6bH7jcWSmfhNMW5YqoCvWZ7yYdrsI3CfDncfDCfBtSnu/4GHH8cGXb6Oj8Tscs84qMdHzG8ZiFosTIeFHsgST76ScbttqbtO8QHLbrVQlpKoOzkrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976083; c=relaxed/simple;
	bh=2EWdcMrPkf1p8eDfkqZmZHPs8BmqSGwIW1yb+gViwc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3Ez8vlcRhBFIlxmMZ6Jv53J7T3aRf5duNgo66jnfAksoryxU507UANB+74kNY6h0ZT170Luwcqh6v7ZJJ34ei0toN/dELcNLzGTMEpy+XuPeoJhJO+jr8FxVy2fN9f2Ix00lb71pzaH4ecEdWMbbtxf5zfzgB4HjawLLueirSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDJC2xwj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDJC2xwj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43fe608cb92so7888730f8f.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976080; x=1780580880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAAY4ADZtMNNAxpwxGGAyfT+L5cJNl6r86p6t7OL4Ds=;
        b=YDJC2xwjRKF6AL82P04hsaLqIJzIziaaZMOoHvMnfsJoWwXJAH3D8qg6ve77dbFQ+9
         q5iuyuz8wlvddktQDPaGj7tDqcQ7COBGnUSUCYsNkv+kl+dwBqRVgBLuNihT5fM+UvHR
         3Dx8ylgT/eI265tkawWaGZl/tTuBdHcwUVT8+3p+NTGMTN+XA0FCSZdYQNrCF9Lj6hIO
         laECvyQ9XxPHyyuDwu0LBPSaAxhL3l9+b/6hoTt8zYR1lbJDGafrDAcBSrOrjiGxc8eH
         VWppuNzdE7jllRbqqC8EvGgWdVShZ8KEfLU89iyBGdoQI3fqt6O3jepxhWc0xeavfE1a
         /Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976080; x=1780580880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAAY4ADZtMNNAxpwxGGAyfT+L5cJNl6r86p6t7OL4Ds=;
        b=RQL3a4qDLE9aqcp5vRgY2vgCtvlJHxTbqopwR0oAOIE4grp6AfTlpehpBvKKMKatO/
         jmoyuE9bvvy2jqFngC37HiecVk6sz9+wYCGc4BC0zyWXUHHabnsBFSbAc9kEcG+aGAzd
         Lm4encwUTm5xIJtUhFEp8D19F2tOaUiMkW/jXlDBapbehFCg8VsFFyeZrh1ydlOk3NKm
         UPPH8fMeF84KimEb+6DHaJPhf54NaI327Xo/+MXrlzX2+nLtJikP22hAeNAtWlE7x9ai
         K5cjieDF0hJpm7bKBojHyVSutO3HDYbnj8Qa8F8RgQk4wFpsg0+XWv49OWWwDuPbG/gZ
         ALYg==
X-Forwarded-Encrypted: i=1; AFNElJ8TbhUHrCY15/uME69PQYuLhOfmdSMHRZ6j+7gjaMO9VHJ/me7q3cD431K6NzvIBkQgrmZ10C7XnMW4@vger.kernel.org
X-Gm-Message-State: AOJu0YxLzbMffmcM+Yv8/K4SPuny+X3qXQ3NYomDz4LGTFZyRk62JaLB
	DYzBNDt5M7dAYdtAzxtze7RII24qvLCeVKolgVAkF3kW78j1PlHk2HsF
X-Gm-Gg: Acq92OFQ4BTqg54noL7Xm8fEeAWmk9wnBlyIr0SQNNJ7dyWmk1NVLIhrvmQZIJaPgtQ
	5x3vm3mGT52pmOCe3joTq4yPBNckLEKDsd+ir9fW9nLNKyRAeZdvo4MiQnyNzdIp+IkbUIQEEYX
	+qKOCh68P96nNxhKM9zoxCGX+TZVtQfSdCm+6zabj3T5GGEIqZuS87yDOBTd4EEVcFQDAsYM5qf
	AefAGMdoj0jcgql5Erck3Nfl8E2YLu2MqjL/HCJAWxdL77PVriNXq0Lyx5BVUPbyPLAFtZDM3to
	Rx28ZQqTO2xawqSodexPTlffJNGA4MeikP8TYYM33zvvngIfgKavHOQAw3t00aB+1IKinycit9B
	4pktWTMToz4mqLtAIEx6JHq//+gGQpmvz+G+o6rnVyfu9j99tMQqnGDLL7AqB6IzbLHmlKPIIjT
	m/L9WyFUcZp5uJ4BHlUpT0qOLQXd3xBL89k98Fsm+vY1/Sv2Yx3Vb6NogMQsVxRoJvyb4Q6onrd
	YMh0yudzpRre+gIPpyvXF1j7tN6BY+guYhreVxKPAzcuHstjZTrZ4ilHQ==
X-Received: by 2002:a05:6000:2411:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-45eb38a167amr45793813f8f.10.1779976079394;
        Thu, 28 May 2026 06:47:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e50f:a16:236e:f9a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb54903csm14013775f8f.6.2026.05.28.06.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:47:58 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
Date: Thu, 28 May 2026 14:47:51 +0100
Message-ID: <20260528134752.79813-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the gmac1 (ETH3) and gmac2 (ETH2) pin configurations on the
RZ/T2H and RZ/N2H EVK boards to comply with the electrical specifications
defined in Table 58.11 of the hardware user manual.

While restructuring the nodes into pin groups, fix a copy-paste comment
typo in the RZ/N2H device tree where the ETH3_TXD1 pin mux configuration
was mistakenly labeled as ETH3_TXD0.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 130 +++++++++++++-----
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 129 ++++++++++++-----
 2 files changed, 191 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 987e44d0bf95..46ae17d0795b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -258,23 +258,54 @@ can0_pins: can0-pins {
 	 *
 	 * SW2[8] ON - use pins P33_2-P33_7 and P34_0-P34_5 for Ethernet port 3
 	 */
-	gmac1_pins: gmac1-pins {
-		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
-			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
-			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
-			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
-			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
-			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
-			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
-			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
-			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
-			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
-			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
-			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
-			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
-			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
-			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
-			 <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
+	gmac1_pins: gmac1-group {
+		txclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>; /* ETH3_TXCLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		txd-en-pins {
+			pinmux = <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
+				 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
+				 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
+				 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
+				 <RZT2H_PORT_PINMUX(33, 7, 0xf)>; /* ETH3_TXEN */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		rx-pins {
+			pinmux = <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+				 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
+				 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
+				 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
+				 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
+				 <RZT2H_PORT_PINMUX(34, 5, 0xf)>; /* ETH3_RXDV */
+			input-schmitt-disable;
+		};
+
+		md-pins {
+			pinmux = <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
+				 <RZT2H_PORT_PINMUX(26, 2, 0x10)>; /* GMAC1_MDIO */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
+
+		refclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(34, 6, 0x2)>; /* ETH3_REFCLK */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+		};
+
+		irq-pins {
+			pinmux = <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
 	};
 
 	/*
@@ -283,23 +314,54 @@ gmac1_pins: gmac1-pins {
 	 * SW2[6] OFF - connect MDC/MDIO of Ethernet port 2 to GMAC2
 	 * SW2[7] ON - use pins P29_1-P29_7 and P30_0-P30_4 for Ethernet port 2
 	 */
-	gmac2_pins: gmac2-pins {
-		pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
-			 <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD0 */
-			 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD1 */
-			 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD2 */
-			 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD3 */
-			 <RZT2H_PORT_PINMUX(29, 6, 0xf)>, /* ETH2_TXEN */
-			 <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
-			 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD0 */
-			 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD1 */
-			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
-			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
-			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
-			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
-			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
-			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>, /* ETH2_REFCLK */
-			 <RZT2H_PORT_PINMUX(31, 1, 0x0)>; /* IRQ13 */
+	gmac2_pins: gmac2-group {
+		txclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>; /* ETH2_TXCLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		txd-en-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD0 */
+				 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD1 */
+				 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD2 */
+				 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD3 */
+				 <RZT2H_PORT_PINMUX(29, 6, 0xf)>; /* ETH2_TXEN */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		rx-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
+				 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD0 */
+				 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD1 */
+				 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
+				 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
+				 <RZT2H_PORT_PINMUX(30, 4, 0xf)>; /* ETH2_RXDV */
+			input-schmitt-disable;
+		};
+
+		md-pins {
+			pinmux = <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
+				 <RZT2H_PORT_PINMUX(30, 6, 0x10)>; /* GMAC2_MDIO */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
+
+		refclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(31, 0, 0x2)>; /* ETH2_REFCLK */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+		};
+
+		irq-pins {
+			pinmux = <RZT2H_PORT_PINMUX(31, 1, 0x0)>; /* IRQ13 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
 	};
 
 	/*
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index a66502d8d82b..174b8f728522 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -341,23 +341,54 @@ can1_pins: can1-pins {
 	 *
 	 * DSW5[8] ON - use pins P33_2-P33_7 and P34_0-P34_6 for Ethernet port 3
 	 */
-	gmac1_pins: gmac1-pins {
-		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
-			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
-			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD0 */
-			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
-			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
-			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
-			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
-			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
-			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
-			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
-			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
-			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
-			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
-			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
-			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
-			 <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
+	gmac1_pins: gmac1-group {
+		txclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>; /* ETH3_TXCLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		txd-en-pins {
+			pinmux = <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
+				 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
+				 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
+				 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
+				 <RZT2H_PORT_PINMUX(33, 7, 0xf)>; /* ETH3_TXEN */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		rx-pins {
+			pinmux = <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+				 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
+				 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
+				 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
+				 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
+				 <RZT2H_PORT_PINMUX(34, 5, 0xf)>; /* ETH3_RXDV */
+			input-schmitt-disable;
+		};
+
+		md-pins {
+			pinmux = <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
+				 <RZT2H_PORT_PINMUX(26, 2, 0x10)>; /* GMAC1_MDIO */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
+
+		refclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(34, 6, 0x2)>; /* ETH3_REFCLK */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+		};
+
+		irq-pins {
+			pinmux = <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
 	};
 
 	/*
@@ -367,24 +398,54 @@ gmac1_pins: gmac1-pins {
 	 * DSW5[7] ON - use pins P29_1-P29_7 and P30_0-P30_4 for Ethernet port 2
 	 * DSW13[7] OFF; DSW13[8] ON - use pin P13_7 for IRQ14
 	 */
-	gmac2_pins: gmac2-pins {
-		pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
-			 <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD0 */
-			 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD1 */
-			 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD2 */
-			 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD3 */
-			 <RZT2H_PORT_PINMUX(29, 6, 0xf)>, /* ETH2_TXEN */
-			 <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
-			 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD0 */
-			 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD1 */
-			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
-			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
-			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
-			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
-			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
-			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>, /* ETH2_REFCLK */
-			 <RZT2H_PORT_PINMUX(13, 7, 0x0)>; /* IRQ14 */
+	gmac2_pins: gmac2-group {
+		txclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>; /* ETH2_TXCLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
 
+		txd-en-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD0 */
+				 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD1 */
+				 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD2 */
+				 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD3 */
+				 <RZT2H_PORT_PINMUX(29, 6, 0xf)>; /* ETH2_TXEN */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		rx-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
+				 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD0 */
+				 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD1 */
+				 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
+				 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
+				 <RZT2H_PORT_PINMUX(30, 4, 0xf)>; /* ETH2_RXDV */
+			input-schmitt-disable;
+		};
+
+		md-pins {
+			pinmux = <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
+				 <RZT2H_PORT_PINMUX(30, 6, 0x10)>; /* GMAC2_MDIO */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
+
+		refclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(31, 0, 0x2)>; /* ETH2_REFCLK */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+		};
+
+		irq-pins {
+			pinmux = <RZT2H_PORT_PINMUX(13, 7, 0x0)>; /* IRQ14 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
 	};
 
 	/*
-- 
2.54.0

