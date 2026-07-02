Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9D93BCD3B
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030104; cv=none; b=JilzU11AarCJY7wk1eVD+2iSHUhoQm0I5qP2dHEj9exQiRgowNyB5KOfM/wOqLQcN6rfxx3oGKUhHUcD3YIoVgU1WXcj8kiHqK2BOQA50YAQUNgnMgAmoNg85+UZJL30xS0LghKoHR8is8ggtTYTfoiuILlpx64e0LAd2AiJvS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030104; c=relaxed/simple;
	bh=hXyDaGOydTctsYzcs0yrBjLBB6HYhhz/fnaoymcEWeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlWKyto7Mb6CZXczjcLbDBeWn+CIo3L9vKOwT3s2WOhNldXlAQoDGt66X0J+2hPZHVDVZ6w3f8p0/hR9+MwvJEvupICsty+Ng1kvKfVPqMq2PEvRXwlWW0EedyCpR9FtdlaqFZxTX8tjs5lJICTgj8i/kZ+QnnzN8lojzogPBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zpri5625; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zpri5625"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40E10C2BCF7;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=hXyDaGOydTctsYzcs0yrBjLBB6HYhhz/fnaoymcEWeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zpri5625jPcv2wRQEPRWmaigaYaEaqSEwpaPbfS3pGnWt1l91je1j1apl/qut68hL
	 RCNlZstNCsITGtODhQ0uY8pdGMHBvuILiX5GKp85iLrLDaJ6RLx4QpnopULkhsF15O
	 hjRJpn7CbfEZqbpoy20EfzZ96Zy+dGHUWhbu5k0aA3uGcGP/w6SkF9wt6BV0JVFxCy
	 VIls5OfjwbQHCjfJDBF+X2Af23x93zi0/u3S4oLfckvErjp3sGIjjIJd1dbq5+dL1i
	 haBRF8WqtLzp5A2+kZe8mBSmQEgeZ1dT5/DG/Ro9Di5SMkENXAbcIOTAaL/0atUw+B
	 qrcmX5rSMuYRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E356C43602;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:25 +0200
Subject: [PATCH 10/12] arm64: dts: rockchip: rk3588s-nanopi: add gmac1 add
 phy-supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-10-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=729;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=gBMET+DbG+jwN0qr/elYvKg3AjYOtdT2r4WKrOud/RA=;
 b=CkSZApDW0t37iqFUuP0m7yJwqvjLXBQVuuMCGZB0WtQqb9NYVo8yYAV16HpqkkRni0u+K5Prv
 QQFQmeUvdzZCimaa3lWH3EjANXVsUVhXfHBx5loK28BrexstMB+3odQ
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
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index e4900af9822a..596b5a64c191 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -153,6 +153,7 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii-rxid";
+	phy-supply = <&vcc_3v3_s3>;
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2
 		     &gmac1_rx_bus2

-- 
2.55.0


