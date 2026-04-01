Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355C633261F
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049388; cv=none; b=rH9G7wC/28oRmE2yG/RooxYvIXeDtYat+v+JjzLbwW3K+ZfVEmfEoofRZ61Esv+vflAYFc8/S+q3D3qy3n1eJKvrQzg6UOOFSlf2xb4E/KoLGKymGM0QPI6zUcjhs9QvhR4kuwC5m7/MwrkOqwBB6SU2+BHWb6Ea7TtzEuSHAnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049388; c=relaxed/simple;
	bh=CGNQRMlk34XHqzvGHCMuqAN6f7M5pIDq3xpMr85kpk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VS+o9y8cEMI5fSlrdH234LX2HbcXYz3Ttnwu/+SwoCd527VwBn5G6B9xUl76RtdXFK6USLuiMoJyhalrU0FPE6wifA7G91CzHjvUFmovYxwlyPzwxfyV+EZElFNL0fIzTvNgqiV6pEDY+QY9A2ve8Ux1qMgHQwMD0/g6nKH0JXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=dhJO1h+W; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="dhJO1h+W"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1775049384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9ydFqbwdCGJ7LRZTrnA9AUz17TQxDwNxo5bRSg0N6o=;
	b=dhJO1h+Ww8MQKzUtbpNaLyCXn73u3UbmH5Tl74THeoTvoSR0HGHXD3AnR3AVAeS8jq1RXl
	Obgk9v2DuAQOoI88zttsNkO5HNt/M4Qta4fBOWA4ik2lS2sCZBCYlFIY3HYNnHqbvNN0r8
	Slh8ksHgkVJhkK1gQGRhtkRtglLvyQVayXovep6Ge5VoOHb67WfG9WdF9Qiqs2+Od7i4lY
	D6wuEyBjxg7QdGX9JwB9SFW4P/XKjLosWz18iJ6Y1FUMsQrnZtVXueppuovRXdSfi+G2s2
	BJrzdqMNfHybzgeRnXwBojP/hsyO1SOwYSEI+2W673rdvufpQy8cdAfk4TDewA==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: rockchip: Fix gmac0 reset pin for NanoPi R5S
Date: Wed,  1 Apr 2026 15:11:38 +0200
Message-ID: <20260401131551.734456-2-diederik@cknow-tech.com>
In-Reply-To: <20260401131551.734456-1-diederik@cknow-tech.com>
References: <20260401131551.734456-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

According to the NanoPi R5S 2204 schematic on page 6, GPIO0_C4 is for
GMAC0_INT/PMEB_GPIO0_C4, while GPIO0_C5 is for GMAC0_RSTn_GPIO0_C5.
While the 'reset-gpios' property was set correctly, the corresponding
pinctrl didn't match that.

Next to fixing the pinctrl definition, also change the node name and
phandle to match what is used in the schematic.

Fixes: c6629b9a6738 ("arm64: dts: rockchip: Add FriendlyElec Nanopi R5S")
Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
index 718d1a2da8e5..90ce6f0e1dcf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
@@ -98,7 +98,7 @@ &mdio0 {
 	rgmii_phy0: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		pinctrl-0 = <&eth_phy0_reset_pin>;
+		pinctrl-0 = <&gmac0_rstn_gpio0_c5_pin>;
 		pinctrl-names = "default";
 	};
 };
@@ -132,8 +132,8 @@ &pcie3x2 {
 
 &pinctrl {
 	gmac0 {
-		eth_phy0_reset_pin: eth-phy0-reset-pin {
-			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_up>;
+		gmac0_rstn_gpio0_c5_pin: gmac0-rstn-gpio0-c5-pin {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
-- 
2.53.0

