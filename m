Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D3E46D2B1
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787604; cv=none; b=s+x0wrNw9Fn6P/OVnIab6joMMcOoY0bPmSw918GTIK51WOCkq6zmxWLTYSkU88vUMiWh3npNutgNXkbVOLluZ2d+uU460Bc+aNNjwVFBjiO5n54g4fhT8HLws3dRh3hWu29D1UtgGMNGHW/F9sQHl3p4eYVFDdNRtemOwQmFVAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787604; c=relaxed/simple;
	bh=G5jXm9KUeZYj2Bl7i7D49ZYRWMRfZvF8D6J8EGNejlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rODyoTVnjtufCf07nybFHAhRADPYjCSsZtjcleH/IiTIF8JfPzGx8+Q/MpCtLzb5893UD9OtREK0CuqStXHzPYC+yMbWhNOPRfnda38I0G3ayiq4Ey1ImJ7TCjU5TZCypPoe7L6X1xz6ZH9ehlQ0AEFktT6ZxANW7BQk7upHun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=c3PMpTJ7; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="c3PMpTJ7"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2533d83e3bso593477266b.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787596; x=1789392396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+tecQI/RAFJySwtEv9OqcvDunXy81vhadYC9Bp1rn4=;
        b=c3PMpTJ7uV3eUQmqwJKZj8MU/BCxWMS/FlDW05chphrUBbMxw/LTrkBm3+m0BSN22F
         rLMOBq6KAtAaQcfajZOsRxi3/+GYrugDHvwnG3Okh+2+sUE+TC6MAHsQ3eDeG7P83x4S
         PmB9aSciY/WcAWc+bMrQFt33zjeTr+Z7svaWILoPEgXLlJhAZWl+ty/6PoGUc7gak2Zg
         A4ZmJGQnKApCkD7/DN+aQjeqm5xrKBcBELYq2cBjC3zd559RScw67SCWDxLkUT6a563C
         K64RNT1vUDzsRvxCGozY9YI7OQaBE422SsTGDUNAvk0OpIyDjSKZoTvlLmY+IEK/PQvk
         ZxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787596; x=1789392396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+tecQI/RAFJySwtEv9OqcvDunXy81vhadYC9Bp1rn4=;
        b=qYJ15ekjAmdcYivMZyTsjIWQuRfD6NVDkSuX1wldWPXrTbrrg8xbmMd4qjccAQRhFp
         pViR0cnNqn9PwFuCQwvcXeI5FZfsFCwkA1IjArSxd239JXJrf+QahvSrByFfuHFVtfAd
         VPpkZ+VcATB+zXEzepZ2xkGwRBdSwqpgZ6AGGequ0OYJewCEV5e/2yGHp3UlLw8MvE0q
         ADh3lYj200tnnsbfZA4G02ycNnCy6NOdjdldlUNVyyju3uppVW5OgiV8S5UQ5EA5vC8X
         CoYLoeG4+3iDybqG4DAb046/MF7TYyCPyHEBxri4z1FMlUzBnDRSwHwt+IfkagFPnxPm
         YFjA==
X-Forwarded-Encrypted: i=1; AKwUvBxQfh6qVBHzZr+0h7MLqJ9tu/6lvoZGrksECFh++7VRLj3F2LthmsipQIz8qRmC8Y1gFUGLAgAN1BaJ@vger.kernel.org
X-Gm-Message-State: AFuF++lqTM58RDlk6txb7fGztS7vynQT0yPoU/Gs60t157x7fQCJgh1g
	ntKHYiFK3V2Y5rH2VtGQ7LWX7DOUfxk1Ia0fdyYNvH9jEZnGA+Gml3W0bhCvJfjHRgg=
X-Gm-Gg: AYBFou3b7jRldt1/iWtAo/TP0A+C4VsSRKSBUAVXF3VIAjlq6474Nat72p0hOuNN8rO
	YYJ4FfNOsXqk6Z6R7Z80ts2E3S2uNHH7Ez9IAo4BitMrOhlkQx0xicp+w1r9AoNeWpy+kzjblp6
	Ds6/4R5zVGDQwxEEJJl0RxpaREzswNy+uTREfZs4xZdcTAEYtK7Rs6Ps7bHHh+/tlFRtBa4hUbj
	PBCkznfUa248cQCylwRHZm/3DimuLgb9CmRk5HfY52p00LO4rXgywXYKrqNynl8+8rPNTur4QBa
	of+WWIK4oofzaNJFiBtw0dtqI06IQLAE/UQuzoWY/V4lu8nNBvrxEruRp5skY6+T8gA32QQJ5Ft
	rHlnUqT68V7PS7SO9V0vVKD81z49Bp5bnt/xFMqRHLQYPbe+Vvm5ZsqSx1S8A82gv2ABUytiO/o
	5RxqlL2ASysECK8LdN0QmSNoFCWADxmcrnqsgov5KWaNn3NRFfbxm38cOYi3k7zpHjhunPMi1si
	Bfze/UDLpo9ROmr5NDA4YSWRwxvIv6CNrirwy5fscFIh21v23zeJ3/B84f8UdEge1oteZlWJzJl
	GtTy0DQiyTTRUaT+zBqKXgTwO/zWDwWWBysvhJS8sfvfJXoq
X-Received: by 2002:a17:907:d28:b0:c25:8eb7:f388 with SMTP id a640c23a62f3a-c260cc0bcdbmr1608993266b.17.1788787595858;
        Mon, 07 Sep 2026 06:26:35 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:35 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 4/6] arm64: dts: microchip: lan969x: add SDMMC nodes
Date: Mon,  7 Sep 2026 15:25:32 +0200
Message-ID: <20260907132617.1198548-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for both SDMMC controllers. Connect their bus interface clock to
the fabric clock and their core clock to the corresponding generated clock.

Configure SDMMC0 with a 100 MHz generated clock for 50 MHz eMMC DDR
operation. Configure SDMMC1 with an exact 50 MHz generated clock so the
integer base clock encoded in the SDHCI capabilities remains accurate and
the identification clock does not exceed 400 kHz.

Keep both nodes ordered by unit address.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Use the fabric clock for the SDMMC bus interface clock.
* Configure SDMMC1 with an exact 50 MHz generated clock.
* Move the SDMMC1 node to preserve unit-address ordering.
* Explain the selected clock rates in the commit description.

 arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index a8541c6a098d..5e330d5fab50 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -414,6 +414,18 @@ qspi0: spi@e0804000 {
 			status = "disabled";
 		};
 
+		sdmmc0: mmc@e0830000 {
+			compatible = "microchip,lan9691-sdhci",
+				     "microchip,sam9x60-sdhci";
+			reg = <0xe0830000 0x00000300>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC0>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&clks GCK_ID_SDMMC0>;
+			assigned-clock-rates = <100000000>;
+			status = "disabled";
+		};
+
 		qspi2: spi@e0834000 {
 			compatible = "microchip,lan9691-qspi";
 			reg = <0xe0834000 0x00000100>,
@@ -429,6 +441,18 @@ qspi2: spi@e0834000 {
 			status = "disabled";
 		};
 
+		sdmmc1: mmc@e0838000 {
+			compatible = "microchip,lan9691-sdhci",
+				     "microchip,sam9x60-sdhci";
+			reg = <0xe0838000 0x00000300>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC1>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&clks GCK_ID_SDMMC1>;
+			assigned-clock-rates = <50000000>;
+			status = "disabled";
+		};
+
 		reset: reset-controller@e201000c {
 			compatible = "microchip,lan9691-switch-reset",
 				     "microchip,lan966x-switch-reset";
-- 
2.55.0
