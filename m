Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1960355D89D
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995687; cv=none; b=l6LYRosU3W+1byCY+zmTpyBo/hnTbygTC8rkZtekzepZPNrodkAk0uWbyAUXUvkwcNgviZ3L6zF56hB+1nhgSoBOYT23vxs+v1l6FHGhV8unQTZwuKkute43yohltqk2JeAkgWNQWSqlLOhtB7eIOHcVkSs1jBXMYY4HfKBOWt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995687; c=relaxed/simple;
	bh=DQlqMZ8mkMUn9N8GXl8KrKZD30XKvJbahTg3l+XwR6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/ODU/OMsffKsyj5+iX2hd6vkVUCqEgzsbIC0OEFjq0HMzjR5YiROfOAplkIwzWDX3rRfXCiWMPbC3kFmwsSO0NFW4Jo86z9DMihtp6Y+UjRUsHZszeuaU2ffn2XUkFNBomV3Eoe3mt49cw/7ZB8RqYznJ58CxS/OR03ZI0GyXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdlqOOIK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdlqOOIK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9B8FC4AF11;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995686;
	bh=DQlqMZ8mkMUn9N8GXl8KrKZD30XKvJbahTg3l+XwR6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jdlqOOIKxUz8nWWD4gpzAxhsxiwkZvwBNPjVcO+v8ZUBDVKl8h2gTycEc2woCijzz
	 rlPKz7iNt0eJ2KZkZJAENH2dO6sF3TyCDYNKGRcsorcZeTtT1fb8idx4b0XjZGG2I1
	 ElkO+N4VB07YCp/cvktULvp5rZU192n5ayoSNFlicFWirQRYCMi2NfyJjSwbgqOMnj
	 wGSIEMZ/0cdO/79O83KMslUAkFJqGpHgMATJJ9r8z7SYlFsCmUnTOW8ELdaROUJCHf
	 /sSvXOc7TTA40E2nFwmos5xY8MHUX3sUc/YoLeqsdENnku19K82ClxqWDsghysamzr
	 rh9i8HBHT/9rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7139CC6B2E;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:06 +0200
Subject: [PATCH 6/9] arm64: dts: rockchip: rk3588s-nanopi: rename usb host
 power pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-6-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1217;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=69W1lTAzZdFrwbRG3RydcrBa/M/DJ1hW57t5Lc/1y5A=;
 b=w57+GkJsIHqACLRjfvRURkDV9sghuLwE/rhvN7ApWzAK69xtm/pBI79RuU2ftW/2qL9ZdLu1V
 7X6SWMF54IHBgu5VLcz4EIvIwGS8hBO8V4MSMgC+6JLrn0jc9mleIO2
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

usb_host_pwren matches the signal name in the schematics, which
simplifies cross-referencing. In M6/M6V2 this pin was renamed to
usb20_host_pwren.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 1d37862edb5b..56264ff3b409 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -79,7 +79,7 @@ vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		enable-active-high;
 		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_host20_en>;
+		pinctrl-0 = <&usb_host_pwren>;
 		regulator-name = "vcc5v0_host_20";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -340,7 +340,7 @@ sdmmc_pwren: sdmmc-pwren {
 	};
 
 	usb {
-		vcc5v0_host20_en: vcc5v0-host20-en {
+		usb_host_pwren: usb-host-pwren { /* usb20_host_pwren on M6 */
 			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.56.0


