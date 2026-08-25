Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95403F822A;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654921; cv=none; b=jtLm8OeQRqWYTlkE0jy0+HNb8dXtW1V3xCTlRwujKRp+/1XM8pXLi3gLv0owfnUSwpVmisHGAFTc2vDIUcmRdwPR4WdozLmwWjN5rogzDq1rkNTV/Vm8QwyC1NOcpKitIjBhjrNMtfvBIlLIBmcxNW5TNPy1vfiF/5OkYeCjVwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654921; c=relaxed/simple;
	bh=5n4CWCuGf8N+WYrS1EObUuP6aViTVd0F84tGUfgyYLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=njBLgU5adom6TllsSMIQZ77RPNs+gTx9x3lnAxTAsprmDBOHWzGtPypJSl230/efyjqE8mjh7yoaE1XwtWSxT9ymEZcH4wrYaIBCfzZqIucJC4oV7LOSXeIi1YcWYpaVx97qIU/8sTARMG0fX9MDO7G3g7BCQ9/UMBb1r6tymYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSxMj/cA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSxMj/cA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C537BC2BCFD;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654920;
	bh=5n4CWCuGf8N+WYrS1EObUuP6aViTVd0F84tGUfgyYLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DSxMj/cAnl35yQywTvYwbmH0vhKHgw9dyTPDtMBlOFf/jVWfAxgmjTD6uX9HOWmxq
	 NgVWv7qXjZyQ9200lHjJIkqQFwfKSo4HP728eERD8HO2cYTLFGAc8uY8QxgL/v8K0J
	 vkG0xIcxfmt9ZIw4lll+7hMQsXBoFEjRW2OuS16vUJ9HtpGH/On75bkaiTAYErOWn+
	 TRT5QxK9T5W0Z6O5tDWUDB5AJLEDdNkSZrHyNHiwalLry9zTQzpi8cVV6WwcyfzxSl
	 6ecCS+gw1s7oSvnroi6cj3X2O9uuDhYxNN2NGKeN3J0pRMLxrIFipMyB71QCW0DOxO
	 hyP9yX9qU9z2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3522C61DBD;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 25 Aug 2026 18:47:50 +0800
Subject: [PATCH v6 09/12] ARM: dts: aspeed: anacapa: evt2: Add shunt
 resistor values for HSC monitors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-anacapa-devlop-phase-devicetree-v6-9-9059a2a279ce@gmail.com>
References: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
In-Reply-To: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Peter Shen <peter.shen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654905; l=2042;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Nkr6isVpDdRMMBTaTgNrI6h8ViGx2pJj1Pj8jJLDOHI=;
 b=PbLx5G7AHzh5WHvsZjQlObM/t2WWS+f13JDDHoRPhAHTS4EM3/Kmx+wi9urIcxgO1YkJ1mwJP
 hZ1XInQY+ZCCpJwGP+ghsQrYIQ6SCJwXAdU+hKj3MluKtF1s2p7jfKT
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Peter Shen <peter.shen@amd.com>

Add shunt resistor configuration for LTC4287 hot-swap controllers on
Anacapa EVT2 platform.

The resistor values are required for accurate current and power
measurement by the driver. These settings reflect the actual BOM used
on EVT2, where different sense resistor values (150 uOhm and 250 uOhm)
are populated across rails.

Without this configuration, the reported readings would be incorrect.

Signed-off-by: Peter Shen <peter.shen@amd.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index 7fe8d279202a..c36519a601a9 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -43,6 +43,30 @@ gpio@24 {
 					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
 					"", "";
 			};
+
+			power-monitor@42 {
+				compatible = "lltc,ltc4287";
+				reg = <0x42>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@43 {
+				compatible = "lltc,ltc4287";
+				reg = <0x43>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@44 {
+				compatible = "lltc,ltc4287";
+				reg = <0x44>;
+				shunt-resistor-micro-ohms = <250>;
+			};
+
+			power-monitor@45 {
+				compatible = "lltc,ltc4287";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <250>;
+			};
 		};
 
 		i2c@1 {
@@ -57,6 +81,24 @@ gpio@24 {
 					"","",
 					"","";
 			};
+
+			power-monitor@40 {
+				compatible = "lltc,ltc4287";
+				reg = <0x40>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@41 {
+				compatible = "lltc,ltc4287";
+				reg = <0x41>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@45 {
+				compatible = "lltc,ltc4287";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <250>;
+			};
 		};
 	};
 };

-- 
2.34.1


