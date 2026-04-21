Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C5B3B19DB
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764735; cv=none; b=k7prU5qXJ5BmHvwgtpaXMq+HhNrlWnOyILm7Xg9VouibxKPLsGZfYkkdECqq0m7Dlkockc6bxvXncV+HkhmwHnuVWK+QyBrJslbeFUn8SgosS/DBFQpxR01Qcqiart5iFixKm5JKSbp+Veu5bT9HfnKLNz8qCnW3K8uIMqEXPsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764735; c=relaxed/simple;
	bh=ErabSuG5d3yguYUubDEhfq9EzY67qjKhS1X9G3hIR3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEwzDWNGiWWaGHcEwy8wyz+IgDg1k5hQFhuhtCrek9Z+R/gwCkLBSOU8qpcxgmLcktWXx6htstp1UN+8sAu1NsnzR5sRl60Sn51uTXC4zMHF63pyamS7O2JOmpfOa79HZ7osK/0/ibcxO5d1IvTLD7jcMKBmFxn6/XFCPkkAC0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=m6tjE2Qw; arc=none smtp.client-ip=185.125.25.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="m6tjE2Qw"
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g0HXM00Krzbqp;
	Tue, 21 Apr 2026 11:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1776764722;
	bh=dNG/Y20//o8s/WKC5TFEmO5f5/3pr9Lb0W7Zg73YSGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m6tjE2QwToZnbli7rrQbIaNnibN82woMW1IErKpEEBaZmNpq8iyeihtoxEuMrrjjN
	 tEQgCM2HrrPa6dBDgFNHL9Gm2fzuAABNXl2XP74q89iT+ZLkrJM5y/4lkaDMsDb9SO
	 PjvEVDvSFTRRHjvUMbatYIvkY+jV6/7IIC+JIlmhCPIpeAklgHR81cKwxLbm1HbAIo
	 Kkg2htoGVyG3eAun/CMlz8bfv0n5XGNTHbu76DKmLtB6lq/Fw6IHOUZgexVOvVKm53
	 xD+DgXvbGS6C0cil9NaBnmeMNLS30nZ+oHyhC5aM6j3WvChvd4pfdVG5ptY7pz9LSD
	 +ta/wvaKp3ouQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4g0HXL0Qv6zbgQ;
	Tue, 21 Apr 2026 11:45:22 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 21 Apr 2026 11:45:05 +0200
Subject: [PATCH v2 1/2] arm64: dts: rockchip: fix Ethernet PHY not found on
 PX30 Cobra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-px30-eth-phy-v2-1-68c375b120fd@cherry.de>
References: <20260421-px30-eth-phy-v2-0-68c375b120fd@cherry.de>
In-Reply-To: <20260421-px30-eth-phy-v2-0-68c375b120fd@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
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

Fixes: bb510ddc9d3e ("arm64: dts: rockchip: add px30-cobra base dtsi and board variants")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
index b7e669d8ba4d1..add917af5de78 100644
--- a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
@@ -397,7 +397,7 @@ &io_domains {
 
 &mdio {
 	dp83825: ethernet-phy@0 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id2000.a140";
 		reg = <0x0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&phy_rst>;

-- 
2.53.0

