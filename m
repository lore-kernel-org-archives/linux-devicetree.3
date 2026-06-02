Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605623E5A13;
	Tue,  2 Jun 2026 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406705; cv=none; b=EC7TMI9z2sLI0F4OZJFQmEo8+t7nck+8jenWYtgJqeNmnxgnGsd/RWPVJ+Qc5YnZkQoVN0IgcymlDewSynTrYclN68imtHTFXFqfQllnPcYadTLXLL5LyLiGl2LgpimfQx4eEgIwEfxVyP7XAI5D2UDKVz2UgLyLzJ8yZjkaIKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406705; c=relaxed/simple;
	bh=2zMuUZhnVRMnb0Dqr2+8FhLQi3PVMEfFrNe7n3qZi9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiVJDgZo85B6iprrA+LjTAYjAPHBvo2PHoH8mX2SRHesSFBq/uP1gS3oxCLxL1Mucwz0ALhV88cS1KU++iFTvpPwDGsktk8wOlFOthpcIkkdLXI+L0BMpm8C+sUpVPObpSK4Uq2bXHWsyFgWxJlFDq3A+/Ij0KIZDC6cUr3z0vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV2JWwiq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV2JWwiq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C342C2BCB4;
	Tue,  2 Jun 2026 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780406705;
	bh=2zMuUZhnVRMnb0Dqr2+8FhLQi3PVMEfFrNe7n3qZi9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CV2JWwiqFoP//CJDhCZcNMf/pV94Hj9LLbgVlrPc1MhmQf/ekyi6L+oeRkUTty+/1
	 LpBHO3vupu6ldV03WgFFKKmVIFvQ8skFN2rXB/AAASPFvEm4/Q0VG9WrGMoHIycZWL
	 rNjAAiWG+s8TfLuhkey/H3dxCH8OM3VFdqCSv5MUsqU/FrEvKRAbKBipKXb9lNEp+n
	 IJlZ9Sj+3LMGY40izXTVVVGuyIOv2erTbIAedAAodT/7LpaaHHK/OQ4riZzBh2QQVR
	 hbh9KWYWc9HWLBseDUNTsHN0eavPaxV5qJVGqVUNeDhIX2MiRX8NvqlcRd/bGl6L7m
	 ck86hVtDQGSng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DE2CD6E4A;
	Tue,  2 Jun 2026 13:25:05 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 02 Jun 2026 21:25:04 +0800
Subject: [PATCH v3 9/9] ARM: dts: aspeed: anacapa: evt2: add shunt resistor
 values for HSC monitors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-anacapa-devlop-phase-devicetree-v3-9-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Peter Shen <peter.shen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406700; l=2097;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=nzXqUPdE0ipMAYml4gMYPk+diP0IJW20/ZsqgbaKJIs=;
 b=Ypwq/IQChmpWeH5OBbXAfUeRdn5YntaSN8ADhW4EUvna9U+0MiSnmbVEqosomdWECeVCyzwaY
 83tWEZUhG6lA5uATo2p8wZsVRHeyt1gB8L7W7R/nsv68eYWpISoWvN1
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
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index 4a6ae7c6cbf8..59875e9d84fd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -8,6 +8,56 @@ / {
 	compatible = "facebook,anacapa-bmc-evt2", "aspeed,ast2600";
 };
 
+// MB - PDB
+&i2c8 {
+
+	i2c-mux@72 {
+
+		i2c8mux0ch0: i2c@0 {
+
+			power-monitor@42 {
+				compatible = "lltc,ltc4287";
+				reg = <0x42>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+			power-monitor@43 {
+				compatible = "lltc,ltc4287";
+				reg = <0x43>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+			power-monitor@44 {
+				compatible = "lltc,ltc4287";
+				reg = <0x44>;
+				shunt-resistor-micro-ohms = <250>;
+			};
+			power-monitor@45 {
+				compatible = "lltc,ltc4287";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <250>;
+			};
+		};
+
+		i2c8mux0ch1: i2c@1 {
+
+			power-monitor@40 {
+				compatible = "lltc,ltc4287";
+				reg = <0x40>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+			power-monitor@41 {
+				compatible = "lltc,ltc4287";
+				reg = <0x41>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+			power-monitor@45 {
+				compatible = "lltc,ltc4287";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <250>;
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


