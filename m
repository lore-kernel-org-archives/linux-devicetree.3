Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24C03FCB2F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240148; cv=none; b=s5Oa0f95fA4v2ytMc+aPVO/7qCT1IaO1iI1MUjNRUKqSEO4N6QuSCfCBXv8rwFuk1OWyPnEDaJSUyDzlY9K6NXj0IL7uHqgk93WawL5ebXha4drvujRoENAgSGJJRi58VLQ+6MQZrObHYkNnIX4fUO8lZF1CujAUbjCZeFLk5OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240148; c=relaxed/simple;
	bh=0StYnzO+BlIiuZfxctwX7lmcEaDWryBiXL9T1hKk/fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgWANWPhmnRp0OLGfwnQKMXpB5FlXHgSGtrP1KTQSAjmMYiqRtO75Xjt+bBmezDL1YTdgs2moVyADhu4gnB+gE643FMUB+/woDV58ejktUNmJs+jJdZgSdicUigoE0TeTfAtCUfNZu8+SbH/HeLnD/jcnl13cLEnKPkLcFv1D8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQaxMHPK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQaxMHPK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81FF2C2BCFA;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=0StYnzO+BlIiuZfxctwX7lmcEaDWryBiXL9T1hKk/fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jQaxMHPKk2uiDrApWvLTxdWtBQ3Abw2DHYML/egf6JKzfJZQLOCUj9NfHHF/yPo6h
	 KIR9QJAINcs671RjcAGRwWcdMbmNUtcUOpYl+PfzCJe03RD2anCUhnbqgnzc1P+j1+
	 6ZtSt42D5fGuXKuNQs2hdRLlQ+d1UmQ4XyrN3b2dFQYeFmLgec0XZ9VtNT4Ii590ZX
	 MIL5exMZOJ2VHOHIG4A2/rdH0oM+fFnLZK6tp5PV1PilEBXAr1dZRM6oup+aVWn01n
	 pY03Og5N+s5K5Vy1gtNqs1tqzjlUBSDDTj2mqB5QbnPuQ5OMiMsrQ7oyH/zgPFMe6A
	 RVgb0Cc8SKJyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61089C54F4C;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:29 +0200
Subject: [PATCH v5 02/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix
 missing sdmmc cd pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-2-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=1141;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=kI3ZjJonY+6nqEWc8m+ryhZH4GnBusVZIougapTsu48=;
 b=mZTwnP0ApdptokhifkjpEi4DCtTRju3VOwM9fuEKZAOdHqvMaEwP4NoeeC6rrr+HY2Uv3eMTG
 rypRnfaoD5KDm9rT1eZASu7Ptyxlo6SZlEhUenE3AiMd+VhCmISNpXD
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The cd (card detect) pin is used, but not reserved through pinctrl.

Fixes: 95147bb42bc1 ("arm64: dts: rockchip: Fix the SD card detection on NanoPi R6C/R6S")
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 91b6eefd7abf..3ee6853b8752 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -421,6 +421,10 @@ rtc_int: rtc-int {
 	};
 
 	sdmmc {
+		sdmmc_det_pin: sdmmc-det-pin {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
 		sd_s0_pwr: sd-s0-pwr {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
@@ -496,6 +500,8 @@ &sdmmc {
 	no-mmc;
 	no-sdio;
 	sd-uhs-sdr104;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det_pin>;
 	vmmc-supply = <&vcc_3v3_sd_s0>;
 	vqmmc-supply = <&vccio_sd_s0>;
 	status = "okay";

-- 
2.55.0


