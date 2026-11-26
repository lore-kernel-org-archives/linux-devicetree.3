Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653471;
	b=JYbZeVz8/V7H8aMfTiqT8/a0NAzOYOflhqaqwGve29+fKTurWA9891Z/RjNdsC1K9YTJ
	 ap/uX1BzkynETwh4SBLyw1TCP66LPxZ6uK7WLW6JA1ap/mKmXEltfNkZ3NoeD1n9DDU1c
	 2lJvZTJ1hkQJ6dae6RKUfbELqkWU5zcQ59p2C2w3Xcj/bxEnkHcTRYN56R67BDlM4CTDA
	 3fcwhWMzLh/U0x0GD7dMZxMfdYhc5aZ6StIfNV60FRFIIekx7C5V+Mze6ni2BBoficMEO
	 KQ5kj9AcafmGd6knWsXY6pjksPkGC4lWiBtoVlXnCnIcJCGhH+AqjU60YolviK/0qeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653471;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=OmYvrk70HOhmdcTLj1sUQ7ohQ8C0dQzLT9pRzuSGOAU=;
	b=oU/zYru1UukFCEgmtbqhPmghWKXNonGhTdzcJ13em6pws+uRppuh79hceNbiu3Kv6Xna
	 gKe28UE7nDZAZSpiVzCkze3FPeJKethc4wOH2+b6FI10Glq4S7Lhx3YaLwmt+p7P1dA5l
	 uiDl3iKg5QPBPEcuUjtIGODqny16DiSA+9MOuuJ9gFyDX5CIWTa82f3cDv8OQR4ZzmAK8
	 uDCkZGC+evlbY6BlJEsyPkjBleYpkgjxo079GyQrHeiEi0I05LjXDDl3Q0mkxUU9jUUmi
	 WggWOPU3BYSgusKeiYZVAOj307C5nWh9xK2X4LOCSMiWPUS4crWQImWe11K4WXxGiOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iX4cpx0L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C608F606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iX4cpx0L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4C41F000C6;
	Thu, 26 Nov 2026 00:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653471;
	bh=OmYvrk70HOhmdcTLj1sUQ7ohQ8C0dQzLT9pRzuSGOAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iX4cpx0LcdjhSQpTeD2Nb/elqkdSQRXfv/ReZNHItM+zAUl7mgvOOzXokBAuHnaIZ
	 yNdspXUj1EhBaFpS959APk1CsuwCCgS2TXJ6kWJoWqlu9VOyEdjBgaRTcV3cGjNf0Z
	 TgZz9UmqHgl/pSar/fMX8er1OstePpufMRqAUep0l8Dfw+npH627kBnfmm++/o49oO
	 Uc0st9qkS7GuSvOtsRUpknJpKhB77i82bW0hGAExMD5TRYJOLSyGCIh2R/ovYCAND/
	 1gMJalupwqiZ3BQ7dqY6nEQRHVCbCCSribzLZs9L7OTFz3BVGPXNPNQ8G/YCQygj4p
	 9HXNmOVs3soRQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:24 +0100
Subject: [PATCH 20/20] ARM: dts: ux500: Connect the AB8500 ULP PLL supply
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-20-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Connect the AB8500 clock controller to its VintCore12 regulator. The
ULP PLL draws power from this rail regardless of which board uses the
PMIC, so describe the connection in the common AB8500 include.

Codex assisted with the device tree update.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ab8500.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/ste-ab8500.dtsi b/arch/arm/boot/dts/st/ste-ab8500.dtsi
index 03cee37ae478..30c3870c6cea 100644
--- a/arch/arm/boot/dts/st/ste-ab8500.dtsi
+++ b/arch/arm/boot/dts/st/ste-ab8500.dtsi
@@ -34,6 +34,7 @@ ab8500 {
 				ab8500_clock: clock-controller {
 					compatible = "stericsson,ab8500-clk";
 					#clock-cells = <1>;
+					vintcore-supply = <&ab8500_ldo_intcore_reg>;
 				};
 
 				ab8500_gpio: gpio {

-- 
2.56.1

