Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31C155C339
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995686; cv=none; b=OMR9073V4hBB+Y4qEPTjg4srIH4EjJCmSgnQC/86yn2nGwp7ZX/JI7JgGq0BdSVgFO0U7CtaKYyW5JFzrsICnW5yq8z5QCB/hff5NlYFd2xz0KW73yEwTMrIok1PXHquyVGecofrNEv0ETFQCbl3O9yaDHz5cWyxGxK4NYgqcpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995686; c=relaxed/simple;
	bh=ALUyyge6FUZ6GWamul8z2xtbvXbH61GTco3jjpVzi54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDlkdLzHIBERJYeG8wb+qoA3JSNO1C+16WzOWGkk591NoqKgvOnFEIcLFZeMFfwFOtaAyn0Ndsb2svgzu3uS1FVd73ffnLhE8QL2GUPPi57Odn3AlVbBGeowH4dTGbnsbCmjCpIgxIvCBQZeFdLID6Xc2TK6CUXW8WjXeJ6S3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipRc0OAm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipRc0OAm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72A47C2BCF7;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995686;
	bh=ALUyyge6FUZ6GWamul8z2xtbvXbH61GTco3jjpVzi54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ipRc0OAmGqmZyBY/NKktdCe/Mj+58+8V056sW7ZEYdXbdh1zpy2cVDKsd+m6NRaCF
	 oihJmJORLGn8kDm5J2AgaCI9u9Q8khE/kst6n6SxMMRC/9wBi6Wv8Y27ZOS+bszstb
	 9016BxuG6/xGZ5rFu7vl8YlPAYwUmosav7+dELLGorZ9C8p6wmXV8Vm37BWyBX+TeY
	 kkxCJiGQ2ZI7391b3vOXJcl5kCQgsNF1uhU4Z7gNZ/z2iD810QzbVXtS4gm/s7x0fJ
	 Uacc/8o/1QHdzHg666r8870DrsY9+uMKie7pQJw18+fewU8MvCzr+vK/+c2Iu0t820
	 hoSNGln9lasyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5144AC3DA7A;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:01 +0200
Subject: [PATCH 1/9] arm64: dts: rockchip: rk3588s-nanopi: fix sd min/max
 voltage
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-1-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=999;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=ZL0Hzb2jEWUjL2wvU/uKxEAnzsHMxAzmFWNQXvnrLKo=;
 b=G2CZan4JvljYpymAFg6tQTWMFL8j5loRE3S67B5NyNlSv4GXYdGWQ8Iycbgd6uQFQNZk20w+p
 D4sUbWZyF0pAgaH4+zwPCWNAhfBeV1G3ZqMHFelarJm9l2BE2z2pTz+
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

This regulator is only a simple power switch and cannot change the
output voltage.

Fixes: c08257d642ac ("arm64: dts: rockchip: refactor rk3588s-nanopi-r6 to support M6 boards")
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 22b0cdee22b4..8c36268e9876 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -79,8 +79,8 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		pinctrl-0 = <&sd_s0_pwr>;
 		regulator-name = "vcc_3v3_sd_s0";
 		regulator-boot-on;
-		regulator-max-microvolt = <3000000>;
-		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
 		vin-supply = <&vcc_3v3_s3>;
 	};
 

-- 
2.56.0


