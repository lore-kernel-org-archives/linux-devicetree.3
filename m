Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008665;
	b=1RyT/KRbvl3tGYHW38Vhwz7VmslHZFV7ORNwFNWQKo7/6j75gsMiGAOcdKUd6QNfsJXE
	 T8kW+/N3LljL/Mh4Sj+8rGk/tU/KUOsVgMrcl90eqwjU7zjL+NDGY7KNJnqX960ZP7B4l
	 L3sExXIDgLL3sWbsTgIXSRDKX2M3TSsSroSyq/nPaJ2v2CXl4qRuY5HdWlcjBygmMAAI4
	 FsTbJEByGyphSRBZ/Qu74RF+JLQQTMXPTjiPsPxoe7b+DfG5PlCArSjS7SwJjuUsU6KnP
	 jZWxxZX4lmsydZ44wv3nGSCx+aKQuG36ce3im/KT538m7pVDlcz9S4n6zySS/eQrWyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HcffSPuimDSKjJ+Q27cp2ryrVy584pPTd3AryXWHadY=;
	b=iM2PCB4lD2vVOVpQP4C2ZMXosSt8BtVk55xgHPwuAqTjl38nfpJuSxI3s8LSH6t5Xk2O
	 LJAJnjUAEUJywuHCJkI/hHzTcAAL3ihDfLC0RxYip6XOMjdkd3tNJF6dHUxjMJnONMWHl
	 wfoiK7D7cUxvUPkm8pErzy9X0B5TQ6aoxEurbo7SgUfA4CHbJI7fnWINLwOVDAwgSV2GH
	 LN503fyzu3G+dtY7p1eQD6bvc8zWNs33bDI6xIByHgVG2rFvuFTpari+xY3Bv86cyvOpP
	 t11SDCZ9djRqyFdk7716g3yFhqMaQ4uhLNpv8geLgCdcfdnxTjFydAwHvOt4qQP8GRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UfBxAXY+;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82876606A336
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82876606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UfBxAXY+
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1693215f8f.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008664; x=1793613464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HcffSPuimDSKjJ+Q27cp2ryrVy584pPTd3AryXWHadY=;
        b=UfBxAXY+OGWZtQVefhBi1aB08I/gReKZ9XZS8CwRRGO3FzKKvsV+LBS/MnfevyAzWI
         zCRA4t0rZ8178bcfqq1lpid9EPsDTWtUFP9viWFk4XYgT4oDTYXUX1buasJYsgrkLli9
         K6BQTcZEp4mRLti3+owSZoFrmqE8CfxzicTnKvNovEaTVvat4rPEkQFneTA6GZoEVCaW
         hLlUxXCdceLYd3aLTvIYVe1Srw6F5JKFyxd3esxHOcWnvdItGuU1CWbKYsOHgrI6uWma
         mblinzTFOaS4lXzfSKNX2chPgULg5Xuptok6ThdrvM5FCpwzo1nEt2pacYZ1iDp2gtEy
         JjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008664; x=1793613464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HcffSPuimDSKjJ+Q27cp2ryrVy584pPTd3AryXWHadY=;
        b=sns+4NdByqJGgfqJYuXODFl6R1epakX4NMpdVG0FMk9wHovirLNy47INjN0f+HsKtz
         0pps8mfGTkvr0Yp6/CuMH8qfzP9u9redvQTix6GkUlTFi0SbWJY+dpyqSDWVYV4RIQtA
         gVaVZq3zXFerUsEXzBrpNRejqcP/E9qt2gcJNaiUAQUiQMffZQMvxWNYX2n/5PBuv84A
         hRHVPOxYWZIR0UZP13uymosck00zxwhOPaBicDmkGoeaJz/auCW5+eTLpK/tdnohMEvO
         YgP64YDPONFhbMlUZtDC0g2UsiTY80b635Nz4ZaWGAZz/V7M+21dWIQZkiQMDBTB1RRH
         xhKw==
