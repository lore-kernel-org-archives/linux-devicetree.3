Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6840E35DA6A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974653; cv=none; b=QtvA08Ki4dpNTDg7MkPZCr477uRux61iYczZ8tDY0UaZOh1O4QVnzBuSueM7BJ7CdmZ0B23pr4zBVfozlkJOtvRPgEyGN2Xn1L5ozSLKqgOuILT+XlbMa2GB3RuJOscVVaV4rKi0RbRIy9PYyKzWa71BemmeYgu9X2Jc+n1Ae9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974653; c=relaxed/simple;
	bh=slVXIX4GkzN7Eqrifla+gMTODGj1mtSLAwrAuVAdcAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lemlv/ESX+6t8uDgzhzp51FfSxsYRwpfVaLJtjmKU/46XqwZUND1mQUqKTGy7ynn3gdTfWiHPcjNEKjvynxmPV4s+2mt8dzgCpJGsD+n+i9vIOQwYG7Zo14/mGZYy5IB+1kIgzpzj2sujFEsjlJKIlgFdTXt/sddzh5lS7gHLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIp/u5Pp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIp/u5Pp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A764C2BCF7;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974653;
	bh=slVXIX4GkzN7Eqrifla+gMTODGj1mtSLAwrAuVAdcAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IIp/u5Pp8yPOCWlxRKGmnD+TNKScn9DNTQTnWxHLL5FM4dA25NS02OmUtT9SCTR0Z
	 MrfTHGiroapCqD/FV2JM6JLmhD5hrFRfe5Gc/+SLDkdispzA4zoB6lF90xQF1NJl8Z
	 +RLS8DJNPpmAiVJaCZN8/47s6Z1AjFw/982TUnCthG57Pp177AZzHNWNgb/IHQuwne
	 6nvKPj0P8yaa1c9nPXyDTFvbVH1P4XbfIPNXTc731b+O6NiIPapT15wF5Hvb2c7Lbu
	 nUlT8t2SshYY7gH2n/68PFEolD9yGol18AqliOJsbkfJ9jkTEqK4Y1bL40Ff0VWcuc
	 chjh8WYbJFvOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A97C44501;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:14 +0200
Subject: [PATCH v3 10/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 comment to gmac phy-mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-10-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=906;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=QLwwfbhniGcF0c6ydiW48fJsP7DMQS+OrE042pH9bwc=;
 b=KbaJrHpRXzSCABELANIq9FRlYjtlJc4llt4uu8dxeJEegeT21VAkTQtnQ8U7BcYAAGCE0YtHy
 dxbgQosxMuLDXW/9xPjjHC3zkCuv4h0FNkNupRKjPLN5mlLIJWneyYb
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
index 84fde8a669a7..d67a7f3e7f8b 100644
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


