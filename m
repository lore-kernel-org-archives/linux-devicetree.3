Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364263B8930
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030104; cv=none; b=YXjCM84ys6VzoJboVh17LmQNYCv/JcIkc7kVRR65mDvYWmt9YCg4hMOqLs4JfG7pwVl4zutaDArvBes8uNvOQPAqoGMBCk51X83qf2uTNw0AbHdFaKHvQENWcYLBI5NCJlk2X+jtFNdQJk3+epl0Jl4/PDsOaX1fMrRaOxohrHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030104; c=relaxed/simple;
	bh=ott/e/PsVQ7ftOVMoDZvH/I1/494RVUTk6InVE/vBKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zhl9Y7ban5cArzEwlVRHXn6uC6qDBbzFSVxdiT1UURBRV/oVBKvH18uLzUfZn8gZxe+qDLu062HA34PSGJQubwswp1GcjeHQp6TUl964hpJIh0Nnce6b4oV8LEX/i+szPiINzSJ+oA5yjqvxOtCriDq/+nSwrdirhEz66StOAY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZJeYkNh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZJeYkNh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9C45C2BCFF;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=ott/e/PsVQ7ftOVMoDZvH/I1/494RVUTk6InVE/vBKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DZJeYkNh5/Zqu+LUlcJ9qLgv5Bv5kM2jZXGCvVNN6qSAQbjYLvGyknQwkJWysoSAF
	 cV21zUOBr1oWcM08vfBlL7nIeBL/dKiZ85K/JcIaBOKbsNpBKjgnsIuPebH0zRnfgM
	 yuBBp2bO9Kr28uiAZPj0n8SBZPMji65jp0KIJxfmRWvvXOlrftVk0MP1vnFk11i1iH
	 M4RebIgvMkOZQsLM/0reoaiqrynZxynk6uHcCWISYL+S47mpEgsQq834Gz0dWqtKXU
	 9EtLPyDEhM8bBGP5aU6is4+zObl6uuroeZ2frMRVdnpI+iDAwSAugP15GNjRVn/kyu
	 jlZiOCXYRF/bA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D231AC44502;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:19 +0200
Subject: [PATCH 04/12] arm64: dts: rockchip: rk3588s-nanopi: add missing
 sdmmc cd pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-4-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=1037;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=RwYpiB/RtND/z6LPjHWK2wsSxC8Q0Qs9K3NgIPhkNgo=;
 b=XisTuZZGCV1AVfD+TzkRzyHXLHFHpBImklosu4XKYZv5/Dji/tqIl2PXldu3LKtNebjAStaiP
 eLSoD9/PhqYD/Ji28zIJlxCjd6ItJt3v5tF7laDFKxZK9Wp8k4aOPCG
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The cd (card detect) pin is used, but not reserved through pinctrl.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index d41c49716fa2..a8f32b994b10 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -336,6 +336,10 @@ rtc_int: rtc-int {
 	};
 
 	sdmmc {
+		sdmmc_det_pin: sdmmc-det-pin {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		sd_s0_pwr: sd-s0-pwr {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
@@ -407,6 +411,8 @@ &sdmmc {
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


