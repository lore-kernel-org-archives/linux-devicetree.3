Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [83.166.143.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D73B9D93
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764735; cv=none; b=fIzcZ3ZSgeNi1rl80uhwSs6n2qs/EVUxJwNZOG9eJoaE09fQyWQJOj1qyJlD2ZI2OTmK8x93DQSn7X0wSWx9WDZOhLvWt5ccx43Hu8j8bWjGiJqwzQKRmjEywO9befbE+XwTNwTMNa9kJPqP8suxzn1Is5ed6cG1ur7xevo0Pmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764735; c=relaxed/simple;
	bh=rSczTOBfEa8J0mWHfJY7Ropk3TcTNHrAiSB2/t02U20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T959WAJE6g9EhpdEhfjKmstYhdZddLOtO8QhnY3GlrQmTdfKtcu7jK8q+Wrfyqi+6AGyW5ES7tMZY8da3Jc/o/QimEYdEaTDLsNkhdnDxK4p7H4L82Cq2RvNEUR++ZPxEdpn8jINcndI3QY4IkNCmKTM7Sc81y2x6zAp6GEV2u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=MuBqGykW; arc=none smtp.client-ip=83.166.143.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="MuBqGykW"
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g0HXM6MgnzXpK;
	Tue, 21 Apr 2026 11:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1776764723;
	bh=CV9c1b3x442J4d7fS2IkKGulkxFv3w2YEEORXf6cDj8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MuBqGykWqgBJzLlqi7pe3zx6e3hd5EYSpG6cJ0iJiKGsy9flvPEmCZa7V2lTOnv70
	 5T7ekGqlve+q3Ui5cwBSRVar4v+t4xTDA+5g3VUibJLiOBebp090IUfcCGqB5kaMpn
	 n0VF9VymGzVM/SpU2J4uuYrDwRJlEKvXWR/pbU7KKV6j/zLQoBwEuGD6WleMsz7ILx
	 po1tpN6CHfvgnd7qCu9xJym4owq09TQo5Kdgqe++7eApSy1DciZyG32QCaHWuWvrr5
	 W/uDHntsHUZuU6mACQcv7fppI0njjp/wrxvw/7F9tuh7pfbVabXRtM+v+DPQRGiJKl
	 /Ral8emt65UVg==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4g0HXL6s14zb5b;
	Tue, 21 Apr 2026 11:45:22 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 21 Apr 2026 11:45:06 +0200
Subject: [PATCH v2 2/2] arm64: dts: rockchip: fix Ethernet PHY not found on
 PX30 Ringneck
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-px30-eth-phy-v2-2-68c375b120fd@cherry.de>
References: <20260421-px30-eth-phy-v2-0-68c375b120fd@cherry.de>
In-Reply-To: <20260421-px30-eth-phy-v2-0-68c375b120fd@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

When not passing the PHY ID with an ethernet-phy-idX.Y compatible
property, the MDIO bus will attempt to auto-detect the PHY by reading
its registers and then probing the appropriate driver. For this to work,
the PHY needs to be in a working state.

Unfortunately, the net subsystem doesn't control the PHY reset GPIO when
attempting to auto-detect the PHY. This means the PHY needs to be in a
working state when entering the Linux kernel. This historically has been
the case for this device, but only because the bootloader was taking
care of initializing the Ethernet controller even when not using it.
We're attempting to support the removal of the network stack in the
bootloader, which means the Linux kernel will be entered with the PHY
still in reset and now Ethernet doesn't work anymore.

The devices in the field only ever had a TI DP83825, so let's simply
bypass the auto-detection mechanism entirely by passing the appropriate
PHY IDs via the compatible.

Note that this is only an issue since commit e463625af7f9 ("arm64: dts:
rockchip: move reset to dedicated eth-phy node on ringneck") as before
that commit the reset was done by the MAC controller before starting the
MDIO auto-detection mechanism, via the snps,reset-* properties.

Cc: stable@vger.kernel.org
Fixes: e463625af7f9 ("arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index 4203b335a2633..973b4c5880e24 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -344,7 +344,7 @@ &io_domains {
 
 &mdio {
 	dp83825: ethernet-phy@0 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id2000.a140";
 		reg = <0x0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&phy_rst>;

-- 
2.53.0

