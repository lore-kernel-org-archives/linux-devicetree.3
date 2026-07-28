Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FC942CAE8
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240148; cv=none; b=SqKcib36GZPox6dxOrkY9hSvGAF3dEyZGXVsQmX1ktD36Q7SK3Nx5JCKYI6Nqr9jFZvL68cd9C4GaGD7txLyVwm+S19RnPb+DPmU9q5Am5pIhnJHyItkk3Yj/nOUiBZiWfIbpEwYNkq9hNDT+0l+bKEymkmssxqU9qanHFd38yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240148; c=relaxed/simple;
	bh=EbrpFXcP7WqS/VSdLWd1gn6iHNZnciSa+KGonGeazdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVcHQpf7lPiFa60a0wlcPx4ymSAtBUG54TWp+SDBIn3SJr3KD7kaH0o60tTEkD7UxefZpHXBQ8wLIebU1n7+uqTuKJn8LwqMG/t2nK4A0x5S2kc54SZEXIhDduVhuBMCW2l9EwnC54KcsgchUrk4tHaMUn/1sgDewuRSpeFj/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMTx7/My; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMTx7/My"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99881C2BCFD;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=EbrpFXcP7WqS/VSdLWd1gn6iHNZnciSa+KGonGeazdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BMTx7/My9l5GJ8kNr5BLauKGdXTntpe/zfGAE1XwZbQ1mVHoawoVBig/2q/a9bzhT
	 ASYyjz801IMJ0cRhcyskoy6GzeXYTehn2kx6jytg5ilfKJ89yL7H/8wGGKOLEe8ojG
	 oL/PkWxCp4SshsrK2odLDPNvmcLOPSIaK6XpDtIJ5dQsX9LCGf9lEyYvHJ0oi0R6Or
	 nFU7guAe5KUVCzmWEMbTt0rXQ/cJVgqzxGC8Sc/0+IyRwU/aLkneoL+rw4X/OzzcOg
	 oD0isfSGZnZ7r6+iNkijgJeutW+Ib2mMMzy2NiVLTuYCWvks04E4DNIjUv7KchlEMR
	 kNDmjDtG/zK9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854C9C53219;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:31 +0200
Subject: [PATCH v5 04/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 pull up on rtc int pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-4-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=849;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=bOUJsEUkqBQ7tLIttYbDSPYSPt/SU6MVMp2Nx20LXH8=;
 b=9bt4bDCtK4Zwmkvz2ep1guxs6feuqL3IukHbc6VAMgM2jlFCSkj/fxAYaGKngUcDp4IAWYsEk
 f44ksY6+eUABThBGkQb0+1L07cIEDvStKrOBnmYrRRfgpNIte2WGYoi
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


