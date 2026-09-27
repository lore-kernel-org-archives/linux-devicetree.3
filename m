Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D508E547040
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 20:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790539714; cv=none; b=nro09Jhj9L9/6/DxqZBEQ5tJFn0SfHtxT3JzNxauSvqzH47PjMPFNDY5qJrDsqcYrwQi9GmCAUIHLrvTomcwC8TX0x5SvyZeywYmqUZijwZOQ+Yi3gVdHBeHkEaeRBegbsqN6Lkn3eLA0407NVxLxFWpmB+7Yh0dNFfWlRS6mRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790539714; c=relaxed/simple;
	bh=Lagu8Xk5DErxyxxxYxSPGQDCPQt0qhxDq+aml5JTvz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QWpUDiUDyH76A6zkyQx1ytW+SLrkMQOJLtzvifGL7eDOZwQ4U/r3ArtSAnaQdpFH7i49xsGgiJReDzLQOArqmq1kwMhB7iqVdBBtSoWeRjocsqrt0x5LHSJkLrtCCqgQK3u3IzIKDnOjNq84gpBkJL9iUADVfaZLA02BaRoE6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=DayQRYMx; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="DayQRYMx"
Received: (wp-smtpd smtp.wp.pl 34551 invoked from network); 27 Sep 2026 22:08:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1790539702; bh=TnQxYgpCNkWFsilYnSP0IcpmCqqzaPwYvLR7k4wkAvk=;
          h=From:To:Cc:Subject;
          b=DayQRYMxvGbmOy99dc+WfOpWTrknJd6y84OnpyqBtZlFno5LbL6N99/KQaCuH2Fk3
           BheIhW6B0uFWPo7fZR3HcssKxh+p+YlnGLLwrkVlrB9nrMWLEaQbXT4j6aEXAOsG54
           /uk+ESmW7WPO8J70kdUsms2eTKf0amuQI+QnYo+SwoW4ZsvIE6W15HwwQyLSjwaH4v
           n3TH74v9uD6qyMxrMGyQ+F6Vj1S+K8lFCiy8ywLqA4Whhgg2IcPPX/xe9cj1fs2b/H
           thhJuYNLGjihbkGmpe0b78SK1CgqOh/aDLVN3IqWUd83xRox0nIJp0IuwImawOxiI7
           1jJ9C1ai9FQQA==
Received: from abajkowski.lan (83.5.247.9.ipv4.supernova.orange.pl [83.5.247.9])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <robh@kernel.org>; 27 Sep 2026 22:08:22 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v2] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Sun, 27 Sep 2026 21:38:18 +0200
Message-ID: <20260927200820.795348-1-olek2@wp.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 6b11e7dc137ab51735648a9f2219e6a2
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000003 [UfB8]                               

This patch adds support for Ethernet LEDs. Keep the default LED settings.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
Changes iv v2:
- add defaullt-state property. Previously, the LEDs were dark by default.
---
 .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index 6e57ee19e799..c23315994799 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/sun4i-a10.h>
 
 / {
@@ -132,6 +133,27 @@ &external_mdio {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+				default-state = "keep";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+				default-state = "keep";
+			};
+		};
 	};
 };
 
-- 
2.53.0

