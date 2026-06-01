Received: from mail-m17210.xmail.ntesmail.com (mail-m17210.xmail.ntesmail.com [45.195.17.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85B7392C2C;
	Mon,  1 Jun 2026 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.17.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308636; cv=none; b=gnfgyEShWf8DLdpYS02ZDnlANTgMw3f4kFr7Oe1RhhDG3dGJsNDFLnbTfz723FflIAj5vgGDp1GaimsMopUugQX5u/Mdsmqm1q9HPvw4SDYs8AQrhp5AznjahE5oTrUCDrKoEvm+X/BDnTNRYbWdR/ph+Boz5ryZQRFJeeo/6pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308636; c=relaxed/simple;
	bh=9LlT1G34vvi4a6OcxIB/TwIZ+p3e9A/iFP+WWpdlxjk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cHa23NypA2W79qRv84tIsprTaOxe8sHzr9HPfFua/b9Rnnb8B+Ovlgmg1oLBmc6BdKLqO9RzbfbwPr9Po7SZngThjr0AuDtJfbF3GzwxURVkTj62brQKgvf9jBz+ul4am/5yKW9U0rYGi5IlBUJgwF+jxgOEt0deIMCtYQNXyHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.195.17.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [113.80.141.91])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40955f675;
	Mon, 1 Jun 2026 18:10:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: rockchip: enable button for Radxa E25
Date: Mon,  1 Jun 2026 18:10:00 +0800
Message-Id: <20260601101000.2076721-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e82a9a5a303a2kunmcf3995f0174ea3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTUwZVkNDQ0hOGE1NGR1NHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJKWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+

The Radxa E25 board has an ADC button. Enable it.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts b/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts
index 98cfa3abb809..a091c3a44747 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 
 /dts-v1/;
+#include <dt-bindings/input/input.h>
 #include "rk3568-radxa-cm3i.dtsi"
 
 / {
@@ -11,6 +12,19 @@ aliases {
 		mmc1 = &sdmmc0;
 	};
 
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+
+		button-recovery {
+			label = "Recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
 	pwm-leds {
 		compatible = "pwm-leds-multicolor";
 
-- 
2.34.1

