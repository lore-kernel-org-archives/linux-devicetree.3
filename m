Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570140;
	b=wcuPkTfhC0SYJOfRQTdmKYD20MkH0Q1uExwyQzhavKIRuQlXiWqxxj9z3eE1gw2FTSe5
	 Xyu0JiAdxVX9NLRZj0Q5mSwB4QrtmrUago045dVGop0L/B5rK371vKVHeFD80vhBi74MF
	 +C2U7hWJxaQWDEib4SDpH2dYsfMmI7PFSRsOUKQyWwZAI/4+HjPKaQXLCVA7pulVRZYNd
	 BOsXQAvAfeUjyU+Vg90wRLXgMHKqeW7CwwagzFP6dWuTCb0De8+PM4CEmZBGlIyybCUvO
	 RVSDIk0vy9jnl++ikfAgwtAk/OdEYcYLbgVXJYYeLyQo0/9h2FAKGFpNhyhOnF86Ojg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570140;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FExjZH4MzZ0dT06qQAYbP4cG2o7lekDCchPx/UsfTjY=;
	b=eciJC/I2/oKNvv9haZtuS8AXWF2LoAwZ/B9lPgNBivYDxXEHl+CjTw6HI9UTm0oaL5Mt
	 f/6tCTeO9V6AnbaosXa/ydjOLF+pTBaW22SOKHm4g4bTzzYliISOFdCTXHfOipuk6rWu5
	 Ttu6mbaT3+JV7cPVsJmw4FzoR6h/Wjk3i98jlQZB5X6EN/sjd83Wy2Ntpwa1XxqjoRxjE
	 4aMF2jasaM+RfbyzJbV7GIMl1QcEqD1ekoYKffhQE0wr1bdJbomSixi3A5rdMeaivwjHX
	 gX9k8dXkAy2gJjM0/W72k9F0UOGqRdJiASg2ZUF1wBoYzvKlo9C+C7Ke0Bc/SGR76Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A261psfU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1337C606A33A
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A261psfU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570139;
	b=LTBFbou1i0lMjbnd0M15VCAILTBpvaI06sPJ4Vunj/LawVyUibTgXoovpId7IVWRnNfO
	 TpNlLhCGXE6WJqJZctjIunAxtt97MCyPInGLKmT7FRPG/Oo72x5Nv5oRpaFaUj5WOWMSC
	 vAVyS6EbRIGlJ4WKrFGb3ZyNNOzkJqBKRRIB1VNqhhkcyIgOuvHq2aqywNifzDgKZb4bt
	 yOseCNIPc4aJ4i90wD2w9rQYqVbN0cTzEhSrC+6QDtbVoQe4CMjDjQ6aQRygeHCOE2DbP
	 0GIL+wQW5kupn+wNAwjm9Z2z7EaRixjuq3zarXL+frH6OVlo6wJETU7W65gFJOhkx4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570139;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FExjZH4MzZ0dT06qQAYbP4cG2o7lekDCchPx/UsfTjY=;
	b=V1TcrQAEAtup2SQwbIVTtBRaUr6QElHqMN8NivIqbTNNx4MgHop0Bzh+jZRYCW7Vjitz
	 r1OtxX9+RVytR/wLeiCYAIREd9//8umKxdS8TwsNUtxCEY8Wl2jkIGXpGNEm7PxpcF9kE
	 xWAIU7s8iFh/97xFA8RSjT/0RW31v7kfUDWHXTZgODDfs21gZuA8bk+7ERGrmNU/c0z7q
	 Uf2JTx5HMnjQ/Q4sEmMdl/Ug7jUxsv2ET5ke3tRFWMF6cSZy8Jkz8ZsMfHuu62VTAUO0R
	 6B+NlxN5R2IzyZM3YddywtEl3lmaz+49vZ6a5CY/xnZHF5UOIwSspD1DHGLr2Z4E+yw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D0D51F00A1E;
	Sun,  1 Nov 2026 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570139;
	bh=FExjZH4MzZ0dT06qQAYbP4cG2o7lekDCchPx/UsfTjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=A261psfUTBmcpxCD3ILpZ0D7F0uj6r5l0nBqBnf82/ay3DyEhMIiFoB7+R202rtX3
	 IbWY7M9ZRfwJ2BMAQsaeLNBBsrUF+Q1RhJ23N9Y6T6Ql/w8s6zAavCMx1VXmBsp7G+
	 NznKiD1fdCGK/oagdZ9QQNMzLOwlILmm8ih8nUn7ZNVc3fkTClHxlajG0XWTuZTonm
	 MX6pqxubBsDVcPugKKgx7zFipeGBNQ/r8T7WMpiHExm0klbE8gy1HqvqCMZ8fxE0dP
	 HBPEtOiHLHYO6l7VmfYw3pvrMbzdvf4JiS7Ee2aHRUnuJuemq5sCAYRPvIpt08AXp7
	 LmBzzweqOrb8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3D216462A8;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:25 +0100
Subject: [PATCH v2 7/9] arm64: dts: rockchip: rk3588s-nanopi: rename gmac1
 reset pin
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6-improvements-v2-7-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1477;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=XJH4M711Td8BhQhjF4m0D7hVTEwMJUSDdTRD8WtZ3+Y=;
 b=Sey30AQRYXFdFtXqImpdd5lHIRZ6w4SHLwd+kKzvWsE/wulTI2iWbIhBWP2/hxmmhsIdT23JL
 LvEGR41bTN2AhEh9ZXVLlyAPkg0fuhMgzLJgmoNehxO7n0TZA66m/rU
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

gmac1_rstn matches the signal name in the schematics, which simplifies
cross-referencing.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 56264ff3b409d..4edf3728e8d17 100644
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
@@ -307,6 +307,12 @@ &pd_npu {
 };
 
 &pinctrl {
+	gmac {
+		gmac1_rstn: gmac1-rstn {
+			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hdmi {
 		hdmi0_tx_on_h: hdmi0-tx-on-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -344,12 +350,6 @@ usb_host_pwren: usb-host-pwren { /* usb20_host_pwren on M6 */
 			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
-
-	rtl8211f {
-		rtl8211f_rst: rtl8211f-rst {
-			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
 };
 
 &rknn_core_0 {

-- 
2.56.0


