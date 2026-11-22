Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327300;
	b=vwXMtrHiNwrr40yeSjQyS5xPVYtEHdYmCJg2NmAbeDWG987ezV5QPslgU/hUS/wVxiJX
	 lyqHTBE/ASNk+9gFpmPIT/RrCiGOlBQDa+5meqH89ygGouBs1WvtzLSWzZm7zrEXWei4Z
	 K+1Ya5JJWGc6CT+ljX3RUXRKVwK4YkMNt/EMQYG4AUYWSXkZCT+Ph4WgDLV6jFtE8laXu
	 AKEt2wwUgNxHtV/zZECkO8NbtylU7Hj4HMv3QxmlxNIAxL/8J+le3yphRjyEPY6jAysLm
	 ZXKhAeEpbrntUaZncHqe0LMM0Cs5yzYyj6yD4K5OuIbzcHMPlms4Dpj8Zm7iXXx73qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327300;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZPZTcZ28iypWR3zLEK6BsXPi/eB2P8Ay98qQME7HgBo=;
	b=gXGYiUNrjI9pJ5C+a0/aL5iaWI8KudViOClICmxdkNaNLowcBsdjqLQOOLVKpQfBr9mA
	 pY67mMvZaAW3+FKVpTdmaYnxdgI5waMlgsoqu1qTGdVwUx9ZA0i64PME9jr86vpz2mVoI
	 /fCOLgGgn4hGOqA68Uus7Rs87EiBoVUsUjP6e67vJ1/xHUCeYQwwHw66yKSwVUEr7Fl6g
	 JW5gwtk0nNeyWcOWZBZ8R638EMZWmpt04W4Lw8TiDPUD8fHm68I/ZEj/LVjBUx1zYWvbn
	 Qy6X94YwXXHK5zfxnSEvoK+3U9lw8NzCGLggJPT4wM1n134hWzOVnUno5b9k5KVs59g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=pEh7LIp9;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=QMGfry2g;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE4660A260D
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE4660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=pEh7LIp9;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=QMGfry2g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327299;
 bh=ZPZTcZ28iypWR3zLEK6BsXPi/eB2P8Ay98qQME7HgBo=;
 b=pEh7LIp9FZjl0PsZowan121u4RA+0A7edpOA7YcGPFC1j5Zl7VDDGjMxMm8krNrQX+qET8GU4
 EaiC0q4vR5mTiTJhM1jhVT/CYpD9kKIAryGLs0fAMzsI+aoyFdAUbkjF2QTrk++7GwF+rc46PZr
 /OWPPiIMzx/9eC2T0n/89GbKaRvvGqGpy8Z1JIF9x5a3s7H81XmCWl2/bsku8w8X5Z+Ktt4JPM9
 jG224r4Eti25bDlAWuLAWFao1C80e9a327g8xMaB8mTusmX1GoKKMiZ20zEvkjn2qCGVdvr4hp0
 mBZaRd5bRPvYYQ0swxUglBCWChMq5CAEsVj0q9+EcXKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327299;
 bh=ZPZTcZ28iypWR3zLEK6BsXPi/eB2P8Ay98qQME7HgBo=;
 b=QMGfry2gkdVsmXutcnaQZnEPxd5/2LqXgGG+pZsxc0yLzUT7V/NaNlEO2euo+qEku/kyr2uOb
 2QARmrDsxuCfTZn2EKtXyTc5IllLIpiqSX0XPq70AIsyfi/kNqH9DtH3xyJPCmgWTjOlvHOFdI+
 ojb+/dww/tUA5CQz8z/aQpI=
CFBL-Feedback-ID: 6b028540cff95ecda8c093f5:d39f546e2953e6c3bd51a1fc1a8b7a3e
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b028540cff95ecda8c093f5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 8/8] ARM: dts: rockchip: Add Luckfox Lyra Zero W board
Date: Sun, 22 Nov 2026 06:01:11 +0000
Message-ID: <20261122060114.773624-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060114.773624-1-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
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

Luckfox Lyra Zero W is a compact wireless development board powered by
the Rockchip RK3506B SoC. It includes 512 MB of DDR3 memory, 256 MB of
SPI NAND flash, 2.4 GHz Wi-Fi 6, Bluetooth 5.2, and BLE connectivity.
MIPI DSI, USB OTG, USB Host, and RM_IO interfaces are available for
peripheral expansion.

Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra-Zero-W
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change

As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 arch/arm/boot/dts/rockchip/Makefile           |  3 ++-
 .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  | 23 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index 9a699bb8fc5a..faebeb20f467 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -48,4 +48,5 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-vyasa.dtb \
 	rk3506-luckfox-lyra-plus.dtb \
 	rk3506-luckfox-lyra.dtb \
-	rk3506b-luckfox-lyra-ultra.dtb
+	rk3506b-luckfox-lyra-ultra.dtb \
+	rk3506b-luckfox-lyra-zero-w.dtb
diff --git a/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
new file mode 100644
index 000000000000..f2fa513e8bff
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+#include "rk3506b-luckfox-lyra.dtsi"
+
+/ {
+	model = "Luckfox Lyra Zero W";
+	compatible = "luckfox,lyra-zero-w", "rockchip,rk3506";
+};
+
+&fspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		bootph-pre-ram;
+		bootph-some-ram;
+		spi-max-frequency = <80000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
-- 
2.56.1

