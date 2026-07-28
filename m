Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0BF42FCD4
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240149; cv=none; b=m23bvhSskmvF5SUfmUOVNsjfpm8B7Pqs1oPi0TCzFKcsWQDVZB01WAm93bFA0bYcol40mvZzjKu2Hwph2JVIsLf9kwekV/SGnmMEhNfqvbrp9n3DGDJAcsjLQiG5+CGGdkA8Q1pWHibbKeAxtO1D2VrvMtuwoxrPNvkGaNxZcX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240149; c=relaxed/simple;
	bh=e8RxcI546sOw6dKd9jhge2VIPPNAJRF1IbocAwcj5gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMy92bpNyWPc9YpYurk80ROBKz6tjHg5Ygu5a1XPgjgqhscYdxGBm63rf2yWT5M4JNb8GY1/zYE4DrTjF7sVGWjlxp6RC1OX1y9gUnZPy10gisF91t4smG1mcdHWFKCgDf8RHyhjE9WdvKXL9uexFpJzKHEGZkYsII9LqVeXvoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpF4RWGi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpF4RWGi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0446EC2BCFD;
	Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240149;
	bh=e8RxcI546sOw6dKd9jhge2VIPPNAJRF1IbocAwcj5gI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CpF4RWGiXOqJrzlTvJ2FXn6yIkPt1Jpnb4QU/SaXT1Y+WOkEIGkgRAwcXLANledGK
	 U7eALsVNC5cHi1a2SEwrg473yVMNrpg03trckI+eMXY9rNeTvGkgse9j/7l4pM5Km4
	 ZLD9C0LoZPmP4Ao8XMThCgyxeqJtjz5eETzgC9m1Eo3dZz0Z1/DbDRzMfO72H1UUxv
	 R6lrbus8YVJuE9nrbCAFreI5i45ui+DpWaVqPFQgoJMGbmle7wgwMtRsJoEdVq2xMH
	 ZI4FFYYU+HwM8o5RWpved+d8HFF86bYNSMtJ6RXqL1dgfHneUJhAluuKx2FuXg+ZOj
	 1qWsRUgotgzng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A18C54F52;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:37 +0200
Subject: [PATCH v5 10/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 comment about gmac phy-mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-10-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=906;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=W9OP4Riybt39A0bIhFgCbk7q5TKSgnKTP3QXL026djI=;
 b=iSLwsGvy8WO2Swa/kYLYskuinmPNHYQVg2OeV9z7bGGt1edeIP0E+Dt5PUAaXN+Jz0Gg9KsRP
 9g1t4IaKhLACN9SKystq+8WZc/ySoTOZiiLiuUwkgGybTLAUCjt9EjT
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Add comment to explain rgmii-rxid phy-mode usage. Note that the actual
delay in ns is not known. The tx_delay value of 0x42 comes from vendor
DT.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 5a42e7dadc92..94f218a48078 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -199,7 +199,7 @@ &cpu_l3 {
 &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
-	phy-mode = "rgmii-rxid";
+	phy-mode = "rgmii-rxid"; /* Vendor provided tx delay value below */
 	phy-supply = <&vcc_3v3_s3>;
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2

-- 
2.55.0


