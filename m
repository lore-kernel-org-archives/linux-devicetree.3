Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD7742DFF6
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240149; cv=none; b=iyJm2ehRMMniZEiE2ASgvLVKWL2lH31Tu5sgjwdTibyO+VdTJuPVkuosYAQTpy1E0u1YNsNtv+maIcySQdoB2pewKVWiGlTLlYiSEAOv2PTL9KOAmEc2Fy1atG5bXbTP3n8q0x2W+ZZHCW/64BcuWnzyGrf/fWozpm+iu60DBkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240149; c=relaxed/simple;
	bh=YS6d1wOk1uNnWdkK9m1ywZhRYLXLB7Jc+RlOQ6jQP7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5tlLurgG7/M9u/a8gtT6BwRgN7Y7G7dv0mCcZHwBB5/LlJP3ckaOICnN9eVjMaNNoRTNm+AEan/IYckZDUMuHODcNBqN0+/lIh6wwuGM+/hTRwIRbFpxjvhLu9/xxDHjiXPxjQp9AI1wVGVCfb6IF6Qw+6PZcqZ1HIZY/0qt2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oi4//B5G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oi4//B5G"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8C69C2BD04;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=YS6d1wOk1uNnWdkK9m1ywZhRYLXLB7Jc+RlOQ6jQP7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Oi4//B5GNtJlX2g7P2DMttP2fRqsvOiu2ddGrjRIcizOqFz0A2u/ov4moAYkiZvwP
	 M2Czm7MSG8F3evNmtjlbgB0scNZ2KsIaidt2SJRWcFl7GBrVP1LDFmLAkcnL8B0Z60
	 9lUVGVZ3TBBT1g4VXmUWf8JcN6ADLr/u0t7r4zq1jTGYXvQLX6SwxA1ovBExLiU0R8
	 rYGXKLOE86lcNDau/8HQX6rbhq3lzYWTFmZOzN0gp1Nf/RohnyMQtLCHqMEsee9PJx
	 iiVwg4oAJy/oNUcnRnbm2wCRaM/WYHCm0uk+z8+4r9JaNhN5c3gAFlwzaar5QnIuME
	 53UZwoPwODfGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FFBC531F9;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:35 +0200
Subject: [PATCH v5 08/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 gmac1 phy-supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-8-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=746;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=7mBOG4nn7SH8FJfxK3Rb2LwUqsvEOBR3h73EDOVqpVs=;
 b=IfXI9VDlw25+1n/T8XMAX8cicBFfFb3hQmva5PGBSAAQP+vJlnvw7+K2IWC0uDz8frEdt3vUq
 RkPiUMeltbVCDnqSpm30lK0Dd+Wl4dSabf0O42eKOW8JwhUBNCgZlhW
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The RTL8211F Ethernet phy is powered from the VCC_3V3_S3 rail.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 50af092f9cfa..206cc88fdaa1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -210,6 +210,7 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii-rxid";
+	phy-supply = <&vcc_3v3_s3>;
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2
 		     &gmac1_rx_bus2

-- 
2.55.0


