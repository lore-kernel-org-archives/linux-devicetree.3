Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA5A4FE2EA
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686135; cv=none; b=aHi/6iu09uLuvDQCJ1PD8TOol/hLcKHZ+OAERe9yxmUS0VflmijCiT3E4hwjbByixaLKM6DaR3c55AneB0+//kLhpuIgV4Y2vhTCqdBvQAGUg1aT0zT8kDoPFhSapAQpR+nx7bMiUJqB2kiO6Rx8iwmakDWhL7U46ZFOM8l/0So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686135; c=relaxed/simple;
	bh=wbHMaKaK45TOAQRLL1l/1fVGrxE2ehsU9nvptqFVQIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VY9rWJv6L0+2ZS207b02bp7hW+HyQTAodz6UQWBJ187vA7Lua3ut5tY0bDX5KCDXIhH9qoXXlBstXCh40j83I1ENp90PCRfBKa0/xjC/kHJU+Lcs9/DZg20Hdyi/IFebFWfefIYULQJE1oF7i9Kj9c/OSMnke848hsn9FeB/AgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTHJQH9y; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTHJQH9y"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so607152f8f.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686131; x=1791290931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmzDllNwVcUBRIMWMvWOLZKFzcdqnhRBady0WsHfzZk=;
        b=UTHJQH9yNKhoZ5B5OR8+pB4xVQLe0MyaCmPxcrNOq51Nlf8VpnAD8jZMna0f/ayYdP
         D+ROwHuYmygaiiF55ndq4Ve3M3ITIzQlYBmW/FH0J2fa9Nim9zK5qfH3TPamqOLMrWSV
         4t3O/mtWwqMnPBd+UYPsuEyjVKM2kjIpYu/lhSpRCutzh7zwGz3xdzgTZyYsEzaf6Kce
         9bjDhEcdNIO4/gbBRDZCX/zSrcfAIfqO/sT4QuM2pKGniK+n7N1NBjLRcTfRlpdS4PTd
         Iyjq+45w4bfO8UHgEy6ClVSERyfL+vm3ShlcV+nLcUY4sxqFx4j9Dm3JzmBTLeAHzflS
         g6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686131; x=1791290931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bmzDllNwVcUBRIMWMvWOLZKFzcdqnhRBady0WsHfzZk=;
        b=kiRvUh6ot1cTMl0GouIkwAf1SWQ6DSnlQv2W3mIX6RnP8qWFWLqPA6xPT6qARcAj4D
         5i/5aRV0IjWohhTSRIYZwk/G+FJlP0/gEUPwSMtC7VAxKOWOhR0bfNxrm11eXQa+pc/X
         uwUyyP0U4s6EVhHS93PfHoMi+yCOII5EEw2vV4JgM7wKuyE/Jik7IZ0jxExd1a7RQSHQ
         REreU3T1BXEnMZYcv5HPnUYc483BwegZo8p/W5vQweqlGnU2a06ERnFhZp6ofTezfZBk
         J0jaL3Ez+6VPjCbZHo8aSEdWgxfgxP3v/Ud0YcoBa3Q1a3k78kKvf+RnuKr19wi1Jpr2
         1vpA==
X-Forwarded-Encrypted: i=1; AKwUvBz5VRtTDbiuL9SMYxS82mlVlyHPTShI4a9gu6+x1ZCPpRMlvcMou0iLRdHUew8Y1TFabdWRZcYxxa2k@vger.kernel.org
X-Gm-Message-State: AFq9FYIDf0ouAbtOvcGvWTFchUa1IaWTnFkHksN6h7M1J1G1yToJjk0n
	4lfdujcpA7KmDYlVUavgvsyzFnuxU1sT3qrVeU2mlJ622VHynac83DuL
X-Gm-Gg: AYBFou28m2ECKBYJOm9v8bSgmLA4sh9XF+GgmjYKgXWLMRLS+qbtNw6PEdaqfm9MbXR
	Y1A43KvTvLqjfB23Urb9Z8py729XxD5yHVFvev8+5uabIaBaWhYUfeoZ1lmJ5t0b5E73JLc6d9i
	PEpsHaOKQ5ky+PfXZR9WH7q5Jj8AYeWbyjfVt4I39P0Hf6f0p0f0AmHuGv2ctqVGJVQVG1FYkuH
	Rfqlnneg/hOgT29eMnVstuY2pxgnghgkWnbhe3/eNw9CDbUxUTA/wArrhaoh2HQVMeH4V6VHGu7
	9FpQkI6DgrRfVB4UTtvm+ujMrADg0Q8Q1J7pB2AbxEPf5rpUoIWJOE+W+GilF/VXEzECZMfvFrw
	E2Gn6Fi6wLR4sWhvPbfgnlWPDrxjqDjzdEJHU3CEcfaS3RGexl06NxI17mn+Ae6PchRcA20+Ouc
	WMbxOiq2N18HVVz1caleqyv4ExeAYc0JWvLdbquA3UdyIbDCTB6xIHFROycCzZtAiuznUMaalmm
	OqY5QRoVZ/ctLbOMiRVsYYMPCmA7SHH3imuumTTMCPWFlXoXKr7iUILFezY4Av1Z1p7tSQq2vC/
	UUx7dOtbXzqWE7bvOw==
