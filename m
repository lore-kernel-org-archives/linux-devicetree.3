Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4223F3BA236
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030104; cv=none; b=SjwlRziaVRLYHD1aFXpMDC+dRBtkqXcwd+B9KstmM3HK6BVEWpIT72s2YijUVBiD5yvsrSirbxNeXMPflIZM7X2ufJXE+mtv5h1Q4furg5pCd1uN9iFdzNcfmBD4kbl7j4RdKStsTnD1FqviHEoEKS8POEPUqS/bXNwKmPlfYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030104; c=relaxed/simple;
	bh=TKxN6qyOBwLKlwESXEsYSM7OBYEKgIX1X5/4DfGa//0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFsaLvlcbxIRo/FwyTXaxQnFSOEKX7ZGslE+pulpTJiVJr+0ItHZt9y0wnmce3Lftz/sgh3wK9ms31T9E1MSOTtKsAIMKrp/qmWII+KE41GbkowccRX7CwgxTwJE5DVQZ+koeMhnOWLLdyc9dasE/4InyHSPZ0WWqYIwwQztxxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqH3YksV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqH3YksV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F4ECC2BD04;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=TKxN6qyOBwLKlwESXEsYSM7OBYEKgIX1X5/4DfGa//0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EqH3YksV7+TgS8d34n2LpYkEqt5Nu59qJO+FRfJo/LashQW0XALw+ZaLFUy1Baaon
	 qZ+GNT079JRuyLWv8SyexvG/CWcOwI3RRVOUPJ2k+IbFnWdLDzXrWdklVDwa5hwWyQ
	 m7gY5cT47cbuPb32CL90+ZU3icBBn9JmaooR0z+WCM4M+NKlraR9kq0BgGhEsBeHLG
	 cdDYcwi3CU9ZSynBgfQxH/23THPQtMITVJL0CEpKzlNRCESI/XQcv07AxnG3IEJqcy
	 Ohbqcw5eIvEx0sWm4RJu2RakMhHEcp3sNfdxs8M/jUhpSs/yesO0ucX/U2BlDMB0ik
	 BsP4dUyzlvTGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA2BC44501;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:21 +0200
Subject: [PATCH 06/12] arm64: dts: rockchip: rk3588s-nanopi: add missing
 pcie rst pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-6-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=1356;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=Qf2hXVsAwP7OhpMLxy0ZtYTeVQxe69crFritq8w97Ws=;
 b=ai/uqBJV0PYPqDHQ1Kv82hk1ayEHURj9pEPXB5kV8X6jVRRvVkrhRD2MmxpA1sSC7F8ufC325
 898POi1Vy+oDK2MowvPW/47s6QP4POLtyNYIi1gU9s8Mb5D766sYhFW
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The pins are used as reset-gpios but not reserved through pinctrl.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index f3a240b48a2a..361682c18e69 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -303,12 +303,16 @@ rgmii_phy1: ethernet-phy@1 {
 };
 
 &pcie2x1l1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_1_rst>;
 	reset-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";
 };
 
 &pcie2x1l2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_2_rst>;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";
@@ -335,6 +339,16 @@ rtc_int: rtc-int {
 		};
 	};
 
+	pcie {
+		pcie2_1_rst: pcie2-1-rst {
+			rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie2_2_rst: pcie2-2-rst {
+			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc {
 		sdmmc_det_pin: sdmmc-det-pin {
 			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.55.0


