Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB6A50276
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990848; cv=none; b=amLTyUp9aiqEFEdLrrdL6HMISdy7EvfsLMHzrhcebcTvesempEAFkoyE276umzIx8tI1TALgUhCNloqa/Lkg5hHmDoYiGGwRSwA5xFk/rrGj9fibobqXkt8lD/tsvGX3OlszGfuWCxXHcq0RhwOZzFkKnLG/o/TXKRr7HUNc4Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990848; c=relaxed/simple;
	bh=sAvpzAz2NZN5YAKhznAkiQ3ghITlK/H3MC0boz/bWb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKvxJTzqeb4hJcjf9FhV8r2VgkkugeJUhZzQSzU29inPEe/3RgBV7zzpFv6lIV5i9RdWpNGOvRamYWxOtowoj62YdiRNvWix7dwjGBM0IGOnwjGzvb5lLw6thBj/3+7UbPWUlwoPGznAkxITeQTpfcX5nCqyV1GcnrDjEgOldMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3e517e6dso134083eec.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 18:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990843; x=1791595643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=luvk4RSDKwxoXOLtb/naS+7NpP4AkbeMINi5BwnyOQg=;
        b=k7rxxNmSlnoFjc3D09wPJujQ71pbCouKZ8x0lqRltc/eZHxTMrLXHdpy/U+nv6tOBa
         iYVCV5OfNXzdV8xIwcqWSraoFrifPRJ7Q17PwVxGLDRAKZN81hT/fTqhEMHsN8VadO9K
         Sa7UU6OzT7CCXiAY4HRLOxDU3zHv8Usq7ujQUhHw8mil49zxVJUB8XUH6K+MC2H2pEI4
         Bx/KwAfG9iiOtdPdObxf+KZv5JTQr0dN09ZMS9KWaAAZYJ40qCA4UXgocQTEmgiiQe2G
         iWaWrAQGRsnIsRydP6MiQkzD+mljLUUvG2aNdK4PJICdhqErZ45tQKQpRA/glw2Sf1is
         x6og==
X-Forwarded-Encrypted: i=1; AKwUvBxoEqRzVqfYOc/mxmTzK87q5QJQgTCOu0jHwHHi7fyB0pYgbiVU8c48YqQ9zjWMrHk+tZXldWS0nI7r@vger.kernel.org
X-Gm-Message-State: AFuF++lBdWwNmW0fiSfZWP9q0HG4qyLe2oHwdVo9OlIjdNfT62XMJGCc
	NKeUMBBELSFGHN+ftCmSGnZynUj2AXsA7tWxqKCw/PNuAbugkpcO9bng
X-Gm-Gg: AYBFou3tHFhZvK1181d7zGTJYUcSD3CTX/GD7KmPmOTu0YLsg5Jk+Mpv3FPh8FEZ2ae
	VTwte6DXiu6fH4S5OdL60l6C7tvmW2ovSwAOj2figCG6LA6qOQxBtwe/0oEE0XLAckTFby3VYg7
	sE6bk2S97wIdbdCKni258PUZ4+/UiO9VIehuKN1DSPogwXoO/JaYxIwcmT+vrq6v+/Le4zV0s0O
	lVIZr79CtzJaJ+yBXl0B1A/aFEXsGhSfTfddUHi0HZ7dH5NuwcmGZ0ss2D+ZsA1UYm4Iv4Anm0l
	A4BnRSx5mkW1LucUNo6/eXWk2lCEs+ZzYCQYsGyjLXJLikIynjEyoXvDJZTtK/eW2+HJdZrSZOL
	gkQkxJsVkgmJg+AUssfi1SuwZR7DNv2fZRJqYmtYLvI3C1BMRfZoF4V5HnaatfMkBslvbA35o/4
	3PH3l3/BiJwe+7C43vMIOp3cCXXdg9RhHDhAx2ucBJIUd9Zlepfg6ye9FIBEeeXguyowU+2y1Lf
	ZyNXlrjzL6EXDe4xg+JBMVpPIlrfkVNKC2Y3uoZF0yDSu19WoLwhQorOINpgSOYzb+2huwhF836
	zPDV+2DEZdcc3UyCdFPmEh50B/MPCjNFjMsnJWqN8UH6
X-Received: by 2002:a05:7022:f51a:b0:151:cba2:effc with SMTP id a92af1059eb24-151cba2f2ffmr1217637c88.30.1790990843319;
        Fri, 02 Oct 2026 18:27:23 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm1116843c88.15.2026.10.02.18.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:22 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] ARM: dts: sun8i-r40: Add SID node and THS calibration
Date: Fri,  2 Oct 2026 22:25:36 -0300
Message-ID: <20261003012534.418820-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003012534.418820-3-otavio@ossystems.com.br>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without the calibration cell, the THS driver leaves the sensor
calibration registers at their reset value (0x800) and the reported
temperatures drift from the real die temperature by a chip-dependent
offset.

Add the SID node at 0x01c1b000 and wire the thermal sensor to its
factory calibration at eFuse offset 0x40, one 16-bit word for each of
the two sensors.

The R40 user manual gives the size of the thermal sensor key (32 bits)
but not its offset. The vendor SDK key map names 0x48 "thermal_sensor",
but that word is zero on all the boards checked. On an A40i running the
Boardcon vendor kernel, the THS_0_1_CDATA register holds exactly the
eFuse word at 0x40 (0x08780875), which confirms the location.

Tested on two Boardcon EMA40i (A40i) boards: THS_0_1_CDATA now holds
the eFuse word at 0x40 of each chip (0x082d0822 and 0x083d0838) instead
of the reset value 0x08000800.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
index f0ed802a9d08e..c7c9cad695ca4 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
@@ -485,6 +485,18 @@ ohci1: usb@1c19400 {
 			status = "disabled";
 		};
 
+		sid: efuse@1c1b000 {
+			compatible = "allwinner,sun8i-r40-sid",
+				     "allwinner,sun50i-a64-sid";
+			reg = <0x01c1b000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@40 {
+				reg = <0x40 0x4>;
+			};
+		};
+
 		ehci2: usb@1c1c000 {
 			compatible = "allwinner,sun8i-r40-ehci", "generic-ehci";
 			reg = <0x01c1c000 0x100>;
@@ -832,7 +844,8 @@ ths: thermal-sensor@1c24c00 {
 			clock-names = "bus", "mod";
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&ccu RST_BUS_THS>;
-			/* TODO: add nvmem-cells for calibration */
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.55.0

