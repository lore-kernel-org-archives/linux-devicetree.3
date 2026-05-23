Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BA12E6CCD
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779531564; cv=none; b=bJIGnedSXO866XT3JAj5hOE88kK5GqrqTUDvTViEEW3jvFJFF3TVOsxMjM19TRdqrWU0guOsritNL/e00CP5UBxcR5vBmDflCyj+b21UeDeBKZu2QOQRVAIUh3f5A/E1UnK3YL5hy9psz3YNvo6UjMaCYTgXe5xSIWaGRZW65yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779531564; c=relaxed/simple;
	bh=E5trW6IlGiz51UkrLqUQkt2ug4VkMqXrFn0uMVDofcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VtxO5vbH0MrwNBKkp3JPNJFxXeWahsvDhtQTFfu5+av367MS87VyfrbK/XJXxk/5bM1S8CJI9v9IbnObQ7ypvMBib6Lwp158uGSgLPTYfJ4ZELDxP7x/OoDbVhaQ7NINl6rgspugYgKdiw/sCcn4GBBQYzGN5pV7QQVnueXE58Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=fiVVcg0y; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="fiVVcg0y"
Received: (wp-smtpd smtp.wp.pl 42262 invoked from network); 23 May 2026 12:19:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1779531553; bh=081I3uGh9xMy+jangEiaAfSrrsCOcyEM7Q7SYywZ4YI=;
          h=From:To:Cc:Subject;
          b=fiVVcg0yphzYqnPILR2CLP8PxPbR9pYBXBODa6XY0EZ07IvYmSoChVuXgwuw1dHZ7
           TGupX97dbcs2Wzy95dcFgxGI4kC9QsUKK+zcF9Zie5sOkoHh0MwsApMiwgTLMSpPqb
           yjPIDqiD3dZMPam5K05HYU2KU9XkJmp8g+YLG437Mik9nmOXi/s25ejfSaJnVr0vec
           ywkFwm0+XHEwiZKTP5JpZ7NYChvbGz5pfaHvCTkeM38ZyyU15RCo6M7Hi48b+5S9KV
           9rdR6FnUMYFL9WGaXLuHUiKEVzmf1YGBYTUW2w9XERLx58kysMG1qPqEozSVfkad1O
           gof1r+6OxdkuA==
Received: from 83.24.127.64.ipv4.supernova.orange.pl (HELO abajkowski.lan) (olek2@wp.pl@[83.24.127.64])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <robh@kernel.org>; 23 May 2026 12:19:13 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH RESEND] arm64: dts: mediatek: add LED and key support on Xiaomi AX3000T
Date: Sat, 23 May 2026 12:18:55 +0200
Message-ID: <20260523101904.293215-1-olek2@wp.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 4ff0eba6bf8edec8983f8b295cbbf876
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [wVOE]                               

This patch adds support for keys and LEDs on the Xiaomi AX3000T.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
index a314c3e05e50..db399cb3ead7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only OR MIT
 
 /dts-v1/;
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 #include "mt7981b.dtsi"
 
@@ -12,4 +15,37 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x10000000>;
 		device_type = "memory";
 	};
+
+	keys {
+		compatible = "gpio-keys";
+
+		key-mesh {
+			label = "MESH";
+			gpios = <&pio 0 GPIO_ACTIVE_LOW>;
+			linux,code = <BTN_9>;
+			linux,input-type = <EV_SW>;
+		};
+
+		key-reset {
+			label = "RESET";
+			gpios = <&pio 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 9 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 10 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
-- 
2.53.0

