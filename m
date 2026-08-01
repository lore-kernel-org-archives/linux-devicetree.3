Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3B135DA7F
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594258; cv=none; b=BzOo6t4R2baS+VKM3lqeUsPUicUTbIq39Rn5KJcuSqq+F3ulxPZix5baOwDffboGzdu8WZpnryLAzB2d/I9AIClAIJkfiuPOpYYfkf5TUN0K1CW0H5NNkNwQVch9skVqDLYphNBA0ICg5pspSTElAoFNiJ2QS3ABZkmmxjOHdaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594258; c=relaxed/simple;
	bh=aT3+YJC4SV9j+IgfW/9nXl5t5WR65qvVucKV2aC0T9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8FVJuPselteyGpOlpiauhiagu34474F1dV9thbCywLur6GsciQdNuiLZArw9hF+wZaPbgzDSkW1wa068qXDihm264CNyz2GbJbPtoL7VSQ2kaEkoqcsjO+cGYvkvChH738RYSWhbAYG9qCXOlUtaa94sF8VSqTjK1nYk9JpEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwCjjWbr; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwCjjWbr"
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ceb5a39c48so6118545ad.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594253; x=1786199053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=;
        b=CwCjjWbrdkiNNh5y+cOvkbtK5JyHfM9aO4YQAHF77hxM2b2PoznbD9AZICXp9UPBnA
         gYa1Wdk/HgKCxAbKqxnh1glNdzrEvWOEqtPRTbqJjS8OYqHXIe42YzwpR/qwVs+zb0Xp
         Wdq1Q1FDlDwhSgFhaW7z18N/4/SnF+EGPUjcNtVGE7WhNSaeV9c+yE7PjWgx6OgslPM6
         NvCiz38WhFW8K69Z3UUHyr1cZjBe2DjmJOAx8qG18DNHwOEv+TXj01jO45d+zG/rg2/g
         yEcGluoRVswljuekfHB6rrc3+fx3YlpH/h6OqflID6Wr+uv4iPwdw039aAG185Mmtwym
         AWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594253; x=1786199053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=;
        b=Lg9h10gCS0G37CRGQ+dVVjxG4ETdaMmNnlb1vs6j3a6MNeSVxjIFkm8Ssg+vnU8y6C
         iDvr8VvHX3s2GQm/L2NWWsdhD82JaR0i6wZdEVd2NIGNGHEGXvTLbo2Dp6qG54U4xTa7
         v7HxdQ27/1HqVC8SEr1ei7fJgxyksRCm0vywtvZF/zLprV1xMvRJ11FaKv01DFn94T/P
         D7EwnFetkGLjcXtkuvMJMyksW8jtuBIRudbIRPtmAL/4lkBBJok7sJGZ9nREl1g69pWC
         UVbc4KfFO1DqjQapStG326cLUmsvmQqaRLcwXON+l4H22s5hHutKWZEf4qQ1fNvVMK02
         V/0g==
X-Forwarded-Encrypted: i=1; AHgh+RotM3VC5bnRkITeRpA7pLAvZyoD8RX6mDOSJ1LChddg2XP0o5HZ5XoQM9x3C2J3xCOIjsyskafmNggK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7wNFElWarAw/TOyysqCnMBPVBQH9Xgn+ZIyFUtAq0XYsgziKS
	3r2YnvttHmZQbjK4nASzdoBBT57JvgbwTYqAtVlOQyi2CLtgwudJ8/1P
X-Gm-Gg: AR+sD117u1S2PfO/SzPh9XrHeM+/pyxpTlSJwMuhtKYBM+pE3bexNn6dI+6P71FtGTI
	dCNHGKvNNAVefpEBt17IgI/aIuVmr4BuLNL4jCVrqQaS7GRxJaFkVYAxLEpebrcK3jTniqwcd8L
	slBEv+vKz6CUSX/bl1vVQUPdt+o/NGLfCi8tIDNVcz1aSm8DlLL9+El5gsfSwluEOeNrCFjngJa
	WBCUJunJHBdqVoPHY9/eK4DPK0wD7QqeWyXA9jSeLH2fSqcoyiJFyZhlgKSTklg8cu08rUoHP35
	XIwpN1q72nB5+p+xI10NbL0loJiSxyRZ0re1WkzFt8hQPSwRnkU6s5HbtR24ljUbY66IaVVlTZ1
	UIdGCKp+AKbt287Q7xYjId0YqNRLaAw8MZ+hAQgS/C4GBz/UhsXtXx+P+uRza7vNGUGkDJqPczE
	nCNyFmCWmlja0Z/UOu4wGiIs2D/YzFro4sUUmqo4lT+kkp46T6Lc+4rB0=
X-Received: by 2002:a17:902:da89:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2d052297a46mr38452135ad.29.1785594253494;
        Sat, 01 Aug 2026 07:24:13 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:24:13 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 09/10] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Sat,  1 Aug 2026 22:22:33 +0800
Message-ID: <20260801142244.679437-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ariaboard Photonicat has a Motorcomm YT8521SC Gigabit Ethernet PHY
connected to GMAC0 via XPCS SGMII.  Enable the necessary nodes to make
this port functional.

Enable combphy2 with rockchip,sgmii-mac-sel = <0> to route the SGMII
interface to GMAC0.  Enable the xpcs node and its port 0 sub-node,
referencing combphy2 as the SerDes PHY.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.  Also add LED configuration for the
existing RGMII PHY on mdio1 for consistency.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 77 ++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..91c17b624fd17 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -242,6 +243,7 @@ &combphy1 {
 
 &combphy2 {
 	status = "okay";
+	rockchip,sgmii-mac-sel = <0>;
 };
 
 &cpu0 {
@@ -260,9 +262,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&xpcs_gmac0_clk>;
+	pcs-handle = <&xpcs_mii0>;
+	managed = "in-band-status";
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -341,6 +352,39 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-id0000.011a";
+		reg = <0x3>;
+		max-speed = <1000>;
+		eee-broken-10gt;
+		eee-broken-10gkx4;
+		eee-broken-10gkr;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy: ethernet-phy@3 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -350,6 +394,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
@@ -586,3 +649,13 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	status = "okay";
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	phy-names = "serdes";
+};
+
+&xpcs_mii0 {
+	status = "okay";
+};
-- 
2.47.3

