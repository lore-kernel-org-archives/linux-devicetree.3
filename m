Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0753B14D4
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272997; cv=none; b=AI2wkr9Tvjddy5zlrxZ1dePYNzO2OTrdu9Oypveel64k0d6ANvV3hALd7HuUaqzDu0nW1ukRGKBOSO+CfPNaX/27P1tjeA2eYNCfVIOoGwRUiuwqskTPi4dV2qQNEI0podzR+64zp2utbUlPRA0CzyT51+5OOX/XuiOyqkq5BTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272997; c=relaxed/simple;
	bh=bedEX7IdqcLQwG2ntTfKH+49oD/U3l2m9X3GPu4//iA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2ehn67D05qQxWQ4I/+C/a3dHOodm18xc1jAopOKpfioxk+pukQl1OPxH6HsyQe9VdgtAAerwsmJpHBY5td69mRKphOsCeFo9N31srMRUoBXqblSXvFmz5hJlL17Uh3PV0jZ6AokUvLQbZgvnvlwCk/C1AdPOJfp1XjIt+2T1BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoLYdGBK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoLYdGBK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BAACC2BD00;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784272996;
	bh=bedEX7IdqcLQwG2ntTfKH+49oD/U3l2m9X3GPu4//iA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LoLYdGBKcoT466rAJBYl62YMB2NaP0jWUyPlZLYKg06zYwE2BppljbXb3eh6oB9hT
	 9LjPKVn0tpMVYWER94q2aMh8LniKXvjVLsgNEZfDp79+CE3yN23UZ0Jcgj4ZmO/tO+
	 cYO/G3NF2jKfaY7ItGNejntGXUKDSV5AwuE1yIYBpp6c6kuTJ6Qy98Ui6zWd3XnFTe
	 im5HHuNYkXv+ZvUBqvJ9yseC6QBW6o67rnCI8KaXmr4ZNDth6EDhnRrsk5DvmxMsKJ
	 lPdVP09VGyg10VHj28VimKspIz2W/esgNo/fZmvpJtgrpF6SrhnQPBWdnjyAIFqJqQ
	 I8eGdukeG6oTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DE7C44507;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 09:23:06 +0200
Subject: [PATCH v4 08/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 gmac1 add phy-supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-nanopi-m6-v4-8-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
In-Reply-To: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784272993; l=746;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=cbMRGCjK0cqeVUY3RIsYZSs7mBZYvBiBTtHs1FmJ/94=;
 b=ZnRgRgisL/g9rcTeSEO7p9vVAGRpab0QuLj3vnVlT/BTHqHnEd9GZQT7kr0ClemfbYKctbbtb
 pWgo/2thcMFC90774z5QIB1fhKjLSwwRN22ESyUN0RNxVVQ9R7aPOxf
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
index 30e09352bbe9..97a495eab7d5 100644
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


