Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C06A44E648
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470626; cv=none; b=Pw13Q8A+Tac2at/D5UOX1Aud7z1M4Vit+Vq1AAMJoxZfd1f8zqpVKsZq25NIz8Wk0Nfoa6Br98n53gm3r6XrYXdfmmxtcwrGJ/SOm6LxxlSzLmsuCzZcZq2gXUqvR7+xJ2WsvX5reUYQZadULNr6iX4Zo6HV71anIbh4ASoBy/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470626; c=relaxed/simple;
	bh=EbrpFXcP7WqS/VSdLWd1gn6iHNZnciSa+KGonGeazdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgvnaZ2mTZ4cL02K3AbdZn1QULH10tYF9SnlvrGkCtgjeNlfhExbI+4Vezsakr3OBs+5nWGK9a0TNJobcPvNeReHz/r02+vvTIjk/Q6HFesV0hhAnZ6VT6jlkfHkSPmBxg1D/7sOe4AEodQ1D6Q4lLCp9EIz0ovEiLEhfo92iA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCO5CRD2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCO5CRD2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 599ACC2BD01;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788470626;
	bh=EbrpFXcP7WqS/VSdLWd1gn6iHNZnciSa+KGonGeazdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JCO5CRD2oUBPcsXtxsbPyHL8umMpuFc++503qKNJrjTWg7aSrGGWgc52GGFLNagO/
	 EAFbs0qeO9SZmhp92PRRUsVEHI7szGsa39pXxv3NALuTdq4pjbbKZ45uz/6Z91xJab
	 R6uYKMoYupiZ+WaF0FtWych0EadUQq/+eYRKeNMUpS9RDv+6yGwNq8nAXBtF4gUokv
	 5K7an9ToMcBe/2sdQas8JWaMxX5qe6m/ApLjGtWyAh9tmkzANfZwNaeCcIv4TYAJ98
	 ss2TjwJdzirArIFDFV+7jhNXaztzQR2VEkNM3Xa2DRnkfwA2l7+QrpN9XGW9BeFjId
	 Nnb/9SLhmPDEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43030C624DB;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Thu, 03 Sep 2026 23:23:16 +0200
Subject: [PATCH v6 04/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 pull up on rtc int pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-nanopi-m6-v6-4-37416bbd6862@gmail.com>
References: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
In-Reply-To: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788470611; l=849;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=bOUJsEUkqBQ7tLIttYbDSPYSPt/SU6MVMp2Nx20LXH8=;
 b=M7yWuF50oFtxgqjBxoyFM3rg/PPm8GVwLNk2Ot/cAT5B3uwoCJugIYSKvyac8w0NDw9i8P/rG
 tF2edHRcShwBzWMqZKxqK5CENm1f5jGbzCoLUVHRi5HLRTUDjBWPezI
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
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 5bbd5d2fc5fa..f2b15e03d5ef 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -420,7 +420,7 @@ hdmi0_tx_on_h: hdmi0-tx-on-h {
 
 	hym8563 {
 		rtc_int: rtc-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

-- 
2.55.0


