Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA663D6663
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721533; cv=none; b=nSjBBm54zswo82dmS9JnNRrJ8vRVBxt5k43qk7J9a+EQVwKJo4ala26TIIo9YLkUTI9SE8faUhsboyl40lBtHxuHllM9Vood0hSm00bI++BZ+qwtMV70Paa0ZjOBLdHh1R6hU3xKdCfUB11b0877XJO+a+fZKftj4sRZPL0/dC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721533; c=relaxed/simple;
	bh=YOA2W9JXwDKffqI911wF2cky112JO3EMFCO6sS+KsJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M88HeTSpfR8nXcCEr1dNAG3dzLmCXd0wjO4ksWO4kokNAV/MHVC6nVkva7tdHZwDc9zDAMFY3P2+vbAbaMLbtgHr+UyMnFHq4svKIud47J3CuYQKJBaqCgAdEYkdN720dCL/SNMf56UWIOLOR9A+3gSGr704IYOvDyvKXMb+c+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCNHKR5r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCNHKR5r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB0AAC2BCFF;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=YOA2W9JXwDKffqI911wF2cky112JO3EMFCO6sS+KsJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WCNHKR5rTCo+Hw95ZeDFGQ291n2eRcFetcdY3k+BYQL2GEBmuZFbZeyTErYa1koIF
	 yE7GCX7ZIyKtYryb/aqw/Nmf4cRfcAuwSSbU8k9GWxoowDeOYCpEWxSYLmQFpleF22
	 6f8fzOeHRYMOnKCN5hNvsbXEIL3MHfRm7nrGrokyrxGeMCS9xFbQ8zi/OpM3seLYgn
	 w2inDbyrHTx93+MKRjCKmSJxtrnC6ETscfmyCrFs8jOJnFZzrrDc42O4k+H6CQvSkH
	 FQ3VWigjnBO1iTXFhAY752OdSID4Dwy+WP1jFTPcnH1XDy0U2pnSUF5DdnbU0BEOV5
	 1mn2sTf2Orlzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA14AC44508;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:58 +0200
Subject: [PATCH v2 09/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 useless vcc_3v3_pcie20
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-9-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=1690;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=4PKV8mGG2KXYxP+JBLeqOMJLeDrA46RkiIfKGdrxAbk=;
 b=kKkC3YXfvu+WyE0n4O6yd9fRnh4PixTkDOCW5qB7cX+eyuh3dOnuIhb2vJGwMAhoQ6WdZjwzU
 UcwA0hFn89yBWRFl1YuTRzwcbGSx+p8pTr0EFNdITKNuH/nLGAvbNGd
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

There is no separate regulator for boards with RTL8125BG MACs.
The power is only separated from VCC_3V3_S3 with a ferrite bead.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 463cfeddf270..e4900af9822a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -86,16 +86,6 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		vin-supply = <&vcc_3v3_s3>;
 	};
 
-	vcc_3v3_pcie20: regulator-vcc3v3-pcie20 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_3v3_pcie20";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3v3_s3>;
-	};
-
 	vcc5v0_usb: regulator-vcc5v0-usb {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_usb";
@@ -305,7 +295,7 @@ &pcie2x1l1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_1_rst>;
 	reset-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc_3v3_pcie20>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
 	status = "okay";
 };
 
@@ -314,7 +304,7 @@ &pcie2x1l2 {
 	pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
 	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc_3v3_pcie20>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
 	status = "okay";
 };
 

-- 
2.55.0


