Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4E63546DE
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974653; cv=none; b=erF5sAaehdkrqE82q0xUC26r5X3MNj8OeGp+zwYsiQS7QHyH7aqgOc9oh7u9NCTGpxDGLrDyKqG2fnSFOd6GLflFPyuTkx5eFFHmKM7azjF0mpsWs+0A//pq2kNx0wi8jHuy1Z0ImV8/A2Jtr6use6OUOFbtrC1ry4t23dAQUWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974653; c=relaxed/simple;
	bh=dNHFrJHLOWSVQj0VAgfx0bbF4tQ7AtO+Nvl4xC2rWdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtSGSm9i+gR1j8kCUkLKJ7arqAPVMfQYPeSCdfq+ildQWYBiE7lpeH8WLprQwc8IPH5qM13xQ2IYqCCMkpGGvBAFhQK0Ll5jiUKBQO5KIFaeGKrz3UFY38CXaUQIBT6+WLaCE6AFPwmLlwjC2a7mBKJeQssBqHuVxvf7ptvIyaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpbh6x9d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpbh6x9d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7559C4AF0C;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974652;
	bh=dNHFrJHLOWSVQj0VAgfx0bbF4tQ7AtO+Nvl4xC2rWdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fpbh6x9dOfNDjCOZEpV8Lnxg84q/sKKX/uJ+NPCnQ5rokPXgEUQncQBV42US8RzxI
	 xVPDnl1KEGKn1YISKPgwwcc3vI8+A1SFD3ByYjz0ufwgJP7cLzFsAeGTP7VMBBfXKh
	 Xr1H6JMaUYEDOMzSAKkO0hp0ls63m70nX6F36RjaT+WQikY9cVc7TbNl/7gb4lc0hV
	 IvbHc+njjLxrY0n/OvyNTM34BUGrDLVPzWbn8T0MFSTj8KUqJnqNrSHcI1ZCOkKNVq
	 linbxXVuihs63GIrAdxRlTGGDVbuPn2VB0WvV0r3FjVjDYkmqZNRwgRPowtmFdrzO0
	 PGMGdtqotX2Yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6206C4450A;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:08 +0200
Subject: [PATCH v3 04/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 pull up on rtc int pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-4-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=849;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=jqJ2696lj9Hvn5Qt/ZOAsC9oB80HacDgq2t74caeHkU=;
 b=yHIR6cVYA1kZqzGRC1L0u5WzEfWH5iTjy1L3y3AWY6M5iZN0WnLoN6Va1HiTkl607AvKiK4ON
 y6YCo/mjNRMChMbIVY+nZYRMZDfab/ZPSdXM0IcJBsrLPTuwu8x+BUX
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
index 8df6e1a21180..3f04b988ec29 100644
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


