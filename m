Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68E5470456;
	Wed,  5 Aug 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934991; cv=none; b=CM0b+/AEMtOCft3BTF38TKqT29ZvKrTyrScHXnpXinGl2ELRNxEssUHY+Hzp2yQ5Y7HpLB+vpFsBhtdaTnW1bvFcZF/ztXSlFHjx819JdvQy5+ApF+v6GbQAep2fdsb2N82a0+jzUSvwkfQs7Uh5fh8yJpA4mM5IEPh43zBIvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934991; c=relaxed/simple;
	bh=FoLZfGD6uyaU5BQXg5Am0hO9ZEAWctWsieG0YVFNjNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3za3CagwIKGo/Tv73/Ulf+sN1SWPhpHbqxqREc0WwG1jahf4J66VTRD8hJCc98QfNPowBWXfM8akCipfTzwRdlgblKdRNVz5ZgZPG8bENF580mq498xbJniCtyAqDOTbtnJwY52D4jx6NCJt2ZzZd3H0CFyAbbRZXmEksMJABU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dr8Gu4WR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dr8Gu4WR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33DC6C2BD00;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785934989;
	bh=FoLZfGD6uyaU5BQXg5Am0hO9ZEAWctWsieG0YVFNjNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dr8Gu4WRgQgVNIAIdD55kno1nIHZsnfEwN/jsJ96Gi4W0GuvK5S9xO0qh9ojRGnrW
	 Xnj63vmpgabGaZqpdRoFSD/tK1XvmqfJfJ1lE1YdQFWGFdMIMIDV0AXdc3/k1V/Xh7
	 c0Y0zlGn4tYHCg1OdkSG7cLbTnhCA0M0sSQg3RIxhNoITl8mga8CZNi9DFC21roaw1
	 uqtxyfeMPkFPJpmKEBBG9vA7V4khfhe+dE8vJ8u4RgbsXGr5PiNW8rp92YVKL6jtSt
	 0F1U1FrwwjC6PO5q0eJcESnod9KljAxyYeXkUqB0Hk7RiQfZxOfPOR6i8JhvXoUhHP
	 PFGZBoLnxOkEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B8EC55ABF;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 21:02:34 +0800
Subject: [PATCH v4 06/12] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-anacapa-devlop-phase-devicetree-v4-6-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Carl Lee <carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785934963; l=854;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=ogPWoxlP9zHHWVbVILynjOOXZGqV6RgIxVGA6kDFSUc=;
 b=/z4nvmSJvhRzs0g+CPh58slDGf0C8IT4bhg5QND24yWyfa8GVxhDS4CFvka3p6F+TTW1eybjs
 Z2vhqivCuPSCR1JDbutj6KtxGU2P75NaPgrUYmlzNLMRZmSQbl6XRCj
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


