Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30195437CF
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995686; cv=none; b=epV5mb+s1i2SUguifXfbyc6kF5ivaDGKfFWsSgqeU6KHP0QrvPylFnQop6T44pe260BxfrKgI32+Kv0u7gG8UZkn4jaBJ3zwrihieU5ClJgob4hYwbhDSyB74EqwFtcoR9+glnsDGH10JHHySQ0cMoWr1KqwnkOhVnveb33obuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995686; c=relaxed/simple;
	bh=e8rMZVE3Hk775NxesQzgW+3PXKTFyUNToxKWcBLcdF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPaBdbYbhZEF450ZHKtO3IBfqK64/qzLffwQljo6512uTp+EkgYmhQwlsXtMn/ThpHHQry7zcpwHpqpnKNgxTizmoiyEG07w8AKpZD8DOKvpifMZW3mvFreqa9yPXowH/dDQX6rTzTqUhDaFX2ilJ7SDkOtepDcUAjEr9NoPd8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBlGeYNV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBlGeYNV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86AC1C2BCFD;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995686;
	bh=e8rMZVE3Hk775NxesQzgW+3PXKTFyUNToxKWcBLcdF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MBlGeYNVIQgpLdRiQPLaIMmCMRLCexPNwn2DOk26KeTeEOkoL7QfuFg760eZr/JIq
	 gZY2fDILXQ7X3/Mgk1oWNCxrsKmpSR+VtbNclsHDXad8DC3GcLJp95muw9ZBoLLE8R
	 +MXJ+rK6Mpjl57j8U9atmwgtQEMZGyEsN/Uwjs9DrpxB3ZHoLZiFxeKbTTTPkqXjhq
	 qX7i2aLAiOKN6UUE0aDnzcD4Ep8tDOGbqT0EWS/rdqrbP3F6mHm8v/kpCxO0QDvmCq
	 QlRPUyQl3P4naR9iTzqj4+/ExnKXvF8jw+1qi1KqbEllwo9o1GSGDPZ3fPfS7/18js
	 36DyanSc8wmGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635DFCC6B29;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:02 +0200
Subject: [PATCH 2/9] arm64: dts: rockchip: rk3588s-nanopi: enable mmc-hs400
 and add supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-2-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=829;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=VE54I6DLOZ7xz7Z1AlY0TEKLCJ6TB2BmQB8DBGvEYKc=;
 b=85xFApN3E8VWMpqzu+YBwEcK9UJkEbqhZr3q4PIxJnwDmASdeSIqMdS2PvzHIbkqQpk4gkEJv
 vr5NzyioSxQDmik7i32Obm3Bz4UzWOBAzhHVMFxlvPovbq22pt9i1en
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The NanoPi 6 series all support eMMC 5.1 HS400 mode. This also matches
the vendor device tree. Also add power supplies while at it.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 8c36268e9876..8c77ee71ebf8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -390,7 +390,10 @@ &sdhci {
 	no-sdio;
 	no-sd;
 	non-removable;
-	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
 	status = "okay";
 };
 

-- 
2.56.0


