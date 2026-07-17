Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F643DD533
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272996; cv=none; b=koU7ZM7ZFNEvWF2BEHa6/BUpghXmN+J6JUQJ+mIOerzAE9Rf05Zbad0NS8emh+nSIStKPx9gWPK4TuHcXXOzC2UuPzt5RCJ4XLWIVSUpPUwuGQ0y2vqMw4h9sxui/B0HYV0D69OLAheUVad12VdKrgJ8jjUe9+FwYaKhYuw9DQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272996; c=relaxed/simple;
	bh=Qt+euM/zsTwnrwWBdeY4FC/bLGntnRxL7BQX8au6CKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfxSQh0mCqc6Id9JQr4UYG0FSjXjVMHXqhp/irrcSc7j3s+L2/wdBxxqiAtvIbx4VlgywcfuxSdL+xerUGRW63M/ewP9/9Xp8TIYtK33Umle6lNYBT24c+QLh1P8qpikRLAPvyUT6PG/3/s2V/8nrLSyI/4aQRcBbZhG1EWpNz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jH64hN5D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jH64hN5D"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21C78C2BCFC;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784272996;
	bh=Qt+euM/zsTwnrwWBdeY4FC/bLGntnRxL7BQX8au6CKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jH64hN5DYQkmaBRqxJu14Ncc14PNNL57PEN2J5rxwd0IlZPvD/BCGhEps4OedLWEu
	 EAQWVcjPaN6UsiB9u7KtzAgDTeqvG0mPrkK/H5RKI5wQLCVcYV/fzfE3AfVJoqLf4y
	 IMhi1ldMo3ByVOpVD2nneU2OLefKsHdH1IB1xrDsJIozORgs8cls8dA1xwLkJiCFmb
	 1AQroJY1Ol1wKzwRLdgV+5k1XIok7Y7rmIS/Tj+rOnRBQt08Y94NNwhGnJeSxyvfIf
	 Edonm2KzpzFYmrDMQLTkkK7mw5dyU/awVDI+M0PFt75hsIofj7sA7RcFH9yPOHJijX
	 32DV0vhVJA9Tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BCDC4451C;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 09:23:03 +0200
Subject: [PATCH v4 05/12] arm64: dts: rockchip: rk3588s-nanopi-r6:
 pcie2x1l2: add clkreq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-nanopi-m6-v4-5-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
In-Reply-To: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784272993; l=850;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=nF39hGlVSZHnYtpnr/CKnQCddKMnmwHJRd/YxWqnHvs=;
 b=hPlkGdUmpom30Nh5CWQSLEMKoJ0lIlRnDVSU/17ctCLjZrTLchi7rADG+z12fYodZ/UkSAtZ2
 /quy3N7M6QEC1kKU0oIjdUOTZM7nSequV+MKXi1i8KTsQxZvxOGRyKl
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The clkreq is present on the board, so hook it up in DT.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 2d3ebcb9cb22..b115852ca13b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -369,7 +369,8 @@ &pcie2x1l1 {
 
 &pcie2x1l2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie20x1_2_perstn_m0>;
+	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";

-- 
2.55.0


