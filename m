Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653457;
	b=lNcjKf7W+36nqmrjAd9kYwZ1uTSttEoOIm9fk9R7Wp5Tkz44JAD1VTMSaFGOtrUxJk9Q
	 d9aSyCQE1nZU/o5GwLK6SdwrEWl9+/9PWtI/dhr+lcMdM4FdGYk5FLxe8WJViZx6BPoRE
	 eBXRvSW+4tSu15MHqHAiB++LkgthMqs97MXa7lqn0WuIpMPr4qfa0tgLIz/E3rilkCmt1
	 DIERXDZAZhKFUafuI+aLjdyrPZa/pW2tpk3KDcuNCc1YaHaQx1ZdUAE16EAcJlve2MLFa
	 Xo+QjEWOd1nCGWEGHRt4ZWeDtBCiIh0gNKOSs5kSKhLRvGuYvo/y4+SI3/Ze9ac/LMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653457;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=97qLk5qZEben3Ei0lHE03MZiWrEcGrpcpEHOGYx2x1I=;
	b=T8M0+vpdQ8jM4HIf34Jha9yTPDG0Ve0+b6lt3nM2fi1Hxc+/kyqesuOoezOWUF+kDBlD
	 44Ra9QFTY/MXjDygLcJoOzAlq7JqUEzsSdSe1qxCaiOW58sbXoM8odn4ijAxneHNfEOW5
	 tjtrC26c5LYcnarz+zI+V1BJPt8/KKtTDDssDKCODLmQ6ndmicttK8B0X7nW98N3LTHjy
	 r7ikbTRe4zspG9WtEtYcij8aTqKl8KPpZBwY3Db53tPxtWO6qrXFydcXn3myFXVMcr/u4
	 EFAS4mNUzufFuZNRltrDlVOcVY1x4AwQm5IWKhMhSuvwSQhT7gziu3o/kWrp8WoaLSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omMnXaoo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F572606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omMnXaoo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC021F000C0;
	Thu, 26 Nov 2026 00:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653456;
	bh=97qLk5qZEben3Ei0lHE03MZiWrEcGrpcpEHOGYx2x1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=omMnXaooTyt7Fd4c4+SmIHqi4dqsf7FD9hdwQfwYfnbz0vuqJ0wm9SvOzL8ctwpft
	 qy+xYX9EeCruKhc5wOvUG1/ktUh/nDrz6ow6jqwD7uu8KvOMlsqQPLhK3CVFqwlbv1
	 NwD/RNt8SMly6WeJw3X6w4ATEpmoCVayWiOsNAwUC1o6y4iyC4sd2KWS5I68r6CGBr
	 MGPrY4QrpL9QIEdD+TX9Ju91XBD4fX0n8dpGRO9huS6pfNrWDcWWwPO3UY39pjXbE/
	 53rW2hwlq+F6bQmwDBaAKMiNAyKG2aNJUTopF02mWqAXkFK2I0czqTyhEWL3darfL3
	 ADD/PU/DShWAA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:17 +0100
Subject: [PATCH 13/20] ARM: dts: ux500: Correct the STMPE interrupt pin
 property
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-13-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Nomadik pin configuration groups use pins, not ste,pins. Correct
the STUIB STMPE IRQ configuration so its pull-up is applied. Found
while validating with the converted pin controller schema.

Fixes: 07523a6cb6f8 ("ARM: dts: ux500: set pull-up on STUIB STMPE IRQ line")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href-stuib.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-href-stuib.dtsi b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
index 1f0f4ed74fd2..e2bd0418bb7a 100644
--- a/arch/arm/boot/dts/st/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
@@ -128,7 +128,7 @@ pinctrl {
 			stmpe {
 				stmpe_stuib_mode: stmpe_stuib {
 					stuib_cfg {
-						ste,pins = "GPIO218_AH11";
+						pins = "GPIO218_AH11";
 						ste,config = <&gpio_in_pu>;
 					};
 				};

-- 
2.56.1

