Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE4342E8C1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240149; cv=none; b=TzDpJqcU1WUbebcGsgTkTmLrGyqFmq5Z7kfGbqGAevIMWBqLxmreyDZHfhkp1dpF6uE8Yz+a66E3PfeqtT5qRQJmNFZf3AGGSdA7TUCfoHA5Tn+DhdVHPMp9rYtVnNI/5bGewXTdyoqPS35adQk5mlvPXq7PQRcRqJ0RZgEJtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240149; c=relaxed/simple;
	bh=Y7h7sGTVhsEzlVMI5TQ4L554qW/IQlnc5Zu2vSWKmDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDWIz/lrbZ434uDfEURwXpJLkwxxh8MACdTB9iQP2TklCQ2lRBswSorrLCuW9pZbT02S5FOmj5wCfqAu0PP+yYDXTQln/eh9pvyo0O67piwNB9IOmSbOGovJem3ZGK0Y8hiiyLykBqO05SgF1vcdRlu/aXfZR6PabkYY7en65PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TC4xzt/c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TC4xzt/c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7BA8C2BCFC;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=Y7h7sGTVhsEzlVMI5TQ4L554qW/IQlnc5Zu2vSWKmDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TC4xzt/chqa2B3Xqlm8wxfI0grrgzoanbjwJHgJrrBDN/trH2+8HQpgbvq+sJEUvp
	 LB9IaVl2cfmDMm/g3hLEqH1/lsNdg8E5zNxASz4L/T0jjwtCvrB6kV12Cu25cQyyrq
	 hAT91MeXQ2jOOyDr7cFtb6ch5FUo5rxypYVYFk9vYTZ2HcbMubEOdUX+M3DRBW/ndK
	 QmRw545fabAzwAv15YGY/Gpm9Pz4wQtDKxsC4Y70U44F1TdE86HEvL9A8gPEtJ5n5P
	 sWXuL+dqf/iZ5eqRB3cN3nB1BXUweIK6ldbvz+ELHrEHLOTCwPlDP4wDhpV5/ISX6e
	 /DBLIDnbJQ1pg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BF9C54F4C;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:33 +0200
Subject: [PATCH v5 06/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 always-on and boot-on from vdd_npu_s0 reg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-6-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=843;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=ZXBLHN8naxHdNPducDxsTIU25a1ogqqtD70keJ0VhC4=;
 b=nTRxx1Mr+epUbe7bpoJ2ci9ntdDeTfr0LmC4XUCbWFbHYbhsIX8jd/J6MTY3DeBMCYSYlIB3b
 WugON0XIxUKD8/bxkfffv+dYRm/9ZK5AQQ3VHoreSgzBvBQtWeB+dGf
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Since the NPU is hooked up in DT, the always-on and boot-on properties
on the regulator isn't needed anymore.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index b120dd98241f..8953dcebb93e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -314,8 +314,6 @@ vdd_npu_s0: regulator@42 {
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
-		regulator-boot-on;
-		regulator-always-on;
 		vin-supply = <&vcc5v0_sys>;
 
 		regulator-state-mem {

-- 
2.55.0


