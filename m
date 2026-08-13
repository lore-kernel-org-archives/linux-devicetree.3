Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3771E474272;
	Thu, 13 Aug 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622401; cv=none; b=uXTmsuINtGF3rF/Zxqnt/jNNQmZ+hTS4QtpuVVIeFiRDAU2Ut/L0k9zrKORHCeE5/6CBmlphHF+ARrNG85bwo0ol3nel7Eew6fafxALSZG77ARK2gwZ1Gbl/EyuEFpsw0Ll57euttCFmqQiifA7p6M1YnLTxgNcBJIUoe4n1Oss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622401; c=relaxed/simple;
	bh=QuSGcF61AVWkzhKL0jYfDHaSvxefEdFczuPQKJ89HbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+dq1VHGAL/MrDxToyU1B33v8MeMeAzrvHSVgwRIFFf4X3mXFd0vXiVPiM5LgoWM0YFWw6D1d93EePP/zt3nL97ElOFwGmgnWYonNxxjbDXXhbi3DLCWrhh4N976dKZVExZh4sXN7pXO4O/w02gPJJ0iIIvuJ6sqagMNk6oZ/Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mV9ZD6KO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mV9ZD6KO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A92B0C2BCF7;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622401;
	bh=QuSGcF61AVWkzhKL0jYfDHaSvxefEdFczuPQKJ89HbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mV9ZD6KORpZX3aSre9b73YbK5k3GbWTd2UbuLiYJ7or8Ps/V8z5rQVjXPTmPxEp2f
	 zcctvfeaVzeetgQ+romqdBE9j4/ia6RfZDioB+0sPIicz5ma4uQPH49bbp77fDs4VE
	 23i3kvhrsvCTGCeSz9sLGm5mfPU4jSCjksVnIJs4/64m9IrU8+vg36VOaH9+cawZaS
	 /O4P10T9Gq8iKWjw5YxKpd1yDVYRQz6TjECyCU8fQCJmu6ERXErDOwykjkeJ3soHl0
	 1lYr/Nyadt+ZZ3APPXsyNyhR0b+h+WLc5vEMoVgAGTQOGaiw1ERuJDvfd7ysQ8xx4i
	 Win88jo8o1oqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA88C5DF6E;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:44 +0800
Subject: [PATCH v5 14/15] ARM: dts: aspeed: anacapa: Use default SPI2
 memory mapping
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-14-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=819;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=oxTF20CYiA7RH6T7z/fDB4EwQ1KdT7fYEEX/g/uzaW4=;
 b=yqV5uqb6ufRzAE5RQBXJYWysUIhzgVy0VSJP+HK2eco3jzvaBlc5EzKqNhmEsySCR4W0wyfZJ
 +muB2m33F5VC6z+kLptDpOQkx5MBIr9Br537nLY+hjPowEzW6s4nKP+
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Remove the board-specific SPI2 reg property override and rely on the
default SPI2 memory window definition provided by aspeed-g6.dtsi.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
index f27ec52f9d56..d613b5b9d6b0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
@@ -1062,7 +1062,6 @@ &sgpiom0 {
 
 // BIOS Flash
 &spi2 {
-	reg = <0x1e631000 0xc4>, <0x50000000 0x8000000>;
 	pinctrl-0 = <&pinctrl_spi2_default>;
 
 	pinctrl-names = "default";

-- 
2.34.1


