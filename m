Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237C3D1A8E
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721532; cv=none; b=MRjdPsW3vbrgsHtRLkwdNXYjb+wa35ajXlprSpMLYgCWCgXRCFcb+fqQTMDjswkx/KEr+STr2PK1kKPGx21Qk6A4j5sQYe4WVh7bR5CX1IGwUzybuHgn1UIevpgohNHh98C5otC7QeJCcDZ7aLcx4ZLZIzollVsKUm3sTw3vB9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721532; c=relaxed/simple;
	bh=cZ22TpFaE71Arc4IoXaypwk8+MUZPyu5jzKLZzuyQIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjOfVKObz5QOrLkP5yUCBe42qAyApQY0RYKdt9jQ3zmVK0+yeyCwhPuBkWXrB/CcdDC8qIvf8j1QFH7DYujaRnMuVOr3LjIWohxdmgrxgAF8lbHCpwEnP09Wv8riraJBbMZCbzOik8BasiSV8WwZihH7bf8liGpBsTrFQTVL5B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6r9fn/H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6r9fn/H"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D837C2BCC9;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=cZ22TpFaE71Arc4IoXaypwk8+MUZPyu5jzKLZzuyQIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F6r9fn/HQSLRprWxBq5850/+SoUH/UUc1LHrKA7c4vFlOOoDGoRSBikvQB7v9xJeE
	 oSzjZ80Wv/BMLu07qQX6A8RQtFWdYWnBH/C617dDUFjM9UkvA0TzAqkaG8a3MUaXZq
	 TOly/7H15ot16+thl86l62OlfjwBGRMXNK45YC9E/g0PAdMKtBqfVPePlA4+9OTiI2
	 Ugep3LriSjbugG23oDWTvpL9teEtcl1/q0QVWz+YyNISBgNlit/vSdCuwka0F7xbb9
	 wH0ABIYfzrQnLq8r+E0KTXnSpIgPKxbfZrGC5ImD1OvOr0+mh2keDPnW+A/6CGR3hP
	 2k2Sda+6myZ9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712A2C44507;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:51 +0200
Subject: [PATCH v2 02/12] arm64: dts: rockchip: refactor rk3588s-nanopi* to
 support M6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-2-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=1615;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=HWHmD8FobgHGe3T1At3FQprs4/9eDsd/kdLWy7BcDkA=;
 b=PUeUMB1QfxHUkHUzXnK1KmUueShDLK6ItJaTWn7elPG/AOF/SLhbfOqjFQFNymz8Pht/rsqhE
 +JiQWZLXbkPD1suN2Qyf4Gc3MwxYwBKA+v08PyTey3Pq54uV+w6FmqT
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Refactor FriendlyElec NanoPi R6 boards based on RK3588S SoC in
preparation to add support the NanoPi M6 board.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts                     | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts                     | 2 +-
 .../boot/dts/rockchip/{rk3588s-nanopi-r6.dtsi => rk3588s-nanopi.dtsi}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
index ccc5e4627517..77fef2662ca5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "rk3588s-nanopi-r6.dtsi"
+#include "rk3588s-nanopi.dtsi"
 
 / {
 	model = "FriendlyElec NanoPi R6C";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts
index 9c3e0b0daaac..f8993418a122 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "rk3588s-nanopi-r6.dtsi"
+#include "rk3588s-nanopi.dtsi"
 
 / {
 	model = "FriendlyElec NanoPi R6S";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
rename to arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi

-- 
2.55.0


