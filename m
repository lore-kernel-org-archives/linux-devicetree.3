Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C11F459AE4
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470626; cv=none; b=La4Hi27zHs3sN9s2HiM5AvL0N2/2I0Jf5GYXYJ0BHiwZnDlcaKwCFqDdqiswUcgJGqwkJfMH0w4GcdfexV9L3CpfjCams/iKbqxDdryhlq6VQduRiPAIyzSuMzZ6PKplc76KHBxYprziGQhj1geP9AHMFr3lWwHwwtGteX9eZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470626; c=relaxed/simple;
	bh=Xr6T3XzdJrfzoe1Z/wTN8OxH5MsfKLNd1qz9ae299ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKCxxiZKTXk8+z5rnNxsjxHhAPjuczBHiWWKGRtwyY/QkRr7tijHdx592YZyMJS9qTSHg0gwW81Axn4o0gFfrWZMiRs5M3saN1a/trIa5KkPMaTEOIYID5BAnhdz3L3Az4yqn3XjT5uN84PKNGorFZlWVgD8DjlRVpVDucDPvtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzQHq6QZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzQHq6QZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FA04C2BCFC;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788470626;
	bh=Xr6T3XzdJrfzoe1Z/wTN8OxH5MsfKLNd1qz9ae299ik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lzQHq6QZ1tIF3xCsZbHNZUm+3lbgrBbfHnQLinFoTJag4KIcZi0DW7JAAOhG5cq5u
	 rOzBIgWGH+Sw9hrMF/gTIrquS0X2DTYn1/nXabgHqT91VOgp1yNA6OT7x1qZ3pkqQz
	 IoBIVWUTKL4TKPVgG3NsQV02xB2UlgVjjGO7ZlfAVazq9eh24LSB5U+b3J5tnfJH3g
	 w5LBHmFCJUil1irqgM5JrvtMDzwmWK9RqdkY6k8Kq4yWCeNIb7cg+IXxWhxQ8SZu2T
	 mtVj7p5ISWnqjetqk1K8d3k6PiVrUZlz+CoNAawuMSYVd81+40PqVMjVAJeXyuX/bU
	 Dyp/cc7NPsU/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DEAC79F80;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Thu, 03 Sep 2026 23:23:15 +0200
Subject: [PATCH v6 03/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix
 missing pcie rst pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-nanopi-m6-v6-3-37416bbd6862@gmail.com>
References: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
In-Reply-To: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788470611; l=1518;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=3OhAdav4ndesm8E0HvAPo6lPfIjUT/KSpfYbi7hWhxY=;
 b=ioSLej+ax2RiWLYvOcW0CjCBcYLgpyVG+1mMi6se5MFHrCZIH4IquXgZ++g1HYtattMpd4qY8
 2fM4am77EggClpyV8ME3Dlv/XnXCsFOeA7VyqMP/5xI1bONgpaY2b+o
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
index 3ee6853b8752..5bbd5d2fc5fa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -360,12 +360,16 @@ rgmii_phy1: ethernet-phy@1 {
 };
 
 &pcie2x1l1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie20x1_1_perstn_m2>;
 	reset-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";
 };
 
 &pcie2x1l2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie20x1_2_perstn_m0>;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";
@@ -420,6 +424,16 @@ rtc_int: rtc-int {
 		};
 	};
 
+	pcie {
+		pcie20x1_1_perstn_m2: pcie20x1-1-perstn-m2 {
+			rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie20x1_2_perstn_m0: pcie20x1-2-perstn-m0 {
+			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc {
 		sdmmc_det_pin: sdmmc-det-pin {
 			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.55.0


