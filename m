Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CBA3E3167;
	Tue,  2 Jun 2026 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406705; cv=none; b=rNuzvbkTa/bi6l5UX2Qz9GBfWYQKmRjGS2JppVDqvMR2ZlqGv9CA161uFDz8Q2pxiUtcDcDMB5tqZsX7d0DveQKtpIZERZ5eOszErZ5cMDB6u0ovmwPhDXmyV1ixYlX4B2NU0ExUvSIe860bOP7LxdFY4RtNf3qrfSaS6naKYEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406705; c=relaxed/simple;
	bh=3ed5WDh67ZmrdDMWAl2i4i0yB2nF51yxl2zoDD6sv5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DeoFavJ/iWuP2UvgTritXLizyMQtE6l5888zoaJu3TL4KqwjEXyfTkrT5ceDEYIaXiO6tweySDZhLOIrVE6wXwniqPUVmqXapypgI23edsvzcXC694fE/87l/aJ6JnFCowqrO3ZBe9jveaJEMHxZOfTCpue/qq8aC9rYeTGYQKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXJ0Byt/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXJ0Byt/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8C27C2BCC9;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780406704;
	bh=3ed5WDh67ZmrdDMWAl2i4i0yB2nF51yxl2zoDD6sv5s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tXJ0Byt/PHQPE8/FDCvAh8mTP7xPSEdTrQWIEiQOKU54erj8Yg7Y0Cjtm3Mh1/7VS
	 OZu9ft/f5M+cFVu1pYshTZsWShIPDUNVTH3SMvMVlkmqeCWP6ZoHBcPzFFpWo+p9Vl
	 BHIeh4vEYogQfWOe8h+dNvq94HOGIDmXA8gt5vMG/yynaNLDU845WTSfFDGJq/Fqau
	 yMVR/qqjOPJmeySMDoAPVkHW6dq3lJQnKWKN/h/1qph5kYDhDjPFqWF7NrKlVbWMuG
	 pc8vQ4Cz3Ec8Z59BBUdEVEjuX+RGAuKhdebgAIBzbzhyN0Xg3N5sSUUATapVPYmcWD
	 4FeKMTPl9HPBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17AECD6E57;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 02 Jun 2026 21:25:01 +0800
Subject: [PATCH v3 6/9] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-anacapa-devlop-phase-devicetree-v3-6-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Carl Lee <carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406700; l=743;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=D5HvAIWQSyP7NcKoy1Ha10lyJBsgyfKjuJ5CFfeZIDI=;
 b=QzyrVnxSf99t5YiqaOWqpNMfQmJ2V9skDS/JmOyMUIjlrZY/oeUKnOYWUbvYjnjZP14qVnBTi
 NfExFhYHSPTANDJRe4FuM7FTnhTE2uwlvWWG54UMmvrMbFXfL8H8IPd
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
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
index 1d2f46e83be8..c703d64edfae 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
@@ -845,6 +845,11 @@ nfc@28 {
 
 				enable-gpios = <&sgpiom0 241 GPIO_ACTIVE_HIGH>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
 		};
 	};
 };

-- 
2.34.1


