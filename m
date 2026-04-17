Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF4E3B47E3;
	Fri, 17 Apr 2026 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417914; cv=none; b=Mlr1iX2WV1+zix3s+9bgLd5mhO6i3I+75bhWh/5RrwpH5bW0+urtOmaJJ6Cxz3SMlaMq0NtqXgC8736Oo0v8DixGYRuIMQgX6VvBurCsbE6+eYHWiz70ugHWVt8gmj8h74J6h8aAkaJHKQBTIQFLyBl2Fgz9sLOvwLS4gXQ8nH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417914; c=relaxed/simple;
	bh=wBR7yIBJO3jQZ20D+6zxEL5IJwhbuHgLCVrs8vSD1yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QTcIkbkWZWes5DbI//F64YJnbqezhf/j2LkbXtxkBCFBauNU7Mo0gQb6/GsJKuwB9yDpCPx0DSd4gOWvAwz9hBI9Ay6bLbjuMAdUsLV3UfmBjGzhbSZoPh1FYZG+lw6yXKy41GrnzGybhDP08IGjmpoA6jtfEZleFEu+FRZmPVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YSfr6WaR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YSfr6WaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417911;
	bh=wBR7yIBJO3jQZ20D+6zxEL5IJwhbuHgLCVrs8vSD1yA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YSfr6WaRjitT3Ubb0Ch5Cx7Fu244nu79niTd+yT4NkTFrLiDM/E+cYRGTUi6vjPaw
	 d/0BuAsdX/BGAt4vsaDbiCSPaZ3EK6WOLTUN+k7d49BXHuQXH7WOzbQi7qXzct4a4W
	 9iWMshRaZSrwX1o0vhW5hbmA9/YVcCP118Cj6sulLeKDI5ih6tf9RFSVLUJq8+18+S
	 EYsJLKPnavQ5Tl+yd4IPfZesyOWWVcaVuaNXpO4zlxuwJGnYNNfP0lk5PKVZYXyNWT
	 APrZdZrsx9RZmbl43KB5FtlO0lpNVR8WltTu9Mcy0QTDaQ9xMbpE+1k4o1AZDQpGtb
	 qUc6eKWGucAMQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2174417E1380;
	Fri, 17 Apr 2026 11:25:11 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:38 +0300
Subject: [PATCH 04/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-evb2-v10
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-4-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_C6 line to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
index 98d5d00d63b5..91fca9b31f81 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
@@ -375,6 +375,8 @@ &gpu {
 };
 
 &hdmi {
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -832,6 +834,12 @@ image_pwren: image-pwren {
 		};
 	};
 
+	hdmi {
+		hdmi_frl_en: hdmi-frl-en {
+			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

