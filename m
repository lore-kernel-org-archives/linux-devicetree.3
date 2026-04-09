Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0B227A92E;
	Thu,  9 Apr 2026 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741176; cv=none; b=ZoyhL1g3iWmN0UCQNih4bO7VF0gaaynXgZgmLYWOi551Tb6pzDq8Ld59QUauIvQLggevlD5lqBU9+ukrFSH4wOTy5e0jyodLDiR3EUdAbwDsA6J89xegBwFyhHSVgFO09WxbeCq1Ey5N+YdtNfs+2/dkEkeOtkHztM1qK0vGwCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741176; c=relaxed/simple;
	bh=qiaR0tsu8ENIOIK4hpyGBWs5m4RYne4hlcbtao7TM2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ImYDS2rLyadjV9+4j/RmWcxuGEkbJmGSope+o1cbEme+GGjmdNN+GM5324DZhW3vnuv0I+ZHq7tPuIpjh155jfLOE+pixClXoajHDYrzg4SyoL9y1HIQR1fzTWjj7v3DFYt3EZTc5PBqlwBNJ05jeXrwJ8TP3DkNwL9XXl8utBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=FoAfbg0A; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="FoAfbg0A"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 9A4EF10086D;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775740684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=raj8KEj7nncAo56c1DXB93zAwOjYFuyy1P91EJAGKgQ=;
	b=FoAfbg0Ar/qN7/CNnYXpybCDJj45NkDPLWINkhoihBBZ+dA6MRP7rlhJOM77/eVjdXy+lJ
	Fnu+xE7q/yJphP8utODHFSMDJZtBn+He4iQw9j26j2FEMe5SsyX8D72oEj3G/3G80a2k35
	Imic6WbJPlRaNXrGFgYsdcE8k6YaFKk=
Received: from frank-u24.. (fttx-pool-217.61.155.21.bambit.de [217.61.155.21])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 6EC781226C0;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: [PATCH v1 2/3] arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
Date: Thu,  9 Apr 2026 15:17:50 +0200
Message-ID: <20260409131754.121737-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409131754.121737-1-linux@fw-web.de>
References: <20260409131754.121737-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

On the official case the red LED is named ERR, the blue LED is named ACT.​​​​​​​​​​​​​​​​
Reflect these labels in function and set them default off.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index 759f608d1081..7f770a76775a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -61,14 +61,16 @@ gpio-leds {
 
 		led_red: sys-led-red {
 			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_FAULT;
 			gpios = <&pca9555 15 GPIO_ACTIVE_HIGH>;
-			default-state = "on";
+			default-state = "off";
 		};
 
 		led_blue: sys-led-blue {
 			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_ACTIVITY;
 			gpios = <&pca9555 14 GPIO_ACTIVE_HIGH>;
-			default-state = "on";
+			default-state = "off";
 		};
 	};
 
-- 
2.43.0

