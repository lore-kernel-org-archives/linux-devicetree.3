Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E43B895D
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030104; cv=none; b=sB/BBy+z0ej8X9pul35QNRbSPznIQw3a3XOcvd/OsIuB4u9iZFTuZfdFPApvfWTSCV0IaAJvpfcHCj791tuM3MgXTVa3RK4szUx89fYkmBQfHla/oOQQRhyDwz7E+2wS2F4kneMMOFW7hoSO14sSKEqlJP8hsZ/7MMUNg6pp70M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030104; c=relaxed/simple;
	bh=7kThHoU7NfVa2SrQo4njFM/R/gQef5vJsZCKo0knqPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lA48KDlwmGijm1wwqaN1/5ZeZZrNKX1LBqgRSEhp9C5v6OKsZ8XDa8QCokPBm+hci++vEM1OJK1HUpKwB1T1SEpYsWtCGh9k+AeHAb3y7Ux0Yed2ug/GtLrHHQSkyEemVoxW9Zodhwx5MgVf9/h1G40vwST6qXhGH4unvT1XJho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBJxSZPG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBJxSZPG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02DF4C2BCFB;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=7kThHoU7NfVa2SrQo4njFM/R/gQef5vJsZCKo0knqPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JBJxSZPG0d7reF9bn82RBCFkm1ikQdVMZMIUQ/C9NxWs3Y9AZevqwmDhCDEy3U6r7
	 NHgBQx+wk5AqZLveOppc5dwYSsQQhKhbMgwHRsnr4pLxMbO49pQ4Dk3yk5I2pSeiBp
	 MIjs4nD6pEXgwWo15Q/FASJBqPAxyMSiGQw4gwzYYOuLIf39iIe8Iu6GavCUCY2Ry6
	 opn0SiqONkMpCyeucS0CJ+Jb584DutugtajZSsPnqTQyJ9pCEPOjTq/CNKJGRTm29h
	 qzdWoB4nSPfNOO2ZEivAUFqEiKEpsf+hFmS8Q+pCwgIa6+Q+1t4Ki1e1drKWP6Gb98
	 V81TjYhFRQ6vQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E003CC43458;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:20 +0200
Subject: [PATCH 05/12] arm64: dts: rockchip: rk3588s-nanopi: remove pull up
 on rtc int pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-5-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=834;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=8bK9qjPaJeH5DZSNwTRXo86eIiea6f1QVJhbeEdJZoQ=;
 b=M5GvjoFyQM7vUcv4AXzMBIyLW12TYwl8mVGascoP4M00Q2BaUYDMtdimfvixcMc8xzO7TkPGJ
 7PmAFnjndqCD/ZRy81pvbPOYbFrDWpYQbypzevbLnAgFXq/TWJRJWUI
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

All boards in the RK3588S NanoPi familiy has a pull on the PCB for the
RTC interrupt pin. So there is no need to enable the pull-up in the SoC.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index a8f32b994b10..f3a240b48a2a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -331,7 +331,7 @@ hdmi0_tx_on_h: hdmi0-tx-on-h {
 
 	hym8563 {
 		rtc_int: rtc-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

-- 
2.55.0


