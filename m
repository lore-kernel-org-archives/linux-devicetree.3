Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB2A3ACEF2
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030104; cv=none; b=Rg8GdNhWnT/qSJBsP8pTcjKtu4WySODpYW02Gmo2v92qu3132y633VN6JqFWd/OttB2MU7+MSeRrnt0I0eRSF+Nung0pl1+HKS1RQczDXhaOtNf5Vc9jDw81gs5kMPbHfjs7+H0ZORhmtNAUbfJitjeGD+6Q6WqWU6z8jbN9+Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030104; c=relaxed/simple;
	bh=cZ22TpFaE71Arc4IoXaypwk8+MUZPyu5jzKLZzuyQIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FsiHMYRJgb+HOxQPk+UWxTeRQnctC+mBbK7Dr/n2j80W8wvvAqnHlVp3LCNv3UXKmI0R/9sHt0ifKz0Dk0oRXIyFEgoQp1QXil87HcNv8oZwZttpODBWkZ/gg6U6MSYsxp4w/2SGMfMXrMeUzeFneEK/5FwYTxNQz7qGZuQ+HH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIB/Gsk3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIB/Gsk3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D431FC2BCC6;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030103;
	bh=cZ22TpFaE71Arc4IoXaypwk8+MUZPyu5jzKLZzuyQIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WIB/Gsk3ZYMH490FMZEwiBvekOHLojx9EA30bDVXl072OdiiybPvakwHr3yAXiqk4
	 RC6rTTUmZ7jQ1Qltr3DURi5i/HSpl465VSgk0vaEO0d9REOYsV9WNycxhnNdR8VCnW
	 l9VrLH3YTtcsLF1FivwlZiYLxkpdTeCURGeTgYLEisf2D/UCaz41BzQjwwmHVl2AwQ
	 TH5TZuwqaLGq7mtzG87Wv98IvohzoTUC7Hv8um20ZSS7zljm8iETX+2tcbk/AV6mAU
	 9Xj5ntl58wPsN9i8XD3IPUfDgxEtOQJqIWNeW3JseNCLYjfB5DyuEHeDWXQUK1CbcY
	 gq3Jejxzgdzrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F9DC44500;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:17 +0200
Subject: [PATCH 02/12] arm64: dts: rockchip: refactor rk3588s-nanopi* to
 support M6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-2-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=1615;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=HWHmD8FobgHGe3T1At3FQprs4/9eDsd/kdLWy7BcDkA=;
 b=123du36QfQzG+SfrECpzxGmzqqKnXjNyc2px8iIag3Q3FfrQkyySV4uZyDi0E96I98YmBhNRZ
 y6v7di8F6K2CCNAMGlsFsv6s44e3gQCjKqxW5bL5V+f8cs8lNjAsPRj
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


