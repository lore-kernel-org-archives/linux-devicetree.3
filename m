Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0EF3D0914;
	Fri, 17 Apr 2026 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417936; cv=none; b=gEhhfx8dJ0sCFDuymNnFXKXn3fGlDweo4a6SAdwJbrpngmUQT9tRe9sdR3nc+5DW1gYIN36cKlWads7v2pjWyA8y/+EJAOX3KZ0cC6DAVXB5oo23U0hpLpPsTVTk73JlRvP/gC/xPl2FeUNrBMso/KgeuYEA/tbKxXLYqdGHXm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417936; c=relaxed/simple;
	bh=EZy0iRhW34YjUTSaavNlkSZjuxVOhJZt7v3evV/vx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JvzbpWy2S/Zb7pf3iKmB2zhOlTD+lyDBG051p5OnMd0tEgWBy+Qk2PbxkndT5P6POBks1fkJvuIqpSjWkd0rINOYhgzSaKSg18mL0NQ1xr1FUxUG+rnhG8D11Xp1OJ8OqYMiELu59uI5KMZZ7nq17akaHuZZP4myC1CPr8Icg98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ESGbskLv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ESGbskLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417933;
	bh=EZy0iRhW34YjUTSaavNlkSZjuxVOhJZt7v3evV/vx0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ESGbskLvBEHqBeEqbRvHjjQK0OF5s6+2RFN2ayhjJrvMg7RGWLiFTMtDqBg7zw+Xo
	 OWIAJJfWqyNA8YGR7QXGGbPogpR8gIZ4LjEKVo56O7PKeepxsariPdzeB1Gy02vflZ
	 JR/9RilwrD2ZrF3x54mg9qOqtHYcVGrtJVXBYb3c72ESuyJs+V+cVxQPTOne/uL9rT
	 7QzREys1MBmBhJAjOAw9QpVtzYmG3Ul5KtBFM1Llh/VZLP3GRalN/bUdfWa/lLCwGN
	 b1UGGkID9mu8tCWEi60/igzrZQg6e93+aMvolqKuu+7Vd1TZI9O6geGTpOZXR7L8pJ
	 njDhskrlqJudQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3479117E1340;
	Fri, 17 Apr 2026 11:25:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:05 +0300
Subject: [PATCH 31/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-indiedroid-nova
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-31-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B6 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index 174d299cc6bb..9a98574ecf7d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -278,8 +278,10 @@ &gpu {
 
 &hdmi0 {
 	pinctrl-0 = <&hdmim0_tx0_scl>, <&hdmim0_tx0_sda>,
-		    <&hdmim0_tx0_hpd>, <&hdmim0_tx0_cec>;
+		    <&hdmim0_tx0_hpd>, <&hdmim0_tx0_cec>,
+		    <&hdmi0_frl_en>;
 	pinctrl-names = "default";
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -517,6 +519,12 @@ bt_wake_host: bt-wake-host {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 
 		hym8563_int: hym8563-int {

-- 
2.53.0

