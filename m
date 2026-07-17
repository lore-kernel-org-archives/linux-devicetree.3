Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB8B3AFCF2
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272996; cv=none; b=HtS7qpfYSnu5jPKzOTwX75qhLCu++mamKC0E6eOOHl1WpoJr3yDC003nx/pJclpQignSf2ztJoB+m5pALyrRHo6I1P3ISSPQxBQEQ1yWi5jXSW+YeGNRwRJU5byfPLRxkvuJdTH+p7DOcPAbwvJRCvlY6po6YQbRhxg130t4H58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272996; c=relaxed/simple;
	bh=8M5ME01DAx3H/18R/A9EATjtt4h2M0LHA9HSUgIuY8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iA5FuPAJsglEHJlYnuYIA9sxSymJJePqkgHExDIeLDWGNPRXIVkCGwsHNI5kSkOZJC1Z2RQ0AEzZcnf2ftJfC0Fr+fAPwUvm/p2KF8a/wpy7HCk60dNl2+pzb2ty/epWGYXZjaL3VvWQR7XOiVA/QYUQqtOENk3wrvEVRn1B14s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGQ+Gdd+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGQ+Gdd+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66865C2BCFF;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784272996;
	bh=8M5ME01DAx3H/18R/A9EATjtt4h2M0LHA9HSUgIuY8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CGQ+Gdd+X1QfFCjsdzaIKEKN74zxe+hH41qR40daN1iY8pBjvuLEBBCTx4Xq/pQIx
	 n5e1WDstGbNz/9oYOKyAcZnUWv7xt8TfY/xKjiI/L6mqE1bjBhx67nRLN5BMTmRI7m
	 vtm4Oi0XSbVZkaJcwED+9ExykrRtqoVEYTIUIuKUaVAUx2eBm66KnAV9UUsajFpbwH
	 GCDxpnxMflAVQoFFp2MhB9euaUDINlfzdekNN0PGUSMmxYR/w3yM2oeIZexSr72OY6
	 vzqHA5krmwhIKUlz27LYfXEhE/8ONWuyuSBgHrMeRcy1gTOEfJY9oJWz2sxACJQ7zw
	 HuFPN9jjVOe/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5408AC4451E;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 09:23:08 +0200
Subject: [PATCH v4 10/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 comment to gmac phy-mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-nanopi-m6-v4-10-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
In-Reply-To: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784272993; l=906;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=QZV8naTWO4Z+iXnYHi+nrsqgVGR4DEKSmwg8FlaLRgw=;
 b=tYfTv2yqkLDSCkvEfKNfqWf4ODEA0oGLjxqwQ3om+1OaOzCTUsXFk+DHDoF59UnrYdmlmQ+Q8
 M9u7GalHOMSCHe8lioqgjjBQeeGGoEfEr+UbJsnpKzP7bJ8iKTiU0Y5
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
index 309cac8902db..b33e7b15d05e 100644
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