X-Forwarded-Encrypted: i=1; AKwUvBx+ctR/aCatJFNI0vrs4WF1auOtU8x61VMxffhl/yG+rrYc8AoWkWSV9ZejTyKa2B+2amWGyHGAQMD7@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ+Xiis9yXycChNL5gUZUD2dHlrEKHAhTiFVppafLPoOyOxWXc
	UYU43gl5okGGgaa6JuElHMw8fhryG+t0JDUoRSDiYlA5S6R6+lxPYQwx
X-Gm-Gg: AYBFou2EYG7KXVfnFZQZbPumTGVL1hKzQxVEFlbiypW951r2idsPEQGomuVBJJGusum
	unmLstaK4lTuWyLnEs5WAYNv2vduRE0sci149eI87W6nOtsOf03stTaz7o1HoBhE0cNj2CzwJdC
	i4HRCvbxI6yR4u+I1KnhKGdhAHgI6/zcBytMpctcGp6Wj8XErpw7xkaYjP3H2wzEsBDm+VqvzYG
	6GYRfOOEmYldNWpfiEd5ZTrVWHqEpPh3OJ7xpbIarW/QqDqUtZ5SyzEVDvmCKf1qDO4rLTEIpzJ
	Nbk4HvPkkyzkYovu9ZcQiSLvk3SlIGrVzDZEb4gG6B/HA7LNLEsY8DL6+iLYCSzdpHgG9S35kAo
	zggMM1e9ZVmYvtfgcZVB70MDPYyxuaAMSZUWpfK5WDMUN6B7BGv1BU6ygFKIaBM6PIChCMpkktV
	OoaWG1KeRLpCIEZ7Fl130CsSdO17oktBbvVECYx8rfAXeYSAR4oSLqvi4OwzXl9P2oU0c/65Q38
	+d7SXSBZ9qu+E2whMs6BmN8hnRyrrFmwSFFc0YmEJTILOan6yO3AAxtdc79Gd9BgL6Fxhpo+KkS
	QZV86YxdkTgPvCpcefmTFMOigcV2mCqbheYGwOwtlh0I8eZiSyTv86X15Ws/
X-Received: by 2002:a05:600d:82c3:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4a51cf1b880mr83369685e9.16.1793008663905;
        Mon, 26 Oct 2026 02:57:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] arm64: dts: airoha: en7581: add nodes for all supported uart and hsuart
Date: Mon, 26 Oct 2026 10:57:13 +0100
Message-ID: <20261026095727.31708-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all the nodes to support the existing uart and hsuart present on the
SoC. Also update the compatible for the already defined uart to use the
more specific UART configuration.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 46 +++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 760f0c3e6090..ee1633f01068 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -470,13 +470,24 @@ fixed-link {
 			};
 		};
 
+		serial@1fbe1000 {
+			compatible = "airoha,an7581-hsuart";
+			reg = <0x0 0x1fbe1000 0x0 0x40>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
 		pbus_csr: syscon@1fbe3400 {
 			compatible = "airoha,en7581-pbus-csr", "syscon";
 			reg = <0x0 0x1fbe3400 0x0 0xff>;
 		};
 
 		uart1: serial@1fbf0000 {
-			compatible = "ns16550";
+			compatible = "airoha,en7523-uart";
 			reg = <0x0 0x1fbf0000 0x0 0x30>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -517,6 +528,39 @@ en7581_pwm: pwm {
 			};
 		};
 
+		serial@1fbf0300 {
+			compatible = "airoha,en7523-uart";
+			reg = <0x0 0x1fbf0300 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
+		serial@1fbf0600 {
+			compatible = "airoha,en7523-uart";
+			reg = <0x0 0x1fbf0600 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
+		serial@1fbf0700 {
+			compatible = "airoha,en7523-uart";
+			reg = <0x0 0x1fbf0700 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
 		i2c0: i2c@1fbf8000 {
 			compatible = "mediatek,mt7621-i2c";
 			reg = <0x0 0x1fbf8000 0x0 0x100>;
-- 
2.55.0

