Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9CA3D6662
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721533; cv=none; b=gDJOMByKJK2wjnjQWRI9yI7xe2+9u8WyrYIxg92NbbYSQyKIz2h5GOMnQEeJggZVQ+U+kXzSSrLG5dtKt67Jc0IYdWMsHc5K25BCk6b15An3Y8yf1saP9XmgSAaWSg5792sjXoUYTUXuA07YjzZzLPGOa1Bg6mXHyvxUtEd2ZOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721533; c=relaxed/simple;
	bh=7kThHoU7NfVa2SrQo4njFM/R/gQef5vJsZCKo0knqPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUcbwvWBd/vdaHepyGAoIgXwaz1oOOm68xIvV/yXofxfmgLZRUQvulms8t7P7pCQRCi2m0u9Fod4Qy66e/iqg0WJuxfGfY/3b7uD0jSRhBcNz1/K4liKYvhy/WNuVvXApVsoO8LBWpcuVym23YZK/V7ERpUu5lUNLiMNpM5kWy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuC0gmQB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuC0gmQB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABB9DC2BCFC;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=7kThHoU7NfVa2SrQo4njFM/R/gQef5vJsZCKo0knqPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TuC0gmQBy8xvI4yZhmmw4iCeFUD0mbcn2HX+O0M2q2XSYdeF68AtyISplxJ9PnHJZ
	 PKPJZUTQwt4GZWzD3TYdEtPro7Ak5YB5a9gsOmSY7CRwsfYE74hs1EuNUnhRXa0eDt
	 /Y1p9MZTUWCi+M9mFSilDm/TG1jjiUZd/XkUhVdNKlL4YxkoQ1D4YaLdjHaXwM5JBA
	 +d/rEsGQe89u7pwTVgiuN8JaWEqEPDiXzibD3TXxPboygCnrTpIskC3ddLBVxirbzF
	 ptWa3dj1xs0wvDqif1TU9qIDFwXqSdUM5gKA8aEa24vUt87svOsPZcRb2Tizdoi+R/
	 j+lNU5qT/vnHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970A7C44508;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:54 +0200
Subject: [PATCH v2 05/12] arm64: dts: rockchip: rk3588s-nanopi: remove pull
 up on rtc int pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-5-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=834;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=8bK9qjPaJeH5DZSNwTRXo86eIiea6f1QVJhbeEdJZoQ=;
 b=yxJ1F6wFUM1wWvQ+bxf+mrLZeZgYWPe5+TwQuiHbYErmcJ7MxBLrQldSkAnRvd724l0f1F1Rz
 kMkm6sLbs+hAuYC8ZDUvfcpi6HeSF1BeHIj8MSzEbxmSFJFRPhaRk3E
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


