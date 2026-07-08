Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66A540242D;
	Wed,  8 Jul 2026 22:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549510; cv=none; b=Uk4G+jjIn5AfGvuw0lUHvdIwsT1dvyy6EYMUE3vCHhIf7Ia/LqbjlRbpXC86hXyUttkbv9hayGKZ6BB02pNnY1kwqzjiuS4HeRvl2g4FLcfDeRNrymXdCFLqf128uytUWIe+uwhpIuTgXTOgfWFXWyWVMbterzyvWWuONJXuJp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549510; c=relaxed/simple;
	bh=t0dxFT0Qa4zqK/8traSJc+pUMOrfCQ5mFFMIt32sS8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=raQfkIiHxT1XcupP5LSxK71mW9N/FAI+FPUJ2EvFBLPPtKxk91w7OLPfEq4zPe3atK6riDVxS04bRsbOHTJf/uI22VVdgzdMZvpdyzI4RuGgXWTu9HY4sa7+MOIpq4cgFXq1OKYINQgUuo8LQQ49C0Bpu3RN085N5k57tVbxR0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ut0hY5DY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ut0hY5DY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF971F000E9;
	Wed,  8 Jul 2026 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783549509;
	bh=oAE7KuHcbYdI24x5VMTp+PIHL311ilvREmVKh4uXwos=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ut0hY5DYQ2RIOniDc3GH7aZTRr7UMrVkXLH5pe6+yNYfwbzeOw9q3E+WpeSz3LqMP
	 vZP8z5S2zpnGG6cIPL7xqR+FCupXI6FcobeDn1mIH4btMuPMcnjrUmMGi6xfqmk25G
	 AmwyS2HlsKxtj1iuvlrf4z1T4VMAC8psTLadLOGipFCanlpMhQge4D2kgaU3R1jUE8
	 AxRciLMKIemUNOBjNKXUQGE+xqK9SpC/M5epti+EOqD+G9cBezMLvzoaum3nlibCkB
	 gfDj2qrIdNQFJLhw4eMAPhakZjs+odf+VwOTb4opM7bk2APxW21cSd6FoTOuuYD4Cu
	 5bgMSo6+2nXmw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 09 Jul 2026 00:24:57 +0200
Subject: [PATCH 3/3] ARM: dts: ixp4xx: Drop the reg-offset hack
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-ixp4xx-little-endian-v1-3-e9622d0ba9e4@kernel.org>
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
In-Reply-To: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2

The reg-offset hack only works when the IXP4xx platform is
running in big endian mode, and it is there to byte-offset
the byte where the serial registers appear in the BE config.

This is clearly wrong, workarounds need to be in the
drivers. Drop the reg-offset.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
index 0adeccabd4fe..b0f98da8def4 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
@@ -84,11 +84,6 @@ pci@c0000000 {
 		uart0: serial@c8000000 {
 			compatible = "intel,xscale-uart";
 			reg = <0xc8000000 0x1000>;
-			/*
-			 * The reg-offset and reg-shift is a side effect
-			 * of running the platform in big endian mode.
-			 */
-			reg-offset = <3>;
 			reg-shift = <2>;
 			interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <14745600>;
@@ -98,11 +93,6 @@ uart0: serial@c8000000 {
 		uart1: serial@c8001000 {
 			compatible = "intel,xscale-uart";
 			reg = <0xc8001000 0x1000>;
-			/*
-			 * The reg-offset and reg-shift is a side effect
-			 * of running the platform in big endian mode.
-			 */
-			reg-offset = <3>;
 			reg-shift = <2>;
 			interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <14745600>;

-- 
2.55.0

