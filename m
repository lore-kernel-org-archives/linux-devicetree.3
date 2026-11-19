Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101687;
	b=uCkix2V4uCI8kN0sSE0KZsAosweRbXUrvZfRedkbIN+XYHoLxqmqoPns2JnzMYr7MbG6
	 NFPzGssNc/Mv3pgyWIninb7aC0MpvCkaTymPLFILxrc+8lPm4MZ8hn0ad72xND+hmqGRj
	 KeWSYWlXGDszLw63IkWw2stMu8ZYArhvcRMKoXGzl4opBewSsKn8pdg2GCvwgrVFRJOdo
	 LIt54OMaZIMKohXz+DuaV03lc0qHP5Y+OZGEwfS5nR0AxSQ5qIVSTRaoAPOwHBi3kIuZL
	 bAGNdkmDylUjaMbZeGoXpHm9wDvVvXgaDtKeJeONnnqmdeQ5szKI40KJR6XTIyAY3wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101687;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5lBK+iqQKPtBE20CfUAPx1/AOEJEHONgAmKJljqD2FQ=;
	b=wOBVbXrJQlLijqAUdn5w5ImSnPju5e5sDt3pZGtiBYlSz63LJJSQwU+9RhwNlQgaQqMT
	 PHokfoKnLZvFm9dc5/eoEcpkBJmuOZ/YdB0PZyeFEg46ZxJjlYT5fNEBZu9lCAKF8zq9x
	 JxqGV415mrmQTupx0reMksTVPaL5LfKjtZM80yWpcR/Xu1mXEgAOqm5EJvvTiqcXfmrYI
	 JdX2whY8bqAiWX/eqz7jgq1U7SFHl5CLNIWGd5BeszHBhjdAltzAtlDF8fnCtsQPUf67p
	 hirJfqAE7hEzXppit59+xv7vHs7xxKN9Z2PhorHxSjGalO0I3UqAo5WaDJuhonzYXEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=O026t4Tf;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b="WXMGNiK/";
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45E660A2626
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45E660A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=O026t4Tf;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=WXMGNiK/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101686;
 bh=5lBK+iqQKPtBE20CfUAPx1/AOEJEHONgAmKJljqD2FQ=;
 b=O026t4TfU2y6eyx7cdrbA98PpTbQ2qMpqM9kqIuuqoYaxZRhF5ZyVssyvwXY1ti8d9debaYCx
 E69HLDqdY/8c/Em10iQJUeRHp7SLx3cVRy2LRBjwmPY368wwgxcZc0cHgEt8Xd2YV+XNBEvy/tf
 Fx80HtU8UaSg3H4NJqBNiFUX7SeZxJH8OOKM5TG3JWCR5XyfPHe1LUEylQgvefNh/8dIBBHX0o3
 Ccb5DhDL8Y1E6oYmXPaMdhHtq2gZ7A7unq12rCQ7cZsI9eUi6b5/XiCyhDVXVmIWgZe0OWI/neg
 2IFG45hpunyp/Uq6L6H5joMVMdPGUCMHOEYXN2+ntLLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101686;
 bh=5lBK+iqQKPtBE20CfUAPx1/AOEJEHONgAmKJljqD2FQ=;
 b=WXMGNiK/j9uB4nQwUw/LzU44MPeb5ceTKD0J1KkUw0iZM5LjAsHu9yC2K9XMITx10jTdsU3TA
 2fgZ06bPRTuE1IBhLB+M0nvrWpUb1k++GPOw9vD4kfD1o9On+eipv1xsYZdiclIWkYrpcrmE3K+
 hu/s1FhACdVuauJlu6vicDw=
CFBL-Feedback-ID: 6aff13f383f3cb488062bb08:c2f9e41094e81573b0961526b419c108
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13f383f3cb488062bb08
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.33
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
Subject: [PATCH 8/8] ARM: dts: rockchip: Add Luckfox Lyra Zero W board
Date: Thu, 19 Nov 2026 15:20:51 +0000
Message-ID: <20261119152055.556266-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
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

