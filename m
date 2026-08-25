Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CB43F660B;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654920; cv=none; b=fLbBSRTnwn9sXccfspp96qh16hfXbfBBUPlQd0eegks/yGYxxw9LPqGsZrQjdiW0bKHHJhCZs2Ns1z/fvIeW1+CU6AdJhZeDdIoUi0Ad2Z0malydaA4vu0hSmB4mUDSoVSPgicakrJ+Xh/012W7CPjoDXYutqkqxh1Jcj/qOXAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654920; c=relaxed/simple;
	bh=hOPf1LjDT4s/OsOzZ2OJtL3XdwwW4MxYaI4DYi2V2sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=plPAkNpB0oZM+opZ4Yc8alhAjsjqGP0ixN6oCxLPeAaFgrcEOMuAXk9w4yDdmUxhyoiKJiV1YRVZS447+jqTUR2WtyXlnf8RVSzrcUeO5wNRQQQZZwJlCd165Wqz2/MSPw2nt7OQRNeyNomyGSMizKtv8nHjuTPWtqb7fOqEJAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSFvEz5o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSFvEz5o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 667DEC32781;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654920;
	bh=hOPf1LjDT4s/OsOzZ2OJtL3XdwwW4MxYaI4DYi2V2sU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OSFvEz5oV8Y3l/1TyLawkleLuvr2nBr89ZNKh22mbjevlimUgbpVaJyT6pqqVsLJd
	 M01Q9d0g71TSoK8dSsPJM1jPbb0OAuajb3uGsRZeWTcvqGeYAnOH5TWMw7uvgmJDob
	 Vt3CuHgZhSZ8+YYhYiRBl1jOik/3OZFxe2XsVTfI4aRcrgSqC1TQl1YfHXYdeiw3Ly
	 cE9octPQldmxLD+Oi42p1gQGBVJsgYPZonl24wGEtTaAQhnKdD1hp4rp3Z5z1fP+mI
	 byYu3FV16JO1ObHhH0asIs71U9+sm/tX+zF9dKwasqFsztlAfA7ncLrnmMVRdhF40O
	 QV05thF2EWRtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F5BC61DB6;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 25 Aug 2026 18:47:47 +0800
Subject: [PATCH v6 06/12] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-anacapa-devlop-phase-devicetree-v6-6-9059a2a279ce@gmail.com>
References: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
In-Reply-To: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Carl Lee <carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654905; l=842;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=W3IShAyxygRLxWChQBNmztwL/6A+5D13GAPOb/9nyvI=;
 b=5x1Obe8eZXfIFVi/XcjUmqoHbfzWEKr0Q2Ht3cV/i6rI0oARG/5URdCp987sJGxoggp4J2waU
 Fy/L2QvVoLqCe/2IXYU1hvkPrEWLB4L3HvsOWWn5V0E56PpgZEwEYKk
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for NFC adaptor board FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index d2b4855ff1ad..22f79a2c2639 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -22,6 +22,19 @@ eeprom@51 {
 	};
 };
 
+// MB
+&i2c13 {
+	i2c-mux@70 {
+		i2c@7 {
+			// NFC adaptor board FRU
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+		};
+	};
+};
+
 &sgpiom0 {
 	bus-frequency = <2000000>;
 	gpio-line-names =

-- 
2.34.1