X-Received: by 2002:a05:6000:310f:b0:488:8b07:f3f5 with SMTP id ffacd0b85a97d-4888b07f881mr15858765f8f.27.1790686131008;
        Tue, 29 Sep 2026 05:48:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] arm64: dts: renesas: r9a09g056: Add ADC nodes
Date: Tue, 29 Sep 2026 13:48:27 +0100
Message-ID: <20260929124829.237997-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the three ADC device nodes to the RZ/V2N SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 144 +++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 175e24c98e11..51370f38989d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -626,6 +626,150 @@ wdt1: watchdog@14400000 {
 			status = "disabled";
 		};
 
+		adc0: adc@11c00000 {
+			compatible = "renesas,r9a09g056-adc", "renesas,r9a09g057-adc";
+			reg = <0 0x11c00000 0 0x400>;
+			interrupts = <GIC_SPI 918 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 919 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 920 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "adi", "gbadi", "gcadi",
+					  "cmpai", "cmpbi";
+			clocks = <&cpg CPG_MOD 0x108>, <&cpg CPG_MOD 0x107>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg 0xf6>;
+			power-domains = <&cpg>;
+			dmas = <&dmac0 0x24c8>, <&dmac1 0x24c8>, <&dmac2 0x24c8>,
+			       <&dmac3 0x24c8>, <&dmac4 0x24c8>;
+			dma-names = "rx", "rx", "rx", "rx", "rx";
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0>;
+			};
+			channel@1 {
+				reg = <1>;
+			};
+			channel@2 {
+				reg = <2>;
+			};
+			channel@3 {
+				reg = <3>;
+			};
+			channel@4 {
+				reg = <4>;
+			};
+			channel@5 {
+				reg = <5>;
+			};
+			channel@6 {
+				reg = <6>;
+			};
+			channel@7 {
+				reg = <7>;
+			};
+		};
+
+		adc1: adc@11c02800 {
+			compatible = "renesas,r9a09g056-adc", "renesas,r9a09g057-adc";
+			reg = <0 0x11c02800 0 0x400>;
+			interrupts = <GIC_SPI 926 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 927 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 928 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 930 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "adi", "gbadi", "gcadi",
+					  "cmpai", "cmpbi";
+			clocks = <&cpg CPG_MOD 0x108>, <&cpg CPG_MOD 0x107>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg 0xf6>;
+			power-domains = <&cpg>;
+			dmas = <&dmac0 0x25b5>, <&dmac1 0x25b5>, <&dmac2 0x25b5>,
+			       <&dmac3 0x25b5>, <&dmac4 0x25b5>;
+			dma-names = "rx", "rx", "rx", "rx", "rx";
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0>;
+			};
+			channel@1 {
+				reg = <1>;
+			};
+			channel@2 {
+				reg = <2>;
+			};
+			channel@3 {
+				reg = <3>;
+			};
+			channel@4 {
+				reg = <4>;
+			};
+			channel@5 {
+				reg = <5>;
+			};
+			channel@6 {
+				reg = <6>;
+			};
+			channel@7 {
+				reg = <7>;
+			};
+		};
+
+		adc2: adc@11c02c00 {
+			compatible = "renesas,r9a09g056-adc", "renesas,r9a09g057-adc";
+			reg = <0 0x11c02c00 0 0x400>;
+			interrupts = <GIC_SPI 931 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 932 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 933 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 934 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 935 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "adi", "gbadi", "gcadi",
+					  "cmpai", "cmpbi";
+			clocks = <&cpg CPG_MOD 0x108>, <&cpg CPG_MOD 0x107>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg 0xf6>;
+			power-domains = <&cpg>;
+			dmas = <&dmac0 0x25ba>, <&dmac1 0x25ba>, <&dmac2 0x25ba>,
+			       <&dmac3 0x25ba>, <&dmac4 0x25ba>;
+			dma-names = "rx", "rx", "rx", "rx", "rx";
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0>;
+			};
+			channel@1 {
+				reg = <1>;
+			};
+			channel@2 {
+				reg = <2>;
+			};
+			channel@3 {
+				reg = <3>;
+			};
+			channel@4 {
+				reg = <4>;
+			};
+			channel@5 {
+				reg = <5>;
+			};
+			channel@6 {
+				reg = <6>;
+			};
+			channel@7 {
+				reg = <7>;
+			};
+		};
+
 		rtc: rtc@11c00800 {
 			compatible = "renesas,r9a09g056-rtca3", "renesas,rz-rtca3";
 			reg = <0 0x11c00800 0 0x400>;
-- 
2.55.0

