Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F013DD51A;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406705; cv=none; b=q0cJCtCJaSlDZ++GQq3EhFY+r+VAHQvgfiJlxCTx1eaBScLJGFhrxeBnL8NOAGoAMcBxVWbCKqsDPi16cBl5zUDfIkyEHhv17wtcX42/JvlWqKX1nPAJQL1lhHvsH9jS0A7Y0+FZUcm8OpfqjbhRLcBpNAZ/clJU9vVQoYU94Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406705; c=relaxed/simple;
	bh=EjotxEbMB+szyjtOIRNVh8lq/E3vDcvELOmiSw0FuEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H1CJRqJZyFVSFhEEJWhRT8AUGe0FO+OdzkebWvPl9FwwAH+VYl7xetn04f2FzV/7uN2nDJ1Y7gjS3yUrJy6U6k+9ySPariKGzb3vVnkFeHfeSVxCcUzR2//J4RGg3iPk91SJY+HdleT1O7Xn+5qBEgXdemjg+FTaAA3BFj75SNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSmsgLwc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSmsgLwc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C396BC2BCF6;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780406704;
	bh=EjotxEbMB+szyjtOIRNVh8lq/E3vDcvELOmiSw0FuEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NSmsgLwcyb8Jga/Le8HYzEuPxeHnWmLT+6DhHWI+Ol1ceSN0T9AUskv60qLN+uWqg
	 BXs4QS0nPQ+HbGsttNqO9cUr4FVdr5+lYMWlw2PtOV5VF8sTtemhpKwoiRo7TJHQba
	 pziqWp4UT7yQS77mXScqVexscDTxH6zZl0JRazeo9UnZWcSwqU8fThp+tHwRaHhv+H
	 b75PKTdt6xuRyisCznystZG+7ADJJBTnV2Nfcv2gXqyAkxrpcLeVy0nMPggE/1SMOU
	 F7V5plg5G3E/aPpDnp2qNzoVf7EmJQQR5qaGioJCsrYeZqlClGvIukRli3uS6r44Li
	 OtMKlYGK5leqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC404CD6E64;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 02 Jun 2026 21:25:00 +0800
Subject: [PATCH v3 5/9] ARM: dts: aspeed: anacapa: add additional EEPROM
 node for SCM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-anacapa-devlop-phase-devicetree-v3-5-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406700; l=1254;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=JNSi9zvNDBr20hXdrUAD8fki2+glqxRtqyS9+sPSXtI=;
 b=7qxVVc2K+G5UI7RLH/zsUDCta5GZfv382bCspCgoqEXC1NFTk4UV8+rp/7akLxMJBUw6beR8J
 YHOFQJ7QH3VA1Irad2bjEVXXMo63pmsj4OgcJGlkoeFXtghTsEcOGsd
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
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
index 9314ee493c61..1d2f46e83be8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
@@ -593,11 +593,20 @@ &i2c9 {
 	status = "okay";
 
 	// SCM FRU
+	// | DC-SCM Rev        | Slave address of eeprom  |
+	// |-------------------|--------------------------|
+	// | Rev B             | 0x50                     |
+	// | Rev C/D/E/F/above | 0x51                     |
 	eeprom@50 {
 		compatible = "atmel,24c128";
 		reg = <0x50>;
 	};
 
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+
 	// BSM FRU
 	eeprom@56 {
 		compatible = "atmel,24c64";

-- 
2.34.1


