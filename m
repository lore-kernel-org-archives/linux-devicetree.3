Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F85029346F
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114728; cv=none; b=iUnoIdyz3cE7licwMvCLUV4MoVhsR6XmL/ErnDojwaFa2LKzVWqX01exbsgJgMHlLu9v2RPMvLYBbFzZ80OdyiBgkG3e0PGVL889pkoq+CWt0yOeqVTTjLQ8qY03keE7l3RZ4dXNs79mOADI3UXCC7T5c92+6XVPYgqZDAei+C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114728; c=relaxed/simple;
	bh=OipjGgsFj3wWpzwiMZ9C+EFIaSQwoMkz5UT902sO1OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgKcN5B+5JYWYsHx9A9FD9G6c+1lKsJsXMtjFIHBn5rLyzRvEvYOJLdx7vVDQZnfSTNl45z0JK/7r62AalDDkdmmn2GE99IY5VIdDLYjfYMco1GMIJYnhOec9UhcLniUYgSCN5SwzN6Rx+a+JrCwhxXGfPufoFD2fO5O5g6EnWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lDnuEKCq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lDnuEKCq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bccd251d622so410655866b.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114722; x=1779719522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiWA+rwoYmnp1xtUJ+3qeQunLZa44uT6rtS6A38xJwA=;
        b=lDnuEKCq/JXqc9QqLeNU1NsrLMLOEinVDtcbUKlYhn2dJFakVqXeivVxDgYCwJFGBf
         sdbrarUdW/Jg+5NeszYxIDXatmdvDDZBt76QGUNK6t2THtGInzL3KS88M5LZDrt+sS46
         27dNE5cDkUJ8m6XDOEHXEyNj5Y2MZ4vMofKfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114722; x=1779719522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NiWA+rwoYmnp1xtUJ+3qeQunLZa44uT6rtS6A38xJwA=;
        b=IsrOU/aSHe6eLUmsYA3IGexExZsesSLOUbVKE+M3cpcWMQtvSsGnh8MvWa2+YtAf9y
         8tRRad/yHhub4CHkoT9cIgcui7BZUsV5gJojqdFxmY4VVkIOxzG/r3veXA2I7lGERHX8
         cuTea8TWAmkiohnxV7vA2dTD0hpzgP/SbB4vpd5vOUo4XPOAQOcjNadfsyZRX9j8jEar
         qTvvDdWOvpsIYuZhjQUV2CIi8+zxrR43dx8XPLpxA7W5S8KWymyJewKAefwUmwzsr1se
         dHVCWg3KLnTDABmU16BNM4eFQD4dItARj3hh/7h2+snRUZR0rVIW9TFSz67NsLqmlm66
         IrTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MRepJYwDVc7yh/52L89asrkMPJJiTeODB1D4PQ68DdgLEnXaXh3cNGKoZeDC3rNeeloq7mfR8AREH@vger.kernel.org
X-Gm-Message-State: AOJu0YwTgYyYZqfypR4NHa/WUL47r2hal6Ho/RxbMJf3ElxivzVY0FVC
	KcmOfA/v1R5JxiqoBDgbrUUh9siQMGhBwlO7q7CIRb4NE1m3+7Vrms0QFZpCbqHhhpI=
X-Gm-Gg: Acq92OGOTYJMQyI0F+AcehbMO5MtasLWTOtFp2Nz2sIp+rCrS60+A2P5rapQHLvQMoV
	iHUn5UJmDZ9utJvrxIbw+Qw+Q05WSECmikKREoeOHO36HkDK6kotFTvaJrcvXppT70OuE7ljhY/
	47QDmkbcXJ5flBUtI6QeWr+VSFubvRJDIS0aOmExL5uDa1+HfVD5fu1XOkdBkkmZ9dN3mTdVDsm
	gyQThOhVjKCJ898VsN+cT5nrNtSOkU9tUCEwM82jroH2qGPP80u8UTlUcVdHDtbfy+JWkAHoE5w
	TX4gbCgp40N7F7MKHlUJf7KI9f64fMODvr1FdfSwuGIpXEwPSdgNT6inMFVgmQ85GhQw6CLST3+
	opIvvInC6W4ZneAcmOd5iU/NaalVvdWqaLDNufcIc+NqyPsm9jvjIYbKUw+gSVVs6ziiPCK7sOW
	yIanFQn68G6Bya2uVxDKG5EEluTK5H4YlATDWQr634hNQrNYqDLDQysw9OfKJbcwNlzQdNcH3Rn
	kG+SUDzmo0vHIKrbYhdcAxYXqIQYo1vkf7wB8vCI/Sod9QE
X-Received: by 2002:a17:907:15d5:b0:bd3:1b44:2ec with SMTP id a640c23a62f3a-bd51785f67amr615296866b.15.1779114721773;
        Mon, 18 May 2026 07:32:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH 02/15] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Mon, 18 May 2026 16:31:17 +0200
Message-ID: <20260518143150.3138712-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..5e46024d2215 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1667,6 +1667,21 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0

