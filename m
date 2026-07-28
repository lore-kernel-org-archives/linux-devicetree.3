Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6D642F6E0
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240149; cv=none; b=rZaiganXhbUgL8Tqapor7jf6SSE54GsTo31mCjHrybo1XjXsysItUT2GCAIOgtLHChv7qlE4Z5ezbkmFbxPre7Kdn9+JIvRA26MsxBVKA+KE5aE7g55vyhxD2HwFWN64avCLQzE4C28qUAgUaaf83/3GMBa61AL4hGrTufJxm5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240149; c=relaxed/simple;
	bh=bjuAYcTAYsvD4EG8NTxGwBNM7nTpamPPGahbx2pLdsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLQAQIh5cLgQfYXHFUHnbQBzGqfji785L/zBKJXp7Y2T3OA0YautL9hHlsHTT8JSJz27DliO34bBrnLe9ZJ06PNFYkJLqMbI2bXC4Jos32vS9TymHaLVbuuPz2ZowEJSvM9BRv5Pme2nmDdoZ2TiH8xOzFhJlpisXl0viksPG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPsdNkWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPsdNkWI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C593EC32782;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=bjuAYcTAYsvD4EG8NTxGwBNM7nTpamPPGahbx2pLdsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VPsdNkWISFACgsaqVEqx3xv7g2V0n3RO+M6lFrA/ZQTqNsBuu3Vy0VyKSGCTrfgR/
	 A8edBIzf4zbX+jL04FU5dOYc2Bpz/Ak0EKRDfHlNQ7ADEJ6jKDPA1RcVw7VVSn6t4V
	 0J1AMPZi+IESHGoo8ixNOI3eGn9M5J1QENzZ0UMIxy1qUR1UNsoo7qjcMvFCfIJwsR
	 26GiosiJgZH5iPBG5W4e1Xu5veHeC3lqNDtSQ+3eg8YgpZh6fku+yBCYPCAIXpMNVQ
	 DhKQtxBvCLPEmS0YFRyvTOxqiu/JxzvPK3aB8RjUptaQydC8qMNR5qinBcY63r2f48
	 2BjlGSmCRytOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4205C54F54;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:34 +0200
Subject: [PATCH v5 07/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 useless vcc_3v3_pcie20
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-7-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=1725;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=w2cXBopYBKJ6Vf2I5uUHUSmKKAcZ+ftsSxy14dp/jMA=;
 b=uWSeKJgt+YCOnh/w7RLR/MuI6p4fcigvwf4T8azGpbWqsGhzxjuMUxyo+fLsFfE5M4HELS9p6
 LCeXLpdddrBDQMkawW8ZY7vrlR6pN2r5uTbsA4uV8MuZwuLtTUwwgqu
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

There is no separate regulator for boards with RTL8125BG MACs.
The power is only separated from VCC_3V3_S3 with a ferrite bead.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 8953dcebb93e..50af092f9cfa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -131,16 +131,6 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		vin-supply = <&vcc_3v3_s3>;
 	};
 
-	vcc_3v3_pcie20: regulator-vcc3v3-pcie20 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_3v3_pcie20";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3v3_s3>;
-	};
-
 	vcc5v0_usb: regulator-vcc5v0-usb {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_usb";
@@ -361,7 +351,7 @@ &pcie2x1l1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie20x1_1_perstn_m2>;
 	reset-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc_3v3_pcie20>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
 	status = "okay";
 };
 
@@ -370,7 +360,7 @@ &pcie2x1l2 {
 	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>;
 	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc_3v3_pcie20>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
 	status = "okay";
 };
 

-- 
2.55.0


