Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0523D669B
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721533; cv=none; b=dwtiFHbJlA+TaQFdoAO1pTwzXaESgjf7toA1joVC8+wbCaDFxX1s8ZTTUPEVVYDNBGLmlY56/WlL24O6hA+aGDMRWUkLYKGzlnHcixR9/bT662E3QQIj2qBuerIa0mxt2mgcSs4ECtPV2q9dItB7ADxx/808SlCsp2/0gLFQRnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721533; c=relaxed/simple;
	bh=npo/fLTvxFH33okSDT5hZKC/JT24REZBjA22Ob+RouA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEhC1jn4so2JSDt9INyDboURgAOVPypGcEgXsjzWqBVvYETEiIfsSQWRae6k+gjakpLW/y71fhqmHytXdhH8ILrOPNWLDkKTcvEU0AtXwbGMh1jQMi7jTF6/nCH44yHgM5YV6mAFiNoqSlpJt8ddzhp8wK/8HT8YLi1u+Hoh1Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8IDNeXM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8IDNeXM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD083C2BCF5;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=npo/fLTvxFH33okSDT5hZKC/JT24REZBjA22Ob+RouA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I8IDNeXMArCfAAmS8GIMYCCXhI7sDQDIQvj/oDKML9nt5yWyqwzV0Zy3P9CIB0zDr
	 0JUFdwAVdV83kxDM0hJPrXEBcC9+IOpBpveZvX/gfebf5jkiYYJ5vP3CoJ6h7opg5D
	 hw5C1RfnlKQP9xBNeRi1C93OrrNqRTViwUDR3fEjSe1lP25mwMpPtFLRqHfAEcFyeh
	 +83WS1p6yYPjYaUCJM+iO+qKBdNJ+W/G16ZicJvrHHY2kcVtvQgToSRAtWs188YdLp
	 ZGdHEe0snZZC/TOvuwX6zGtMZaoRXa5qOhlKVIFG4oLAGoq9DUYdyhFYjt3k2jj/zT
	 f71KC9JcqQCOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD21C44501;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:57 +0200
Subject: [PATCH v2 08/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 always-on from vdd_npu_s0 reg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-8-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=747;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=xYuB/QxuBX7PA9bPdFQENsiRAGCOhRcwISiBdc/4PZo=;
 b=zNPJIUAv39IhWBBp4hPXN/+Mdg2AZuPIoZQUvjVmpCqcOMtrlf9Q+MagrqGkdYVHW2w5auiuE
 9V3jxkXiB9ECsM7tN2ijroXuqa0BBprLF0YEiOXZHTKvJh33HHQmRzc
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Since the NPU is hooked up on these the always-on isn't needed anymore.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index bcb2f5d63a61..463cfeddf270 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -258,7 +258,6 @@ vdd_npu_s0: regulator@42 {
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
 		regulator-boot-on;
-		regulator-always-on;
 		vin-supply = <&vcc5v0_sys>;
 
 		regulator-state-mem {

-- 
2.55.0


