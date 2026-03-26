Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFB320C490;
	Thu, 26 Mar 2026 10:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520975; cv=none; b=SEZ7OPLxLs5eToFQZyupx5smBRyK+OrCvMec7VosI3xDBev323PwUYLhGsp5l9zkZiuTWSKtsQ/HyVWuf+xf04TelV4i2c8Xh6hEJX33AzXBnx1Iu73SDk05UXc+ETxxvl414WNgZgEjMmjKrINk2oVWFXk2LrGUBBn/QoAEIW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520975; c=relaxed/simple;
	bh=VdlCgfKxytsoAxz1ceuN+oZF1N/0ydu9279KC7M2B6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=fPheQ2m1gnMR5bZJvHbU5op4lEgQqVmyZeyHu0aNVVR+Pdo+3rXNT/CpYH6AUgPPCoQQFzsIzOIFlawYNs8tbR8/uCNzHRsXITR5t5zP1MZ50NW/0nMX9NdpzEn5gNtm00i5uTKQmXEX3sWuhCfzrrYYMbTcMJu+r+ss72QClUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Mar
 2026 18:29:31 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 26 Mar 2026 18:29:31 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Thu, 26 Mar 2026 18:29:22 +0800
Subject: [PATCH] ARM: dts: aspeed: g6: Add PWM/Tach controller node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260326-g6-dtsi-v1-1-348e7a0661c2@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAIEKxWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3XQz3ZSS4kxdy9RU4xRLI4OkZINkJaDqgqLUtMwKsEnRsbW1ABG
 wlgRZAAAA
X-Change-ID: 20260326-g6-dtsi-9ee3d920bc0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774520971; l=1258;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=VdlCgfKxytsoAxz1ceuN+oZF1N/0ydu9279KC7M2B6Q=;
 b=6LQIfCPgwe2WTbwtFBzk67e1rmbGs8rZ2uOnqh+PSZ9DXZv9Rn4tKkJdjKheF3/+gY9bieilX
 qUclh29h+NiAF6R789GZKqv2U8efedQl54cShepZyIWqe9JFI5NhGEb
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Introduce a device tree node for the AST2600 PWM/Tach controller.
Describe register range, clock, reset, and cell configuration.
Set status to "disabled" by default.

Prepares for enabling PWM and tachometer support on platforms
utilizing this SoC.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 189bc3bbb47c..818d486b94ac 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -102,6 +102,15 @@ ahbc: bus@1e600000 {
 			reg = <0x1e600000 0x100>;
 		};
 
+		pwm_tach: pwm-tach-controller@1e610000 {
+			compatible = "aspeed,ast2600-pwm-tach";
+			reg = <0x1e610000 0x100>;
+			clocks = <&syscon ASPEED_CLK_AHB>;
+			resets = <&syscon ASPEED_RESET_PWM>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		fmc: spi@1e620000 {
 			reg = <0x1e620000 0xc4>, <0x20000000 0x10000000>;
 			#address-cells = <1>;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260326-g6-dtsi-9ee3d920bc0c

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>

