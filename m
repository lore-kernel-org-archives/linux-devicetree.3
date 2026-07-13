Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E56D357CE0
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974653; cv=none; b=p9So8+c+6eAr8ifnDbGJDo/HfVbFn+64JCtx3vXma1i9iGwnbKWuJM7/g/NwaksK+/IMxwEP5everIAEzDQEQyjcVYZyJkrLlprtw/F9FJu7uWn7L3/8M3MeoAZlXbAFXpfJ7LiiAJrzHtATItrf8gCoygwJ3gbQD1Vo0IMx72s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974653; c=relaxed/simple;
	bh=2B3rcMxZr2XiNoehrXQldHt6csa9rlIjsXNlNlLF4p4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCOvmBkN5mxy6/SiswS7QIFZXNKkXh4sr/TBfxiKRf/UyMQmutyFP9CRSA11PugPhAy0RiCMiiTcI3TjYYmfTVvEhmoWHMqDo1ff8RqIFyVSN9QF2UNr835Yozw+cN1V9k73Q+PlXXht2UjcU5as7e4rjuscMY1nKRrqAc0IfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gh+Aygsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gh+Aygsv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF4AAC2BCF6;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974653;
	bh=2B3rcMxZr2XiNoehrXQldHt6csa9rlIjsXNlNlLF4p4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gh+AygsvQ7kEW+kUubn0hbCcbgpAZHfWt3IHNNygmkbwEhNXc66bhIywE/cANYuf4
	 1nhBCu86vFTOavlaUhtmKtlWW0///lY+td5WML0LNTihLmS4ZqiijLB3c1eii6U8V7
	 ii7x102ch0dxZOWInO8i41HG0m+OourEPCq1vpEwnkJpF4MRI8HvXZ9zesZvYki3zn
	 uPSn+VMYFZ1Hz6zd3apnDiyDNlqlJecmLiAJ9c0K+UHtWBnW42U4NJqUa2YOHc+I9t
	 2OEA0XRaJ76ToxPJPRWLF4xw4OQl6nepG+FpAbOBAtM93j2w38v6V8fQSnxB5k9YKy
	 Ayw6sOfqM1h1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C802BC44507;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:07 +0200
Subject: [PATCH v3 03/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix
 missing pcie rst pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-3-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=1466;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=ss8BtzYchNM4aSwjVzwg4/YSPnVXTNnv0MDxmZmDGxw=;
 b=Extvu38J+mnjP9HzXzznUKxIGVXl6/vfXkD1HA3AO/ir9V0Vr0RGhfLZ6yaR5MSPnreylkgED
 WzPgLcdkVoCA1MZfDDDEP7z68ieV0taiEPhiRtfOqIYTvYz8Iy4iEwG
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The pins are used as reset-gpios but not reserved through pinctrl.

Fixes: f3c6526d6fb2 ("arm64: dts: rockchip: Convert dts files used as parents to dtsi files")
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 67e284a15c35..8df6e1a21180 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -360,12 +360,16 @@ rgmii_phy1: ethernet-phy@1 {
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
@@ -420,6 +424,16 @@ rtc_int: rtc-int {
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


