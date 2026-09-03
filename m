Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB314F472A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470626; cv=none; b=LXo63UCHHwqDZ3J7veIHUbYe/7gpVgQ6aadvef/g3Z3PJWu7tK1pwqTGhSaF6Gg919EFgyTsBss2EytzTTr4eZbD5Jp/AVlvBKmhEDRIoxZyR9EM1FMA4/ehF7RZOPbUDeqWv0w2lOb7fJuzk74ulikmCBwjtMoH9hs7Yj+VoGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470626; c=relaxed/simple;
	bh=e8RxcI546sOw6dKd9jhge2VIPPNAJRF1IbocAwcj5gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAlM9nmMz579xnh91k6jyrYtBc6/JBRzRPlQgjAB5m9B+XWtYa7nSvJa0rlSJvmbM6UbuRkUWdyDDytcCyu+Qpt72hXwRPAOPlKdBtC/4Pc/1QDo3TNgKMvFRSu8hGEjsQIOM8a8IbSwQvfbpwerq2bvTKRcMU68SxeEnUb72iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o89RKJr2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o89RKJr2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6285C2BCB8;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788470626;
	bh=e8RxcI546sOw6dKd9jhge2VIPPNAJRF1IbocAwcj5gI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o89RKJr2KFnppN2qIUIwqx2KwVUPu4mHeiWwmCzdDlbRqlGel8FInNDwDTlk0EewB
	 yPzd3SQ12gfgeYE6yRxoekQTh/HGxP8kkYwGv0E0WSM0k8YqoUOmjVdozE7meNQomC
	 vWiXPxivjJkoW+k/iaaXUVMUyr+iAaTUaawG08fT/4Lf5sgiguEfkgQnaqjr+fYZRZ
	 lBYlvdEHM5I1vxEquujWkg/JdN3gg8MC4EbI/6mX+irkBXkYWl7C8uZT6KCy0bC+4g
	 Q5j2XcmsFnMKnfUt5HYmmiDeZxVTNpol2SrUOjJzD+Xy2eSiRXK5PXW5n+nvu8UfAV
	 B6t1/GwKNC18g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DA4C79F81;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Thu, 03 Sep 2026 23:23:22 +0200
Subject: [PATCH v6 10/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 comment about gmac phy-mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-nanopi-m6-v6-10-37416bbd6862@gmail.com>
References: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
In-Reply-To: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788470612; l=906;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=W9OP4Riybt39A0bIhFgCbk7q5TKSgnKTP3QXL026djI=;
 b=X45i6lJzWBlp05s9gXNgNlJHSk81RhKn4xfFxbtHowlF0C+EJYmAjTu1xmXHl8Z4gueHvOV1R
 KQE5Kx651A5Arhzsguy3h3Y+76G0f5ZpC3KxgFNPY5eKfTqeG1k/v4e
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Add comment to explain rgmii-rxid phy-mode usage. Note that the actual
delay in ns is not known. The tx_delay value of 0x42 comes from vendor
DT.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 5a42e7dadc92..94f218a48078 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -199,7 +199,7 @@ &cpu_l3 {
 &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
-	phy-mode = "rgmii-rxid";
+	phy-mode = "rgmii-rxid"; /* Vendor provided tx delay value below */
 	phy-supply = <&vcc_3v3_s3>;
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2

-- 
2.55.0


