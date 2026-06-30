Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93973FFFB9
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811609; cv=none; b=HNeWAGpExX2vbB+Izf65lGBPX5sDsToX19eP+UZfbc15WYH6fpnE3KmNWfsB3eMaHdE6rUVnHrAGnKU83GS5wlPq0knYMB5ALnpLaOiwK2Ojbn1TRU+cKkT1gXNgQSSfnrk7/gJa7qMnlxCGonaKhZAbJs0Ql9DpSVhDL72pHPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811609; c=relaxed/simple;
	bh=97KY9yD7aJyeFaO9lx3/aKKgODbzwtq99a/1TuTW0pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSyQq7cjOEwt8peOCuQm5dsCwkzwBOtnECKNaMHaU+h/xg9jYZjZDMJ7doRjR2xRUdq25SG3v6QZSfSTu8f5qsKwH0bxoEKHjxZAkDGShlMtA/PqbizAo+OOZnpJQmy2COswFRXOJLw8K4gOUmybQ31EhJ/xyK1gk58wvEz6QC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hXJXL6mZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hXJXL6mZ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4745492ed3aso1137501f8f.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811606; x=1783416406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=hXJXL6mZXg/6zl8YpBpVakLQm57EhpO5X8J3Cu+y9+g/+cuxAGmELefyHAHf7bt4G0
         vxQf5PzarclFQ/GfLI/Ye27SSKdvpgntVmrhdntwfWu/Fij4ER7ndrvXUuYtYknlDcpl
         sr3i3nIOS+OcdYuyDTIP96Bx6y+0U19qB1xuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811606; x=1783416406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=lsOYEWxQzaNTidbeMqfVWHEvEvZv9tTrxS4J5CuKBT2+GMvQ2deMGPlXg8YU7Qa5Xl
         Ko9Ir5mNZvCkLIpA6RIXfr/tFBcnFIUmmVSYjTpp6IIW0C1+wnRdHYuHTAaYB+tOVeGt
         pd4gSIEN+KY6UUAxVSSTKJgMMZpVRBd74OXri8TUD3FzXLIh360k7dtoe6SPRtMrUHpd
         6nfsebJOfG76m6RxTNU1nLK76hubJyhDgBteDYY/z+I2+98JFIAcqfEZVN7CLyi8TeOf
         V4Zh37+M7zEDwdnLJukuX7i2z4wVynlrknvX4d9mRO5Jx1v7wXqOEGCo8gbISe+3t/nP
         Ztww==
X-Forwarded-Encrypted: i=1; AHgh+RpYzWGxgqsr+nKHkdaJlOxx1S8X5di7cJyOHi+auToEDj3OIXIQVLRgSK7pLTTQRWMEfXX1obEnKiWs@vger.kernel.org
X-Gm-Message-State: AOJu0YzoLI1u93RNBRO4hFxFnDyprqvaIQKP6xwpK+iy1ZPYx+6cwbLq
	aNuDV9u8Bm6HlN7iNicRFY/i2Io2pyD3A6mCi8pdlQTXurJXXgG8MOHa/CEd680ugm8=
X-Gm-Gg: AfdE7cmDM3e2n0k8YI1+3u7SCWJAY2j9UMsx9U25so7EjWHohtIOcH1L1RbO1Dddd2b
	32WB8DP5I01ekFg0mc3pS1icju/nXUy73SRR2K6/g8ng/s0OCN52TyKoUP+8FL9XAdF3wBeucyJ
	voRX1hA/cKSdOY//vmhW1eh5cUkquYjU2fqAxhnUifj4E8NyI9pvdokk6oEQgPVqhLPZZGDiVmf
	XML4tGloui+7lsnMR6x9dxvVbc4k3wGSax3I/YOjqcLGRkZS4WcgoZT4P5crRHk1oWes8sKG3qP
	HHi953xH99oS+t8dHcEUjcDZZFj0A1sIvJcdcz10dVSz/dolQKxTLCJfOB8Jr9w4iseRh9A3mjU
	NmxircIXNrjRktPmSqtveGHS+RdwZAyZ/DyGMa033acPEKKXmC05e7K736APsCphOPGgdlMvrTp
	cWYAknLEMSO5wJxSybYr21qYvP7p0PkVL1fyAI41y5S7FVqdIxMdmrYJb5Zrw4xVjboiKXE4Uow
	0ne7iy1GpAGDy8VTd2gDyTaDGf6OydtX0LU9lpgBW5betOQqdFkiSchVmtttXuxyU5SNRfw/yI5
	9wSRSK4Pu6kXcEqhqUkZviF0
X-Received: by 2002:a05:6000:3107:b0:475:f100:360e with SMTP id ffacd0b85a97d-475f10037aamr1473953f8f.61.1782811606455;
        Tue, 30 Jun 2026 02:26:46 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 06/16] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:35 +0200
Message-ID: <20260630092628.1695560-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0

