Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653461;
	b=CKxqU4HPkIbYfABomEOzMF2CXI/LkWnGLyoJ0YgEqG7mkgloYChZOgbY+4XV1ml3mLyq
	 T5Ur7mGbrDZhYDk2q0cCMshRkPR314DvqE3NmMSAh3nTZkAASoUJxm5gr3/ir0cJHp2ct
	 oHYI2SPiSvX8INesSX2uZrtgyqn7KaMbMWM0chz+BDYufI6hHqTGPULsQBgHE8FToahYe
	 3vuOd7KMGGprb7PZWzegLAojt3hu1JN0EUBGgo/XmARr7XsWaR2Lr7g4K6gY9B9X2Op2s
	 jQjCkBeXJlqsnU8O9HXKXPpX+1g1pj6urG6OLrkMRPiXnnPyqTG1zSlu6sN0Zf7airw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653461;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=A+W+M4a0tpMPaBVhwCroEh09aBMO2K9r3DCCzGIO2EE=;
	b=vpX8j1E9n6tmTL9W1Fv9BUb7eiakyUxeuTbGeqEKUEBlCfpNHvsP7M3mI5rnqR2qupbs
	 x+1s7mv0UJJUG+XuNETKX+3yqyYB4iTA4iX5SKCk9Hpi293rjjY43R6edkvrL6qRAZP2r
	 4gpEXdsMO37HJ5Ds0sDGMgg5rokctrnFH/DU9DigiD4ECelT34QLlAQwmNc2zELfZE34g
	 sZMK4eR8BOq5tSdV/1GPxOd0ViQOJoQUMC+DSnQUnbDKJzFiQ+BXxBPFUW0jvLqKlloN3
	 zEW4JtVjM/n1bQWBDCjl2Tq/lpm8OrZbN0pjI1hyS/JRQMNi5ImB83Nk56Rme/y51Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OIOxuI5k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB23E606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OIOxuI5k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA401F000D3;
	Thu, 26 Nov 2026 00:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653461;
	bh=A+W+M4a0tpMPaBVhwCroEh09aBMO2K9r3DCCzGIO2EE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OIOxuI5kWTuT2dzVew/JqyPxNsN7OTFom43hpSbO0xoX8iT7IfrcerLGmELhmDDLQ
	 X5VS49taztvoH3nsc27m7vMVWyPrPd6YQQ3yfwmnjCHdMMQICrz1wuf1jWY90nDGKX
	 CoIGuk0k4WIB2yYTqu5kAFtmP/6lwn8HDeNGrKOYD8G8KM74nqZAFn+mvg1EkYE6ff
	 Mv2yZnZNXsigcdmzQwe8ogyE4UaoClio3OaAtcF5HtEJQm8ogYZHCg2hht+zb8iDZQ
	 bId0vPi7z0ee1Idh0dimzeJSAMUraQmKUjl9KDQ1Mmwu/OpbJHkskdhrh1sx8Z7YGc
	 ifEn9yD6MH0Fw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:19 +0100
Subject: [PATCH 15/20] ARM: dts: ux500: Correct memory-mapped controller
 unit addresses
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-15-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Add missing unit addresses to the PL310 and clock controller and use
lowercase hexadecimal for DMA40. This lets the simple-bus schema
recognize their register properties. Found with CHECK_DTBS=1.

Fixes: f2b56a6b2b07 ("ARM: dts: ste: Align L2 cache-controller nodename with dtschema")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 7bb09b45698d..920d07fbf00e 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -340,7 +340,7 @@ backupram@80150000 {
 			reg = <0x80150000 0x2000>;
 		};
 
-		L2: cache-controller {
+		L2: cache-controller@a0412000 {
 			compatible = "arm,pl310-cache";
 			reg = <0xa0412000 0x1000>;
 			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
@@ -371,7 +371,7 @@ pm_domains: power-controller {
 						 <DOMAIN_B2R2_MCDE>;
 		};
 
-		clocks {
+		clocks@8012f000 {
 			compatible = "stericsson,u8500-clks";
 			/*
 			 * Registers for the CLKRST block on peripheral
@@ -637,7 +637,7 @@ usb_per5@a03e0000 {
 			clocks = <&prcc_pclk 5 0>;
 		};
 
-		dma: dma-controller@801C0000 {
+		dma: dma-controller@801c0000 {
 			compatible = "stericsson,db8500-dma40", "stericsson,dma40";
 			reg = <0x801C0000 0x1000>;
 			reg-names = "base";

-- 
2.56.1

