Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3594EE849
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470626; cv=none; b=cLFj/l22DdDN3IYyFTFis7Mescwl/qUgrFoHTI/bEQ1SfAstVkfPEOKY8DerbnatBP3EZrky6Xu6npcRbnZMWzXcKrW+YVn4DETnMNJukqeSMGEvvajMvK5RHENvJg2+0TmuRp4KDQj3TYnVZ7KRLR1KPc26xI7i7UBwRPrM8uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470626; c=relaxed/simple;
	bh=YS6d1wOk1uNnWdkK9m1ywZhRYLXLB7Jc+RlOQ6jQP7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lxuAH9wTiwK07iTte5VhmKcioqK1xYuGcPCRAwySxlp9lJTSAOi8X+riK3It099p4qgSS3FCgBjcxw+X8VCkCz1VVlwoGRAmVSv5MqsnleR9yNQsWJPYYkVk2V4nGUEzMVhSkOf25NHH3AOZ45bnW8kN2HbviX+KmRZ+bE22U8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOFtq085; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOFtq085"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95F41C2BCF5;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788470626;
	bh=YS6d1wOk1uNnWdkK9m1ywZhRYLXLB7Jc+RlOQ6jQP7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dOFtq085hd4ythazqk3O4PihV8yCEqe/SBMFhpdid1j4mjHubTZZv3UftZohBTqeI
	 J+m4nb6f/pKY648RObyMmyGUBDovkoKpaHOk2PJKcxaiLqwjSVggpwTtqQx6W2zHnu
	 3Mf0OVXHVBubjNBeavAnCDqg2zGfouub4A1HRSeelilSGa3Qu+hA+eDJ/TIHvWarke
	 QtmaeGdYAUAD47zYoPFM5QJOMpnUgtcs/J4hNkcTk7ZqomRY2XFvs9aT1ANgGvNcIX
	 xoc8ObemFr+Y7tWqBPMgTL6rLZfXxRgRmuFxCAnh6OD8I1t0zZfXvJSEJFDcYLxriW
	 cqIm38pZpPm6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833A1C79F80;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Thu, 03 Sep 2026 23:23:20 +0200
Subject: [PATCH v6 08/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 gmac1 phy-supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-nanopi-m6-v6-8-37416bbd6862@gmail.com>
References: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
In-Reply-To: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788470611; l=746;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=7mBOG4nn7SH8FJfxK3Rb2LwUqsvEOBR3h73EDOVqpVs=;
 b=g+xv6apdWQEXmAO/lg+rJrIm/bH3QnoLVplsIxd4F+pyG3ZiEqh2pLmKtkvZVmtuwqiFPblOj
 uD1rV9O/z9nCFMwumOHeSBIx4xfBs2kLu4o9ZtKv6qCz0RQRUG3V6Dq
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


