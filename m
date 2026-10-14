Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1B8560ABF
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995687; cv=none; b=R3Z16tQsoUqT56tyXk/q2rRWKgbbWXNjebtk9FoP48mE1cee6sMbvRmTpbK+yCcM6fzofy/SjhXcJ1/rbumwJO6qbDq13lbBA3EMl94BV+rL3m3199+7uaADszExs/SzrUvhFEFPZaWEnNGTflY42jjUYo7BZOYtkE8orG+2Ihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995687; c=relaxed/simple;
	bh=K8zjjQF5yT+P0g5cD5EJ3sZntjAqtwV3y6uaav5MeLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzzoRBTdO2j/8caDydOWWtnEqQ8iYV0e2HT9wMp/aN/hL4ZKGiivFxJQSszqATC0YWuR6cw2KGGKjv0PDDstAVJlbPejnWNi0aIZLoADayKG+MZlwxTGPtwQk8bw9DT4mh5l/aNtvdRMxX9HuGGwgelmJluBst0juwPY6D37NQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dupVvL7j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dupVvL7j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05E31C2BCFD;
	Wed, 14 Oct 2026 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995687;
	bh=K8zjjQF5yT+P0g5cD5EJ3sZntjAqtwV3y6uaav5MeLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dupVvL7jK0tZTW+Dl5XkC7hQJ2qJe6LwpUX2gbWEjdSLNU5uNfFYIm64q0BcBLsrl
	 nFzbm2HZCEPkWuiPgdvHAU/bNv8JL+PlXLexvh7jgJyGmUtU4wwjddmRu8zNX0adbf
	 tCW6pBpGwpeCa41No0aTsMBUP6dnoR/tr5v9ko0SxK1i/ticQkJc3ptIEBJW3NHuo3
	 4ZACFsCX+DAL4Ujm6eySpFBnpPzgoy6acLjxl/rwuiM6gQrFXFLEtkMJmkNTNY+rKF
	 WyMw8hfvg4esirRsVtBiAMUAT5/Zj2MdlMcgDxhS3HBCwxguQ+K1nIUfihbh1P+4M5
	 GygRhV5eXFV7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98B3CC6B1A;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:09 +0200
Subject: [PATCH 9/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2
 power rail
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-9-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1347;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=sa5+w9akUhc5UnYTeKWIOEz5rjtnoSRpmbzGcB+u7yU=;
 b=S9y6ZtmyOvHQtvQQ3RbtPmpquB7+uHS1JIHD0tDq1fzByb33nuRGpCC0nLBIpHPgHT7gRSFlw
 ZK6IvbFglwhCPJUDKZ/dwkjDGARX5g1LfxqTfkoYkjluFxMTCoAC9ar
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

vcc3v3_pcie matches the signal name in the schematics, which simplifies
cross-referencing.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
index ca115d8e108a..dd61c61fe7d7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
@@ -36,13 +36,13 @@ user_led: led-1 {
 		};
 	};
 
-	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
+	vcc3v3_pcie: regulator-vcc3v3-pcie {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie20x1_2_con_pwren>;
-		regulator-name = "vcc_3v3_pcie";
+		regulator-name = "vcc3v3_pcie";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc5v0_sys>;
@@ -95,7 +95,7 @@ &pcie2x1l1 { /* M.2 E-key 2230 */
 
 &pcie2x1l2 { /* M.2 M-key 2280 */
 	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>, <&pcie20x1m0_waken>;
-	vpcie3v3-supply = <&vcc_3v3_pcie>;
+	vpcie3v3-supply = <&vcc3v3_pcie>;
 };
 
 &pinctrl {

-- 
2.56.0


