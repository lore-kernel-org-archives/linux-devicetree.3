Received: from mx0.gmx.wtf (mx0.gmx.wtf [203.137.112.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C615C14F;
	Sun, 19 Jul 2026 18:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.137.112.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784486960; cv=none; b=FOjv+xgmHmysxvYgOSdMO8JmDeaQjTcvMh7b5Fyuqcqjahv4Nj3ZSLGo8//hivy1Gicwx6GkOt+mlmu/v1Mq6+/qZmLXs/WoPKGeUu+ufytTdDoEu9Sp/QjAGZzME7UMSs+OXov3z7P1XlMHTq6mFR7LpV5KuQEI6eynnu+W2dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784486960; c=relaxed/simple;
	bh=CZ34Dq4h24k1BTVbY3+f0i5vXsK5au8ANUooagJDjfE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/5lEoVkZNnJ4dGsTKwwtiqqLlgWXyxFSpqyIB5h3TLKms+e++wrxIGNLokQQpE9ahxbNSPokCFXCYrN1iBnvUxhNfjFjRkxtw/gjivGgdWvhwW2ITLS48jrO+loc3HcuzDJzKaPtEAWocK4O2akPnq706j+3/o7mdOBt4NIwlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vicb.net; spf=pass smtp.mailfrom=vicb.net; dkim=pass (2048-bit key) header.d=vicb.net header.i=@vicb.net header.b=ptwJp/w3; arc=none smtp.client-ip=203.137.112.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vicb.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vicb.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vicb.net header.i=@vicb.net header.b="ptwJp/w3"
Date: Sun, 19 Jul 2026 20:49:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=vicb.net;
	s=f747d04263f05989; t=1784486957;
	bh=CZ34Dq4h24k1BTVbY3+f0i5vXsK5au8ANUooagJDjfE=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ptwJp/w3Fd4tu6FELIHC3Z36JqLnKI+uOeHZaCHp+XoYfcg9UxKfHXzgEGKVDgAPT
	 NwxWipCB9GXgjIldQRpHBrPC2COKFajtEdYsPjZddNqcl4FqK3bP7nbRjj8UKc/0rI
	 LQP/w4cjsAvsbUFbMBk74cQ0fJGpWuyWM2c/5OAQMFcvECTYIugK2fPryCnymLZKLy
	 MA9mFHqBev5lkdbxeIjJRN1RJUrPwRMcGD9lcPRB+xfRxxoxKl+zMBDk+QMOsYpchj
	 KkSo4lm2NevH6G5/dO/gWDx8gTV8yeHSco8p9gCj0WcwQKdHHnbU++dF0MGQHaV6Fs
	 UkwY36w3ogbNw==
From: Vic B <linux@vicb.net>
To: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Jensen Huang <jensenhuang@friendlyarm.com>
Subject: [PATCH v2] arm64: dts: rockchip: fix label of sys_led for nanopi-r4s
Message-ID: <al0cKhqvPbBO_5q8@vicb.net>
References: <alz112qGhm77liqi@vicb.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alz112qGhm77liqi@vicb.net>

This commit corrects the system LED configuration for the NanoPi R4S by
replacing the deprecated label property with color and function.

This changes the resulting label of mislabeled sys_led from red:power
to green:status, while the labels of the other two leds stay intact
(green:lan for lan_led and green:wan for wan_led).

Signed-off-by: Vic B <linux@vicb.net>
---
Changes in v2:

  - use color and function instead of deprecated label as suggested
    by Sashiko AI
---
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
index 4274d1b6e80a..4ad012a9bdc8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
@@ -14,6 +14,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "rk3399-nanopi4.dtsi"
 
 / {
@@ -25,19 +26,22 @@ gpio-leds {
 		/delete-node/ led-0;
 
 		lan_led: led-lan {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
 			gpios = <&gpio1 RK_PA1 GPIO_ACTIVE_HIGH>;
-			label = "green:lan";
 		};
 
 		sys_led: led-sys {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
-			label = "red:power";
 			default-state = "on";
 		};
 
 		wan_led: led-wan {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WAN;
 			gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
-			label = "green:wan";
 		};
 	};
 
-- 
2.47.3

