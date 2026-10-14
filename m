Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196D0560AA4
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995687; cv=none; b=V+XJYMApL3gLIWmH9Tf5YB1IYu7M4VpUl4d4eTpnqq9eKJnqfYrcLuUTF3pgOckWylJl9Jiv5/0R6ViVq3qBDoPFQ52jXTKeoxa7TwCTc9ZzXyXIrs6w3hABvmpLyzHRzfhRbEVT9rFAfLRvwvvdzaDWvXZMmWsD6lK2QVnPbjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995687; c=relaxed/simple;
	bh=KcLH0FxVAapkgL1Wnemj3DDftG9cNXCHkk3pyZsGg28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XapIXMnDJV30yXch5EW226eGV0GTOP6b57icrk0kDuCN193gBfIMw8jdTu9SpIifnkNpvOqBhUrYlwnTOc3jpSgztmX7Z3dxQ8xb+1BDYePOgij7P2Smu4R8GGbTNGooqzhxlnvThJhPw6kNBM/xvMJfT1Fnez0jtvXPxmTMt4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7Ay201I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7Ay201I"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB7DAC32781;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995686;
	bh=KcLH0FxVAapkgL1Wnemj3DDftG9cNXCHkk3pyZsGg28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g7Ay201IC4os8fAnpHozDHFRJqTDFZuIvj16PSbw+OJa7r8AFOq3N2oUt3fnTS4AG
	 gaTQOuVUVJfiXPXUmHFcikMDJOCfgTI3yHFaRLj3seHw8SuCAGTNFm5QBEDj4yFVgB
	 75B3CdVr9DQy/e+k48vx69lPSckrlI2EnvRWkE4DDQCKRGyDPIVr4GqHDJ9Wx7f5P1
	 DLbcnf2NxQLroV5HBcKQZuQ1Mt//j0dIRQfVNo5XU6/3Mc1SfL2wNB64U68dWqENGu
	 D0cgVCeUH+Z2Ituf0+oZfmgiUtYs84J/149eKRjaML9IRUC9i/UI/MCTUzDOt45/m6
	 uFpCKKOScd19A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84C6CC6B2D;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:07 +0200
Subject: [PATCH 7/9] arm64: dts: rockchip: rk3588s-nanopi: rename gmac1
 reset pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-7-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1121;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=WtATwbQABKVY4tLFdbXIynQTMB75uVl3gBt3XPQsrKw=;
 b=y5mvhJ2yoRh9AD4k14R+VjYXo4zI6vfesUROGPLsbB5nNirUtfticeo6qcZRum1dT8Lbf9Cps
 X1qZH/93LJRCbvzaavWw3KVxuumgRToZ1bZH5cCVH+lRv2lxvB3h+6I
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

gmac1_rstn matches the signal name in the schematics, which simplifies
cross-referencing.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 56264ff3b409..2789c3d9bcc4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -274,7 +274,7 @@ rgmii_phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&rtl8211f_rst>;
+		pinctrl-0 = <&gmac1_rstn>;
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
@@ -346,7 +346,7 @@ usb_host_pwren: usb-host-pwren { /* usb20_host_pwren on M6 */
 	};
 
 	rtl8211f {
-		rtl8211f_rst: rtl8211f-rst {
+		gmac1_rstn: gmac1-rstn {
 			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.56.0


