Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B378B394461;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654920; cv=none; b=DRNkwBL50ie2GHwGr4abqVn+7JjXaOj+4dZO0g5j+RfJzI1J5LYsBcVfgVJP48Sw0X2Ol1ZWSjm79Uu69pJ0czeTlyUyJRo+OOcGFM5AD+h1fCGDSuDFjfbX1ZB/UVF7kvxTqqqLp1TYDh/qEUsZIFuolGAuhBmFli25EJ82Vi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654920; c=relaxed/simple;
	bh=wAwBTsf3GkIlrHwbVtRdn+g/x5eJ9jnUFDqj54HbqqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bWjmZtgAPE/moWxItCRnNyUmGUrqpwEJd4O/BtT6qb7PLJA5AwggPK5C36FDHmeQLpBSXowz5bxyAuO+O5MJeu85ok00tqz6BT336PC0V41eY/AR+DeL155TwEE6YV8Yj2WBDEG6OghBNsAKQHnSGHYLOBWmmGSAW/QBmSh7MUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9XvgZsO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9XvgZsO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 535A9C2BD01;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654920;
	bh=wAwBTsf3GkIlrHwbVtRdn+g/x5eJ9jnUFDqj54HbqqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i9XvgZsOzRwVgbl4s0RN+eeMo/VatgD1nDeMLWst42HtLlcmGa8Uuz1ZJhRRX3mIm
	 uxV7jFR+cq9TAyFGi5kxtqWYo/dSMzRshcFonTQdy36PvG238uIZ6ZcC1CnL9OkdcB
	 h2CKADzv8jio5Q4J+lC8+WTyiVekEvnonuB8ytmA/sx5jmaEH3kQYJNpsYaNh90pXL
	 tTrZdop9aSi+a5tX4G8q7x6BMmDtJRfQjIdiX/Ld9FznDR0EsTlRUky0XqfG6Fk1Ev
	 ZtuI8IlF+9ab41dVgivnSqwvOIlkPGbnq48Pt0W4eqlx1xgWFQnGg7TUY0Ol3ZAtxk
	 b/b5qA+J7s1mA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F66C61DBE;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 25 Aug 2026 18:47:46 +0800
Subject: [PATCH v6 05/12] ARM: dts: aspeed: anacapa: Add additional EEPROM
 node for SCM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-anacapa-devlop-phase-devicetree-v6-5-9059a2a279ce@gmail.com>
References: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
In-Reply-To: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654905; l=1224;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=6bqaYqKHlIwRPbR4gPkyIhffT51cOaBU7ByQ/FJQMrw=;
 b=XMu0Lx/noo3Yw4GhiYGV3uBQBVNQwxetTW3BuNLfMxGfGVAjhSLlcpJ1GPO/6ErE0vg0SL8e+
 i8f/ZdGC4EgAUpb33SHEAvvzThzQk2Ducd4TDuZjNGdmY992hmkH7GZ
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

The SCM FRU EEPROM I2C address differs between SCM revisions:
- Rev B uses address 0x50
- Rev C/D/E/F and later use address 0x51

Add an additional AT24C128 EEPROM node at 0x51 on i2c9 so the same
device tree can support multiple SCM revisions.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index 075ac39f369f..d2b4855ff1ad 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -8,6 +8,20 @@ / {
 	model = "Facebook Anacapa BMC";
 };
 
+// SCM
+&i2c9 {
+	// SCM FRU
+	// | DC-SCM Rev        | Slave address of eeprom  |
+	// |-------------------|--------------------------|
+	// | Rev B             | 0x50                     |
+	// | Rev C/D/E/F/above | 0x51                     |
+
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+};
+
 &sgpiom0 {
 	bus-frequency = <2000000>;
 	gpio-line-names =

-- 
2.34.1


