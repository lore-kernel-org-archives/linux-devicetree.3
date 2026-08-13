Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE8E472F83;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622400; cv=none; b=fhtYmrnk3JLDhvX21pIq6mwo5fMgBCXhuFI9AfptGY5cvdmHcpBfs2AzUxKi8/VKthWme17KT5470cl0qSWXm0LHKx+REntEge6A3tcjYPMUkcGKGtPynm9ubLEwRECyjRny6l8/UX6a9gCouCBXob3j3MhhoSM3Z/KvH2HCABY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622400; c=relaxed/simple;
	bh=FoLZfGD6uyaU5BQXg5Am0hO9ZEAWctWsieG0YVFNjNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEZ+d1KS+87hfnZz8Ywomv5WjnEwUGKj/IPBHqiLFSXrkNg2mnjsjV2KmHSCTLjqLUtU6WSigftvr0G9ELDnjHaYL2417AsLouzFeI3yVbpAYyBFw5c0GOYTMB1A/8ox9orR5E2En3R+eNh6Hx5BJ1ZLwYF/JmjdEjZ7Hwiaie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PefcQlh6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PefcQlh6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CC72C2BD00;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622400;
	bh=FoLZfGD6uyaU5BQXg5Am0hO9ZEAWctWsieG0YVFNjNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PefcQlh6zJF3yqBV7Pro1oH+U96FS4z8irsFo7cGWB0KYbEJW9XnQq0Iy2Y0p4vER
	 23VgKDqIzIx/sGicoE7ArYXblLXemamjRiziUV2W2F9cIR8RvAEm8TgvWfNOrnHB0+
	 CdET7ijOCyrLxxw9vMME67nhYjx4H8uGAMSQeRe0f7k6WLstVKeszeNldKxM6+0vRY
	 oa1JX6zbbNXFefM1xwcOQwvYOH1ZqTi0tOeHKQrQds+H1aE033GOnJreXE9fSDznva
	 7q9NL952mfbKwHuz/2zmuUtaf9I4PCfkUwowPwIBJ4krlauxoN8naK2sIAT28e8wpJ
	 SXycH123+c+aQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F052BC5DF69;
	Thu, 13 Aug 2026 11:59:59 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:36 +0800
Subject: [PATCH v5 06/15] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-6-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Carl Lee <carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=854;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=ogPWoxlP9zHHWVbVILynjOOXZGqV6RgIxVGA6kDFSUc=;
 b=Xzj5DalG+aiFRpcfA+06+fcwnTU8Td1CoS3EF2nJ5pr8VMxHJSPZM4kgMCqrGfQel1OgpTWXY
 m6bbLJwFz0HB/09rm20/yqzgZ50lBUxpVgIiwp7Djc447ulFCRvaS15
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
index 1901a325c72c..c7bffa7c6557 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -22,6 +22,19 @@ eeprom@51 {
 	};
 };
 
+// MB
+&i2c13 {
+	i2c-mux@70 {
+		i2c13mux0ch7: i2c@7 {
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
 	ngpios = <128>;
 	bus-frequency = <2000000>;

-- 
2.34.1


