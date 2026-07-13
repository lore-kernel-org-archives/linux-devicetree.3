Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E46C3546CF
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974653; cv=none; b=eM9tTiv3OqPQZXtKMNaQ0xPCvmQ4CJncnpGtsx/PwOe8COQtcu6TU58eWjlItCcUy9a2N4Sl25BSQ8dym4wS2mrZLElOm+TGk1Rvk1KS9Y1ymi6cZIureGKOCl4FFVDWeGGAh9J6DFM/mM/0Abl9EgdcqkmfFgAGO5IcvL4mYi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974653; c=relaxed/simple;
	bh=HgQcs89lvtTaOzFYyfub5T0h+85ljYHNvHGxWWPu98g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHhRRovmD9OXpPONluVsgO+p3JP7zK9FdaCM/ddYDjG2YSA1UjRizvSNGt2NMJ8WiqHG688ODvsvnWQZ9OVbyQAsEI+lwwVWgDk/LVOt7Wyg3kZlGOSEZ4hfdOpJpfacc3mcnbLDe73X55RsoGR7v3DUHDkALmvxMWHWCVbxTds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMKKV7AX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMKKV7AX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D02BFC2BCF4;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974652;
	bh=HgQcs89lvtTaOzFYyfub5T0h+85ljYHNvHGxWWPu98g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AMKKV7AX22d2fg0yJo7rZajRHrSkscirRkHDqfmVfWjfGVHqukhteqysts/Hq9Emv
	 OHs9bZLyOXJHObpsGP9VJzrLpmieuc5GmyOvzCKiMxRsfSw+mdiWFTkVuIrNkOmdJt
	 KnnjQEMsHRbBAWIyvTCZIS61U9A06S218AKfjOFdhlFNNaWxHyunGPOIGuAxts7aGd
	 j7alSFoXyPjTczQaee83A3hahkRmyzMO7DeUEGJAIr+MG5vC/XeaIgN0giEp3V7CjI
	 13hZOEh4Dt8Rl4LeSlmmTIkTsO/wF0IqdX8WZ1M1kIchSdsMbqf3XsyAYUAldf6/46
	 gyfzgZN1g0jxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6CDC44508;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:06 +0200
Subject: [PATCH v3 02/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix
 missing sdmmc cd pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-2-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=1143;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=jHdQb+otpVtf3Zy9VFk36AJnKjgFthAh3MuUfqpCMnk=;
 b=HLDcuT6+iCkV0lggdbczZK0JA0fkv+U686BUqPOQUAz1LtC0OqY638AZy8fZgAPmt7Yn6hn/m
 NIxvVZIFDrtDBuVoBJeOjUmc9P49RDXyELMv3d3mYq2TmF6Ol+7niao
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The cd (card detect) pin is used, but not reserved through pinctrl.

Fixes: 95147bb42bc1 ("arm64: dts: rockchip: Fix the SD card detection on NanoPi R6C/R6S")
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 91b6eefd7abf..67e284a15c35 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -421,6 +421,10 @@ rtc_int: rtc-int {
 	};
 
 	sdmmc {
+		sdmmc_det_pin: sdmmc-det-pin {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		sd_s0_pwr: sd-s0-pwr {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
@@ -496,6 +500,8 @@ &sdmmc {
 	no-mmc;
 	no-sdio;
 	sd-uhs-sdr104;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det_pin>;
 	vmmc-supply = <&vcc_3v3_sd_s0>;
 	vqmmc-supply = <&vccio_sd_s0>;
 	status = "okay";

-- 
2.55.0


