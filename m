Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FFC3D3D1B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928571; cv=none; b=pHyR61oyi+cxMyqkUkooeJxybti9oUPc81egWg0oLTphV6EL3ubXu+vEROCTElRWsqt7hwJhwDNZpHl7EV6QyMofnLkaT7mH8f13mmwtmQY7gTEGeDFvPUdgOA9x/EeEIf7ivmeQTmYBrLlAvGhbMhTsQijh9ZeC54hK2TflGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928571; c=relaxed/simple;
	bh=NXfXIGVIGeCVikB9TgfoNEer690zMfYo8lkyy6VHVv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipYSfarpWXwxo2OtZy+t4+oz67/e7kBs/7CmXon1bVsInFI1K8JB2xwRJa462BJnN9E4wQqxiwfyijBT0F6vGq6WMv38LVyT07mozwA/CruGyrRz5MONcQ4VGXA+eNPpeX5p6HC/h40U0HXJCUCTLjQrjZhsoBYrdl0aD7L2Scs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eytWU/70; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eytWU/70"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bec450b950dso613631766b.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928568; x=1781533368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=eytWU/70i6rgfNhyRe5CuRiTafmkDJxxFtsEO4G8P0UNil1XpT7i3Mox74jF53/pGA
         LkHOPKt1Xiwg9dv0yzqNZjODr/S+MMsQRXpo73cHhIQHCY2N+KPzy+Jd7MG9e0otkq1Y
         DAIKxf6c3v0bTfv6zEDCdx/DzxWba+tQJFNo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928568; x=1781533368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=OFTSXYagrFVhEZPSa1E/06ySKGhEEV7AOd+UQIk8xdzbYcDrFahTzvA1i1uAZpOPSP
         vvE4cZwrUkYBYLN01hRQvqBJulBjN8mx6e/m6k9zml2nSOcxviEzfLeXho1FFW5lr9eq
         WGd9O1b3C27fbh6Dfp+fi/Q9akClrWBfGtUDn2bP0s3v5veMrEoj/DBu11FRTJB/azk9
         9ZH6LTrW2obLoXsNkcp3+5ULqjd/Ehr+6qjIm9wHQXCDJOJPjbICfdtZCaKZFPPXJREX
         tX3BCNjWJXkDIpAikeRY4aBBLXFv7du4Os34XvNACU0K2eMjFTjaPghkLDe5sVR6QG1X
         lPOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LPOiFPjM+R48ya1A25VQYAMN0fOpbnE2p/mTXd3a4xXfqIqwY3bfJh9bH6u7GqGo2xKRAW843BwEs@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+McbhF+amBvTGvl0RxDYkN79mjsxqs15OrntnlLgYJnfacRI
	nvN87/ZYgTRCIKnLNDB0wu9c8p2j+KCQN4dEUNlxDaKrjt5Pqna2OGjfiAR0xofyHyQ=
X-Gm-Gg: Acq92OF05SkUprgj3QxtcE3C6sPaOUuvGLIcOrQEGb8kjA1ril/PGwArSNTN5F7WIwB
	9NHe78xXpVgM4SkoS0q+QAziICoHpAR6z8POHBPDs7MP0tX9OJHAw3bTS5QrBpjF1PgYZ4GqY+j
	Ks3hRGpi89NgP/GCe/slGTpeFQGxLlKtd1N40z69kHindBsY+GN/MgJPrCyK/FsNIinGsUfjvdL
	WGZlpK/zHPeaVpFv3RePEXP6i8mJbvbHQjetGGrdPxSYwWkNwIqzcEqXNEOVWhSAjPk3YW3XG3S
	MuyNESHjez+2kujE9mqPxtb6l8mAjdWMNF01pYPCz5qM8JIZ09oa8wSQEWslBrZmGyko1AsQZGN
	F++8DFbwdt58aiOasGKiYFKjg1c5+itkfWdGEanqeNkLtnG/1dIDlErMIMILiuJOWx06n4xQInC
	wMhYJ+QcKp5h+dn2adoxxEouEuJKDwYQXfLUkqJOweOxgP3gYY6T3MTAHs/3aromK/Ip+EPZnEn
	nFAPPp98dFgrz5QngPZIPmKEI2dNDAKWOTIdriZqy6SgBH3YtQvbZ1dZPA=
X-Received: by 2002:a17:907:c486:b0:bee:e2a2:bddc with SMTP id a640c23a62f3a-bf373a0010amr730229666b.46.1780928568461;
        Mon, 08 Jun 2026 07:22:48 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:29 +0200
Message-ID: <20260608142221.952245-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the spi1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c816a6aece47..4e570e2e5157 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -702,6 +702,30 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	spi1_pins_a: spi1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, AF3)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, AF3)>; /* SPI1_MOSI */
+			drive-push-pull;
+			bias-disable;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 12, AF3)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	spi1_sleep_pins_a: spi1-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, ANALOG)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, ANALOG)>, /* SPI1_MOSI */
+				 <STM32_PINMUX('F', 12, ANALOG)>; /* SPI1_MISO */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0

