Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570140;
	b=p2FigjbYHmm0Gnw+iv7G7efjgJKqiAlYtJfg5moh2GXxNJPTcAXcmbGrFgSqToqIqb+Q
	 xn+jbuxTHLuscoU0mICKykkLebpcyCYmT4P5c00XzXoi7utKz7dMsbQaFQADAJc4RJttS
	 Gsb7u7KIpkZfZJ5gB9MmjwOzAwW6c8V7yTcE+KbMHlLGJb14/qG2xEPumKzH+HdWR0ANT
	 /hkm9cvUCQRHl1p6qNk/HIWYd0xxD2OTJEEWlWWJ1HrzxFxqIHBbA1+W/fGc5Ag/18wza
	 w/1C68Nqd9zYpFuUHGVpoLVTTcsV19skZ9touFrcdf2dBDPTIZ3weFyjyZpkAVRuAkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570140;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cmJQY6CxCO3fQ2jSfuT5Em1eTV8/b6tChqwuIbfXg0k=;
	b=086R9K0tMJ2z2Bea9axeXtuaD4FECXDpQS3eCV4witawljuDukF1QlMfktHDO7KOJ/43
	 oxyWLoH7Fz5rMMj0qzYIyxIJF2p/FGzPvUeXl+2UDkiD3gMVf34zgT7Ub15SgD+MXRhFa
	 WOIFHWgxTKIdr1B7bFP6bYxdHmZLv9LVzj8pHfqd5Xh/8jlPQjImm2DKTIRkvmdWhm+Hc
	 pGWEWOWFqR0jTe2fzDHLF5+ZybTlEkb7zhQBdF/++gdSUPM6/At1kck0Z9TCaTeOlWsh2
	 03ZRZAdqVRHhWFcXa5j0u0EqIXhI4BrOpcV7MYGUz9kU4a6UQHlj7AIywZkWxAGwCyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhbNHBH2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AAD606A33B
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhbNHBH2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570140;
	b=HE8T4laifIOhhymSk/SkJR8lutbIjAHhAipv9DG5o+z+L9feYqZYiDkC3CE/pOQe10cM
	 Gabu4a01NiUjzT/zbVsd+uORiJgvLqXfiBNA4c/BZKlOMFbN9B6mTgvbU0rM1fti/vOuh
	 PYc7ku4ezJhOcL+krFv3l1tsqaxZl+YEBTGhCXIhs0dRGaTg/FHrjuwU964T+1Nk2PsRi
	 W4+OBmlmFKvS4TZskZkXlja1dm8BXiR+RFWDyJWqI1nnUJhkGbWqKhXSarspQVv41W2qe
	 UiA7EtCCF4F9qLVT6O4goavy6AgJOZfgk3/r+4521lbemQg73QSia640J3KaQobATNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570140;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cmJQY6CxCO3fQ2jSfuT5Em1eTV8/b6tChqwuIbfXg0k=;
	b=PIDbD7uuvuSosoFeiPLOtP1k6vrHot4Fs2fuMAOTweHo25t33NpVXrJLK1qHqY2wODu5
	 M0zJO6+C56mKksiGxOO5Tkm/qJEqKMt8y3UrqcR3K2yM3X5H2NpC9P3w2U/IrhnflaYtq
	 xOkhvTbu7ySNbO2DYVx7jsL7d08lDg+BxtcS2nIuEuEjvbkOyD6AuXAY61MpUa34Q+3Oe
	 SWU/fLbtcX0eqTxb4P7ZT4OusaBfCzrEwvearyvuSiRLKRNivdKFI4UNs5NTv8qelLyrt
	 swKQ0swW0+ZC58HIKDPGsjbRQdREbjvWrWIsbWJ3EzYpN+gXfWQ12mvrWlurndjm6zA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46E121F00A23;
	Sun,  1 Nov 2026 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570139;
	bh=cmJQY6CxCO3fQ2jSfuT5Em1eTV8/b6tChqwuIbfXg0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KhbNHBH2IjZlCBMMlA++mDIJwnKr7502Rf25KKp/ni1YWn+E+w4spl6VaZQPte5AY
	 e6wNHFT9D+lWNbK8QIMMP+SpnjTLX7/sfDc39FUW+4jQt8d8gP4iSxAjNoQOBKl7dE
	 qMdCCHKpfk302QIkt2flAeFo6OZgbCqoabdBZIafIMUobPRgso3N1pUiftzwZUT3ys
	 D7CaC+XP6ot97Z002O8B1pfrhKCeodic22ZsRyiuAWj51uezSSNR3B2oYri2EGCXYo
	 aEsPpviK35NzNShxMNE4C/M+XjtHxTNS73T7SC99Sh48f2uL9iDcZfTPigFDJyEzR8
	 Q8LXscn3g7PeA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 57A30462B0;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:27 +0100
Subject: [PATCH v2 9/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename
 pcie2 power rail
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6-improvements-v2-9-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1400;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=TfFgiB4giRKaTgnfoPfRrHvibM40sDP9g/fpZx+5ABA=;
 b=tqqvqzg0Se8NS6bMEPELSeJOETbOX++VJ7/RYUqJW/nYfjTmCYw6EMg9XAvCV27rKl3wWj/sM
 fty2BA5qa8xAHxYiCjP1bc6WgiJEr1bxwwh6ra2oJyeae3dAJCHyUTh
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

vcc3v3_pcie matches the signal name in the schematics, which simplifies
cross-referencing.

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
index ca115d8e108a7..dd61c61fe7d7c 100644
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


