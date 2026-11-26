Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653464;
	b=T9WsacdxsYuW82+AALhKmRXHLITicmeX0nb2FL5LsRjvkwQk3LLGVxbvJn+5A5HVuUD9
	 GnbYMqTmOCczwD/RrA/gkJ3RHO7uYVLK70+zHAyB7Fjnmh/79GVb4Elpgl23YgQBMrgm0
	 IU/p+0h+geqbel4+oFv+m9q20LhfrwvseKWp075Q2EsiycphXE2kwf97JrlfWPvhOjxy/
	 gaoylT/lSpUGP/WrCnc0LiBt0ASg0fJfHbo8vpYFCYyI08l2EoBrhRN+OFY0qKmP4ZHEn
	 BdIFxNayMEqWoUdhLkTAMDNCKPzKML49CZ3mkSikzvbI/zAzBnDlosWB+veavXsXszQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653464;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=6MbADn505QBr7VWegQW68Bv7f/hrrQJTBJ9au0Y29No=;
	b=bkfxREHp/wesp82HYM6mMybyXsDa9LR/KpjQ9Evr7Bw38KaBUQ61oLuSuAby4PWtaxD+
	 k2m3aZtVxejiKJM0U3WmqW9QjnjKMqffvL6RrkJ9yDlFadA3272hGMLngKxjUy7qIZShW
	 Q7aJGDqN6oOPsghU6QkRTk3wYhJNCNhKmarfXVRnYGiJM2BFVb4klIA32bkP+BBRUZpWX
	 8odvT4o8EkFNs5+mYdrRCMRfrL6gcUrne3hfqh6rTpF2BjdPhxe57ax1IOSt32o7L7637
	 D70uGSNwz1bURFsc8yd6+lfwoKk38ODL2srctIl6KzLau0TyEeuLtWFYkz654xXLoag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1sJNk0y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F930606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1sJNk0y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0541F000C4;
	Thu, 26 Nov 2026 00:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653463;
	bh=6MbADn505QBr7VWegQW68Bv7f/hrrQJTBJ9au0Y29No=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h1sJNk0y4wXdpnPmLBP4VRrkMCTqxe+PyuNu0XJNsA3gHAtFqZgmPjLGM7kZvfpRT
	 Zudpwv34wgTQMtp5JKssghDurcZ6z8MVimVk/iQGsQflnqriLsjchUq+k3MbuCGn4D
	 AuSw7/YxgAFhqZVfsiASa/QtM2jjCI0TTzdzpNmnzdBKnqaBxhKOI/Y0Fp47SCEPkf
	 L3nifwud4YOJmt9Nb4tbnX5k4fvQNsdXSTUFtvyhq2MBgMK6iHWfHaBSGlkNCTD3sY
	 0xM89BuMagjdGQoIRsKjRrTiqoQHLNg8VASB3VbLt6lLVjXEQm79reozNuT5B+d+UE
	 Af+WsN3GceaqQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:20 +0100
Subject: [PATCH 16/20] ARM: dts: nomadik: Correct the camera I2C unit
 address
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-16-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The camera node has reg = <0x10>. Match its node name to that address
to fix the I2C bus warning exposed by the controller node rename.
Found with W=1 CHECK_DTBS=1.

Fixes: 09e02f4d1d3b ("ARM: nomadik: add I2C devices to the device tree")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
index f635af262d96..4eba7c943368 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
@@ -728,7 +728,7 @@ i2c-1 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c1_default_mux>, <&i2c1_default_mode>;
 
-		camera@2d {
+		camera@10 {
 			   compatible = "st,camera";
 			   reg = <0x10>;
 		};

-- 
2.56.1

