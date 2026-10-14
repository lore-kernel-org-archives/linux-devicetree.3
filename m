Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35822560AC1
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995687; cv=none; b=Llebg0Ifdics8UopCrTcsO9tZFzRoZnlP3BySTN1OQG1mHMPb8orSduyEr6/TYxtNCRR/29u/h7Iig5zBmgG4hFg6fV/SCfAP5vX6/Z138B0owPL6DzKOFeqdZpqs+Pkyva7RGe9xEvLgQ1ehejkfG/nbT/g1OnVnuIC3HWkjQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995687; c=relaxed/simple;
	bh=yoEkzv3L18sWFC59rJDzuQJ9eP+Jz/EAEuSDh1mibNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DegSFEACZ/tR9/gSi3sFmlVbBojhj+FA7WDqyNJzDUhhPhG64IY+NAUI5EM1hSE7YSTOWm5SRcU/m6Z4v2W2HlXZchFYFKg/8ApMNkbVFhRibWx66xm0XkMR4VPrsDg9aApEuijAjfo7G5zmExDOcUsrqv6rTx3b0xzlx4bYTBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fB1eeuJJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fB1eeuJJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9976C2BCFF;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995687;
	bh=yoEkzv3L18sWFC59rJDzuQJ9eP+Jz/EAEuSDh1mibNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fB1eeuJJlYK6UEGbklkPSoK/EAepoW/iFbSAeXUmCOG+ZJybhYDBaUBFbhdtImbuR
	 uyCsSfAZCZ5NsFPd6tkQwNLS6BDq3CT5uvSQ/M6PR1Z4xbiGaPDM2SMWqlLaXh6dB4
	 +irT29j2/VYlZu8WVnL9afOS6MR08nl+VfiLXuL8+XMg/VP6ErHG09q187RYtCkEnv
	 EXiCjQsxdVs+vkAgMG3TXl2JUo/1cWQJKZR5NYmiMwol8w5xkE7jguVt516Yb4Pp0f
	 3bkk98lAvcf8a+JNFZW09lKDJEF5tIXny3+tpn9fFJB3R1G7KYko5yYTmTpj3VbkuV
	 ZBtsCzZCNn0vQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87BBC3DA7A;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:08 +0200
Subject: [PATCH 8/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2
 power pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-8-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1149;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=GfKqko+BDEDT60oHbA0Oxe3Rj0eMd1CHLKLNk3udR1A=;
 b=Z+r8PqUi76NbwVK8sVcXAQug20g8SdGQ4/NrTN1UApcxjAeBJd8eciHBIVaVullfyosGIHwp/
 jF3YyjAAfBKAuAh1hQItJf0VcHsWNvNWk0EINVvj0d6tn3WDcw6KaCm
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

pcie20x1_2_con_pwren matches the signal name in the schematics, which
simplifies cross-referencing.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
index 6205a542cd1a..ca115d8e108a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
@@ -41,7 +41,7 @@ vcc_3v3_pcie: regulator-vcc-3v3-pcie {
 		enable-active-high;
 		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pcie2_2_pwren>;
+		pinctrl-0 = <&pcie20x1_2_con_pwren>;
 		regulator-name = "vcc_3v3_pcie";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -116,7 +116,7 @@ hp_det: hp-det {
 	};
 
 	pcie {
-		pcie2_2_pwren: pcie2-2-pwren {
+		pcie20x1_2_con_pwren: pcie20x1-2-con-pwren {
 			rockchip,pins = <3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.56.0


