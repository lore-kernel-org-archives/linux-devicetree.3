Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9333D5252
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721533; cv=none; b=oIofCCHlfFmveP835dtWQIKlVsIb7LQtF05It4syrAvV/HDUwqwzeSvjmVsJFcx98g1HSGnIZaBcRxA4BllSZZz9jSC5OvAAyfKyhw6t8ajPRGC+od44q/ltNG3mgXuhxNgET8Yu39dqq4oNT2jzlPFURliuzkJ/1AKCgM9kMDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721533; c=relaxed/simple;
	bh=TKxN6qyOBwLKlwESXEsYSM7OBYEKgIX1X5/4DfGa//0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYFh8+4O4VfgIpwNofHgJOu6B9duCzgyjg0Nn20nnx52C3x8z+TcaO5SecVVviKU+MOsSPLifXog9QMob1ueo5mdGNFRxOhvEkCzi7wRHj8jztq/yCb98NCXLfk/Qo8j2Se2Lme6n0c4nqG6pYGhdHXfMWAlP+iT8zgYt3ZJKJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcY/TsRt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcY/TsRt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6A43C4AF0D;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=TKxN6qyOBwLKlwESXEsYSM7OBYEKgIX1X5/4DfGa//0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dcY/TsRthAEtPcMh9hrpJW4cKNS+VGaLyW6D3Tyy0B40SCCRPLlgIAjZEceZ/lsJy
	 VQOSy9ZHRjl/z8UR35HBbI5B0zym1G26TZCb6cP3VxEt5mhNOLTHsO+JSO61f1KJ+n
	 GBZL+XGl/qSRknTrxqkEsRgyablizAWY8x1h5iFSseDgDrSSYy0cPDwqB6qD5vQ4iA
	 ne6ZG4HFb8EBq50YGSPuMP+RIOrf/Uz90T+uE72yaalsoKxleKQvYUGQlBh8o4EHr2
	 +vNfiN0uLoyuVWwvXUSkUJjlq7vYfj/wtEDGawXghgX92V4vvIFXMDs9hjy3mHDzSV
	 +UrLp+RJ3PIXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E0BC43458;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:55 +0200
Subject: [PATCH v2 06/12] arm64: dts: rockchip: rk3588s-nanopi: add missing
 pcie rst pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-6-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=1356;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=Qf2hXVsAwP7OhpMLxy0ZtYTeVQxe69crFritq8w97Ws=;
 b=BJhot+K/NCrmr9WyaGRgVDkpXpulj6wLq7khsZF1oFnHNK0ugUye//oS3bZGM4KsGM9XDUXZ0
 D/3EAoMnYn9Ct9wKfkhXxpDhQas+ZnHIlDBTJD5rrce+6I3gW8+N8uq
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


