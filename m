Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2773B9D94
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030104; cv=none; b=hb9BhwLk3/stMq+2P6pn/FcmF4AhSvUZGRA58bTeHDu8HG29Q23i4L8rqeKnSAQGANwe5ZBLLg9iRItTs6LkFburmdU5rNi0tkrAFuk7reW+LD2LnOjp5em36F2eNNwJ2TQc23FVqGqkaltqENr7nqy8lXqBt66seR76MgCYs14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030104; c=relaxed/simple;
	bh=nJFIVRllr6lBbEH5QrCyHfVsOTw/A4aUo1durTpSg3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ea7qESSaafTg/hBI8olEV/DldpUDGQJf2oTlrDG3ejKRxcG3/eCaJeYKKZvFxdKADTB6DKpW1/+kxaNK/3x93wSV3xWRcafrjgnVlqtivyU0hUgFdHheIdujZcFwP3jbI/v3iFmCVlP0AaxeGZ3bjZBmqOQWde2GeVZwT/Mu7Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHqfIw7E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHqfIw7E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 173FEC32786;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=nJFIVRllr6lBbEH5QrCyHfVsOTw/A4aUo1durTpSg3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JHqfIw7ErnRLHXSVnE0xlFBC3Daw75fAq8fhtyOAVU0Ov6t7cVPe6KmwLjB5yEEeh
	 qbvTTu5jMgngmra6/sCzDQ3qKTVQRnLNLOt+JViD1wHH1oCezbPbssdYszhK8mFOU3
	 O2TdY5/NHHlTb02Zx93YCn+bIe0I9uf6PYfc1h+1V/K+d6IBv2Y48TkS+ltren/lhR
	 ATqNXWkp4Q1Ji1062vBrabi85pJUnt+PJlx6UZyFuICMaHmULk9+XAMzIho9ALCIJ6
	 HCvT9LAu9+teh9QF7QCQovuUxwFJdy07UnDV2A80s9yDNXZxVQPLu1iNmA63B2yr3q
	 cQJ0WJ6PxVveA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06188C43602;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:22 +0200
Subject: [PATCH 07/12] arm64: dts: rockchip: rk3588s-nanopi: pcie2x1l2: add
 clkreq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-7-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=817;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=UdSN50l8fPPMDfJY8YaQToVjBNdxjR3Y9tdra7aQfto=;
 b=33qo2mouC7p3XEOVXak9y0hbIO5U89q9bndd02lpu/wuvl4S9Kx3HFzCX7erCAZ9BazI6DtJn
 0T/wSi48Dy8CTDLhNafk0nYTJFnLjIhkVtYoydMwjPgr7Q2hkVL3TM4
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The clkreq is present on the board, so hook it up in DT.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 361682c18e69..bcb2f5d63a61 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -312,7 +312,8 @@ &pcie2x1l1 {
 
 &pcie2x1l2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_2_rst>;
+	pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";

-- 
2.55.0


