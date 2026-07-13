Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE7535CBD7
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974653; cv=none; b=KxODHtLBIwNR+YKjSoR3qCafdWKx3JOitEbQKvqMq/2zk2RPkP7kQk1t3/NeZ1oCA9e8oBxSFJ+w2MKh5ceNa1dF+rFArI3gjaL+s56F+bT0z1EIrLQp8Awvx1zdVKeGk8INSohcBJoiUXYf+ZQHhUIpqvCyp/rp6XBeYk3CdF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974653; c=relaxed/simple;
	bh=7Peo8R+rVWVG6kWFFJl2L+ChHy1rf0XLf1HZKdhDLPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2igeCKqJdkxFzEiqnl4qR/fyUGE88rj+Unz7WqMTVEkvu/9HQOc+Jk3RpYalZHsW41jiTlIQYI5qADRXfn78i3SFvFXKvC1kuzzW2dIX/Mtkv6ZXJZAY7s4JHAUG5HqR6FDnCfTrDB+090KAr6ld1YB7n/cn9cv+3iXmN0dYUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttBVqn+m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttBVqn+m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E8A0C2BCF5;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974653;
	bh=7Peo8R+rVWVG6kWFFJl2L+ChHy1rf0XLf1HZKdhDLPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ttBVqn+mIEZ+/Hknekk8cZ6TV5BToIU2g6JOjoHmVJ758E8EtL69yPmyLlqTLt6C6
	 iuN8l2j+tT/+Mt/H1ObpNuym/DCtuxMQOkTTzK++C8fBDhFUKki3/Y2TWdJl4tdUl/
	 rGm1qM5E3XKZwFbM/psHhQ8IMwzTI84gu2YVMhF7zHQtJJSZ/Jez0wNk9kv2BbLFxp
	 XdZ0kTotisyZpKIIPO3k6fQECHqf37RIJKh8b8kY0gqrfMdViFskie0GclOSIjV4Md
	 3Bb5XOqmthSNTHUmpJs59DTxgtAjWL1CsHq68wpOnE6aOnnqm3CAT6UBd62V8uX9L/
	 Gu1BpxUV+1jyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBFCC43458;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:12 +0200
Subject: [PATCH v3 08/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 gmac1 add phy-supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-8-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=744;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=VtXwxo9nIN5ynn514KiA+OPs3fVdBgCDqzICxbxr++4=;
 b=Dvi+F3ftfPLt06D3Meo0CNMOK3lLnZNvTzlNhCC52I6re/leQxduNp87Lcsr5pPVJB0XI7URu
 iZ2xtWQ3y2kC1IUphJLjgJYZ8i2I2w3iwExINEhx9fc/bNaMOUwL7rX
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The RTL8211F Ethernet phy is power from the VCC_3V3_S3 rail.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index b0a92f3174e2..aa074ecda050 100644
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


